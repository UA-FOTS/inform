#!/bin/bash

echo "Time-out value set to ${TO:-1h}"

echo "_________2__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO2.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________3__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO3.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________4__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO4.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________5__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO5.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________6__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO6.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________7__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO7.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________8__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO8.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________9__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO9.jani --max-run-length 0 -W 0.9
echo "return value: $?"

echo "_________10__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popeoe/COVID2019_EOE_TO10.jani --max-run-length 0 -W 0.9
echo "return value: $?"

