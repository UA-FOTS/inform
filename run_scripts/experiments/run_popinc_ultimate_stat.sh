#!/bin/bash

echo "Time-out value set to ${TO:-1h}"

echo "_________10__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO10.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________20__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO20.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________40__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO40.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________80__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO80.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________160__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO160.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________320__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO320.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________640__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO640.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________1280__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO1280.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________2560__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO2560.jani  --max-run-length 0 --seed 997
echo "return value: $?"




echo "_________5120__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO5120.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________10240__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO10240.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________20480__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO20480.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________40960__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO40960.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________81920__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO81920.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________163840__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO163840.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________327680__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO327680.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________655360__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO655360.jani  --max-run-length 0 --seed 997
echo "return value: $?"

echo "_________1310720__________"
timeout ${TO:-1h} /opt/Modest/modest  modes  /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO1310720.jani  --max-run-length 0 --seed 997
echo "return value: $?"


