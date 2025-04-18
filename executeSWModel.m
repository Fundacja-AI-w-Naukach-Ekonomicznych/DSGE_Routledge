addpath C:\dynare\5.4\matlab
dynare EA_SWW14_rep

% Names 
M_.endo_names 
M_.exo_names

% Pierwszy param - zmienna endo, drugi szoki, trzeci obserwacje
file =  oo_.shock_decomposition;
file = file(46, :, :);
file = squeeze(file);
file = transpose(file);
cellNames = [transpose(M_.exo_names), {'initial conditions','smoothed value of the respective endogenous variable '}];
Table = array2table(file, 'VariableNames',cellNames);

writetable(Table, "Emp_shocks.xlsx")

%'GDP_Shock'
file =  oo_.shock_decomposition;
file = file(41, :, :);
file = squeeze(file);
file = transpose(file);
cellNames = [transpose(M_.exo_names), {'initial conditions','smoothed value of the respective endogenous variable '}];
Table = array2table(file, 'VariableNames',cellNames);

writetable(Table, "GDP_shocks.xlsx")
