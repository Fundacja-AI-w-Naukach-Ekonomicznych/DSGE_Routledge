function check_all_identities_EASWW14(oo_, M_)
    % Przygotuj
    T = size(oo_.endo_simul, 2);
    idx = @(name) find(strcmp(M_.endo_names, name));
    param = @(name) M_.params(strcmp(M_.param_names, name));

    % Parametry
    alpha     = param('c_alpha');
    psi_p     = param('c_psi_p');
    gamma_p   = param('c_gamma_p');
    theta_p   = param('c_theta_p');
    beta      = param('c_beta');
    pi1       = param('pi1');
    pi2       = param('pi2');
    c1        = param('c1');
    c2        = param('c2');
    i1        = param('i1');
    i2        = param('i2');
    q1        = param('q1');
    w1        = param('w1');
    omega     = param('c_omega');
    c_v       = param('c_v');
    c_h       = param('c_h');
    c_tau     = param('c_tau');
    k1        = param('k1');
    k2        = param('k2');
    c_psi     = param('c_psi');
    rho_intr  = param('c_rho_intr');
    rpi       = param('c_rpi');
    ry        = param('c_ry');
    rdy       = param('c_rdy');
    e1        = param('e1');

    fprintf('=== Sprawdzanie tożsamości EA_SWW14 ===\n');

    % Pomocnicze
    lag = @(x) [x(:,1), x(:,1:end-1)];
    lead = @(x) [x(:,2:end), x(:,end)];

    % Wczytanie zmiennych
    v = @(name) oo_.endo_simul(idx(name), :);

    % Lista równań do sprawdzenia

    %% Eq (1): Konsumpcja
    check_eq(v('c'), c1 * lead(v('c')) + (1 - c1) * lag(v('c')) - c2 * (v('r') - lead(v('pi')) - v('epsilon_b')), 'Eq(1): Konsumpcja');

    %% Eq (2): Inwestycje
    check_eq(v('i'), i1 * lag(v('i')) + (1 - i1) * lead(v('i')) + i2 * v('q') + v('epsilon_q'), 'Eq(2): Inwestycje');

    %% Eq (3): Wartość kapitału
    check_eq(v('q'), -(v('r') - lead(v('pi')) - v('epsilon_b')) + q1 * lead(v('rk')) + (1 - q1) * lead(v('q')), 'Eq(3): Wartość kapitału');

    %% Eq (4): Zasób - constraint
    c_cy = param('c_cy');
    c_iy = param('c_iy');
    c_vy = param('c_vy');
    check_eq(v('y'), c_cy*v('c') + c_iy*v('i') + c_vy*v('v') + v('epsilon_g'), 'Eq(4): Zasób');

    %% Eq (5): Produkcja Cobb-Douglas
    check_eq(v('y'), psi_p * (alpha*v('k') + (1-alpha)*v('n') + v('epsilon_a')), 'Eq(5): Produkcja');

    %% Eq (6): Calvo ceny
    check_eq(v('pi') - gamma_p * lag(v('pi')), pi1 * (lead(v('pi')) - gamma_p * v('pi')) - pi2 * (-v('mc') + 100*v('epsilon_p')), 'Eq(6): Calvo ceny');

    %% Eq (7): Koszt krańcowy
    check_eq(v('mc'), (1 - alpha)*v('w') + alpha*v('rk') - v('epsilon_a'), 'Eq(7): Marginal cost');

    %% Eq (8): Phillips wage
    check_eq(v('w') - lag(v('w')) + v('pi'), ...
             param('c_gamma_w')*lag(v('pi')) + beta * (lead(v('w')) - v('w') + lead(v('pi')) - param('c_gamma_w')*v('pi')) ...
             - w1*(omega*v('u') - 100*v('epsilon_w')), 'Eq(8): Phillips wage');

    %% Eq (9): Bezrobocie
    check_eq(omega * v('u'), v('w') - (v('z') + v('epsilon_s') + omega * v('e')), 'Eq(9): Bezrobocie');

    %% Eq (10): Naturalne bezrobocie
    check_eq(omega * v('un'), 100 * v('epsilon_w'), 'Eq(10): Naturalne u');

    %% Eq (11): Siła robocza
    check_eq(v('l'), v('e') + v('u'), 'Eq(11): l = e + u');

    %% Eq (12): Trend konsumpcji
    ch_tau = c_h / c_tau;
    z_calc = (1 - c_v) * lag(v('z')) + c_v / (1 - ch_tau) * (v('c') - ch_tau * lag(v('c')));
    check_eq(v('z'), z_calc, 'Eq(12): Trend konsumpcji');

    %% Eq (13): Kapitał
    check_eq(v('kbar'), k1 * lag(v('kbar')) + (1 - k1) * v('i') + k2 * v('epsilon_q'), 'Eq(13): Kapitał');

    %% Eq (14): Produkcja kapitału
    check_eq(v('k'), v('v') + lag(v('kbar')), 'Eq(14): Kapitał produkcyjny');

    %% Eq (15): Użycie kapitału
    check_eq(v('v'), (1 - c_psi) / c_psi * v('rk'), 'Eq(15): Użycie kapitału');

    %% Eq (16): Warunek kapitał-praca
    check_eq(v('k'), v('w') - v('rk') + v('n'), 'Eq(16): Kapitał-praca');

    %% Eq (17): Reguła Taylor’a
    ygap = v('ygap');
    check_eq(v('r'), ...
             rho_intr * lag(v('r')) + (1 - rho_intr)*(rpi * v('pi') + ry * ygap + rdy * (ygap - lag(ygap))) - v('epsilon_r'), 'Eq(17): Reguła Taylor’a');

    %% Eq (18): Zatrudnienie
    check_eq(v('e') - lag(v('e')), beta * (lead(v('e')) - v('e')) + e1 * (v('n') - v('e')), 'Eq(18): Zatrudnienie');

    fprintf('=== Koniec sprawdzania ===\n');

end

function check_eq(lhs, rhs, label)
    diff = lhs - rhs;
    max_err = max(abs(diff));
    mean_err = mean(abs(diff));
    fprintf('%s:\n', label);
    fprintf('  Max błąd: %.2e | Średni błąd: %.2e\n', max_err, mean_err);
    if max_err < 1e-6
        fprintf('  ✅ OK\n\n');
    else
        fprintf('  ⚠️  DUŻY BŁĄD – sprawdź!\n\n');
    end
end
