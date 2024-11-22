/*
	encabezado
*/

module MemoriaRAM_fpga#(
	parameter	N=4,
	parameter	M=4
)(
	input			[N-1:0] 		addr_i,
	input							clk_i,
	input							rst_i,
	input			[M-1:0]		dato_write_i,
	input							rden_i,
	input							wren_i,
	output		[0:6]			salida_o, //salida del display
	output						daenable_o //daenable_o del display
);
	//declaracion de seniales
	wire			clk_df;
	wire			[3:0] salidaRAM_o;
	
	//instancia del divFreq
	
	Divfreq DF(
		.clk_i		(clk_i),
		.rst_ni		(rst_i),
		.clk_o		(clk_df)
	);
	
	//instancia de la memoria ram
	
	MemoriaRAM memRam(
		.clk_i			(clk_df),
		.addr_i			(addr_i),
		.rst_i			(rst_i),
		.rden_i			(rden_i),
		.dato_write_i	(dato_write_i),
		.wren_i			(wren_i),
		.dato_read_o	(salidaRAM_o)
	);
	
	//instancia del display
	
	display disp(
		.cuenta_i			(salidaRAM_o),
		.enable_i			(1'b1),
		.display_o			(salida_o),
		.daenable_o			(daenable_o)
	);



endmodule