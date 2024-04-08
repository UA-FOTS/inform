use crate::compmodel::CompModel;
use crate::compmodel::CTrans;

//////////////////////////////////////////////////////////////////////////
// Variable formats:                                                    //
// compartment: c{compartment id}_{agegroup id}                         //
// flow rate: fr{transition id}_{agegroup id}                           //
// temporary binomial: t{transition id}_{compartment id}_{agegroup id}  //
// temporary exponent: tt{transition id}_{compartment id}_{agegroup id} //
//////////////////////////////////////////////////////////////////////////


pub fn to_prism(model: &CompModel)-> String{

	let mut out = "".to_string();

	out += "dtmc\n\n";
	out += generate_constants(model).as_str();
	
	let compartments = model.get_compartments();
	out += "\n";
	out += "module compartmental_model\n";

	let ag = 0;
	let mut state = 0;
	let mut ti : u64 = 0;

	let mut transitions = "".to_string();

	for trans in &model.transition_vec{

		if let Some(c) = trans.comp{

			transitions +=  generate_bin_gadget2(trans, model, ti, ag, state, c).as_str();
			state += 3;
		} else {
			
			transitions +=  generate_bin_gadget1(trans, model, ti, ag, state).as_str();
			state += 2;
		}
		ti += 1;
	}

	transitions += generate_return(model, state).as_str();


	out += generate_variables(model, ag, state+1).as_str();
	out += "\n";

	out += transitions.as_str();


	out += "endmodule\n\n";
	out += generate_reward(model).as_str();
	return out;
}

fn generate_constants(m : &CompModel)-> String{
	let mut out = "".to_string();
	let compartments = m.get_compartments();

	out += format!("const int pop;\n").as_str();
	for ag in (0..m.agegroups){
		for var in &compartments{
			out += format!("const int c{}_{}_init;\n", var.0, ag).as_str();
		}
	}
	return out;
}



/**
 * Generates all variable declarations in Prism model.
 **/
fn generate_variables(m: &CompModel, ag: u64, nr_states: u64) -> String{
	let mut out = "".to_string();
	let compartments = m.get_compartments();

	for i in (0..m.agegroups){
		out += format!("\tq{} : [0..{}] init 0;\n", i, nr_states).as_str();
	}
	for var in &compartments{
		out += format!("\tc{}_{} : [0..{}] init c{}_{}_init;\n", var.0, ag, m.pop, var.0, ag).as_str();
	}
	let mut ti : u64 = 0;
	for trans in &m.transition_vec{
		// All flow realizations
		out += format!("\tfr{}_{} : [0..{}] init 0;\n", ti, ag, m.pop).as_str();
		// All temp variables
		out += format!("\tt{}_{}_{} : [0..{}] init 0;\n", ti, trans.src, ag, m.pop).as_str();
		if let Some(c) = trans.comp{
			out += format!("\ttt{}_{}_{} : [0..{}] init 0;\n", ti, c, ag, m.pop).as_str();
		}
		ti += 1;
	}
	return out;

}

fn generate_bin_gadget1(t: &CTrans, m: &CompModel, ti: u64, ag:u64, state: u64)-> String{
	let val = t.val;
	let cval = 1.0 - t.val;
	let mut out = "".to_string();
	
	out += "\t//Generating binomial gadget with no compartment reference\n";
	out += "\t// init temp variable \n";
	out += format!("\t[] (q{}={}) -> (q{}'={}) & (t{}_{}_{}'=c{}_{}); \n", 
					ag, state, ag, state + 1, ti, t.src, ag, t.src, ag).as_str();
	out += "\t//Go to final state\n";
	out += format!("\t[] (q{}={})&(t{}_{}_{}=0) -> (q{}'={});\n", 
					ag, state + 1, ti, t.src, ag, ag, state + 2).as_str();
	out += "\t//Do Bernouilli Trial\n";
	out += format!("\t[] (q{}={})&(t{}_{}_{}>0) -> ", 
					ag, state + 1, ti, t.src, ag).as_str();
	out += format!("{}:(t{}_{}_{}'=t{}_{}_{}-1)&(fr{}_{}' = fr{}_{} + 1)", 
					val, ti, t.src, ag, ti, t.src, ag, ti, ag, ti, ag ).as_str();
	out += format!(" + {}:(t{}_{}_{}'=t{}_{}_{}-1); \n", 
					cval, ti, t.src, ag, ti, t.src, ag).as_str();
	out += "\n";
	return out;
}


