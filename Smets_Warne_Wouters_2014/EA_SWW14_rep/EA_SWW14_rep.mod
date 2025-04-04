var     
        c           ${c}$         (long_name='Consumption')
        r           ${r}$         (long_name='Nominal interest rate')
        pi          ${\pi}$       (long_name='Inflation rate')
        i           ${i}$         (long_name='Investment')
        q           ${q}$         (long_name='Value of capital stock')
        rk          ${r^{k}}$     (long_name='Expected return on capital')
        y           ${y}$         (long_name='Output')
        v           ${v}$         (long_name='Capital utilization')
        k           ${k}$         (long_name='Capital used in production')
        n           ${n}$         (long_name='Hours worked')
        mc          ${mc}$        (long_name='Marginal cost')
        w           ${w}$         (long_name='Real wage')
        z           ${z}$         (long_name='Smoothed trend of consumption')
        u           ${u}$         (long_name='Unemployment rate')
        e           ${e}$         (long_name='Employment')
        un          ${u^{n}}$     (long_name='Natural rate of unemployment (flex wage)')
        l           ${l}$         (long_name='Labor force')
        kbar        ${\bar{k}}$   (long_name='Capital stock')
        ygap        ${y^{gap}}$   (long_name='Output gap')

     // flex variables
        cf          ${c^{f}}$            (long_name = 'Consumption (flex prices)')
        rf          ${r^{f}}$            (long_name = 'Nominal interest rate (flex prices)')
        invf        ${i^{f}}$            (long_name = 'Investment (flex prices)')
        qf          ${q^{f}}$            (long_name = 'Value of capital stock (flex prices)')
        rkf         ${r^{k,f}}$          (long_name = 'Return on capital (flex prices)')
        vf          ${v^{f}}$            (long_name = 'Capital utilization (flex prices)')
        kf          ${k^{f}}$            (long_name = 'Capital used in production (flex prices)')
        nf          ${n^{f}}$            (long_name = 'Hours worked (flex prices)')
        wf          ${w^{f}}$            (long_name = 'Real wage (flex prices)')
        zf          ${z^{f}}$            (long_name = 'Smoothed trend of consumption (flex prices)')
        ef          ${e^{f}}$            (long_name = 'Employment (flex prices)')
        kbarf       ${\bar{k}^{f}}$      (long_name = 'Capital stock (flex prices)')
        yf          ${y^{f}}$            (long_name = 'Output (flex prices)')

     // shocks
        epsilon_b    ${\varepsilon_b}$     (long_name='Risk premium shock')
        epsilon_q    ${\varepsilon_q}$     (long_name='Investment-specific technology shock')
        epsilon_g    ${\varepsilon_g}$     (long_name='Government spending shock')
        epsilon_a    ${\varepsilon_a}$     (long_name='Productivity shock')
        epsilon_p    ${\varepsilon_p}$     (long_name='Price markup shock')
        epsilon_s    ${\varepsilon_s}$     (long_name='Labor supply shock')
        epsilon_w    ${\varepsilon_w}$     (long_name='Wage markup shock')
        epsilon_r    ${\varepsilon_r}$     (long_name='Monetary policy shock')

     // measurement equations
        dy_obs   ${dy^{obs}}$            (long_name = 'Output growth (observed)')
        dc_obs   ${dc^{obs}}$            (long_name = 'Consumption growth (observed)')
        di_obs   ${di^{obs}}$            (long_name = 'Investment growth (observed)')
        pi_obs   ${\pi^{obs}}$           (long_name = 'Inflation (observed)')
        dw_obs   ${dw^{obs}}$            (long_name = 'Real wage growth (observed)')
        de_obs   ${de^{obs}}$            (long_name = 'Employment growth (observed)')
        u_obs    ${u^{obs}}$             (long_name = 'Unemployment rate (observed)')
        r_obs    ${r^{obs}}$             (long_name = 'Interest rate (observed)')

     // annualized rates
        r_year    ${r^{ann}}$            (long_name = 'Nominal interest rate (annualized)')
        pi_year   ${\pi^{ann}}$          (long_name = 'Inflation rate (annualized)')
