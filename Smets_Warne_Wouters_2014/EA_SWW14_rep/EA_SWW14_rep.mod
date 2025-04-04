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
        epsilonb    ${\varepsilon_b}$     (long_name='Risk premium shock')
        epsilonq    ${\varepsilon_q}$     (long_name='Investment-specific technology shock')
        epsilong    ${\varepsilon_g}$     (long_name='Government spending shock')
        epsilona    ${\varepsilon_a}$     (long_name='Productivity shock')
        epsilonp    ${\varepsilon_p}$     (long_name='Price markup shock')
        epsilons    ${\varepsilon_s}$     (long_name='Labor supply shock')
        epsilonw    ${\varepsilon_w}$     (long_name='Wage markup shock')
        epsilonr    ${\varepsilon_r}$     (long_name='Monetary policy shock')

     // measurement equations
        dyobs   ${dy^{obs}}$            (long_name = 'Output growth (observed)')
        dcobs   ${dc^{obs}}$            (long_name = 'Consumption growth (observed)')
        diobs   ${di^{obs}}$            (long_name = 'Investment growth (observed)')
        piobs   ${\pi^{obs}}$           (long_name = 'Inflation (observed)')
        dwobs   ${dw^{obs}}$            (long_name = 'Real wage growth (observed)')
        deobs   ${de^{obs}}$            (long_name = 'Employment growth (observed)')
        uobs    ${u^{obs}}$             (long_name = 'Unemployment rate (observed)')
        robs    ${r^{obs}}$             (long_name = 'Interest rate (observed)')

     // annualized rates
        ryear    ${r^{ann}}$            (long_name = 'Nominal interest rate (annualized)')
        piyear   ${\pi^{ann}}$          (long_name = 'Inflation rate (annualized)')
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
        ch          ${h}$                   (long_name = 'Habit parameter')
        ctau        ${\tau}$                (long_name = 'Trend growth rate')
        cbeta       ${\beta}$               (long_name = 'Discount factor')
        cphi        ${\phi}$                (long_name = 'Elasticity of the capital adjustment cost function')
        cdelta      ${\delta}$              (long_name = 'Depreciation of capital')
        cpsip       ${\psi_p}$              (long_name = 'Reflects fixed costs in production')
        calpha      ${\alpha}$              (long_name = 'Cobb-Douglas parameter')
        cgammap     ${\gamma_p}$            (long_name = 'Price indexation')
        cthetap     ${\theta_p}$            (long_name = 'Probability of price change')
        cepsp       ${\varepsilon_p}$       (long_name = 'Curvature of the price aggregator function')
        cgammaw     ${\gamma_w}$            (long_name = 'Wage indexation')
        cthetaw     ${\theta_w}$            (long_name = 'Probability of wage change')
        cepsw       ${\varepsilon_w}$       (long_name = 'Curvature of the wage aggregator function')
        comega      ${\omega}$              (long_name = 'Inverse elasticity of labor supply')
        cv          ${v}$                   (long_name = 'Captures short run wealth effect on labor supply')
        cpsi        ${\psi}$                (long_name = 'Elasticity of the capital utilization cost function')
        crhointr    ${\rho_{i}}$            (long_name = 'Persistence of monetary policy rule')
        crpi        ${r_{\pi}}$             (long_name = 'Coefficient on inflation')
        cry         ${r_{y}}$               (long_name = 'Coefficient on output gap')
        crdy        ${r_{\Delta y}}$        (long_name = 'Coefficient on change in output gap')
        cthetae     ${\theta_e}$            (long_name = 'Fraction of firms able to adjust employment')

     // steady state (SS) parameters
        crk        ${c_{rk}}$              (long_name = 'Steady state return on capital')
        ccy        ${\frac{\bar{c}}{y}}$   (long_name = 'Steady state consumption-output ratio')
        ciy        ${\frac{\bar{i}}{y}}$   (long_name = 'Steady state investment-output ratio')
        cvy        ${\frac{\bar{v}}{y}}$   (long_name = 'Steady state capital utilization-output ratio')
        cgy        ${\frac{\bar{g}}{y}}$   (long_name = 'Steady state government spending-output ratio')
        cky        ${\frac{\bar{k}}{y}}$   (long_name = 'Steady state capital-output ratio')
        ctaubar    ${\bar{\tau}}$          (long_name = 'Steady state average tax rate')
        cpi        ${c_{\pi}}$             (long_name = 'Steady state inflation rate')
        cpibar     ${\bar{\pi}}$           (long_name = 'Target inflation (steady state)')
        crbar      ${\bar{r}}$             (long_name = 'Steady state nominal interest rate')
        cubar      ${\bar{u}}$             (long_name = 'Steady state unemployment rate')
        cebar      ${\bar{e}}$             (long_name = 'Steady state employment')
        cbetabar   ${\bar{\beta}}}$        (long_name = 'Steady state discount factor')
        cpsiw      ${\psi^w}$              (long_name = 'Steady state labor market markup parameter')

     // new defined parameters for SS
        clk       // ${c_{lk}}$           Steady state labor-capital ratio
        cw        // ${c_{w}}$            Steady state real wage

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
        crhog     ${\rho_g}$              (long_name = 'Persistence of government spending shock')
        crhoa     ${\rho_a}$              (long_name = 'Persistence of productivity shock')
        crhoga    ${\rho_{ga}}$           (long_name = 'Persistence of growth of productivity')
        crhop     ${\rho_p}$              (long_name = 'Persistence of price markup shock')
        cmup      ${\mu_p}$               (long_name = 'Steady state price markup')
        crhos     ${\rho_s}$              (long_name = 'Persistence of labor supply shock')
        crhow     ${\rho_w}$              (long_name = 'Persistence of wage markup shock')
        cmuw      ${\mu_w}$               (long_name = 'Steady state wage markup')
        crhor     ${\rho_r}$              (long_name = 'Persistence of monetary policy shock')
