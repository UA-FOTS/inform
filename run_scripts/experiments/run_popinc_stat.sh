echo "Time-out value set to ${TO:-1h}"

echo "popinc3000"
timeout ${TO:-1h} /opt/Modest/modest modes /CAVsubmission/CovidModel/experiments/popinc/COVID2019_POP3000.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "popinc0111"
timeout ${TO:-1h} /opt/Modest/modest modes /CAVsubmission/CovidModel/experiments/popinc/COVID2019_POP0111.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "popinc3110"
timeout ${TO:-1h} /opt/Modest/modest modes /CAVsubmission/CovidModel/experiments/popinc/COVID2019_POP3110.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "popinc2111"
timeout ${TO:-1h} /opt/Modest/modest modes /CAVsubmission/CovidModel/experiments/popinc/COVID2019_POP2111.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "popinc1400"
timeout ${TO:-1h} /opt/Modest/modest modes /CAVsubmission/CovidModel/experiments/popinc/COVID2019_POP1400.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

