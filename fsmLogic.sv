`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 08:07:20 PM
// Design Name: 
// Module Name: fsmLogic
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


module fsmLogic( input logic clock,
                 input logic reset,
                 input logic enable,
                 input logic direction,
                 output logic [3:0] lights
                 );
                 
logic[3:0] currentState, nextState;


parameter State0 = 4'b1100;
parameter State1 = 4'b0110;
parameter State2 = 4'b0011;
parameter State3 = 4'b1001;

always_ff@( posedge clock, posedge reset )
if( reset )
        currentState <= State0;
else     
        currentState <= nextState;


always_comb
    case(currentState)
        State0:
        begin
                if( enable  == 1'b1 && direction == 1'b1 )
                    nextState = State1;
                else if( enable == 1'b1 && direction == 1'b0 )
                    nextState = State3;
                else
                    nextState = State0;
                    
        end
               
        State1:
        begin
                if( enable  == 1'b1 && direction == 1'b1 )
                    nextState = State2;
                else if( enable == 1'b1 && direction == 1'b0 )
                    nextState = State0;
                else
                    nextState = State1;
                    
        end
            
        State2:
        begin
                if( enable  == 1'b1 && direction == 1'b1 )
                    nextState = State3;
                else if( enable == 1'b1 && direction == 1'b0 )
                    nextState = State1;
                else
                    nextState = State2;
                    
        end
            
        State3:
        begin
                if( enable  == 1'b1 && direction == 1'b1 )
                    nextState = State0;
                else if( enable == 1'b1 && direction == 1'b0 )
                    nextState = State2;
                else
                    nextState = State3;
                    
        end
        default : nextState = State0;
    endcase


always@ (*)
case(currentState)
    State0: begin lights = 4'b1100; end   
    State1: begin lights = 4'b0110; end
    State2: begin lights = 4'b0011; end
    State3: begin lights = 4'b1001; end
    default:begin lights = 4'b1100; end
endcase


            
 
endmodule
