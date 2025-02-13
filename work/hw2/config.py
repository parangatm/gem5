from gem5.components.boards.simple_board import SimpleBoard
from gem5.components.cachehierarchies.classic.private_l1_shared_l2_cache_hierarchy import (
    PrivateL1SharedL2CacheHierarchy,
)
from gem5.components.memory.single_channel import SingleChannelDDR4_2400
from gem5.resources.resource import obtain_resource
from gem5.resources.resource import AbstractResource
from gem5.simulate.simulator import Simulator
from gem5.isas import ISA
from gem5.resources.resource import Resource

from gem5.components.processors.base_cpu_core import BaseCPUCore
from gem5.components.processors.base_cpu_processor import BaseCPUProcessor

from m5.objects import X86O3CPU, X86MinorCPU
from m5.objects import TournamentBP

class OutOfOrderCore(BaseCPUCore):
    def __init__(self, width, rob_size, num_int_regs, num_fp_regs):
        super().__init__(X86O3CPU(), ISA.X86)
        self.core.fetchWidth = width
        self.core.decodeWidth = width
        self.core.renameWidth = width
        self.core.issueWidth = width
        self.core.wbWidth = width
        self.core.commitWidth = width

        self.core.numROBEntries = rob_size

        self.core.numPhysIntRegs = num_int_regs
        self.core.numPhysFloatRegs = num_fp_regs

        self.core.branchPred = TournamentBP()

        self.core.LQEntries = 128
        self.core.SQEntries = 128

class OutOfOrderProcessor(BaseCPUProcessor):
    def __init__(self, width, rob_size, num_int_regs, num_fp_regs):
        """
        :param width: sets the width of fetch, decode, raname, issue, wb, and
        commit stages.
        :param rob_size: determine the number of entries in the reorder buffer.
        :param num_int_regs: determines the size of the integer register file.
        :param num_int_regs: determines the size of the vector/floating point
        register file.
        """
        cores = [OutOfOrderCore(width, rob_size, num_int_regs, num_fp_regs)]
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

main_memory = SingleChannelDDR4_2400(size="2GB")

caches = PrivateL1SharedL2CacheHierarchy(
    l1d_size="32KiB",
    l1d_assoc=8,
    l1i_size="32KiB",
    l1i_assoc=8,
    l2_size="256KiB",
    l2_assoc=16,
)

ooo_processor = OutOfOrderProcessor(
    width=8, rob_size=192, num_int_regs=256, num_fp_regs=256
)

ino_processor = InOrderProcessor(
    width=8
)

board = SimpleBoard(
    processor=ooo_processor,
    # processor=ino_processor,
    memory=main_memory,
    cache_hierarchy=caches,
    clk_freq="3GHz",
)

benchmark = f'work/hw2/verify'
benchmark = f'work/hw2/work'
binary = AbstractResource(local_path = benchmark)
board.set_se_binary_workload(binary)

simulator = Simulator(board)
simulator.run()
