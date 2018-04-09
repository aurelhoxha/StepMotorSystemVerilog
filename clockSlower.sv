`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 08:58:29 PM
// Design Name: 
// Module Name: clockSlower
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

module clockSlower( input logic clock, 
                    input logic reset,
                    input logic [1:0] motorSpeed, 
                    output reg new_clock
                    );
    
    int NUMBER = 230000;
    int count = 0;
    
    always @(posedge clock)
    if( count == NUMBER )
        begin
            count = 0;
            new_clock = 1'b1;
        end
        
    else if( motorSpeed == 2'b11 )
            
        begin
            if( NUMBER > 230000 )
                count = 0;
            NUMBER = 230000;
            count = count + 1;
            new_clock = 1'b0;
        end
        
        
    else if( motorSpeed == 2'b10 )
            begin
                if(NUMBER > 450000 )
                    count = 0;
                NUMBER = 450000;
                count = count + 1;
                new_clock = 1'b0;
            end
    else if( motorSpeed == 2'b01 )
                begin
                    if(NUMBER > 700000 )
                        count = 0;
                    NUMBER = 700000;
                    count = count + 1;
                    new_clock = 1'b0;
                end
    else if( motorSpeed == 2'b00 )
                    begin
                        new_clock = 1'b0;
                    end
   else
     begin
        count = count + 1;
        new_clock = 1'b0;
      end
 
endmodule

