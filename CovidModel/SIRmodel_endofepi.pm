// Discrete-Time Markov Chain model for SIR-analysis


dtmc

const double p_infect;
const double p_recover;

const int pop;

const int s_init;
const int i_init;
const int r_init;


module infect
	q : [0..6] init 0; 
	s : [0..pop] init s_init; 
	i : [0..pop] init i_init;  
	r : [0..pop] init r_init; 

	
	i_update : [0..pop] init 0;
	r_update : [0..pop] init 0;


	i_temp : [0..pop] init 0;
	s_temp : [0..pop] init 0;


	// init i_temp
	[] q=0 -> (q'=1) & (i_temp'= i);

	// do a single bernoulli trial for recovery
	[] (q=1)&(i_temp>0) -> p_recover:(i_temp'=i_temp-1)&(r_update'=r_update+1) + 
						   (1-p_recover):(i_temp'=i_temp-1);

	// go to final state
	[] (q=1)&(i_temp=0) -> (q'=2);

    // initialize variable s_temp 
    [] (q=2) -> (q'=3)&(s_temp'= s);

    // if all trials are handled go to final 
    [] (q=3)&(s_temp=0) -> (q'=5);
   
    // if not all trials are handled, handle next trial, initialize i_temp
    [] (q=3)&(s_temp>0) -> (q'=4)&(i_temp'=i)&(s_temp'=s_temp-1);
 
    // check a single q trial. To remain susceptible, i consecutive q trials have to be passed.
    [] (q=4)&(i_temp>0) -> p_infect:(i_temp'=i_temp-1)+(1-p_infect):(q'=3)&(i_update'=i_update+1);

    // if all q trials are passed, add changes to s_update and i_update.
    [] (q=4)&(i_temp=0) -> (q'=3);

    // finalize a single timestep.
    [] (q=5) -> (q'=6)&(s'=s-i_update)&(i'=i+i_update-r_update)&(r'=r+r_update); 

    // go back to begin and reset.
    //[] (q=6) -> (q'=0)&(i_update'=0)&(r_update'=0);
    [] (q=6) -> (q'=0)&(i_update'=0)&(r_update'=0)&(i_temp'=0)&(s_temp'=0);


endmodule

rewards "time_step"
	[] (q=0) : 1;
	//[] (q=0)&(i>0) : 1;
endrewards
