#!/bin/bash


echo "Testing suite for SIR model"
echo "Compiling sir.cms to pm"
../target/debug/inform -i ../examples/sir.cms -p ./testdata/sir.pm
../target/debug/inform -i ../examples/sir.cms -p ./testdata/sir2.pm -l
../target/debug/inform -i ../examples/split.cms -p ./testdata/split.pm
../target/debug/inform -i ../examples/two_depends_simple.cms -p ./testdata/two_depends_simple.pm
../target/debug/inform -i ../examples/two_depends_simple.cms -p ./testdata/two_depends_simple2.pm -l

sudo docker run -v "$(pwd)"/testdata:/data:z -w /opt/storm/build/bin --rm -it --name storm movesrwth/storm:ci-release 

