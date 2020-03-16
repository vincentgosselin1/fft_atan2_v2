
module cordic_atan2_v2 (
	areset,
	clk,
	en,
	q,
	r,
	x,
	y);	

	input		areset;
	input		clk;
	input	[0:0]	en;
	output	[15:0]	q;
	output	[14:0]	r;
	input	[15:0]	x;
	input	[15:0]	y;
endmodule
