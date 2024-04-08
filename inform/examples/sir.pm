dtmc

const int pop;
const int c0_0_init;
const int c1_0_init;
const int c2_0_init;

module compartmental_model
	q0 : [0..5] init 0;
	c0_0 : [0..20] init c0_0_init;
	c1_0 : [0..20] init c1_0_init;
	c2_0 : [0..20] init c2_0_init;
	fr0_0 : [0..21] init 0;
	t0_0_0 : [0..20] init 0;
	tt0_1_0 : [0..20] init 0;
	fr1_0 : [0..21] init 0;
	t1_1_0 : [0..20] init 0;

	//Generating binomial gadget with compartment reference
	// init temp variable 
	[] (q0=0) -> (q0'=1) & (t0_0_0'=c0_0); 
	//Go to final state
	[] (q0=1)&(t0_0_0=0) -> (q0'=3);
	//Start Bernouilli Trial
	[] (q0=1)&(t0_0_0>0) ->(q0'=2)&(t0_0_0'=t0_0_0-1)&(tt0_1_0' = c1_0);
	//Do single q-trial
	[] (q0=2)&(tt0_1_0>0) -> 0.2:(tt0_1_0'=tt0_1_0-1) + 0.8:(q0'=1)&(fr0_0' = fr0_0 + 1);
	//If all q-trial go back
	[] (q0=2)&(tt0_1_0=0) -> (q0'=1);
 
	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q0=3) -> (q0'=4) & (t1_1_0'=c1_0); 
	//Go to final state
	[] (q0=4)&(t1_1_0=0) -> (q0'=5);
	//Do Bernouilli Trial
	[] (q0=4)&(t1_1_0>0) -> 0.3:(t1_1_0'=t1_1_0-1)&(fr1_0' = fr1_0 + 1) + 0.7:(t1_1_0'=t1_1_0-1); 

	//Update all values and go back to initial state
	[] (q0 = 5) -> (q0' = 0)&(c0_0'=c0_0-fr0_0)&(c1_0'=c1_0+fr0_0-fr1_0)&(c2_0'=c2_0+fr1_0)&(fr0_0' = 0)&(fr1_0' = 0);
endmodule

rewards "time_step" 
	[] (q0 = 0)&(c1_0 > 0) : 1;
endrewards
