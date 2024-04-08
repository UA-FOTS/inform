dtmc

const int pop;
const int c0_init;
const int c1_init;

module compartmental_model
	q : [0..3] init 0;
	c0 : [0..10] init c0_init;
	c1 : [0..10] init c1_init;
	fr0 : [0..10] init 0;
	t0_0 : [0..10] init 0;
	tt0_0 : [0..10] init 0;
	tt0_1 : [0..10] init 0;

	//Generating binomial gadget with a compartment reference
	// init temp variable 
	[] (q=0) -> (q'=1) & (t0_0'=c0); 
	//Go to final state
	[] (q=1)&(t0_0=0) -> (q'=2);
	//Do Bernouilli Trial
	[] (q=1)&(t0_0>0) -> (1-(0.2^c0)*(0.3^c1)):(t0_0'=t0_0-1)&(fr0' = fr0 + 1) + ((0.2^c0)*(0.3^c1)):(t0_0'=t0_0-1); 

	//Update all values and go back to initial state
	[] (q=2)&((c0 >=fr0)) -> (q'=0)&(c0'=c0-fr0)&(c1'=c1+fr0)&(fr0' = 0);
	[] (q=2)&((c0 <fr0)) -> (q'=3);
endmodule

rewards "time_step" 
	[] (q=0)&(c0>0) : 1;
endrewards
