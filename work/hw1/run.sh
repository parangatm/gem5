#!/bin/sh
cd ../..

run_gem5() {
    local prog_name=$1
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/baseline work/baseline.py --prog=${prog_name}
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/minorcpu work/baseline.py --prog=${prog_name} --cpu=minor
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/issuewidth2 work/baseline.py --prog=${prog_name} --issueWidth=2
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/clkfreq1 work/baseline.py --prog=${prog_name} --freq=1GHz
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/clkfreq4 work/baseline.py --prog=${prog_name} --freq=4GHz
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/l2size256 work/baseline.py --prog=${prog_name} --l2Size=256KiB
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/l2size16 work/baseline.py --prog=${prog_name} --l2Size=16MiB
    build/X86/gem5.opt --outdir=work/hw1/results/${prog_name}/compilero1 work/baseline.py --prog=${prog_name} --compilerOpt=O1
}

run_gem5 lfsr
run_gem5 merge
run_gem5 mm
run_gem5 sieve
run_gem5 spmv
