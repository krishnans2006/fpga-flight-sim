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

=== Parameters

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

=== Equations

The primary source for our flight dynamics equations was #link("https://eng.libretexts.org/Bookshelves/Aerospace_Engineering/Fundamentals_of_Aerospace_Engineering_(Arnedo)/07%3A_Mechanics_of_flight/7.01%3A_Performances/7.1.03%3A_Hypotheses")[this textbook section].

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

=== Edge Cases and Constants

To account for some special edge cases, a few additional rules are implemented:

- The aircraft cannot go below ground level (altitude $h < 0$)
- The aircraft cannot have a negative airspeed ($v < 0$)
- If the aircraft is within 5 feet of the ground, it cannot roll or pitch
- Pitch and roll angles are clamped to $plus.minus 20$ degrees to simulate a fly-by-wire system

Finally, research was done to determine reasonable values for the various constants used in the equations. These values are defined in `flight_sim.c` as part of the `default_plane_characteristics` variable. For sake of conciseness, these values will not be listed here, but they are described in great detail in the code comments.

== Hardware Communication

=== Communication Protocol

A lot of effort was spent determining an efficient and effective way for the MicroBlaze processor to communicate the plane's state to the hardware design. Initially, we considered using a custom AXI peripheral with a large number of registers, which would expose these registers as output ports to the hardware design. However, this approach was abandoned due to the sheer complexity and difficulty with implementing AXI peripherals and dealing with the IP integrator in Vivado.

Instead, we opted to use eight GPIO modules, each with a 32-bit output data port. This gave us a total of 256 bits to communicate the plane's state, which we would need to pack and write appropriately using memory-mapped I/O (MMIO) operations from the MicroBlaze.

=== Data Packing

To begin, we implemented a `struct plane_state_export` in `flight_sim.h`, which would define the specific variables that needed to be "exported" from the massive plane state structure to the hardware design. The struct definition is as follows:

```c
struct plane_state_export {
    uint32_t status;  // bits that convey status info (e.g., ready bit)
    uint32_t latitude;
    uint32_t longitude;
    uint32_t altitude;
    uint16_t airspeed;
    uint16_t pitch;
    uint16_t roll;
    uint16_t yaw;
    uint16_t throttle;
    uint16_t climb_rate;
};
```

Appropriate integer sizes were chosen for each variable to ensure sufficient precision while minimizing bit usage. For example, latitude and longitude are represented as 32-bit integers in microdegrees, allowing for precise positioning without floating-point representation.

Another key design decision was to use 4-bit segments of the integer values to represent a base-10 number. For example, typically, an airpseed of 123 knots would be represented as `0x007B` in hexadecimal, which would then be sent to the hardware design. However, we instead chose to represent this as `0x0123`, where each 4-bit segment corresponds to a single decimal digit. The reasoning for this decision was to simplify the hardware design and allow it to use less resources. Specifically, we considered the situation where the hardware design would need to display the text of the airspeed value on the screen. In this situation, being able to look up every 4-bit segment in a small ROM would be much simpler and more resource-efficient than implementing a full binary-to-decimal conversion in hardware.

With this encoding scheme defined, we then defined the specific encoding scheme for each variable in the `plane_state_export` struct. For example, the airspeed variable was chosen to be represented as `###.#`, meaning up to three decimal digits before the decimal point and one digit after would be sent to the hardware design. Thus, an airspeed of 123.4 knots would be represented as `0x1234`. Similar encoding schemes were defined for the other exported variables.

=== Memory-Mapped I/O

To then send this packed data to the hardware design, we implemented memory-mapped I/O (MMIO) operations in the `gpio.c` and `gpio.h` files.

To allow for easy operations, we defined structs that represented the registers of each GPIO peripheral. For example, one such struct is defined as follows:

```c
struct gpio1_regs {
    union {
        struct __attribute__((packed)) {
            uint16_t airspeed;
            uint16_t pitch;
        };

        uint8_t raw[4];
    };
};
```

Such a struct definition allows us to easily write to the airspeed and pitch data values, while also allowing us to access the raw bytes stored in the GPIO peripheral's data register.

Using these struct definitions, we then implemented proper memory-mapped I/O using volatile pointers to the base addresses of each GPIO peripheral. For example, one such pointer is defined as follows:

```c
#include "xparameters.h"

#define GPIO1 (*(volatile struct gpio1_regs*)(XPAR_GPIO_DATA_1_BASEADDR))
```

This setup essentially allows very simple and straightforward GPIO operations. For example, to set the airspeed and pitch values in GPIO, we can simply do the following:

```c
GPIO1.airspeed = export_state->airspeed;
GPIO1.pitch = export_state->pitch;
```

This code is implemented in the `write_plane_export_to_gpio` function in `gpio.c`, which is called every timestep to update the GPIO peripherals with the latest plane state (after it is packed into the `plane_state_export` struct).

== Vivado Block Design

== Summary of Block Design Components

== Summary of Program Files

= FPGA Implementation

== RTL Block Diagram

== Design Analysis

= Conclusion