;

// parameter declaration 
// calibrated
cdelta  = 0.025 ; 
cepsp   = 10    ; // epsilonp
cgy     = 0.18  ;
crhos   = 0.999 ;

// estimated (use posterior modes provided by the author, used for IRF (autors' code))
// authors' parameter names in code commented behind if different to this declaration
// ysigmac=1 (--> log utility)
ch      = 0.635318; //lambda
cphi    = 4.630882; //varphi
cpsip   = 1.490662; //phip
calpha  = 0.226791; 
cgammap = 0.250432; //imathp
cthetap = 0.842802; //xip
cgammaw = 0.251781; //imathw
cthetaw = 0.696311; //xiw
cpsiw   = 1.500236; //phiw
comega  = 5.385964; //sigmal
cv      = 0.085281; //upsilon
cpsi    = 0.472810; //psi
crhointr= 0.856383; //rho
crpi    = 1.287264; 
cry     = 0.192124; 
crdy    = 0.016608; 
cthetae = 0.705567; //xie
cpibar  = 0.561370; 
cbetabar= 0.268560; //betainv
cebar   = 0.226367; 
ctaubar = 0.130848; //gammabar

// ybetabar //= cbeta/ctau

// not estimated, calculated

// formula: ctaubar = 100*(ctau-1);
ctau    = ctaubar/100+1;
// formula: cbetabar=100*(cbeta^(-1)-1);
cbeta   = 1/(cbetabar/100+1);
// formula: cpibar  = 100*(cpi-1);
cpi     = cpibar/100+1;
cubar   = 100*(cpsiw-1)/comega;
crbar   = 100*(cpi*ctau/cbeta-1);

//not in paper, can be seen in code

cepsw   = cpsiw/(cpsiw-1);
crk     = (ctau/cbeta)+cdelta-1;  //yrkstar
cw      = (calpha^calpha*(1-calpha)^(1-calpha)/(cpsip*crk^calpha))^(1/(1-calpha));
clk     = ((1-calpha)/calpha)*(crk/cw);
cky     = cpsip*(clk^(calpha-1));

// shock parameters
c_rho_b   = 0.915697;
c_rho_q   = 0.345078; //rhoi
crhog   = 0.992875;
crhoa   = 0.982716;
crhoga  = 0.196454;
crhop   = 0.624064;
cmup    = 0.570707;
crhow   = 0.905390;
cmuw    = 0.826670;
crhor   = 0.316487;

// SS parameters
ciy     = (ctau+cdelta-1)*cky;
ccy     = 1-ciy-cgy;
cvy     = crk*cky;

//helpers
c1      = 1/(1+ch/ctau);
c2      = (1-ch/ctau)/(1+ch/ctau);
i1      = 1/(1+cbeta);
i2      = i1/(ctau^2*cphi);
q1      = crk/(crk+1-cdelta);
pi1     = cbeta;
pi2     = ((1-cthetap*cbeta)*(1-cthetap))/(cthetap*(1+(cpsip-1)*cepsp));
w1      = ((1-cthetaw*cbeta)*(1-cthetaw))/(cthetaw*(1+comega*cepsw));
k1      = (1-cdelta)/ctau;
k2      = (ctau+cdelta-1)*(1+cbeta)*ctau*cphi;
e1      = ((1-cthetae*cbeta)*(1-cthetae))/cthetae;

model(linear);

// sticky model

[name='Eq (1).: Consumption Euler Equation']
c=c1*c(+1)+(1-c1)*c(-1)-c2*(r-pi(+1)-epsilonb);

