#!/bin/bash

echo "########################"
echo "# Running  experiments #"
echo "########################"
echo "scipt options, "
echo "  1 : run precision tests, these will conclude within a reasonable time.(Table 5)"
echo "  2 : run time-out tests, these experiments will not finish within"
echo "      reasonable timei (Table 2)"
echo "  3 : run modest on realistic size populations, these experiments"
echo "      will not finish within reasonable time.(Figure 4)"
echo "  4 : run all experiments."

echo "parameter given: $1"
echo " "

echo "Setting time-out value to 1h"
TO=1h



if [ $1 == "1" ] || [ $1 == "4" ] 
then
	echo " - RUNNING PRECISION TESTS -"
	echo "end of epidemic (STORM)"
	echo "clearing destination file..."
	 > /submission/output/run_eoe.txt
	echo "running test..." 
	. /submission/run_scripts/experiments/run_eoe.sh > /submission/output/run_eoe.txt
        echo "output stored in  /submission/output/run_eoe.txt"
	echo " - "

	echo "end of epidemic (MODEST, width=0.01)"
	echo "clearing destination file..."
	> /submission/output/run_eoe_stat.txt
	echo "running test..." 
	. /submission/run_scripts/experiments/run_eoe_stat.sh > /submission/output/run_eoe_stat.txt
        echo "output stored in  /submission/output/run_eoe_stat.txt"
	echo " - "

	echo "population increase (STORM)"
        echo "clearing destination file..."
        > /submission/output/run_popinc.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_popinc.sh > /submission/output/run_popinc.txt
        echo "output stored in  /submission/output/run_popinc.txt"
        echo " - "
	
	echo "population increase (MODEST, width=0.01)"
        echo "clearing destination file..."
        > /submission/output/run_popinc_stat.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_popinc_stat.sh > /submission/output/run_popinc_stat.txt
        echo "output stored in  /submission/output/run_popinc_stat.txt"
        echo " - "

	echo "population increase (MODEST, width=0.001)"
        echo "clearing destination file..."
        > /submission/output/run_popinc_stat001.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_popinc_stat001.sh > /submission/output/run_popinc_stat001.txt
        echo "output stored in  /submission/output/run_popinc_stat001.txt"
        echo " - "

	echo "one shot (STORM)"
        echo "clearing destination file..."
        > /submission/output/run_os.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_os.sh > /submission/output/run_os.txt
        echo "output stored in  /submission/output/run_os.txt"
        echo " - "

	echo "one shot (MODEST, width=0.01)"
        echo "clearing destination file..."
        > /submission/output/run_os_stat.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_os_stat.sh > /submission/output/run_os_stat.txt
        echo "output stored in  /submission/output/run_os_stat.txt"
        echo " - "


	echo "one shot (MODEST, width=0.001)"
        echo "clearing destination file..."
        > /submission/output/run_os_stat001.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_os_stat001.sh > /submission/output/run_os_stat001.txt
        echo "output stored in  /submission/output/run_os_stat001.txt"
        echo " - "
fi


if [ $1 == "2" ] || [ $1 == "4" ]
then
	echo " - RUNNING TIME-OUT TESTS -"

	echo "end of epidemic (STORM)"
	echo "clearing destination file..."
	> /submission/output/run_eoe_to.txt
	echo "running test..."
	. /submission/run_scripts/experiments/run_eoe_to.sh > /submission/output/run_eoe_to.txt
	echo "output stored in /submission/output/run_eoe_to.txt"
	echo "-"

	echo "end of epidemic (MODEST, width=0.01)"
        echo "clearing destination file..."
        > /submission/output/run_eoe_to_stat.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_eoe_to_stat.sh > /submission/output/run_eoe_to_stat.txt
        echo "output stored in /submission/output/run_eoe_to_stat.txt"
        echo "-"

	echo "population increase (STORM)"
        echo "clearing destination file..."
        > /submission/output/run_popinc_to.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_popinc_to.sh > /submission/output/run_popinc_to.txt
        echo "output stored in /submission/output/run_popinc_to.txt"
        echo "-"

	echo "population increase (MODEST, width=0.01)"
        echo "clearing destination file..."
        > /submission/output/run_popinc_to_stat.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_popinc_to_stat.sh > /submission/output/run_popinc_to_stat.txt
        echo "output stored in /submission/output/run_popinc_to_stat.txt"
        echo "-"

	echo "one-shot (STORM)"
        echo "clearing destination file..."
        > /submission/output/run_popos_to.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_popos_to.sh > /submission/output/run_popos_to.txt
        echo "output stored in /submission/output/run_popos_to.txt"
        echo "-"

	echo "one-shot (MODEST, width=0.01)"
        echo "clearing destination file..."
        > /submission/output/run_popos_to_stat.txt
        echo "running test..."
        . /submission/run_scripts/experiments/run_popos_to_stat.sh > /submission/output/run_popos_to_stat.txt
        echo "output stored in /submission/output/run_popos_to_stat.txt"
        echo "-"
fi


if [ $1 == "3" ] || [ $1 == "4" ]
then
	echo " - RUNNING MODEST ON REALISTIC POPULATIONS -"
	

	echo "population increase (MODEST, width = 0.01)"
	echo "clearing destination file..."
	> /submission/output/run_popinc_ultimate.txt
	echo "running test..."
	. /submission/run_scripts/experiments/run_popinc_ultimate_stat.sh > /submission/output/run_popinc_ultimate.txt
	echo "output stored in /submission/output/run_popinc_ultimate.txt"
	echo "-"

fi
