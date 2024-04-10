# This script will generate table 6 from the inform paper.

import pandas as pd

def read_storm_output(lines):
    """Reads values from storm output, puts everything output in a list with time in seconds or TO for time out."""
    values = []
    tempvalue = 0
    for line in lines:
        if "return value: 124" in line:  # time-out occured.
            values.append("TO")
            tempvalue = 0  # flush tempvalue, this entry is time-out.

        elif "Time for model construction:" in line:
            l2 = line[29:]
            l3 = l2[:-3]
            tempvalue += float(l3)

        elif "Time for model checking:" in line:
            l2 = line[25:]
            l3 = l2[:-3]
            tempvalue += float(l3)
            values.append(str(tempvalue) + "s")
            tempvalue = 0
    return values


def read_modest_output(lines):
    values = []

    for line in lines:
        if "return value: 124" in line:  # time-out occured.
            values.append("TO")
        elif "Simulation time:" in line:
            l2 = line[17:-3]
            values.append(str(l2) + "s")
    return values

# generate run_eoe in storm
val_eoe = []
val_eoe_stat = []

val_popinc = []
val_popinc_stat = []
val_popinc_stat001 = []

val_popos_stat = []
val_popos_stat001 = []

with open("/submission/output/run_eoe.txt") as f:
    val_eoe = read_storm_output(f.readlines())

with open("/submission/output/run_eoe_stat.txt") as f:
    val_eoe_stat = read_modest_output(f.readlines())

with open("/submission/output/run_popinc.txt") as f:
    val_popinc = read_storm_output(f.readlines())

with open("/submission/output/run_popinc_stat.txt") as f:
    val_popinc_stat = read_modest_output(f.readlines())

with open("/submission/output/run_popinc_stat001.txt") as f:
    val_popinc_stat001 = read_modest_output(f.readlines())

with open("/submission/output/run_os.txt") as f:
    val_popos = read_storm_output(f.readlines())

with open("/submission/output/run_os_stat.txt") as f:
    val_popos_stat = read_modest_output(f.readlines())

with open("/submission/output/run_os_stat001.txt") as f:
    val_popos_stat001 = read_modest_output(f.readlines())

data = {"population": [(3, 0, 0, 0), (0, 1, 1, 1), (3, 1, 1, 0), (2, 1, 1, 1), (1, 4, 0, 0)],
        "eoe(storm)": val_eoe,
        "eoe(modest, w=0.9)": val_eoe_stat,
        "popinc(storm)": val_popinc,
        "popinc(modest, w=0.01)": val_popinc_stat,
        "popinc(modest, w=0.001)": val_popinc_stat001,
        "popos(storm)": val_popos,
        "popos(modest, w=0.01)": val_popos_stat,
        "popos(modest, w=0.001)": val_popos_stat001
        }
df = pd.DataFrame(data=data)
print(df.to_latex())

