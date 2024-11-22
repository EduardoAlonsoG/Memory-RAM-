module display(
	input			[3:0]	cuenta_i,
	input					enable_i, //0 - anodo, 1 - catodo
	output 		[0:6]	display_o,
	output  		daenable_o
);
	reg			[6:0]	display_w;
	assign daenable_o = 1'b1;

	always @(*)
	begin	
		case(cuenta_i)
			4'b0000:
				display_w = 7'b0111111;
			4'b0001:
				display_w = 7'b0000110;
			4'b0010:
				display_w = 7'b1011011;
			4'b0011:
				display_w = 7'b1001111;
			4'b0100:
				display_w = 7'b1100110;
			4'b0101:
				display_w = 7'b1101101;
			4'b0110:
				display_w = 7'b1111101;
			4'b0111:
				display_w = 7'b0000111;
			4'b1000:
				display_w = 7'b1111111;
			4'b1001:
				display_w = 7'b1100111;
			4'b1010:
				display_w = 7'b1110111;
			4'b1011:
				display_w = 7'b1111100;
			4'b1100:
				display_w = 7'b0111001;
			4'b1101:
				display_w = 7'b1011110;
			4'b1110:
				display_w = 7'b1111001;
			4'b1111:
				display_w = 7'b1110001;
		endcase
	end
	
	//seleccion para catodo o anodo
	assign display_o = (enable_i) ? display_w : ~display_w;
	
endmodule	