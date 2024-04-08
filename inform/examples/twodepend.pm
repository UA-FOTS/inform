dtmc

const int pop;
const int c0_init;
const int c1_init;
const int c2_init;
const int c3_init;

module compartmental_model
	q : [0..9] init 0;
	c0 : [0..20] init c0_init;
	c1 : [0..20] init c1_init;
	c2 : [0..20] init c2_init;
	c3 : [0..20] init c3_init;
	fr0 : [0..20] init 0;
	t0_0 : [0..20] init 0;
	tt0_2 : [0..20] init 0;
	tt0_3 : [0..20] init 0;
	fr1 : [0..20] init 0;
	t1_1 : [0..20] init 0;
	tt1_2 : [0..20] init 0;
	fr2 : [0..20] init 0;
	t2_1 : [0..20] init 0;

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=0) -> (q'=1) & (t0_0'=c0); 
	//Go to final state
	[] (q=1)&(t0_0=0) -> (q'=2);
	//Do Bernouilli Trial
	[] (q=1)&(t0_0>0) -> ((0.2^c2)*(0.3^c3)):(t0_0'=t0_0-1)&(fr0' = fr0 + 1) + (1-(0.2^c2)*(0.3^c3)):(t0_0'=t0_0-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=3) -> (q'=4) & (t1_1'=c1); 
	//Go to final state
	[] (q=4)&(t1_1=0) -> (q'=5);
	//Do Bernouilli Trial
	[] (q=4)&(t1_1>0) -> ((0.4^c2)):(t1_1'=t1_1-1)&(fr1' = fr1 + 1) + (1-(0.4^c2)):(t1_1'=t1_1-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=6) -> (q'=7) & (t2_1'=c1); 
	//Go to final state
	[] (q=7)&(t2_1=0) -> (q'=8);
	//Do Bernouilli Trial
	[] (q=7)&(t2_1>0) -> 0.5:(t2_1'=t2_1-1)&(fr2' = fr2 + 1) + 0.5:(t2_1'=t2_1-1); 

	//Update all values and go back to initial state
	[] (q=8)&((c0 >=fr0)&(c1 >=fr1+fr2)) -> (q'=0)&(c0'=c0-fr0)&(c1'=c1+fr0-fr1-fr2)&(c2'=c2+fr1)&(c3'=c3+fr2)&(fr0' = 0)&(fr1' = 0)&(fr2' = 0);
	[] (q=8)&((c0 <fr0)|(c1 <fr1+fr2)) -> (q'=9);
endmodule

rewards "time_step" 
	[] (q=0)&(c0>0) : 1;
endrewards
