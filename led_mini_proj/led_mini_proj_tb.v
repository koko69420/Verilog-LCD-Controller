`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:51:32 11/26/2024
// Design Name:   led_mini_proj
// Module Name:   /home/kausthubh/Verilog/led_mini_proj/led_mini_proj_tb.v
// Project Name:  led_mini_proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: led_mini_proj
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module led_mini_proj_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] lcd_data;
	wire lcd_rs;
	wire lcd_en;

	// Instantiate the Unit Under Test (UUT)
	led_mini_proj uut (
		.clk(clk), 
		.reset(reset), 
		.lcd_data(lcd_data), 
		.lcd_rs(lcd_rs), 
		.lcd_en(lcd_en)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

      // Apply reset for some time
      #10 reset = 0; // Release reset after 10ns
       
      // Monitor output signals
      $monitor("Time = %0d, lcd_data = %0h, lcd_rs = %b, lcd_en = %b", $time, lcd_data, lcd_rs, lcd_en);

      // Simulate for a sufficient period to see the scrolling
      #200;
        
      // End the simulation
	end
      
endmodule

