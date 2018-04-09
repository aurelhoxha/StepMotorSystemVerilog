`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2016 11:59:48 AM
// Design Name: 
// Module Name: outputDigitSelector
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


module outputDigitSelector( input logic [ 3:0 ] switchEnabler,
                            output logic[ 3:0 ] switchEnable
                           );
                           
 //Seven Segment Display are active LOW
 assign switchEnable[0] = !(  switchEnabler[0] && !switchEnabler[1] && !switchEnabler[2] && !switchEnabler[3]);
 assign switchEnable[1] = !( !switchEnabler[0] &&  switchEnabler[1] && !switchEnabler[2] && !switchEnabler[3]);
 assign switchEnable[2] = !( !switchEnabler[0] && !switchEnabler[1] &&  switchEnabler[2] && !switchEnabler[3]);
 assign switchEnable[3] = !( !switchEnabler[0] && !switchEnabler[1] && !switchEnabler[2] &&  switchEnabler[3]);
 
endmodule


module numbersToSegment( input logic [1:0] motorSpeed,
                         output logic[6:0] segments );

//These are the input that changes the seven Segment                         
logic motorSpeed0 = motorSpeed[0];
logic motorSpeed1 = motorSpeed[1];

//These are the internal variables that correspond to the Seven Segment
logic a,b,c,d,e,f,g; 

//This is the output, 7 segment that are going to be displayed
assign segments[0] = a;
assign segments[1] = b;
assign segments[2] = c;
assign segments[3] = d;
assign segments[4] = e;
assign segments[5] = f;
assign segments[6] = g;


//Results from the K-Maps to for the numbers in the seven Segment
assign a = !( motorSpeed1 | !motorSpeed0 ); 
assign b = !( !motorSpeed1 & !motorSpeed0 | !motorSpeed1 & motorSpeed0 | motorSpeed1 & !motorSpeed0 | motorSpeed1 & motorSpeed0);
assign c = !( !motorSpeed1 | motorSpeed0 );
assign d = !( motorSpeed1 | !motorSpeed0 ); 
assign e = !( !motorSpeed0 );
assign f = !( !motorSpeed1 & !motorSpeed0 );
assign g = !( motorSpeed1 );

endmodule