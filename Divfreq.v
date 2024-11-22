module Divfreq#(
parameter 	freqdev		= 1000000, //10MHz
parameter 	freqfinal 	=freqdev/4

)

(
	input 		clk_i,
	input			rst_ni,
	output reg 	clk_o
);
	reg	[31:0] counter_r;
	always @(posedge clk_i, negedge rst_ni)
	begin	
		if (!rst_ni)
			begin	
				counter_r<= 32'b0;
				clk_o <=1'b1;
			end
		else
			begin
				if (counter_r==freqfinal)
					begin 
						counter_r <= 32'b0;
						clk_o 		<=~clk_o;
					end
				else 
					begin
						counter_r <=counter_r + 1'b1;
					end
			end
	end
endmodule
