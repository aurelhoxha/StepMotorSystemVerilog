`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2016 12:45:03 PM
// Design Name: 
// Module Name: sevenSegmentImplementation
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


module sevenSegmentImplementation(input logic[3:0] switchEnabler,
                                  input logic[1:0] motorSpeed,
                                  output logic[3:0] switchEnable,
                                  output logic[6:0] segments
                                  );
                                  
outputDigitSelector selectTheDigit(.switchEnabler(switchEnabler),.switchEnable(switchEnable));
numbersToSegment showTheNumbers(.motorSpeed(motorSpeed), .segments(segments));
endmodule