;

varexo  
        eta_b        ${\eta_b}$         (long_name='Risk premium shock')
        eta_q        ${\eta_q}$         (long_name='Investment-specific technology shock')
        eta_g        ${\eta_g}$         (long_name='Government spending shock')
        eta_a        ${\eta_a}$         (long_name='Productivity shock')
        eta_p        ${\eta_p}$         (long_name='Price markup shock')
        eta_s        ${\eta_s}$         (long_name='Labor supply shock')
        eta_w        ${\eta_w}$         (long_name='Wage markup shock')
        eta_r        ${\eta_r}$         (long_name='Monetary policy shock')
;

parameters 
        c_h          ${h}$                   (long_name = 'Habit parameter')
        c_tau        ${\tau}$                (long_name = 'Trend growth rate')
        c_beta       ${\beta}$               (long_name = 'Discount factor')
        c_phi        ${\phi}$                (long_name = 'Elasticity of the capital adjustment cost function')
        c_delta      ${\delta}$              (long_name = 'Depreciation of capital')
        c_psi_p       ${\psi_p}$              (long_name = 'Reflects fixed costs in production')
        c_alpha      ${\alpha}$              (long_name = 'Cobb-Douglas parameter')
        c_gamma_p     ${\gamma_p}$            (long_name = 'Price indexation')
        c_theta_p     ${\theta_p}$            (long_name = 'Probability of price change')
        c_eps_p       ${\varepsilon_p}$       (long_name = 'Curvature of the price aggregator function')
        c_gamma_w     ${\gamma_w}$            (long_name = 'Wage indexation')
        c_theta_w     ${\theta_w}$            (long_name = 'Probability of wage change')
        c_eps_w       ${\varepsilon_w}$       (long_name = 'Curvature of the wage aggregator function')
        c_omega      ${\omega}$              (long_name = 'Inverse elasticity of labor supply')
        c_v          ${v}$                   (long_name = 'Captures short run wealth effect on labor supply')
        c_psi        ${\psi}$                (long_name = 'Elasticity of the capital utilization cost function')
        c_rho_intr    ${\rho_{i}}$            (long_name = 'Persistence of monetary policy rule')
        c_rpi        ${r_{\pi}}$             (long_name = 'Coefficient on inflation')
        c_ry         ${r_{y}}$               (long_name = 'Coefficient on output gap')
        c_rdy        ${r_{\Delta y}}$        (long_name = 'Coefficient on change in output gap')
        c_theta_e     ${\theta_e}$            (long_name = 'Fraction of firms able to adjust employment')

     // steady state (SS) parameters
        c_rk        ${c_{rk}}$              (long_name = 'Steady state return on capital')
        c_cy        ${\frac{\bar{c}}{y}}$   (long_name = 'Steady state consumption-output ratio')
        c_iy        ${\frac{\bar{i}}{y}}$   (long_name = 'Steady state investment-output ratio')
        c_vy        ${\frac{\bar{v}}{y}}$   (long_name = 'Steady state capital utilization-output ratio')
        c_gy        ${\frac{\bar{g}}{y}}$   (long_name = 'Steady state government spending-output ratio')
        c_ky        ${\frac{\bar{k}}{y}}$   (long_name = 'Steady state capital-output ratio')
        c_tau_bar    ${\bar{\tau}}$          (long_name = 'Steady state average tax rate')
        c_pi        ${c_{\pi}}$             (long_name = 'Steady state inflation rate')
        c_pi_bar     ${\bar{\pi}}$           (long_name = 'Target inflation (steady state)')
        c_r_bar      ${\bar{r}}$             (long_name = 'Steady state nominal interest rate')
        c_u_bar      ${\bar{u}}$             (long_name = 'Steady state unemployment rate')
        c_e_bar      ${\bar{e}}$             (long_name = 'Steady state employment')
        c_beta_bar   ${\bar{\beta}}}$        (long_name = 'Steady state discount factor')
        c_psi_w      ${\psi^w}$              (long_name = 'Steady state labor market markup parameter')

     // new defined parameters for SS
        c_lk       // ${c_{lk}}$           Steady state labor-capital ratio
        c_w        // ${c_{w}}$            Steady state real wage

     // helpers
        c1        // ${c_1}$              Helper constant 1
        c2        // ${c_2}$              Helper constant 2
        i1        // ${i_1}$              Investment-related helper 1
        i2        // ${i_2}$              Investment-related helper 2
        q1        // ${q_1}$              Capital value helper
        pi1       // ${\pi_1}$            Inflation helper 1
        pi2       // ${\pi_2}$            Inflation helper 2
        w1        // ${w_1}$              Wage helper 1
        k1        // ${k_1}$              Capital helper 1
        k2        // ${k_2}$              Capital helper 2
        e1        // ${e_1}$              Employment helper 1

     // shocks
        c_rho_b     ${\rho_b}$              (long_name = 'Persistence of risk premium shock')
        c_rho_q     ${\rho_q}$              (long_name = 'Persistence of investment-specific shock')
        c_rho_g     ${\rho_g}$              (long_name = 'Persistence of government spending shock')
        c_rho_a     ${\rho_a}$              (long_name = 'Persistence of productivity shock')
        c_rho_ga    ${\rho_{ga}}$           (long_name = 'Persistence of growth of productivity')
        c_rho_p     ${\rho_p}$              (long_name = 'Persistence of price markup shock')
        c_mu_p      ${\mu_p}$               (long_name = 'Steady state price markup')
        c_rho_s     ${\rho_s}$              (long_name = 'Persistence of labor supply shock')
        c_rho_w     ${\rho_w}$              (long_name = 'Persistence of wage markup shock')
        c_mu_w      ${\mu_w}$               (long_name = 'Steady state wage markup')
        c_rho_r     ${\rho_r}$              (long_name = 'Persistence of monetary policy shock')
