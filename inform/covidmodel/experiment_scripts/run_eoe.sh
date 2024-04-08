#!/bin/bash


#Sus = c0
#A = c3
#M = c4
#S = c5

echo "eoe3000"
./storm --prism /data/covidmodel/COVID2019.pm  --io:constants pop=3,c0_init=3,c1_init=0,c2_init=0,c3_init=0,c4_init=0,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "R{\"time_step\"}=? [F (c1+c2+c3+c4+c5 = 0)]"

echo "eoe0111"
./storm --prism /data/covidmodel/COVID2019.pm  --io:constants pop=3,c0_init=0,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "R{\"time_step\"}=? [F (c1+c2+c3+c4+c5 = 0)]"

echo "eoe3110"
./storm --prism /data/covidmodel/COVID2019.pm  --io:constants pop=5,c0_init=3,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "R{\"time_step\"}=? [F (c1+c2+c3+c4+c5 = 0)]"

echo "eoe2111"
./storm --prism /data/covidmodel/COVID2019.pm  --io:constants pop=5,c0_init=2,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "R{\"time_step\"}=? [F (c1+c2+c3+c4+c5 = 0)]"

echo "eoe1400"
./storm --prism /data/covidmodel/COVID2019.pm  --io:constants pop=5,c0_init=1,c1_init=0,c2_init=0,c3_init=4,c4_init=0,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "R{\"time_step\"}=? [F (c1+c2+c3+c4+c5 = 0)]"


