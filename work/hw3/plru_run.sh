#!/bin/bash

cd /root/spec2017
source shrc

go leela_s
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/leela_s_PLRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/leela_s \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=PLRU

cd /root/spec2017
source shrc

go mcf_s
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/mcf_s_PLRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/mcf_s \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=PLRU 

cd /root/spec2017
source shrc

go nab_s
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/nab_s_PLRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/nab_s \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=PLRU 

cd /root/spec2017
source shrc

go lbm_s
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/lbm_s_PLRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/lbm_s \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=PLRU 

cd /root/spec2017
source shrc

go x264_s
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/x264_s_PLRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/x264_s \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=PLRU 

