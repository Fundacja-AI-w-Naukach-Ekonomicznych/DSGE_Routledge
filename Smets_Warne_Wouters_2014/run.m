% Adjust path to folder where replication file is stored
addpath('C:\dynare\6.3\matlab');
cd([cd '/EA_SWW14_rep']);
load('SWW_Params.mat');  
dynare EA_SWW14_rep.mod noclearall
