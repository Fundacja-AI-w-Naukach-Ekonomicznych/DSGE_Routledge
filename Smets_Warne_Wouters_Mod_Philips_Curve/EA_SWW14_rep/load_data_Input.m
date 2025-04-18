function load_params_from_excel(sheetname)
    file_name = 'Model_Inputs.xlsx';
    column_names = 1;
    column_values = 4; 

    T = readtable(file_name,  'Sheet', sheetname, 'ReadVariableNames',true);

    for i = 1:height(T)
        assignin('base', T{i,column_names}{1}, T{i,column_values});
    end
end

%load_params_from_excel('Parametry')
%load_params_from_excel('Szoki_Rho')