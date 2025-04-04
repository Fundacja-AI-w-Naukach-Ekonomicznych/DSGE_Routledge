function ds = dynamic_set_auxiliary_series(ds, params)
%
% Status : Computes Auxiliary variables of the dynamic model and returns a dseries
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

ds.AUX_ENDO_LAG_2_1=ds.pi(-1);
ds.AUX_ENDO_LAG_2_2=ds.AUX_ENDO_LAG_2_1(-1);
ds.AUX_EXO_LAG_54_0=ds.etap;
ds.AUX_EXO_LAG_56_0=ds.etaw;
end
