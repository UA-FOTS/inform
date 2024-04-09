#!/bin/bash


echo "_________2__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=5,c0_init=2,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________3__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=6,c0_init=3,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________4__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=7,c0_init=4,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________5__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=8,c0_init=5,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________6__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=9,c0_init=6,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________7__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=10,c0_init=7,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________8__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=11,c0_init=8,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________9__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=12,c0_init=9,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

echo "_________10__________"
/opt/storm/build/bin/storm --prism /project_antwerp/inform/covidmodel/COVID2019.pm  --io:constants pop=13,c0_init=10,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(c0 >= c0_init) U (q=30)&(fr0 = c0_init)]"