;

// parameter declaration 
// calibrated
c_delta  = 0.025 ; 
c_eps_p   = 10    ; // epsilon_p
c_gy     = 0.18  ;
c_rho_s   = 0.999 ;

// estimated (use posterior modes provided by the author, used for IRF (autors' code))
// authors' parameter names in code commented behind if different to this declaration
// ysigmac=1 (--> log utility)
c_h      = 0.635318; //lambda
c_phi    = 4.630882; //varphi
c_psi_p   = 1.490662; //phip
c_alpha  = 0.226791; 
c_gamma_p = 0.250432; //imathp
c_theta_p = 0.842802; //xip
c_gamma_w = 0.251781; //imathw
c_theta_w = 0.696311; //xiw
c_psi_w   = 1.500236; //phiw
c_omega  = 5.385964; //sigmal
c_v      = 0.085281; //upsilon
c_psi    = 0.472810; //psi
c_rho_intr= 0.856383; //rho
c_rpi    = 1.287264; 
c_ry     = 0.192124; 
c_rdy    = 0.016608; 
c_theta_e = 0.705567; //xie
c_pi_bar  = 0.561370; 
c_beta_bar= 0.268560; //betainv
c_e_bar   = 0.226367; 
c_tau_bar = 0.130848; //gammabar

// ybetabar //= c_beta/c_tau

// not estimated, calculated

// formula: c_tau_bar = 100*(c_tau-1);
c_tau    = c_tau_bar/100+1;
// formula: c_beta_bar=100*(c_beta^(-1)-1);
c_beta   = 1/(c_beta_bar/100+1);
// formula: c_pi_bar  = 100*(c_pi-1);
c_pi     = c_pi_bar/100+1;
c_u_bar   = 100*(c_psi_w-1)/c_omega;
c_r_bar   = 100*(c_pi*c_tau/c_beta-1);

