#!/bin/bash


#Sus = c0
#A = c3
#M = c4
#S = c5

echo "POP3000"
/opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=3,c0_init=3,c1_init=0,c2_init=0,c3_init=0,c4_init=0,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "pop0111"
/opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=3,c0_init=0,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "pop3110"
/opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=5,c0_init=3,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "pop2111"
/opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=5,c0_init=2,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "pop1400"
/opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=5,c0_init=1,c1_init=0,c2_init=0,c3_init=4,c4_init=0,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"


