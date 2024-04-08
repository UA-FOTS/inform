use crate::compmodel::CompModel;
use crate::compmodel::CTrans;

//////////////////////////////////////////////////////////////////////////
// Variable formats:                                                    //
// compartment: c{compartment id}                                       //
// flow rate: fr{transition id}                                         //
// temporary binomial: t{transition id}                                 //
// temporary exponent: tt{transition id}_{compartment id}               //
//////////////////////////////////////////////////////////////////////////


pub fn to_prism(model: &CompModel, loop_enc:bool)-> String{
	let mut out = "".to_string();

	out += "dtmc\n\n";
	out += generate_constants(model).as_str();
	
	let compartments = model.get_compartments();
	out += "\n";
	out += "module compartmental_model\n";


	let mut state = 0;
	let mut ti : u64 = 0;

	let mut transitions = "".to_string();

	for trans in &model.transition_vec{

		if trans.has_dep{

			if(loop_enc){
				let mut state_add : u64 = 0;
				transitions += generate_bin_gadget2(trans,model, ti, state, &mut state_add).as_str();
				state += state_add;

			}else{
				transitions +=  generate_bin_gadget2_fast(trans, model, ti, state).as_str();
				state += 2;
			}

			
		} else {
			
			transitions +=  generate_bin_gadget1(trans, model, ti, state).as_str();
			state += 2;
		}
		ti += 1;
	}

	transitions += generate_return(model, state).as_str();

	out += generate_variables(model, state+1).as_str();
	out += "\n";

	out += transitions.as_str();


	out += "endmodule\n\n";
	out += generate_reward(model, state + 1).as_str();
	return out;
}

/**
 * Generates all constants
 */
fn generate_constants(m : &CompModel)-> String{
	let mut out = "".to_string();
	let compartments = m.get_compartments();

	out += format!("const int pop;\n").as_str();
	
	for var in &compartments{
		out += format!("const int c{}_init;\n", var.0).as_str();
	}
	return out;
}



/**
 * Generates all variable declarations in Prism model.
 **/
fn generate_variables(m: &CompModel, nr_states: u64) -> String{
	let mut out = "".to_string();
	let compartments = m.get_compartments();

	out += format!("\tq : [0..{}] init 0;\n", nr_states).as_str();

	for var in &compartments{
		out += format!("\tc{} : [0..pop+5] init c{}_init;\n", var.0, var.0).as_str();
	}
	let mut ti : u64 = 0;
	for trans in &m.transition_vec{
		// All flow realizations
		out += format!("\tfr{} : [0..pop+5] init 0;\n", ti).as_str();
		// All temp variables
		out += format!("\tt{}_{} : [0..pop+5] init 0;\n", ti, trans.src).as_str();
		if trans.has_dep {
			for dep in &trans.dep{
				out += format!("\ttt{}_{} : [0..pop+5] init 0;\n", ti, dep.1.expect("No dependency found")).as_str();
			}
		}
		
		ti += 1;
	}
	return out;

}



// Generate a binomial gadget in Prism based on transtion t from Compartmental model m, with no compartmental reference. 
fn generate_bin_gadget1(t: &CTrans, m: &CompModel, ti: u64,  state: u64)-> String{
	let val = t.dep[0].0;
	let cval = 1.0 - val;
	let mut out = "".to_string();
	
	out += "\t//Generating binomial gadget with no compartment reference\n";
	out += "\t// init temp variable \n";
	out += format!("\t[] (q={}) -> (q'={}) & (t{}_{}'=c{}); \n", 
					state, state + 1, ti, t.src, t.src).as_str();
	out += "\t//Go to final state\n";
	out += format!("\t[] (q={})&(t{}_{}=0) -> (q'={});\n", 
					state + 1, ti, t.src, state + 2).as_str();
	out += "\t//Do Bernouilli Trial\n";
	out += format!("\t[] (q={})&(t{}_{}>0)&(fr{}<{}) -> ", 
					state + 1, ti, t.src, ti, m.pop).as_str();
	out += format!("{}:(t{}_{}'=t{}_{}-1)&(fr{}' = fr{} + 1)", 
					val, ti, t.src, ti, t.src, ti, ti ).as_str();
	out += format!(" + {}:(t{}_{}'=t{}_{}-1); \n", 
					cval, ti, t.src, ti, t.src).as_str();
	out += "\n";
	return out;
}

