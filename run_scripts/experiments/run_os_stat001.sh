echo "Time-out value set to ${TO:-1h}"

echo "os3000"
timeout ${TO:-1h} /opt/Modest/modest modes /submission/CovidModel/experiments/popos/COVID2019_POP3000.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "os0111"
timeout ${TO:-1h} /opt/Modest/modest modes /submission/CovidModel/experiments/popos/COVID2019_POP0111.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "os3110"
timeout ${TO:-1h} /opt/Modest/modest modes /submission/CovidModel/experiments/popos/COVID2019_POP3110.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "os2111"
timeout ${TO:-1h} /opt/Modest/modest modes /submission/CovidModel/experiments/popos/COVID2019_POP2111.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"

echo "os1400"
timeout ${TO:-1h} /opt/Modest/modest modes /submission/CovidModel/experiments/popos/COVID2019_POP1400.jani -W 0.01 --max-run-length 0 --seed 997
echo "return value: $?"
