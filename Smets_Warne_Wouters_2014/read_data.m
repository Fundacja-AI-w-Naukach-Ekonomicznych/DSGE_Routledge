file = readtable("SWW_data.xlsx", 'Sheet',"Sheet 1");
file = removevars(file, "time");

dy_obs =    file{:,1};
dc_obs =    file{:,2};
di_obs =    file{:,3};
de_obs =    file{:,4};
u_obs  =    file{:,5};
dw_obs =    file{:,6};
pi_obs =    file{:,7};
r_obs  =    file{:,8};

clear file;

save('SWW2014_data.mat')
