# inform
Inform is a tool that generates Prism files for stochastic compartmental models (SCM).
Stochastic compartmental models are often used to model epidemics and pandemics on large scales. 
Inform is a tools in a larger toolchain with the aim of enabling formal methods for these epidemiological models.


## The CMS language
The CMS format is a simple regular format for encoding stochastic compartmental models in line with the model for the early stages of COVID in Belgium [1]. 
Here we give a simple example of a small SIR model as seen in [2].
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

In the meta header, all extra information is specified, like the population size, the lenght of a timestep, the amount of compartments and the final condition. Currently, the final condition can only be a reference to a compartment. The termination condition is then "Compartment 0 is empty". 
In the trans part a list of transition should be given in the following format. First the source compartment has to be specified by its integer id, then the destination compartment has to be specified by its integer id. 
Finally, a space separated list of tuples has to be specified that represent the rates of the Binomial distributions associated with the transitions.

## References
[1] Abrams, S., Wambua, J., Santermans, E., Willem, L., Kuylen, E., Coletti, P., ... & Hens, N. (2021). Modelling the early phase of the Belgian COVID-19 epidemic using a stochastic compartmental model and studying its implied future trajectories. Epidemics, 35, 100449.

[2] González AA, Pérez GA. Computation of Expected Epidemic Duration. medRxiv; 2023. DOI: 10.1101/2023.04.24.23289026.
