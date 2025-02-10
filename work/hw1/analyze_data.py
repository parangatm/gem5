import os
import sys
import pandas as pd

df = pd.read_csv('stats.csv')

experiments = ['baseline', 'minorcpu',
               'issuewidth2', 'clkfreq1','clkfreq4', 
               'onlyl1', 'l2size256', 'l2size16', 'compilero1']

progs = ['lfsr', 'merge', 'mm', 'sieve', 'spmv']

ipc_df = pd.DataFrame(columns=experiments)
l2occ_df = pd.DataFrame(columns=experiments)
l2miss_df = pd.DataFrame(columns=experiments)
l1dmiss_df = pd.DataFrame(columns=experiments)
l1occ_df = pd.DataFrame(columns=experiments)
idle_df = pd.DataFrame(columns=experiments)
issue_df = pd.DataFrame(columns=experiments)

for prog in progs:
    for exp in experiments:
        fdf = df.loc[(df['prog'] == prog) & (df['dir'] == exp)]
        ipc_df.loc[prog, exp] = fdf['ipc'].values[0]
        l2occ_df.loc[prog, exp] = fdf['l2occ'].values[0]
        l2miss_df.loc[prog, exp] = fdf['l2miss'].values[0]
        l1dmiss_df.loc[prog, exp] = fdf['l1dmiss'].values[0]
        l1occ_df.loc[prog, exp] = fdf['l1occ'].values[0]
        idle_df.loc[prog, exp] = fdf['idleCycles'].values[0]
        issue_df.loc[prog, exp] = fdf['issueRate'].values[0]

print("\nIPC")
print(ipc_df)

print("\n\nL2 Occ")
print(l2occ_df)

print("\n\nL2 Miss")
print(l2miss_df)

print("\n\nL1 Miss")
print(l1dmiss_df)

print("\n\nL1 Occ")
print(l1occ_df)

print("\n\nIdle Cycles")
print(idle_df)

print("\n\nIssue Rate")
print(issue_df)

def get_prog_df(prog):
    new_df = pd.DataFrame(index=experiments)
    new_df['IPC'] = ipc_df.loc[prog]
    new_df['L2 Occ'] = l2occ_df.loc[prog]
    new_df['L2 Miss'] = l2miss_df.loc[prog]
    new_df['L1 Miss'] = l1dmiss_df.loc[prog]
    new_df['L1 Occ'] = l1occ_df.loc[prog]
    new_df['Idle Cycles'] = idle_df.loc[prog]
    new_df['Issue Rate'] = issue_df.loc[prog]
    return new_df

lfsr_df = get_prog_df('lfsr')
mm_df = get_prog_df('mm')
merge_df = get_prog_df('merge')
sieve_df = get_prog_df('sieve')
spmv_df = get_prog_df('spmv')

lfsr_df.to_csv('lfsr_stats.csv')
print(lfsr_df)
