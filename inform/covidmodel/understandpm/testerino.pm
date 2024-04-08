dtmc

const int pop = 5;
const int c0_init = 3;
const int c1_init = 0;
const int c2_init = 2;
const int c3_init = 2;
const int c4_init = 0;
const int c5_init = 0;
const int c6_init = 0;
const int c7_init = 0;
const int c8_init = 0;
const int c9_init = 0;
const double pr = 0.2;

module compartmental_model
	q : [0..2] init 1;

	c1 : [0..5] init 1;
	
	t : [0..5] init 1;

	u : [0..5] init 0;

	[] (q=0) -> pr: (q'=1) + (1-pr): (q' = 2);


	// init temp variable
	//[] (q=0) -> (q'=1)&(t' = c1);

	// go to final state
	[] (q=1)&(t<=0) -> (q'=2);

	// do a single Bernouilli trial
	[] (q=1)&(t>=1)&(u<5) -> 0.2:(t'=t-1)&(u' = u + 1) 
					 + 0.8:(t'=t-1);

	


endmodule