// Generate a binomial gadget in Prism based on transtion t from Compartmental model m, with compartmental reference, 
// where the probabilities are computed from the state. (not compatible with Modest)
fn generate_bin_gadget2_fast(t: &CTrans, m: &CompModel, ti: u64, state: u64)-> String{
	let val = t.dep[0].0;
	let cval = 1.0 - val;
	let mut probability = "".to_string();
	let mut index = 0;
	for dependency in &t.dep{
		if index != 0{
			probability += "*";
		}
		index += 1;
		probability += format!("({}^c{})", dependency.0, dependency.1.unwrap() ).as_str();
	}
	let cprobability = "(".to_string() + probability.as_str() +")";
	probability = "(1-".to_string() + probability.as_str() + ")";

	let mut out = "".to_string();
	
	out += "\t//Generating binomial gadget with a compartment reference\n";
	out += "\t// init temp variable \n";
	out += format!("\t[] (q={}) -> (q'={}) & (t{}_{}'=c{}); \n", 
					state, state + 1, ti, t.src, t.src).as_str();
	out += "\t//Go to final state\n";
	out += format!("\t[] (q={})&(t{}_{}=0) -> (q'={});\n", 
					state + 1, ti, t.src, state + 2).as_str();
	out += "\t//Do Bernouilli Trial\n";
	out += format!("\t[] (q={})&(t{}_{}>0) -> ", 
					state + 1, ti, t.src).as_str();
	out += format!("{}:(t{}_{}'=t{}_{}-1)&(fr{}' = fr{} + 1)", 
					probability, ti, t.src, ti, t.src, ti, ti ).as_str();
	out += format!(" + {}:(t{}_{}'=t{}_{}-1); \n", 
					cprobability, ti, t.src, ti, t.src).as_str();
	out += "\n";
	return out;
}

// Generate a binomial gadget in Prism based on transtion t from Compartmental model m, with compartmental reference. 
fn generate_bin_gadget2(t: &CTrans, m: &CompModel, ti: u64, state: u64, state_add: &mut u64)-> String {
	let mut out = "".to_string();
	let mut st = state;
	out += "\t//Generating binomial gadget with a compartment reference\n";
	out += "\t// init temp variable \n";
	*state_add = 2;

	
	out += format!("\t[] (q={}) -> (q'={}) & (t{}_{}'=c{}); \n", 
					state, state + 1, ti, t.src, t.src).as_str();
	
	
	let first_dep = t.dep[0];
	let first_prob = first_dep.0;
	let first_comp = first_dep.1.unwrap();
	let last_dep = t.dep[t.dep.len()-1];
	let last_prob = last_dep.0;
	let last_comp = last_dep.1.unwrap();

	st += 1;
	// add the first transition to chain
	out += "\t// go to start of probability chain \n";
	out += format!("\t[] (q={})&(t{}_{}>0) -> (q'={})&(t{}_{}'=t{}_{} -1)&(tt{}_{}' = c{});\n", 
					state + 1, ti, t.src, state + 2, ti, t.src, ti, t.src, ti, first_comp, first_comp).as_str();

	let mut index = 0;
	for d in &t.dep{
		let prob = d.0;
		let dep  = d.1.unwrap();
		st += 1;

		out += "\t// do a single q trial \n";
		out += format!("\t[] (q={})&(tt{}_{}>0)&(fr{} < {}) -> ",
							 st, ti, dep, ti, m.pop).as_str();
		out += format!("\t {}:(tt{}_{}'=tt{}_{}-1) + {}:(q'={})&(tt{}_{}'=0)&(fr{}' = fr{} + 1); \n",
							 prob, ti, dep, ti, dep, 1.0-prob, state + 1, ti, dep, ti, ti).as_str();
		index += 1;

		if index != t.dep.len(){

			let nextdep = t.dep[index];
			let nextcomp = nextdep.1.unwrap();
			out += "\t// go to next dependency \n";
			out += format!("\t[] (q={})&(tt{}_{} = 0) -> (q'= {})&(tt{}_{}' = c{});\n", 
							st, ti, dep, st+1, ti, nextcomp, nextcomp).as_str();
		}
	}


	out += "\t// go back when chain is completed. \n";
	out += format!("\t[] (q={})&(tt{}_{}=0) -> (q'={})&(tt{}_{}' = c{});\n", 
					st , ti, last_comp, state + 1, ti, first_comp, first_comp).as_str();


	out += "\t//Go to final state\n";
	out += format!("\t[] (q={})&(t{}_{}=0) -> (q'={});\n", 
					state + 1, ti, t.src, st + 1 ).as_str();
	out += "\n";

	*state_add = 2 + (t.dep.len() as u64); 

	return out;
}

