#!/bin/bash

echo "Time-out value set to ${TO:-1h}"

echo "_________2__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO2.jani --max-run-length 0
echo "return value: $?"

echo "_________3__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO3.jani --max-run-length 0
echo "return value: $?"

echo "_________4__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO4.jani --max-run-length 0
echo "return value: $?"

echo "_________5__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO5.jani --max-run-length 0
echo "return value: $?"

echo "_________6__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO6.jani --max-run-length 0
echo "return value: $?"

echo "_________7__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO7.jani --max-run-length 0
echo "return value: $?"

echo "_________8__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO8.jani --max-run-length 0
echo "return value: $?"

echo "_________9__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO9.jani --max-run-length 0
echo "return value: $?"

echo "_________10__________"
timeout ${TO:-1h} /opt/Modest/modest  modes /CAVsubmission/CovidModel/experiments/popos/COVID2019_POPOS_TO10.jani --max-run-length 0
echo "return value: $?"

