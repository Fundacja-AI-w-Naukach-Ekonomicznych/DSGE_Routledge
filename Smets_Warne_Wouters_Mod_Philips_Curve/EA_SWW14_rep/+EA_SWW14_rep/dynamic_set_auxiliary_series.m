function ds = dynamic_set_auxiliary_series(ds, params)
%
% Computes auxiliary variables of the dynamic model
%
ds.AUX_ENDO_LAG_2_1=ds.pi(-1);
ds.AUX_ENDO_LAG_2_2=ds.AUX_ENDO_LAG_2_1(-1);
ds.AUX_EXO_LAG_62_0=ds.eta_p;
ds.AUX_EXO_LAG_64_0=ds.eta_w;
end
