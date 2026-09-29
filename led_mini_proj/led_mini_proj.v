`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:49:08 11/26/2024 
// Design Name: 
// Module Name:    led_mini_proj 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module led_mini_proj(
    input wire clk,
    input wire reset,
    output reg [7:0] lcd_data,
    output reg lcd_rs,
    output reg lcd_en
	);
    reg [6:0] message [0:15]; // Message array
    reg [3:0] pos; // Current position in message
    integer i;

    initial begin
        message[0] = "H"; message[1] = "e"; message[2] = "l"; message[3] = "l";
        message[4] = "o"; message[5] = " "; message[6] = "W"; message[7] = "o";
        message[8] = "r"; message[9] = "l"; message[10] = "d"; message[11] = "!";
        message[12] = " "; message[13] = " "; message[14] = " "; message[15] = " ";
        pos = 0;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pos <= 0;
        end else begin
            lcd_data <= {message[pos], 8'b00000000}; // Send character to LCD
            lcd_rs <= 1; // Data mode
            lcd_en <= 1; // Enable signal
            
            if (pos < 15) pos <= pos + 1; // Scroll through message
            else pos <= 0; // Loop back to start
        end
	end

endmodule
