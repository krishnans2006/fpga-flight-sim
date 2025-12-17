#import "template.typ": template

#show: template.with(
  lab_title: "Final Project Report",
  names: ("Krishnan Shankar (ks128@illinois.edu)", "Aniketh Tarikonda (aniketh8@illinois.edu)"),
  not_numbered: true,
)

= Introduction

We propose to design and implement a comprehensive flight simulator, similar to Microsoft Flight Simulator and FlightGear (albeit not as complex), using the RealDigital Urbana Board. The flight simulator will present users with a virtual plane, which they can control using input devices (keyboard, joystick, etc.) to take off, fly, and land. The surroundings and heads-up display (HUD) will be rendered in real-time on a connected monitor, providing an immersive experience.

= High Level Block Diagram

#figure(
  image("media/block_diagram.svg", width: 100%),
  caption: [
    Block Diagram
  ],
)

= Hardware

== Description

== 3D Rendering

== Summary of Modules

= Software

== Description

== Flight Dynamics

A significant portion of the difficulty for this project came from implementing accurate flight dynamics. At first, we attempted to implement this physics engine in hardware, but quickly realized that the complexity of the calculations were simply infeasible given the limited resources on the FPGA board. For example, even simple additions and subtractions would infer DSP units, which were both limited in number and significant sources of timing violations. As a result, we decided to implement flight dynamics on the MicroBlaze processor, allowing us to just send current flight state (position, velocity, attitude, etc.) to the hardware design for rendering.

The primary source for our flight dynamics equations was #link("https://eng.libretexts.org/Bookshelves/Aerospace_Engineering/Fundamentals_of_Aerospace_Engineering_(Arnedo)/07%3A_Mechanics_of_flight/7.01%3A_Performances/7.1.03%3A_Hypotheses")[this textbook section].

Before describing the equations we used, it's important to define the numerous parameters involved.

- In general, $k$ represents a specific constant
- In general, $i$ represents the value of a particular input (like throttle or rudder)
- $gamma$, $mu$, and $chi$ represent pitch, roll, and yaw angle respectively---these three angles define the attitude of the aircraft
- $C_l$ and $C_d$ are the lift and drag coefficients respectively
- Forces on the aircraft are parameterized as thrust ($T$), lift ($L$), and drag ($D$)
- $v$ is the velocity (airspeed) of the aircraft
- $x$ and $y$ represent an arbitrary $(x,y)$ position
- $h$ is the altitude above ground
- $A$ is the wing area
- $rho$ is air density


First, we derived the following equations for thrust ($T$), lift ($L$), and drag ($D$).

$ T = k_T i_"throttle" $

$ L = 1/2 rho v^2 A C_l $

$ D = 1/2 rho v^2 A C_d $


Then, from various resources, we derived the following equations for lift and drag coefficients for a commercial aircraft.

$ C_l = k_"C0" + k_"C1" gamma $

$ C_d = k_"D2" C_l^2 + k_"D0" $

We also derived an equation for air density based on altitude.

$ rho &= 1 - (0.6 / 27600) h "  atm" \
  &= (1 - (0.6 / 27600) h ) * 1.225 "  kg/m"^"3" $

Using the equations for forces, we can calculate changes in velocity and attitude over a small timestep ($dif t$).

$ dif v = (T - D - m g sin gamma) / m dif t $

$ dif chi = (L sin mu) / (m v cos gamma) dif t $

$ dif gamma = (L cos mu - m g cos gamma) / (m v) dif t $

So, at each timestep, we can integrate the above differentials to update the aircraft's airspeed and attitude.

The attitude of the aircraft is also affected by control surface deflections. This is simplified using the following equations.

$ dif gamma = k_"pitch" i_"elevator" dif t $

$ dif mu = k_"roll" i_"aileron" dif t $

$ dif chi = k_"yaw" i_"rudder" dif t $

We can account for change in the aircraft's mass due to fuel consumption. $eta$ is the fuel consumption rate (kg/s) per unit thrust.

$ dif m = - T eta dif t $

Finally, we can update the aircraft's position using the following equations. Note that these equations update position based on attitude and airspeed, which are in turn updated using the previous equations based on forces on the aircraft. This reflects proper physics modeling.

$ dif x = v cos gamma cos chi dif t $

$ dif y = v cos gamma sin chi dif t $

$ dif h = v sin gamma dif t $

All of these equations are either calculated or integrated on the MicroBlaze processor for each timestep, updating the aircraft's state accordingly. This code is implemented in the `update_plane_state` function in `flight_sim.c`.

To account for some special edge cases, a few additional rules are implemented:

- The aircraft cannot go below ground level (altitude $h < 0$)
- The aircraft cannot have a negative airspeed ($v < 0$)
- If the aircraft is within 5 feet of the ground, it cannot roll or pitch
- Pitch and roll angles are clamped to $plus.minus 20$ degrees to simulate a fly-by-wire system

Finally, research was done to determine reasonable values for the various constants used in the equations. These values are defined in `flight_sim.c` as part of the `default_plane_characteristics` variable. For sake of conciseness, these values will not be listed here, but they are described in great detail in the code comments.

== MMIO Communication

== Vivado Block Design

== Summary of Block Design Components

== Summary of Program Files

= FPGA Implementation

== RTL Block Diagram

== Design Analysis

= Conclusion
