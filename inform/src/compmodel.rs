/***
 * Data structure for transitions in the Compartmental Model
 ***/
pub struct CTrans{
	pub src : u64,
	pub dst : u64,
	pub has_dep : bool,
	pub dep : Vec<(f64, Option<u64>)>,
}

/***
 * Data structure for digraph representation of Compartmental Model.
 ***/
pub struct CompModel{
	pub h : f64,
	pub pop : u64,
	pub comps : u64,
	pub transition_vec: Vec<CTrans>,
	pub final_cond : u64,
}

fn exp(v : f64) -> f64 {
	let e : f64 = 2.71828182845904523536028747135266249775724709369995;
	return 1.0-e.powf(v);
}

// Implementation for CTrans
impl CTrans{
	/***
	 * returns an initialized object of CTrans based on given string
	 ***/
	pub fn from_string(spec: String, agegroups: u64) -> CTrans{

		//initialize useful variables.
		let mut dependency_vector : Vec<(f64, Option<u64>)> = Vec::new();
		let mut has_dependency = false;

		//Extract useful info
		let info = spec.split("[");
		let split1 : Vec<&str> = info.collect();

		let transinfo = split1[0].split(" ");
		let tic : Vec<&str> = transinfo.collect();

		let multiple_deps = split1.len() > 2;


		for dependency in &split1[1..]{
			let mut dep = dependency.replace("]", "");
			let dep_info = dep.split(" ");
			let dep_split : Vec<&str> = dep_info.collect();

			let mut dep_comp = None;
			if dep_split[1] != "_"{
				has_dependency = true;
				dep_comp = Some(dep_split[1].parse::<u64>().unwrap());
			} else if dep_split[1] == "_" && multiple_deps{
				panic!("Trying to add non-dependency to transition with dependencies.");
			}
			dependency_vector.push((dep_split[0].parse::<f64>().unwrap(), dep_comp));
		}

		return CTrans{src: tic[0].parse::<u64>().unwrap(), 
					  dst: tic[1].parse::<u64>().unwrap(),
					  has_dep: has_dependency,
					  dep : dependency_vector
					  };
	}	
}

impl CompModel{
	/***
	 * Returns an initialized object of CompModel based on given string 
	 * in cms format.
	 ***/ 
	pub fn from_cms (cms:String) -> CompModel{
		let mut mode : i32 = 0; 
		let mut lpop = 0;
		let mut lh :f64 = 0.0;
		let mut comp = 0;
		let mut groups = 0;
		let mut transvec : Vec<CTrans> = Vec::new();
		let mut fc = 0;


		for line in cms.lines(){
			if (line == "-meta-"){
				mode = 1;
			}

			else if (line == "-trans-"){
				mode = 2;
			}
			else if (mode == 1){
				let info = line.split(" ");
				let collection : Vec<&str> = info.collect();

				if (collection[0] == "pop"){
					lpop = collection[1].parse::<u64>().unwrap();
				} else if (collection[0] == "h"){
					lh = collection[1].parse::<f64>().unwrap();
				} else if(collection[0] == "comps") {
					comp = collection[1].parse::<u64>().unwrap();
				} else if (collection[0] == "final" ){
					fc = collection[1].parse::<u64>().unwrap();
				} else {
					panic!("Could not initialize {:?}, no such field!", 
						collection[0] );
				}
			}
			else if (mode == 2){
				let new_transition = CTrans::from_string(line.to_string(), 
					groups);
				transvec.push(new_transition);
				println!("Parsing transition {}", line );
			}
			else {
				panic!("could not parse line \"{}\"", line);
			}		
		}
		return CompModel{h:lh, 
						 pop:lpop, 
						 comps: comp, 
						 transition_vec: transvec,
						 final_cond: fc};
	}

	/**
	 * Generates a string in dot format of the given compartmental model.
	 * TODO: add h matrices
	 **/ 
	pub fn to_dot(&self) -> String{
		let mut out : String = "digraph compmodel {\n".to_string();
/*		for index in (0..self.comps){
			out = out + format!("V{} [\"label\"=\"{}\" ];\n", 
								index, index).as_str()
		}

		for trans in &self.transition_vec{
			if let Some(c) = trans.comp {
				out = out + format!("V{} -> V{} [\"label\"=\"{}, {}\" ];\n", 
									trans.src, trans.dst, trans.val, c).as_str();
			} else {
				out = out + format!("V{} -> V{} [\"label\"=\"{}\" ];\n", 
									trans.src, trans.dst, trans.val).as_str();
			}
		}*/
		out = out + "}\n";
		return out;
	}

	pub fn get_compartments(&self) -> Vec::<(u64, bool)>{
		let mut out = Vec::new();
		for i in (0..self.comps){
			let mut has_out = false;
			for t in &self.transition_vec{
				if t.src == i {has_out = true;}
			}
			out.push((i, has_out));
		}
		return out;
	}


	pub fn get_trans_from(&self, src: u64) -> Vec<u64>{
		let mut out = Vec::new();
		let mut tid = 0;
		for t in &self.transition_vec{
			if t.src == src {
				out.push(tid);
			}
			tid += 1;
		}
		return out;

	}
}



