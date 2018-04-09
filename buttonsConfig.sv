`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2016 04:09:57 AM
// Design Name: 
// Module Name: buttonsConfig
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


module buttonsConfig(input logic buttonRight,
                      input logic buttonLeft,
                      output logic [1:0] rightLeft
                     );
                     

assign rightLeft[1] = buttonRight;
assign rightLeft[0] = buttonLeft;
endmodule
