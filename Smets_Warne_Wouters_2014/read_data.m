file = readtable("SWPL_data.xlsx", 'Sheet',"dataset");
file = removevars(file, "Var1");

dy_obs =    file{:,1};
dc_obs =    file{:,2};
di_obs =    file{:,3};
dw_obs =    file{:,4};
de_obs =    file{:,5};
pi_obs =    file{:,6};
r_obs  =    file{:,7};
u_obs  =    file{:,8};

clear file;

save('SWW2014_data.mat')
