#!/bin/bash

echo "Time-value is set to ${TO:-1h}"
#Sus = c0
#A = c3
#M = c4
#S = c5

echo "POP3000"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=3,c0_init=3,c1_init=0,c2_init=0,c3_init=0,c4_init=0,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "pop0111"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=3,c0_init=0,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "pop3110"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=5,c0_init=3,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "pop2111"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=5,c0_init=2,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"

echo "pop1400"
timeout ${TO:-1h} /opt/storm/build/bin/storm --prism /submission/CovidModel/COVID2019.pm  --io:constants pop=5,c0_init=1,c1_init=0,c2_init=0,c3_init=4,c4_init=0,c5_init=0,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"
echo "return value: $?"
