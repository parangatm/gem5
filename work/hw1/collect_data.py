import os
import sys
import re
import pandas as pd

def get_df_for_prog(prog):
    df = pd.DataFrame(
        columns=['prog', 'dir', 'ipc', 
                 'simInsts','simTicks', 'simOps', 
                 'l1dmiss', 'l2miss', 'l2occ', 'l1occ',
                 'issueRate', 'idleCycles'])

    for dir in os.listdir(f'hw1/{prog}'):
        for file in os.listdir(f'hw1/results/{prog}/{dir}'):
            if file == 'stats.txt':
                stats_dict = {}
                stats_dict['dir'] = dir
                with open(f'hw1/results/{prog}/{dir}/{file}', 'r') as f:
                    lines = f.readlines()
                    for line in lines:
                        # if 'simSeconds' in line:
                        #     stats_dict['simSeconds'] = line.split()[1]
                        if 'simTicks' in line:
                            stats_dict['simTicks'] = line.split()[1]
                        if 'simInsts' in line:
                            stats_dict['simInsts'] = line.split()[1]
                        if 'simOps' in line:
                            stats_dict['simOps'] = line.split()[1]
                        if 'board.cache_hierarchy.l1dcaches.overallMissRate::total' in line:
                            stats_dict['l1dmiss'] = line.split()[1]
                        if 'board.cache_hierarchy.l2cache.overallMissRate::total' in line:
                            stats_dict['l2miss'] = line.split()[1]
                        if 'board.cache_hierarchy.l2cache.tags.avgOccs::total' in line:
                            stats_dict['l2occ'] = line.split()[1]
                        if 'board.cache_hierarchy.l1dcaches.tags.avgOccs::total' in line:
                            stats_dict['l1occ'] = line.split()[1]
                        if 'board.processor.cores.core.ipc' in line:
                            stats_dict['ipc'] = line.split()[1]
                        if 'board.processor.cores.core.issueRate' in line:
                            stats_dict['issueRate'] = line.split()[1]
                        if 'board.processor.cores.core.idleCycles' in line:
                            stats_dict['idleCycles'] = line.split()[1]
                        
                            
                f.close()
                stats_dict['prog'] = prog
                stats_df = pd.DataFrame([stats_dict])
                df = pd.concat([df, stats_df], ignore_index=True)
    return df

master_df = pd.DataFrame(
    columns=['prog', 'dir', 'ipc', 
                 'simInsts','simTicks', 'simOps', 
                 'l1dmiss', 'l2miss', 'l2occ', 'l1occ', 
                 'issueRate', 'idleCycles'])

progs = ['lfsr', 'merge', 'mm', 'sieve', 'spmv']

for prog in progs:
    prog_df = get_df_for_prog(prog)
    master_df = pd.concat([master_df, prog_df], ignore_index=True)

print(master_df)
master_df.to_csv('stats.csv', index=False)

