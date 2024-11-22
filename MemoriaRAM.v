/*
	ENCABEZADO
*/

module MemoriaRAM#(
	parameter		N=4,
	parameter		M=4
)
(
	//seniales generales
	input							clk_i,
	input				[N-1:0]	addr_i,	
	input							rst_i,
	
	//seniales del puerto de lectura
	
	input							rden_i,
	output			[M-1:0]	dato_read_o,
	//seniales del puerto de escritura
	input				[M-1:0]	dato_write_i,
	input							wren_i

);
	//definicion de la memoria 
	reg				[M-1:0] RAM [0:2**N-1];
	
	//definicio de \ vector de validacion
	reg			[0:2**N-1]	VALID;
	
	//inicializacion de la memoria ram
	initial
	begin
		$readmemh("ram_init.hex", RAM);
	end


	//puerto de escritura
	
	/*always@(posedge clk_i, posedge rst_i)
	begin
	if(wren_i)
		RAM[addr_i] <= dato_write_i;
	end*/
	
	always @(posedge clk_i, posedge rst_i)
	begin
		if(rst_i)
			VALID <= 16'b0011111100011101;
		else 
			if(wren_i)
				RAM[addr_i] <= dato_write_i;
	end
	
	//puerto de lectura
	//assign dato_read_o = (rden_i) ? RAM[addr_i] : {M{1'b0}};
	assign dato_read_o = (rden_i && VALID[addr_i]) ? RAM[addr_i] : {M{1'b0}};

	
	
endmodule