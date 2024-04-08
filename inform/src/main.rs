#![allow(unused)]

use clap::Parser;
use std::fs;

mod compmodel;
mod prismgenerator;

#[derive(Parser)]
#[command(author, version, long_about = None)]
#[command(about="Inform translates compartmental models into PRISM files.")]
struct Cli {
    /// File name of compartmental model specification (.cms).
    #[arg(long, short)]
    input: String,

    /// If flag is set, all information will be printed to terminal.
    #[arg(long, short)]
    verbose: bool,

    /// If given, a dot representation of the compartmental model is outputted to given filename.
    #[arg(long, short)]
    dot: Option<String>,

    /// If given, a prism representation of the compartmental model is outputted to given filename.
    #[arg(long, short)]
    prism: Option<String>,

    /// If flag is set, the full encoding will be used with nested cycles for p^c.
    #[arg(long, short)]
    lenc: bool,
}

fn main() {
    let args = Cli::parse();

    
    //let outputfn = format!("{}.pm", args.input);

    if (args.verbose){
        println!("Translating Compartmental model");
        println!("input file: {}", args.input );
    }
    let content = fs::read_to_string(args.input).expect("No file found with given input file name.");
    let c = compmodel::CompModel::from_cms(content);


    if let Some(dotfile) = args.dot {
        let data = c.to_dot();
        fs::write(dotfile, data).expect("Unable to write file");
    } else {
        println!("No dot file given.");
    }

    if let Some(prismfile) = args.prism{
        let data = prismgenerator::to_prism(&c, args.lenc);
        fs::write(prismfile, data).expect("Unable to write file");
    } else {
        println!("No prism file given.");
    }
}