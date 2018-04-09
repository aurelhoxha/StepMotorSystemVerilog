`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 09:02:00 PM
// Design Name: 
// Module Name: Merger
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


module Merger( input logic clock,
               input logic reset,
               input logic enable,
               input logic direction,
               input logic buttonRight,
               input logic buttonLeft,
               input logic [3:0]switchEnabler,
               input logic [1:0] motorSpeed,
               output logic [3:0]switchEnable,
               output logic [6:0]segments,
               output logic [3:0] lights,
               output logic [1:0] rightLeft
             );
   wire temporary;
   //clockSlower test1(.clock(clock), .reset(reset), .motorSpeed(motorSpeed), .new_clock(temporary));
   fsmLogic    test2(.clock(clock), .reset(reset), .enable(enable), .direction(direction), .lights(lights));
   buttonsConfig test3(.buttonRight(buttonRight), .buttonLeft(buttonLeft),.rightLeft(rightLeft));
   sevenSegmentImplementation testi(.switchEnabler(switchEnabler),.motorSpeed(motorSpeed),.switchEnable(switchEnable),.segments(segments));
endmodule
