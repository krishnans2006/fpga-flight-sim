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

== MMIO Communication

== Vivado Block Design

== Summary of Block Design Components

== Summary of Program Files

= FPGA Implementation

== RTL Block Diagram

== Design Analysis

= Conclusion
