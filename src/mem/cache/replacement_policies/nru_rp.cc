/**
 * Copyright (c) 2018-2020 Inria
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "mem/cache/replacement_policies/nru_rp.hh"

#include <cassert>
#include <memory>

#include "params/NRURP.hh"
#include "sim/cur_tick.hh"

namespace gem5
{

namespace replacement_policy
{

NRU::NRU(const Params &p)
  : Base(p)
{
}

void
NRU::invalidate(const std::shared_ptr<ReplacementData>& replacement_data)
{
    // Set NRU bit to 0 (NRU)
    std::static_pointer_cast<NRUReplData>(
        replacement_data)->nruBit = false;
}

void
NRU::touch(const std::shared_ptr<ReplacementData>& replacement_data) const
{
    // Set NRU bit to 1 (RU)
    std::static_pointer_cast<NRUReplData>(
        replacement_data)->nruBit = true;
}

void
NRU::reset(const std::shared_ptr<ReplacementData>& replacement_data) const
{
    // On insertion, set NRU bit to 1 (RU)
    std::static_pointer_cast<NRUReplData>(
        replacement_data)->nruBit = true;
}

ReplaceableEntry*
NRU::getVictim(const ReplacementCandidates& candidates) const
{
    // There must be at least one replacement candidate
    assert(candidates.size() > 0);

    // Collect all NRU=0 entries
    std::vector<ReplaceableEntry*> nru_zero_entries;
    for (const auto& candidate: candidates) {
        if (!std::static_pointer_cast<NRUReplData>(candidate->replacementData)->nruBit) {
            nru_zero_entries.push_back(candidate);
        }
    }

    // Select a random NRU=0 entry
    if(!nru_zero_entries.empty()) {
        return nru_zero_entries[rng->random<unsigned>(0, nru_zero_entries.size() - 1)];
    }

    // Reset all NRU bits all are zero
    resetNRUBits(candidates);

    return candidates[rng->random<unsigned>(0, candidates.size() - 1)];
}

std::shared_ptr<ReplacementData>
NRU::instantiateEntry()
{
    return std::shared_ptr<ReplacementData>(new NRUReplData());
}

void 
NRU::resetNRUBits(const ReplacementCandidates& candidates) const
{
    for (auto& candidate : candidates) {
        std::static_pointer_cast<NRUReplData>(candidate->replacementData)->nruBit = true;
    }
}

} // namespace replacement_policy
} // namespace gem5
