@#define reestimate_flag = 0

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
        dy_obs   ${\Delta y^{obs}}$            (long_name = 'Output growth (observed)')
        dc_obs   ${\Delta c^{obs}}$            (long_name = 'Consumption growth (observed)')
        di_obs   ${\Delta i^{obs}}$            (long_name = 'Investment growth (observed)')
        pi_obs   ${\pi^{obs}}$                 (long_name = 'Inflation (observed)')
        dw_obs   ${\Delta w^{obs}}$            (long_name = 'Real wage growth (observed)')
        de_obs   ${\Delta e^{obs}}$            (long_name = 'Employment growth (observed)')
        u_obs    ${u^{obs}}$                   (long_name = 'Unemployment rate (observed)')
        r_obs    ${r^{obs}}$                   (long_name = 'Interest rate (observed)')

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
        c_psi_p      ${\psi_p}$              (long_name = 'Reflects fixed costs in production')
        c_alpha      ${\alpha}$              (long_name = 'Cobb-Douglas parameter')
        c_gamma_p    ${\gamma_p}$            (long_name = 'Price indexation')
        c_theta_p    ${\theta_p}$            (long_name = 'Probability of price change')
        c_eps_p      ${\varepsilon_p}$       (long_name = 'Curvature of the price aggregator function')
        c_gamma_w    ${\gamma_w}$            (long_name = 'Wage indexation')
        c_theta_w    ${\theta_w}$            (long_name = 'Probability of wage change')
        c_eps_w      ${\varepsilon_w}$       (long_name = 'Curvature of the wage aggregator function')
        c_omega      ${\omega}$              (long_name = 'Inverse elasticity of labor supply')
        c_v          ${v}$                   (long_name = 'Captures short run wealth effect on labor supply')
        c_psi        ${\psi}$                (long_name = 'Elasticity of the capital utilization cost function')
        c_rho_intr   ${\rho_{i}}$            (long_name = 'Persistence of monetary policy rule')
        c_rpi        ${r_{\pi}}$             (long_name = 'Coefficient on inflation')
        c_ry         ${r_{y}}$               (long_name = 'Coefficient on output gap')
        c_rdy        ${r_{\Delta y}}$        (long_name = 'Coefficient on change in output gap')
        c_theta_e    ${\theta_e}$            (long_name = 'Fraction of firms able to adjust employment')

     // steady state (SS) parameters
        c_rk         ${c_{rk}}$              (long_name = 'Steady state return on capital')
        c_cy         ${\frac{\bar{c}}{y}}$   (long_name = 'Steady state consumption-output ratio')
        c_iy         ${\frac{\bar{i}}{y}}$   (long_name = 'Steady state investment-output ratio')
        c_vy         ${\frac{\bar{v}}{y}}$   (long_name = 'Steady state capital utilization-output ratio')
        c_gy         ${\frac{\bar{g}}{y}}$   (long_name = 'Steady state government spending-output ratio')
        c_ky         ${\frac{\bar{k}}{y}}$   (long_name = 'Steady state capital-output ratio')
        c_tau_bar    ${\bar{\tau}}$          (long_name = 'Steady state average growth rate')
        c_pi         ${c_{\pi}}$             (long_name = 'Steady state inflation rate')
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
        c1         ${c_1}$              (long_name = 'Consumption - parameter 1')
        c2         ${c_2}$              (long_name = 'Consumption - parameter 2')
        i1         ${i_1}$              (long_name = 'Investments - parameter 1')
        i2         ${i_2}$              (long_name = 'Investments - parameter 2')
        q1         ${q_1}$              (long_name = 'Capital value - parameter 1')
        pi1        ${\pi_1}$            (long_name = 'Inflation - parameter 1')
        pi2        ${\pi_2}$            (long_name = 'Inflation - parameter 2')
        w1         ${w_1}$              (long_name = 'Wage - parameter 1')
        k1         ${k_1}$              (long_name = 'Capital - parameter 1')
        k2         ${k_2}$              (long_name = 'Capital - parameter 2')
        e1         ${e_1}$              (long_name = 'Employment - parameter 1')

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
@# include "param_defs.mod"

