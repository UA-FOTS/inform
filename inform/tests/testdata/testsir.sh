#!/bin/bash
echo "sir (5, 5, 0)"
echo "Expected value: 9.261268464"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=5,c1_init=5,c2_init=0 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir (9, 1, 0)" 
echo "Expected value: 9.842866578"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=9,c1_init=1,c2_init=0 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir (8, 1, 1)" 
echo "Expected value: 9.55148468"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=8,c1_init=1,c2_init=1 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir (3, 4, 3)" 
echo "Expected value: 8.25082656"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=3,c1_init=4,c2_init=3 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir (6, 1, 3)" 
echo "Expected value: 8.858321753"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=6,c1_init=1,c2_init=3 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir (1, 1, 9)" 
echo "Expected value: 5.157318741"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=1,c1_init=1,c2_init=9 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir (5, 0, 5)" 
echo "Expected value: 0"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=5,c1_init=0,c2_init=5 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir (0, 10, 0)" 
echo "Expected value: 8.711869991"
./storm --prism /data/sir.pm --io:constants pop=10,c0_init=0,c1_init=10,c2_init=0 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"


echo "___TESTING_SPLIT___"
echo "split (2, 0, 0)" 
echo "Expected value: 0.1562301335"
./storm --prism /data/split.pm --io:constants pop=2,c0_init=2,c1_init=0,c2_init=0 --prop "P=? [F q=5]" | grep 'Result'
echo "------"

echo "___TESTING_DEPENDS___"
echo "two_depends_simple (2, 1)"
echo "Expected value: 1.0243422859"
./storm --prism /data/two_depends_simple.pm --io:constants pop=3,c0_init=2,c1_init=1 --prop "R{\"time_step\"}=? [F c0=0]"| grep 'Result'

echo "___TESTING SIR2___"
echo "sir2 (5, 5, 0)"
echo "Expected value: 9.261268464"
./storm --prism /data/sir2.pm --io:constants pop=10,c0_init=5,c1_init=5,c2_init=0 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir2 (9, 1, 0)" 
echo "Expected value: 9.842866578"
./storm --prism /data/sir2.pm --io:constants pop=10,c0_init=9,c1_init=1,c2_init=0 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir2 (8, 1, 1)" 
echo "Expected value: 9.55148468"
./storm --prism /data/sir2.pm --io:constants pop=10,c0_init=8,c1_init=1,c2_init=1 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir2 (3, 4, 3)" 
echo "Expected value: 8.25082656"
./storm --prism /data/sir2.pm --io:constants pop=10,c0_init=3,c1_init=4,c2_init=3 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "sir2 (6, 1, 3)" 
echo "Expected value: 8.858321753"
./storm --prism /data/sir2.pm --io:constants pop=10,c0_init=6,c1_init=1,c2_init=3 --prop "R{\"time_step\"}=? [F c1=0]" | grep 'Result'
echo "------"

echo "___TESTING DEPENDS2___"
echo "two_depends_simple (2, 1)"
echo "Expected value: 1.0243422859"
./storm --prism /data/two_depends_simple2.pm --io:constants pop=3,c0_init=2,c1_init=1 --prop "R{\"time_step\"}=? [F c0=0]"| grep 'Result'