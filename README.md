# The INFORM toolchain

The INFORM toolchain allows formal verification of compartmental model. The toolchain is the first step to a uniform framework for analyzing epidemics. Compartmental models are given in a graph based format, using the CMS (compartmental model specifications) format.

Inform is has a GPLv3 license. All dependencies provided here have their own
licenses. In particular, Modest is only provided in binary form.

## Building and running INFORM
We strongly suggest you use the provided Docker image or follow the steps below to build your own from the sources in this repository. Otherwise, you can try and satisfy the following dependencies on your own.
* [The Storm model checker](https://www.stormchecker.org/)
* The statistical model checker from the [Modest Toolset](https://www.modestchecker.net/)

### Building the Docker image yourself

To build it you have to do the following:
```
docker builder build -t some_name .
```
From the directory in which the dockerfile is. 

### Setting up the Docker image
Now that you have the image, you can start a container, either in docker desktop with the GUI, or with 
```
docker run -ti some_name
```
 We put tail -f /dev/null as entry point, meaning that when you start the container, it just does nothing. To do anything you can go to the terminal/exec tab in docker desktop (which starts a shell) or run 
```
docker exec -ti name_of_the_container bash
```
to start a bash.

Currently, the dockerfile only installs rust for bash and not shell, so in the terminal/exec you first have to start bash to build INFORM. 

### Post Docker setup

INFORM is the translation tool for compartmental models in the cms format to stochastic counter machines in the prism (.pm) format. Then model checkers like storm and modest can be used to verify the desired properties. Note that modest does not support prism files yet, and storm-conv has to be used to convert prism files to jani files. 

INFORM was written in Rust and can easily be built using the cargo package manager. For your convenience, it has already been compiled. If you want to recompile it, simply go the to directory containing INFORM and use the command "cargo build" to build the application. The executable can then be found in ./inform/target/debug/.

To run INFORM, use the -h flag to display all options. Use the -i filename1 flag to give cms file as input, and use the -p filename2 flag to translate the input to the prism format and save it in filename2. The use of the -l flag is higly advised. This will ensure that INFORM will translate any binomial distributions with compartmental dependencies using the full encoding. Otherwise, the model is not compatible to be translated to jani. 

### Reproducing experiments
Once you launch bash from the Docker image, you can use the following three
scripts to re-run all conversions and experiments and to generate the tables
presented in the paper.
```
run_scripts/run_conversions.sh
run_scripts/run_experiments.sh 4
run_scripts/generate_tables/generate_table6.py
```

The `run_experiments.sh` script has a 10s timeout, per individual experiment, by default. For the numbers
reported in the paper, a timeout of 1h was used instead. You can change the
timeout by defining the environment variable `TO` and setting it to 1h before
running the experiments' script.

## The CMS input format

The CMS format is simple textual file format for encoding compartmental models. 
Each CMS file is divided into two sections: the meta-section, and the trans(itions)-section. In the meta section, starting with the "-meta-", all meta info is placed, such as the population size, number of compartments. In the trans section, starting with "-trans-", all transitions are defined. The format for a transition is as follows.
```
src dst [prob1 dependency1] [prob2 dependency2] ...
```
Here, src is the id of source compartment. If there are 3 compartments, the ids are 0, 1, or 2. Dst is the id of the destination state. This is followed by a list of probabilities with their dependency. If there is no dependency then the only probability in the list will be [p _] with p in [0, 1]. If the list is [p1 0] [p2 1], then the success-rate is p1^|0|*p2^|1|. 

### A complete example
```
-meta-
pop 10
h 1
comps 3
final 1
-trans-
0 1 [0.2 1] 
1 2 [0.3 _]
```
