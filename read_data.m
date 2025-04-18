file = readtable("SWPL_data.xlsx", 'Sheet',"dataset");
file = removevars(file, "Var1");

dyobs =    file{:,1};
dcobs =    file{:,2};
diobs =    file{:,3};
dwobs =    file{:,4};
deobs =    file{:,5};
piobs =    file{:,6};
robs  =    file{:,7};
uobs  =    file{:,8};

clear file;

save('SWW2014_data.mat')
