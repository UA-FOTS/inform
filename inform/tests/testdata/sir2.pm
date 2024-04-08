dtmc

const int pop;
const int c0_init;
const int c1_init;
const int c2_init;

module compartmental_model
	q : [0..6] init 0;
	c0 : [0..10] init c0_init;
	c1 : [0..10] init c1_init;
	c2 : [0..10] init c2_init;
	fr0 : [0..10] init 0;
	t0_0 : [0..10] init 0;
	tt0_1 : [0..10] init 0;
	fr1 : [0..10] init 0;
	t1_1 : [0..10] init 0;

	//Generating binomial gadget with a compartment reference
	// init temp variable 
	[] (q=0) -> (q'=1) & (t0_0'=c0); 
	// go to start of probability chain 
	[] (q=1)&(t0_0>0) -> (q'=2)&(t0_0'=t0_0 -1)&(tt0_1' = c1);
	// do a single q trial 
	[] (q=2)&(tt0_1>0) -> 0.2:(tt0_1'=tt0_1-1) + 0.8:(q'=1)&(tt0_1'=0)&(fr0' = fr0 + 1); 
	// go back when chain is completed. 
	[] (q=2)&(tt0_1=0) -> (q'=1)&(tt0_1' = c1);
	//Go to final state
	[] (q=1)&(t0_0=0) -> (q'=3);

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=3) -> (q'=4) & (t1_1'=c1); 
	//Go to final state
	[] (q=4)&(t1_1=0) -> (q'=5);
	//Do Bernouilli Trial
	[] (q=4)&(t1_1>0) -> 0.3:(t1_1'=t1_1-1)&(fr1' = fr1 + 1) + 0.7:(t1_1'=t1_1-1); 

	//Update all values and go back to initial state
	[] (q=5)&((c0 >=fr0)&(c1 >=fr1)) -> (q'=0)&(c0'=c0-fr0)&(c1'=c1+fr0-fr1)&(c2'=c2+fr1)&(fr0' = 0)&(fr1' = 0);
	[] (q=5)&((c0 <fr0)|(c1 <fr1)) -> (q'=6);
endmodule

rewards "time_step" 
	[] (q=0)&(c1>0) : 1;
endrewards
