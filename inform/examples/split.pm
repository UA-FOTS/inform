dtmc

const int pop;
const int c0_init;
const int c1_init;
const int c2_init;

module compartmental_model
	q : [0..16] init 0;
	c0 : [0..20] init c0_init;
	c1 : [0..20] init c1_init;
	c2 : [0..20] init c2_init;
	fr0 : [0..20] init 0;
	t0_0 : [0..20] init 0;
	fr1 : [0..20] init 0;
	t1_0 : [0..20] init 0;
	fr2 : [0..20] init 0;
	t2_1 : [0..20] init 0;

endmodule

