`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2025 03:22:48 PM
// Design Name: 
// Module Name: graphics_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*
This will be flushed out later

I envision this module to basically define the AXI interface between GPU and MicroBlaze
I haven't created the BD for MicroBlaze yet, whether we want to package GPU as a custom IP is up to you. 
On one hand it may be easier to do the block design with GPU as an IP, on the other hand you have to deal with IP Packager and all of its shenanigans. 

Temporarily, because I'm not using microblaze to test ddr3 renderer, I don't really need AXI atm
*/

module graphics_top();
/* DEFINE AXI Behavior ~ it should be similar to lab 7.1/7.2 where we just write pitch/yaw/roll data to some internal BRAM/registers */
endmodule
