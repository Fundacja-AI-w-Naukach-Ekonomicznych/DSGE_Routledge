% Tolerancja numeryczna (np. 1e-6)
tol = 1e-6;

% Sprawdzenie warunków
ok = true;
ok = ok && abs(c_tau - (c_tau_bar/100 + 1)) < tol;
ok = ok && abs(c_beta - 1/(c_beta_bar/100 + 1)) < tol;
ok = ok && abs(c_pi - (c_pi_bar/100 + 1)) < tol;
ok = ok && abs(c_u_bar - 100*(c_psi_w - 1)/c_omega) < tol;
ok = ok && abs(c_r_bar - 100*(c_pi*c_tau/c_beta - 1)) < tol;
ok = ok && abs(c_eps_w - c_psi_w/(c_psi_w - 1)) < tol;
ok = ok && abs(c_rk - ((c_tau/c_beta) + c_delta - 1)) < tol;
ok = ok && abs(c_w - (c_alpha^c_alpha * (1 - c_alpha)^(1 - c_alpha) / (c_psi_p * c_rk^c_alpha))^(1 / (1 - c_alpha))) < tol;
ok = ok && abs(c_lk - ((1 - c_alpha) / c_alpha) * (c_rk / c_w)) < tol;
ok = ok && abs(c_ky - c_psi_p * (c_lk^(c_alpha - 1))) < tol;

% Zgłoszenie wyniku
if ok
    disp('Wszystkie tożsamości są zachowane po estymacji.');
else
    error('Niektóre tożsamości NIE są spełnione po estymacji!');
end
