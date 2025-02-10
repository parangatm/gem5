## Baseline Configuration

## Script Inputs: prog, cpu, issueWidth, freq, l2Size, compilerOpt

## CommandLine Arguments
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--prog", type=str, default="tests/test-progs/hello/bin/x86/linux/hello", help="Program to run")
# parser.add_argument("--cpu", type=str, default="ooo", help="CPU Type")
# parser.add_argument("--issueWidth", type=int, default=8, help="Issue Width")
# parser.add_argument("--freq", type=str, default="2GHz", help="Frequency")
# parser.add_argument("--l2Size", type=str, default="2MiB", help="L2 Cache Size")
# parser.add_argument("--compilerOpt", type=str, default="O3", help="Compiler Optimization")

args = parser.parse_args()
prog = args.prog
# cpu = args.cpu
# issueWidth = args.issueWidth
# freq = args.freq
# l2Size = args.l2Size
# compilerOpt = args.compilerOpt

# print("## gem5 Experiment Configuration:")
# print(f"Program: {prog}")
# print(f"CPU: {cpu}")
# print(f"Issue Width: {issueWidth}")
# print(f"Frequency: {freq}")
# print(f"L2 Cache Size: {l2Size}")
# print(f"Compiler Optimization: {compilerOpt}")
# print("-----------------------------")

## Default parameters
# prog = "tests/test-progs/hello/bin/x86/linux/hello"
cpu = "ooo"
issueWidth = 8
freq = "2GHz"
l2Size = "2MiB"
compilerOpt = "O3"

## Import gem5 components
from gem5.components.boards.simple_board import SimpleBoard
from gem5.components.cachehierarchies.classic.private_l1_shared_l2_cache_hierarchy import PrivateL1SharedL2CacheHierarchy
from gem5.components.cachehierarchies.classic.private_l1_cache_hierarchy import PrivateL1CacheHierarchy
from gem5.components.memory.single_channel import SingleChannelDDR3_1600
from gem5.isas import ISA
from gem5.resources.resource import AbstractResource
from gem5.simulate.simulator import Simulator
from gem5.components.processors.base_cpu_core import BaseCPUCore
from gem5.components.processors.base_cpu_processor import BaseCPUProcessor
from m5.objects import X86O3CPU, X86MinorCPU

## Memory
main_mem = SingleChannelDDR3_1600(size="8GB")
l1_l2_caches = PrivateL1SharedL2CacheHierarchy(
    l1d_size="64KiB",
    l1d_assoc=8,
    l1i_size="64KiB",
    l1i_assoc=8,
    l2_size=l2Size,
    l2_assoc=16
)
only_l1_cache = PrivateL1CacheHierarchy(
    l1d_size="64KiB",
    # l1d_assoc=8,
    l1i_size="64KiB",
    # l1i_assoc=8
)

## Processor
class OutOfOrderCore(BaseCPUCore):
    def __init__(self, width):
        super().__init__(X86O3CPU(), ISA.X86)
        self.core.fetchWidth = width
        self.core.decodeWidth = width
        self.core.renameWidth = width
        self.core.dispatchWidth = width
        self.core.issueWidth = width
        self.core.wbWidth = 8
        self.core.commitWidth = 8
        self.core.squashWidth = 8

class OutOfOrderProcessor(BaseCPUProcessor):
    def __init__(self, width):
        cores = [OutOfOrderCore(width)]
        super().__init__(cores)

class InOrderCore(BaseCPUCore):
    def __init__(self, width):
        super().__init__(X86MinorCPU(), ISA.X86)
        self.core.decodeInputWidth = width
        self.core.executeInputWidth = width
        self.core.executeIssueLimit = width
        self.core.executeCommitLimit = width

class InOrderProcessor(BaseCPUProcessor):
    def __init__(self, width):
        cores = [InOrderCore(width)]
        super().__init__(cores)

ooo_processor = OutOfOrderProcessor(
    width=issueWidth
)

ino_processor = InOrderProcessor(
    width=issueWidth
)

if cpu == "ooo":
    processor = ooo_processor
if cpu == "minor":
    processor = ino_processor

## Board
# board = SimpleBoard(
#     processor = processor,
#     memory = main_mem,
#     cache_hierarchy = l1_l2_caches,
#     clk_freq = freq
# )
board = SimpleBoard(
    processor = processor,
    memory = main_mem,
    cache_hierarchy = only_l1_cache,
    clk_freq = freq
)

# binary = AbstractResource(local_path = "tests/test-progs/hello/bin/x86/linux/hello")
benchmark = f'work/hw1/cs251a-microbench/{compilerOpt}/{prog}'
binary = AbstractResource(local_path = benchmark)
board.set_se_binary_workload(binary)

simulator = Simulator(board=board)
simulator.run()