[name='Eq (2).: Investment Euler Equation']
i = i1*i(-1) + (1 - i1)*i(+1) + i2*q + epsilonq;

[name='Eq (3).: Value of Capital Stock']
q = -(r - pi(+1) - epsilonb) + q1*rk(+1) + (1 - q1)*q(+1);

[name='Eq (4).: Aggregate Resource Constraint']
y = ccy*c + ciy*i + cvy*v + epsilong;

[name='Eq (5).: Cobb-Douglas Production Function']
y = cpsip*(calpha*k + (1 - calpha)*n + epsilona);

[name='Eq (6).: Calvo Pricing']
pi - cgammap*pi(-1) = pi1*(pi(+1) - cgammap*pi) - pi2*(-mc + 100*epsilonp);

[name='Eq (7).: Marginal Cost']
mc = (1 - calpha)*w + calpha*rk - epsilona;

[name='Eq (8).: Calvo Wage Setting']
w - w(-1) + pi = cgammaw*pi(-1) + cbeta*(w(+1) - w + pi(+1) - cgammaw*pi) - w1*(comega*u - 100*epsilonw);

[name='Eq (9).: Average Wage Markup and Unemployment']
comega*u = w - (z + epsilons + comega*e);

[name='Eq (10).: Natural Unemployment']
comega*un = 100*epsilonw;

[name='Eq (11).: Labor Force']
l = u + e;

[name='Eq (12).: Smoothed Trend of Consumption']
z = (1 - cv)*z(-1) + cv/(1 - ch/ctau)*(c - ch/ctau*c(-1));

[name='Eq (13).: Capital Stock']
kbar = k1*kbar(-1) + (1 - k1)*i + k2*epsilonq;

[name='Eq (14).: Capital Services Production']
k = v + kbar(-1);

[name='Eq (15).: Optimal Capital Utilization']
v = (1 - cpsi)/cpsi*rk;

[name='Eq (16).: Optimal Capital-Labor Condition']
k = w - rk + n;

[name='Eq (17).: Monetary Policy Rule']
r = crhointr*r(-1) + (1 - crhointr)*(crpi*pi + cry*ygap + crdy*(ygap - ygap(-1))) - epsilonr;

[name='Eq (18).: Employment/Technology']
e - e(-1) = cbeta*(e(+1) - e) + e1*(n - e);


//flex model

cf=c1*cf(+1)+(1-c1)*cf(-1)-c2*(rf-epsilonb);
invf=i1*invf(-1)+(1-i1)*invf(+1)+i2*qf+epsilonq;
qf=-(rf-epsilonb)+q1*rkf(+1)+(1-q1)*qf(+1);
yf=ccy*cf+ciy*invf+cvy*vf+epsilong;
yf=cpsip*(calpha*kf+(1-calpha)*nf+epsilona);
0=(1-calpha)*wf+calpha*rkf-epsilona;
//comega*un= wf-(zf+epsilons+comega*ef); // flex version of sticky equation
wf=zf+epsilons+comega*nf; // flex version used by authors' in code
zf=(1-cv)*zf(-1)+cv/(1-ch/ctau)*(cf-ch/ctau*cf(-1));
kbarf=k1*kbarf(-1)+(1-k1)*invf+k2*epsilonq;
kf=vf+kbarf(-1);
vf=(1-cpsi)/cpsi*rkf;
kf=wf-rkf+nf;
ef-ef(-1)=cbeta*(ef(+1)-ef)+e1*(nf-ef);

// output gap
ygap=y-yf;

// shock processes
epsilonb=c_rho_b * epsilonb(-1) + eta_b;
epsilonq=c_rho_q * epsilonq(-1) + eta_q;
epsilong=crhog*epsilong(-1) + eta_g + crhoga * eta_a;
epsilona=crhoa*epsilona(-1) + eta_a;
epsilonp=crhop*epsilonp(-1) + eta_p - cmup * eta_p(-1);
epsilonr=crhor*epsilonr(-1) + eta_r;
epsilons=crhos*epsilons(-1) + eta_s;
epsilonw=crhow*epsilonw(-1) + eta_w - cmuw * eta_w(-1);

// measurement equations
dyobs=ctaubar+cebar+y-y(-1);
dcobs=ctaubar+cebar+c-c(-1);
diobs=ctaubar+cebar+i-i(-1);
piobs=cpibar+pi;
dwobs-piobs=ctaubar+w-w(-1)-(pi-pi(-1));
deobs=cebar+e-e(-1);
uobs=cubar+u;
robs=4*crbar+4*r;

// annualzied rates
ryear=4*r;
piyear=pi+pi(-1)+pi(-2)+pi(-3);

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
