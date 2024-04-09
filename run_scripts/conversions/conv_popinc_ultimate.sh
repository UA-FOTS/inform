 #!/bin/bash


echo "_________10__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO10.jani --input:constants pop=13,c0_init=10,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________20__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO20.jani --input:constants pop=23,c0_init=20,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________40__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO40.jani --input:constants pop=43,c0_init=40,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________80__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO80.jani --input:constants pop=83,c0_init=80,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________160__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO160.jani --input:constants pop=163,c0_init=160,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________320__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO320.jani --input:constants pop=323,c0_init=320,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________640__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO640.jani --input:constants pop=643,c0_init=640,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________1280__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO1280.jani --input:constants pop=1283,c0_init=1280,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________2560__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO2560.jani --input:constants pop=2563,c0_init=2560,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"




echo "_________5120__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO5120.jani --input:constants pop=5123,c0_init=5120,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________10240__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO10240.jani --input:constants pop=10243,c0_init=10240,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________20480__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO20480.jani --input:constants pop=20483,c0_init=20480,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________40960__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO40960.jani --input:constants pop=40963,c0_init=40960,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________81920__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO81920.jani --input:constants pop=81923,c0_init=81920,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________163840__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO163840.jani --input:constants pop=163843,c0_init=163840,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________327680__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO327680.jani --input:constants pop=327683,c0_init=327680,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________655360__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO655360.jani --input:constants pop=655363,c0_init=655360,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"

echo "_________1310720__________"
/opt/storm/build/bin/storm-conv --prism /submission/CovidModel/COVID2019.pm  --tojani /submission/CovidModel/experiments/popinc/COVID2019_POPINC_TO1310720.jani --input:constants pop=1310723,c0_init=1310720,c1_init=0,c2_init=0,c3_init=1,c4_init=1,c5_init=1,c6_init=0,c7_init=0,c8_init=0,c9_init=0 --prop "P=? [(q<31) U (c1+c2+c3+c4+c5 = 0)]"