//not in paper, can be seen in code

c_eps_w   = c_psi_w/(c_psi_w-1);
c_rk     = (c_tau/c_beta)+c_delta-1;  //yrkstar
c_w      = (c_alpha^c_alpha*(1-c_alpha)^(1-c_alpha)/(c_psi_p*c_rk^c_alpha))^(1/(1-c_alpha));
c_lk     = ((1-c_alpha)/c_alpha)*(c_rk/c_w);
c_ky     = c_psi_p*(c_lk^(c_alpha-1));

// shock parameters
c_rho_b   = 0.915697;
c_rho_q   = 0.345078; //rhoi
c_rho_g   = 0.992875;
c_rho_a   = 0.982716;
c_rho_ga  = 0.196454;
c_rho_p   = 0.624064;
c_mu_p    = 0.570707;
c_rho_w   = 0.905390;
c_mu_w    = 0.826670;
c_rho_r   = 0.316487;

// SS parameters
c_iy     = (c_tau+c_delta-1)*c_ky;
c_cy     = 1-c_iy-c_gy;
c_vy     = c_rk*c_ky;

//helpers
c1      = 1/(1+c_h/c_tau);
c2      = (1-c_h/c_tau)/(1+c_h/c_tau);
i1      = 1/(1+c_beta);
i2      = i1/(c_tau^2*c_phi);
q1      = c_rk/(c_rk+1-c_delta);
pi1     = c_beta;
pi2     = ((1-c_theta_p*c_beta)*(1-c_theta_p))/(c_theta_p*(1+(c_psi_p-1)*c_eps_p));
w1      = ((1-c_theta_w*c_beta)*(1-c_theta_w))/(c_theta_w*(1+c_omega*c_eps_w));
k1      = (1-c_delta)/c_tau;
k2      = (c_tau+c_delta-1)*(1+c_beta)*c_tau*c_phi;
e1      = ((1-c_theta_e*c_beta)*(1-c_theta_e))/c_theta_e;

model(linear);

// sticky model

[name='Eq (1).: Consumption Euler Equation']
c=c1*c(+1)+(1-c1)*c(-1)-c2*(r-pi(+1)-epsilon_b);

[name='Eq (2).: Investment Euler Equation']
i = i1*i(-1) + (1 - i1)*i(+1) + i2*q + epsilon_q;

[name='Eq (3).: Value of Capital Stock']
q = -(r - pi(+1) - epsilon_b) + q1*rk(+1) + (1 - q1)*q(+1);

[name='Eq (4).: Aggregate Resource Constraint']
y = c_cy*c + c_iy*i + c_vy*v + epsilon_g;

[name='Eq (5).: Cobb-Douglas Production Function']
y = c_psi_p*(c_alpha*k + (1 - c_alpha)*n + epsilon_a);

[name='Eq (6).: Calvo Pricing']
pi - c_gamma_p*pi(-1) = pi1*(pi(+1) - c_gamma_p*pi) - pi2*(-mc + 100*epsilon_p);

[name='Eq (7).: Marginal Cost']
mc = (1 - c_alpha)*w + c_alpha*rk - epsilon_a;

[name='Eq (8).: Calvo Wage Setting']
w - w(-1) + pi = c_gamma_w*pi(-1) + c_beta*(w(+1) - w + pi(+1) - c_gamma_w*pi) - w1*(c_omega*u - 100*epsilon_w);

[name='Eq (9).: Average Wage Markup and Unemployment']
c_omega*u = w - (z + epsilon_s + c_omega*e);

[name='Eq (10).: Natural Unemployment']
c_omega*un = 100*epsilon_w;

[name='Eq (11).: Labor Force']
l = u + e;

[name='Eq (12).: Smoothed Trend of Consumption']
z = (1 - c_v)*z(-1) + c_v/(1 - c_h/c_tau)*(c - c_h/c_tau*c(-1));

