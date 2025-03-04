#!/bin/bash

###-----leela_s-----###

prog_name="leela_s"

cd /root/spec2017
source shrc

go ${prog_name}
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=LRU

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=BRRIP 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="ref.sgf" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=BRRIP 

###-----mcf_s-----###

prog_name="mcf_s"

cd /root/spec2017
source shrc

go ${prog_name}
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=BRRIP 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="inp.in" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=BRRIP 

###-----nab_s-----###

prog_name="nab_s"

cd /root/spec2017
source shrc

go ${prog_name}
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=BRRIP 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="3j1n 20140317 220" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=BRRIP 

###-----lbm_s-----###

prog_name="lbm_s"

cd /root/spec2017
source shrc

go ${prog_name}
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=BRRIP 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="2000 reference.dat 0 0 200_200_260_ldc.of" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=BRRIP 

###-----x264_s-----###

prog_name="x264_s"

cd /root/spec2017
source shrc

go ${prog_name}
cd run/run_base_refspeed_mytest-m64.0000

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_LRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=LRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NMRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NMRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_NRU_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=NRU 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_8 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=8 --l2_assoc=8 --rp=BRRIP 

/root/gem5/build/X86/gem5.opt --outdir=/root/gem5/work/hw3/out/${prog_name}_BRRIP_16 /root/gem5/configs/deprecated/example/se.py \
        --cmd=../../build/build_base_mytest-m64.0000/${prog_name} \
        --options="--seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 ../../BuckBunny.yuv 1280x720" \
        --mem-size=8GB --cpu-type=DerivO3CPU --caches --l2cache --l1d_size=64kB --l1i_size=32kB --l2_size=2MB --cpu-clock=2GHz --maxinsts=5000000 --l1d_assoc=16 --l2_assoc=16 --rp=BRRIP 
