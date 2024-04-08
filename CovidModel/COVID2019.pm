dtmc

const int pop;
const int c0_init;
const int c1_init;
const int c2_init;
const int c3_init;
const int c4_init;
const int c5_init;
const int c6_init;
const int c7_init;
const int c8_init;
const int c9_init;

module compartmental_model
	q : [0..31] init 0;
	c0 : [0..pop+5] init c0_init;
	c1 : [0..pop+5] init c1_init;
	c2 : [0..pop+5] init c2_init;
	c3 : [0..pop+5] init c3_init;
	c4 : [0..pop+5] init c4_init;
	c5 : [0..pop+5] init c5_init;
	c6 : [0..pop+5] init c6_init;
	c7 : [0..pop+5] init c7_init;
	c8 : [0..pop+5] init c8_init;
	c9 : [0..pop+5] init c9_init;
	fr0 : [0..pop+5] init 0;
	t0_0 : [0..pop+5] init 0;
	tt0_2 : [0..pop+5] init 0;
	tt0_3 : [0..pop+5] init 0;
	tt0_4 : [0..pop+5] init 0;
	tt0_5 : [0..pop+5] init 0;
	fr1 : [0..pop+5] init 0;
	t1_1 : [0..pop+5] init 0;
	fr2 : [0..pop+5] init 0;
	t2_2 : [0..pop+5] init 0;
	fr3 : [0..pop+5] init 0;
	t3_2 : [0..pop+5] init 0;
	fr4 : [0..pop+5] init 0;
	t4_3 : [0..pop+5] init 0;
	fr5 : [0..pop+5] init 0;
	t5_4 : [0..pop+5] init 0;
	fr6 : [0..pop+5] init 0;
	t6_4 : [0..pop+5] init 0;
	fr7 : [0..pop+5] init 0;
	t7_5 : [0..pop+5] init 0;
	fr8 : [0..pop+5] init 0;
	t8_5 : [0..pop+5] init 0;
	fr9 : [0..pop+5] init 0;
	t9_6 : [0..pop+5] init 0;
	fr10 : [0..pop+5] init 0;
	t10_6 : [0..pop+5] init 0;
	fr11 : [0..pop+5] init 0;
	t11_7 : [0..pop+5] init 0;
	fr12 : [0..pop+5] init 0;
	t12_7 : [0..pop+5] init 0;

	//Generating binomial gadget with a compartment reference
	// init temp variable 
	[] (q=0) -> (q'=1) & (t0_0'=c0); 
	// go to start of probability chain 
	[] (q=1)&(t0_0>0) -> (q'=2)&(t0_0'=t0_0 -1)&(tt0_2' = c2);
	// do a single q trial 
	[] (q=2)&(tt0_2>0) -> 0.0127949398:(tt0_2'=tt0_2-1) + 0.9872050602:(q'=1)&(tt0_2'=0)&(fr0' = fr0 + 1); 
	// go to next dependency 
	[] (q=2)&(tt0_2 = 0) -> (q'= 3)&(tt0_3' = c3);
	// do a single q trial 
	[] (q=3)&(tt0_3>0) -> 0.0127949398:(tt0_3'=tt0_3-1) + 0.9872050602:(q'=1)&(tt0_3'=0)&(fr0' = fr0 + 1); 
	// go to next dependency 
	[] (q=3)&(tt0_3 = 0) -> (q'= 4)&(tt0_4' = c4);
	// do a single q trial 
	[] (q=4)&(tt0_4>0) -> 0.0032247892:(tt0_4'=tt0_4-1) + 0.9967752108:(q'=1)&(tt0_4'=0)&(fr0' = fr0 + 1); 
	// go to next dependency 
	[] (q=4)&(tt0_4 = 0) -> (q'= 5)&(tt0_5' = c5);
	// do a single q trial 
	[] (q=5)&(tt0_5>0) -> 0.0032247892:(tt0_5'=tt0_5-1) + 0.9967752108:(q'=1)&(tt0_5'=0)&(fr0' = fr0 + 1); 
	// go back when chain is completed. 
	[] (q=5)&(tt0_5=0) -> (q'=1)&(tt0_2' = c2);
	//Go to final state
	[] (q=1)&(t0_0=0) -> (q'=6);

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=6) -> (q'=7) & (t1_1'=c1); 
	//Go to final state
	[] (q=7)&(t1_1=0) -> (q'=8);
	//Do Bernouilli Trial
	[] (q=7)&(t1_1>0) -> 0.0299183253:(t1_1'=t1_1-1)&(fr1' = fr1 + 1) + 0.9700816747:(t1_1'=t1_1-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=8) -> (q'=9) & (t2_2'=c2); 
	//Go to final state
	[] (q=9)&(t2_2=0) -> (q'=10);
	//Do Bernouilli Trial
	[] (q=9)&(t2_2>0) -> 0.0164875673:(t2_2'=t2_2-1)&(fr2' = fr2 + 1) + 0.9835124327:(t2_2'=t2_2-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=10) -> (q'=11) & (t3_2'=c2); 
	//Go to final state
	[] (q=11)&(t3_2=0) -> (q'=12);
	//Do Bernouilli Trial
	[] (q=11)&(t3_2>0) -> 0.0031616581:(t3_2'=t3_2-1)&(fr3' = fr3 + 1) + 0.9968383419:(t3_2'=t3_2-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=12) -> (q'=13) & (t4_3'=c3); 
	//Go to final state
	[] (q=13)&(t4_3=0) -> (q'=14);
	//Do Bernouilli Trial
	[] (q=13)&(t4_3>0) -> 0.0099501663:(t4_3'=t4_3-1)&(fr4' = fr4 + 1) + 0.9900498337:(t4_3'=t4_3-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=14) -> (q'=15) & (t5_4'=c4); 
	//Go to final state
	[] (q=15)&(t5_4=0) -> (q'=16);
	//Do Bernouilli Trial
	[] (q=15)&(t5_4>0) -> 0.030520549:(t5_4'=t5_4-1)&(fr5' = fr5 + 1) + 0.969479451:(t5_4'=t5_4-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=16) -> (q'=17) & (t6_4'=c4); 
	//Go to final state
	[] (q=17)&(t6_4=0) -> (q'=18);
	//Do Bernouilli Trial
	[] (q=17)&(t6_4>0) -> 0.000503873:(t6_4'=t6_4-1)&(fr6' = fr6 + 1) + 0.999496127:(t6_4'=t6_4-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=18) -> (q'=19) & (t7_5'=c5); 
	//Go to final state
	[] (q=19)&(t7_5=0) -> (q'=20);
	//Do Bernouilli Trial
	[] (q=19)&(t7_5>0) -> 0.0030889693:(t7_5'=t7_5-1)&(fr7' = fr7 + 1) + 0.9969110307:(t7_5'=t7_5-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=20) -> (q'=21) & (t8_5'=c5); 
	//Go to final state
	[] (q=21)&(t8_5=0) -> (q'=22);
	//Do Bernouilli Trial
	[] (q=21)&(t8_5>0) -> 0.0010307184:(t8_5'=t8_5-1)&(fr8' = fr8 + 1) + 0.9989692816:(t8_5'=t8_5-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=22) -> (q'=23) & (t9_6'=c6); 
	//Go to final state
	[] (q=23)&(t9_6=0) -> (q'=24);
	//Do Bernouilli Trial
	[] (q=23)&(t9_6>0) -> 0.0076404538:(t9_6'=t9_6-1)&(fr9' = fr9 + 1) + 0.9923595462:(t9_6'=t9_6-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=24) -> (q'=25) & (t10_6'=c6); 
	//Go to final state
	[] (q=25)&(t10_6=0) -> (q'=26);
	//Do Bernouilli Trial
	[] (q=25)&(t10_6>0) -> 0.0000385409:(t10_6'=t10_6-1)&(fr10' = fr10 + 1) + 0.9999614591:(t10_6'=t10_6-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=26) -> (q'=27) & (t11_7'=c7); 
	//Go to final state
	[] (q=27)&(t11_7=0) -> (q'=28);
	//Do Bernouilli Trial
	[] (q=27)&(t11_7>0) -> 0.0076404538:(t11_7'=t11_7-1)&(fr11' = fr11 + 1) + 0.9923595462:(t11_7'=t11_7-1); 

	//Generating binomial gadget with no compartment reference
	// init temp variable 
	[] (q=28) -> (q'=29) & (t12_7'=c7); 
	//Go to final state
	[] (q=29)&(t12_7=0) -> (q'=30);
	//Do Bernouilli Trial
	[] (q=29)&(t12_7>0) -> 0.0000385409:(t12_7'=t12_7-1)&(fr12' = fr12 + 1) + 0.9999614591:(t12_7'=t12_7-1); 

	//Update all values and go back to initial state
	[] (q=30)&((c0 >=fr0)&(c1 >=fr1)&(c2 >=fr2+fr3)&(c3 >=fr4)&(c4 >=fr5+fr6)&(c5 >=fr7+fr8)&(c6 >=fr9+fr10)&(c7 >=fr11+fr12)) -> (q'=0)&(c0'=c0-fr0)&(c1'=c1+fr0-fr1)&(c2'=c2+fr1-fr2-fr3)&(c3'=c3+fr2-fr4)&(c4'=c4+fr3-fr5-fr6)&(c5'=c5+fr6-fr7-fr8)&(c6'=c6+fr7-fr9-fr10)&(c7'=c7+fr8-fr11-fr12)&(c8'=c8+fr4+fr5+fr9+fr11)&(c9'=c9+fr10+fr12)&(fr0' = 0)&(fr1' = 0)&(fr2' = 0)&(fr3' = 0)&(fr4' = 0)&(fr5' = 0)&(fr6' = 0)&(fr7' = 0)&(fr8' = 0)&(fr9' = 0)&(fr10' = 0)&(fr11' = 0)&(fr12' = 0);
	[] (q=30)&((c0 <fr0)|(c1 <fr1)|(c2 <fr2+fr3)|(c3 <fr4)|(c4 <fr5+fr6)|(c5 <fr7+fr8)|(c6 <fr9+fr10)|(c7 <fr11+fr12)) -> (q'=31);

	//Go back to start with no update
	[] (q=31) -> (q'=0)&(fr0' = 0)&(fr1' = 0)&(fr2' = 0)&(fr3' = 0)&(fr4' = 0)&(fr5' = 0)&(fr6' = 0)&(fr7' = 0)&(fr8' = 0)&(fr9' = 0)&(fr10' = 0)&(fr11' = 0)&(fr12' = 0);
endmodule

rewards "time_step" 
	[] (q=0) : 1;
	//[] (q=0)&(c1+c2+c3+c4+c5>0) : 1;
	[] (q=31) : -1;
endrewards