[name='Eq (13).: Capital Stock']
kbar = k1*kbar(-1) + (1 - k1)*i + k2*epsilon_q;

[name='Eq (14).: Capital Services Production']
k = v + kbar(-1);

[name='Eq (15).: Optimal Capital Utilization']
v = (1 - c_psi)/c_psi*rk;

[name='Eq (16).: Optimal Capital-Labor Condition']
k = w - rk + n;

[name='Eq (17).: Monetary Policy Rule']
r = c_rho_intr*r(-1) + (1 - c_rho_intr)*(c_rpi*pi + c_ry*ygap + c_rdy*(ygap - ygap(-1))) - epsilon_r;

[name='Eq (18).: Employment/Technology']
e - e(-1) = c_beta*(e(+1) - e) + e1*(n - e);


//flex model

cf=c1*cf(+1)+(1-c1)*cf(-1)-c2*(rf-epsilon_b);
invf=i1*invf(-1)+(1-i1)*invf(+1)+i2*qf+epsilon_q;
qf=-(rf-epsilon_b)+q1*rkf(+1)+(1-q1)*qf(+1);
yf=c_cy*cf+c_iy*invf+c_vy*vf+epsilon_g;
yf=c_psi_p*(c_alpha*kf+(1-c_alpha)*nf+epsilon_a);
0=(1-c_alpha)*wf+c_alpha*rkf-epsilon_a;
//c_omega*un= wf-(zf+epsilon_s+c_omega*ef); // flex version of sticky equation
wf=zf+epsilon_s+c_omega*nf; // flex version used by authors' in code
zf=(1-c_v)*zf(-1)+c_v/(1-c_h/c_tau)*(cf-c_h/c_tau*cf(-1));
kbarf=k1*kbarf(-1)+(1-k1)*invf+k2*epsilon_q;
kf=vf+kbarf(-1);
vf=(1-c_psi)/c_psi*rkf;
kf=wf-rkf+nf;
ef-ef(-1)=c_beta*(ef(+1)-ef)+e1*(nf-ef);

// output gap
ygap=y-yf;

// shock processes
epsilon_b=c_rho_b * epsilon_b(-1) + eta_b;
epsilon_q=c_rho_q * epsilon_q(-1) + eta_q;
epsilon_g=c_rho_g*epsilon_g(-1) + eta_g + c_rho_ga * eta_a;
epsilon_a=c_rho_a*epsilon_a(-1) + eta_a;
epsilon_p=c_rho_p*epsilon_p(-1) + eta_p - c_mu_p * eta_p(-1);
epsilon_r=c_rho_r*epsilon_r(-1) + eta_r;
epsilon_s=c_rho_s*epsilon_s(-1) + eta_s;
epsilon_w=c_rho_w*epsilon_w(-1) + eta_w - c_mu_w * eta_w(-1);

// measurement equations
dy_obs=c_tau_bar+c_e_bar+y-y(-1);
dc_obs=c_tau_bar+c_e_bar+c-c(-1);
di_obs=c_tau_bar+c_e_bar+i-i(-1);
pi_obs=c_pi_bar+pi;
dw_obs-pi_obs=c_tau_bar+w-w(-1)-(pi-pi(-1));
de_obs=c_e_bar+e-e(-1);
u_obs=c_u_bar+u;
r_obs=4*c_r_bar+4*r;

// annualzied rates
r_year=4*r;
pi_year=pi+pi(-1)+pi(-2)+pi(-3);

end; 


//resid(1);
steady;
check;

shocks;
    var eta_a; stderr 0.570053;
    var eta_b; stderr 0.254028;
    var eta_g; stderr 0.305013;
    var eta_q; stderr 0.485825;
    var eta_r; stderr 0.111101;
    var eta_p; stderr 0.379025;
    var eta_w; stderr 0.354961;
    var eta_s; stderr 1.012299;
end;

stoch_simul(periods = 1000, irf = 21) y c;

write_latex_dynamic_model;