// Calculations
c_tau    = c_tau_bar/100+1;
c_beta   = 1/(c_beta_bar/100+1);
c_pi     = c_pi_bar/100+1;
c_u_bar   = 100*(c_psi_w-1)/c_omega;
c_r_bar   = 100*(c_pi*c_tau/c_beta-1);
c_eps_w   = c_psi_w/(c_psi_w-1);
c_rk     = (c_tau/c_beta)+c_delta-1;  //yrkstar
c_w      = (c_alpha^c_alpha*(1-c_alpha)^(1-c_alpha)/(c_psi_p*c_rk^c_alpha))^(1/(1-c_alpha));
c_lk     = ((1-c_alpha)/c_alpha)*(c_rk/c_w);
c_ky     = c_psi_p*(c_lk^(c_alpha-1));

// SS parameters
c_iy     = (c_tau+c_delta-1)*c_ky;
c_cy     = 1-c_iy-c_gy;
c_vy     = c_rk*c_ky;

//helpers
c1      = 1/(1+c_h/c_tau);
c2      = (1-c_h/c_tau)/(1+c_h/c_tau);
i1      = 1/(1+c_beta);
i2      = i1/(c_tau^2*c_phi);
q1      = c_rk/(1 + c_rk - c_delta);
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
    c_omega * un = 100 * epsilon_w;
    
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
    [name='Eq (1b).: Consumption Euler Equation - Flexible prices']
    cf = c1 *cf(+1) + (1-c1) * cf(-1) - c2 * (rf-epsilon_b);

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
    epsilon_a = c_rho_a * epsilon_a(-1) + eta_a;
    epsilon_b = c_rho_b * epsilon_b(-1) + eta_b;
    epsilon_g = c_rho_g * epsilon_g(-1) + eta_g + c_rho_ga * eta_a;
    epsilon_p = c_rho_p * epsilon_p(-1) + eta_p - c_mu_p * eta_p(-1);
    epsilon_q = c_rho_q * epsilon_q(-1) + eta_q;
    epsilon_r = c_rho_r * epsilon_r(-1) + eta_r;
    epsilon_s = c_rho_s * epsilon_s(-1) + eta_s;
    epsilon_w = c_rho_w * epsilon_w(-1) + eta_w - c_mu_w * eta_w(-1);
    
    // measurement equations
    dy_obs = c_tau_bar + c_e_bar+y-y(-1);
    dc_obs = c_tau_bar + c_e_bar+c-c(-1);
    di_obs = c_tau_bar + c_e_bar+i-i(-1);
    pi_obs = c_pi_bar+pi;
    dw_obs - pi_obs= c_tau_bar + w - w(-1) -(pi-pi(-1));
    de_obs = c_e_bar + e - e(-1);
    u_obs = c_u_bar + u;
    r_obs = 4 * c_r_bar + 4 * r;
    
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

varobs 
    dy_obs 
    dc_obs 
    di_obs 
    pi_obs 
    dw_obs 
    de_obs 
    u_obs 
    r_obs;