fn generate_check(m: &CompModel) -> (String, String){
	let mut compchecks1 : Vec<String> = Vec::new();
	let mut compchecks2 : Vec<String> = Vec::new();
	let ag = 0;
	let mut tid = 0;
	for comp in (0..m.comps){
		let mut outdegree = 0;
		let mut newstring1 = format!("(c{} ", comp);
		let mut newstring2 = "".to_string();
		tid = 0;
		for t in &m.transition_vec{
			if t.src == comp{
				
				if outdegree != 0{
					newstring2 += "+";
				}
				outdegree += 1;	
				newstring2 += format!("fr{}", tid).as_str();
			}
			tid += 1;
		}
		newstring2 +=  ")";
		if outdegree > 0 {
			compchecks1.push(newstring1.clone() + ">=" + newstring2.as_str());
			compchecks2.push(newstring1.clone() + "<" + newstring2.as_str());
		}
	}
	return (compchecks1.join("&"), compchecks2.join("|"));
}

fn generate_return(m: &CompModel, state: u64)-> String{
	let mut out = "".to_string();
	out += "\t//Update all values and go back to initial state\n";
	let cond = generate_check(m);

	out += format!("\t[] (q={})&({})", state, cond.0).as_str();

	out += " -> (q'=0)&";
	let mut tid = 0;

	let mut check = "".to_string();
	let mut temp_check = "".to_string();
	for comp in (0..m.comps){
		out += format!("(c{}'=c{}", comp,  comp).as_str();
		
		tid = 0;
		for trans in &m.transition_vec{
			if trans.src == comp{
				out += format!("-fr{}", tid).as_str();
				temp_check += format!("fr{}", tid).as_str();
				if tid != m.transition_vec.len()-1{
					temp_check += "+";
				}
			} else if trans.dst == comp{
				out += format!("+fr{}", tid).as_str();
			}
			tid += 1;
		}
		if temp_check != "" {
			check = format!("(c{} < ", comp) + temp_check.as_str() + ")" ;
		}
		temp_check = "".to_string();
		out += ")&";
	}
	tid = 0;
	for trans in &m.transition_vec{
		out += format!("(fr{}' = 0)", tid).as_str();
		if tid != m.transition_vec.len()-1{
			out += "&";
		}
		tid += 1;
	}

	out += ";\n";

	out += format!("\t[] (q={})&({}) -> (q'={});\n", state, cond.1, state + 1 ).as_str();
	

	out += "\t//generate return when from error state.\n";
	out += format!("\t[] (q={}) -> (q' = 0)", state + 1).as_str();
	
	for i in 0..m.transition_vec.len() {
		out += format!("&(fr{}'=0)", i).as_str();
	}
	out += "\n";


	return out;
}


fn generate_reward(m: &CompModel, states: u64) -> String{
	let mut out = "rewards \"time_step\" \n".to_string();
	out += format!("\t[] (q=0) : 1;\n").as_str();
	out += format!("\t[] (q={}) : -1;\n", states ).as_str();
	out += "endrewards\n";


	return out;
}