fn generate_bin_gadget2(t: &CTrans, m: &CompModel, ti: u64, ag:u64, state: u64, c: u64)-> String{
	let val = t.val;
	let cval = 1.0 - t.val;
	let mut out = "".to_string();
	out += "\t//Generating binomial gadget with compartment reference\n";
	out += "\t// init temp variable \n";
	out += format!("\t[] (q{}={}) -> (q{}'={}) & (t{}_{}_{}'=c{}_{}); \n", 
					ag, state, ag, state + 1, ti, t.src, ag, t.src, ag).as_str();

	out += "\t//Go to final state\n";
	out += format!("\t[] (q{}={})&(t{}_{}_{}=0) -> (q{}'={});\n", 
					ag, state + 1, ti, t.src, ag, ag, state + 3).as_str();

	out += "\t//Start Bernouilli Trial\n";
	out += format!("\t[] (q{}={})&(t{}_{}_{}>0) ->", 
					ag, state + 1, ti, t.src, ag).as_str();
	out += format!("(q{}'={})&(t{}_{}_{}'=t{}_{}_{}-1)&", 
					ag, state + 2, ti, t.src, ag, ti, t.src, ag).as_str();
	out += format!("(tt{}_{}_{}' = c{}_{});\n", ti, c, ag, c, ag).as_str();

	out += "\t//Do single q-trial\n";
	out += format!("\t[] (q{}={})&(tt{}_{}_{}>0) -> ", 
						ag, state+2,  ti, c, ag).as_str();
	out += format!("{}:(tt{}_{}_{}'=tt{}_{}_{}-1) + ", 
						val, ti, c, ag, ti, c, ag).as_str();
	out += format!("{}:(q{}'={})&(fr{}_{}' = fr{}_{} + 1);\n", 
					 cval, ag, state+1, ti, ag, ti, ag ).as_str();

	out += "\t//If all q-trial go back\n";
	out += format!("\t[] (q{}={})&(tt{}_{}_{}=0) -> (q{}'={});\n ", 
					ag, state+2,  ti, c, ag, ag, state+1).as_str();
	out += "\n";
	return out;
}

fn generate_check(m: &CompModel) -> (String, String){
	let mut compchecks1 : Vec<String> = Vec::new();
	let mut compchecks2 : Vec<String> = Vec::new();
	let ag = 0;
	let mut tid = 0;
	for comp in (0..m.comps){
		let mut outdegree = 0;
		let mut newstring1 = format!("(c{}_{} ", comp, ag);
		let mut newstring2 = "".to_string();
		tid = 0;
		for t in &m.transition_vec{
			if t.src == comp{
				
				if outdegree != 0{
					newstring2 += "+";
				}
				outdegree += 1;	
				newstring2 += format!("fr{}_{}", tid, ag).as_str();
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
	let ag = 0;
	out += "\t//Update all values and go back to initial state\n";
	let cond = generate_check(m);

	out += format!("\t[] (q{}={})&({})", ag, state, cond.0).as_str();

	out += format!(" -> (q{}'=0)&", ag).as_str();
	let mut tid = 0;

	let mut check = "".to_string();
	let mut temp_check = "".to_string();
	for comp in (0..m.comps){
		out += format!("(c{}_{}'=c{}_{}", comp, ag, comp, ag).as_str();
		
		tid = 0;
		for trans in &m.transition_vec{
			if trans.src == comp{
				out += format!("-fr{}_{}", tid, ag).as_str();
				temp_check += format!("fr{}_{}", tid, ag).as_str();
				if tid != m.transition_vec.len()-1{
					temp_check += "+";
				}
			} else if trans.dst == comp{
				out += format!("+fr{}_{}", tid, ag).as_str();
			}
			tid += 1;
		}
		if temp_check != "" {
			check = format!("(c{}_{} < ", comp, ag) + temp_check.as_str() + ")" ;
		}
		temp_check = "".to_string();
		out += ")&";
	}
	tid = 0;
	for trans in &m.transition_vec{
		out += format!("(fr{}_{}' = 0)", tid, ag).as_str();
		if tid != m.transition_vec.len()-1{
			out += "&";
		}
		tid += 1;
	}
	//println!("{}", check);
	out += ";\n";

	out += format!("\t[] (q{}={})&({}) -> (q{}'={});\n", ag, state, cond.1, ag, state + 1 ).as_str();
	return out;
}

fn generate_reward(m: &CompModel) -> String{
	let ag = 0;
	let mut out = "rewards \"time_step\" \n".to_string();
	out += format!("\t[] (q{}=0)&(c{}_{}>0) : 1;\n", ag, m.final_cond, ag).as_str();

	out += "endrewards\n";
	return out;
}