estimated_params;
  stderr eta_a,  0.254028,   0.01,  3,  INV_GAMMA_PDF,  0.1,    2;
  stderr eta_b,  0.254028,   0.025, 5,  INV_GAMMA_PDF,  0.1,    2;
  stderr eta_g,  0.305013,   0.01,  3,  INV_GAMMA_PDF,  0.1,    2;
  stderr eta_q,  0.485825,   0.01,  3,  INV_GAMMA_PDF,  0.1,    2;
  stderr eta_r,  0.111101,   0.01,  3,  INV_GAMMA_PDF,  0.1,    2;
  stderr eta_p,  0.379025,   0.01,  3,  INV_GAMMA_PDF,  0.1,    2;
  stderr eta_w,  0.354961,   0.01,  3,  INV_GAMMA_PDF,  0.1,    2;
  stderr eta_s,  1.012299,   0.01,  5,  INV_GAMMA_PDF,  0.1,    2;

  //ARMA Components
  c_rho_a,    0.982716,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_rho_b,    0.915697,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_rho_q,    0.345078,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_rho_g,    0.992875,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_rho_ga,   0.196454,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_rho_p,    0.624064,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_rho_w,    0.905390,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_rho_r,    0.316487,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_mu_p,     0.570707,   .01,  .9999,  BETA_PDF,   0.5,    0.20;
  c_mu_w,     0.826670,   .01,  .9999,  BETA_PDF,   0.5,    0.20;

  //STRUCTURAL PARAMETERS
  c_alpha,       0.24,       0.01,  1.0,    NORMAL_PDF,   0.3,     0.05;
  c_beta_bar,    0.7420,     0.01,  2.0,    GAMMA_PDF,    0.25,    0.1;
  c_e_bar,       1.2918,    -10.0,  10.0,   NORMAL_PDF,   0.0,     2.0;
  c_gamma_w,     0.4425,     0.01,  0.99,   BETA_PDF,     0.5,     0.15;
  c_gamma_p,     0.3291,     0.01,  0.99,   BETA_PDF,     0.5,     0.15;
  c_h,           0.7205,     0.001, 0.99,   BETA_PDF,     0.7,     0.1;
  c_psi_p,       1.4672,     1.0,   3,      NORMAL_PDF,   1.25,    0.125;
  c_pi_bar,      0.7,        0.1,   2.0,    GAMMA_PDF,    0.625,   0.1;
  c_phi,         6.3325,     2,     15,     NORMAL_PDF,   4,       1.5;
  c_psi,         0.2648,     0.01,  1,      BETA_PDF,     0.5,     0.15;
  c_rho_intr,    0.8258,     0.5,   0.975,  BETA_PDF,     0.75,    0.10;
  c_rpi,         1.7985,     1.0,   3,      NORMAL_PDF,   1.5,     0.25;
  c_rdy,         0.2239,     0.001, 0.5,    NORMAL_PDF,   0.125,   0.05;
  c_ry,          0.0893,     0.001, 0.5,    NORMAL_PDF,   0.125,   0.05;
  c_omega,       2.8401,     0.25,  10,     NORMAL_PDF,   2,       0.75;
  c_tau_bar,     0.3982,     0.1,   0.8,    NORMAL_PDF,   0.4,     0.10;
  c_theta_p,     0.7813,     0.5,   0.95,   BETA_PDF,     0.5,     0.10;
  c_theta_w,     0.7937,     0.3,   0.95,   BETA_PDF,     0.5,     0.1;
  c_v,           1.2312,     0.25,  3,      NORMAL_PDF,   1.50,    0.375;

end;

@#if reestimate_flag == 1 
    estimation(optim=('MaxIter',200),
               datafile='SWW2014_data.mat',
               mode_compute=6, first_obs=1, 
               presample=4,lik_init=2, prefilter=0,mh_replic=0, 
               mh_nblocks=2, mh_jscale=0.20, mh_drop=0.2, nograph, 
               nodiagnostic, tex);
@#else
    estimation(optim=('MaxIter',200),
               datafile='SWW2014_data.mat',
               mode_file = 'EA_SWW14_rep_mode.mat',
               mode_compute=0, first_obs=1, 
               presample=4,lik_init=2, prefilter=0,mh_replic=0, 
               mh_nblocks=2, mh_jscale=0.20, mh_drop=0.2, nograph, 
               nodiagnostic, tex);
@#endif

shock_decomposition dy_obs pi_obs;
stoch_simul(periods = 1000, irf = 21) pi;

write_latex_dynamic_model;
