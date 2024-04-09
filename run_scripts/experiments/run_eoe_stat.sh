
echo "Time-out value set to ${TO:-1h}"

echo "eoe3000"
timeout ${TO:-1} /opt/Modest/modest modes /submission/CovidModel/experiments/popeoe/COVID2019_EOE3000.jani -W 0.9 --max-run-length 0 --seed 997

echo "return value: $?"

echo "eoe0111"
timeout ${TO:-1} /opt/Modest/modest modes /submission/CovidModel/experiments/popeoe/COVID2019_EOE0111.jani -W 0.9 --max-run-length 0 --seed 997

echo "return value: $?"

echo "eoe3110"
timeout ${TO:-1} /opt/Modest/modest modes /submission/CovidModel/experiments/popeoe/COVID2019_EOE3110.jani -W 0.9 --max-run-length 0 --seed 997

echo "return value: $?"

echo "eoe2111"
timeout ${TO:-1} /opt/Modest/modest modes /submission/CovidModel/experiments/popeoe/COVID2019_EOE2111.jani -W 0.9 --max-run-length 0 --seed 997

echo "return value: $?"

echo "eoe1400"
timeout ${TO:-1} /opt/Modest/modest modes /submission/CovidModel/experiments/popeoe/COVID2019_EOE1400.jani -W 0.9 --max-run-length 0 --seed 997

echo "return value: $?"
