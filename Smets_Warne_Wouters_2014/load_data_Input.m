function load_params_from_excel(sheetname)
    file_name = 'Model_Inputs.xlsx';
    column_names = 1;
    column_values = 4; 

    T = readtable(file_name,  'Sheet', sheetname, 'ReadVariableNames',true);

    for i = 1:height(T)
        assignin('base', T{i,column_names}{1}, T{i,column_values});
    end
end

function create_parameters_files()
    clear all
    load_params_from_excel('Parametry')
    load_params_from_excel('Szoki_Rho')

    cd([cd '/EA_SWW14_rep']);
    fid = fopen('param_defs.mod','w');

    param_names = evalin('base', 'who');
    for i = 1:length(param_names)
        value = evalin('base', param_names{i});
        fprintf(fid, '@# define %s = %f\n', param_names{i}, value);
    end

    fprintf(fid, '\n');
    for i = 1:length(param_names)
       fprintf(fid, '%s = @{%s};\n', param_names{i}, param_names{i});
    end
    fclose(fid);

    save('SWW_Params.mat')
end

create_parameters_files()