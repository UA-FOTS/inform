#!/bin/bash

echo "Time-out value is set to ${TO:-1h}"

echo "_________2__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=5,c0_init=2,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________3__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=6,c0_init=3,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________4__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=7,c0_init=4,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________5__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=8,c0_init=5,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________6__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=9,c0_init=6,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________7__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=10,c0_init=7,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________8__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=11,c0_init=8,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________9__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=12,c0_init=9,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "_________10__________"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /CAVsubmission/CovidModel/COVID2019.pm  --io:constants pop=13,c0_init=10,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0  --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"


