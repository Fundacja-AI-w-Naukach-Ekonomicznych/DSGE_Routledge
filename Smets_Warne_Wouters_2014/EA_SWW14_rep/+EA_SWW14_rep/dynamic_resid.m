function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = EA_SWW14_rep.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(54, 1);
lhs = y(28);
rhs = params(38)*y(82)+(1-params(38))*y(1)-params(39)*(y(29)-y(83)-y(60));
residual(1) = lhs - rhs;
lhs = y(31);
rhs = params(40)*y(4)+(1-params(40))*y(84)+params(41)*y(32)+y(61);
residual(2) = lhs - rhs;
lhs = y(32);
rhs = params(42)*y(86)-(y(29)-y(83)-y(60))+(1-params(42))*y(85);
residual(3) = lhs - rhs;
lhs = y(34);
rhs = y(28)*params(23)+y(31)*params(24)+params(25)*y(35)+y(62);
residual(4) = lhs - rhs;
lhs = y(34);
rhs = params(6)*(params(7)*y(36)+(1-params(7))*y(37)+y(63));
residual(5) = lhs - rhs;
lhs = y(30)-params(8)*y(3);
rhs = params(43)*(y(83)-y(30)*params(8))-params(44)*(100*y(64)-y(38));
residual(6) = lhs - rhs;
lhs = y(38);
rhs = (1-params(7))*y(39)+params(7)*y(33)-y(63);
residual(7) = lhs - rhs;
lhs = y(30)+y(39)-y(6);
rhs = y(3)*params(11)+params(3)*(y(83)+y(87)-y(39)-y(30)*params(11))-params(45)*(params(14)*y(41)-100*y(66));
residual(8) = lhs - rhs;
lhs = params(14)*y(41);
rhs = y(39)-(y(40)+y(65)+params(14)*y(42));
residual(9) = lhs - rhs;
lhs = params(14)*y(43);
rhs = 100*y(66);
residual(10) = lhs - rhs;
lhs = y(44);
rhs = y(41)+y(42);
residual(11) = lhs - rhs;
lhs = y(40);
rhs = (1-params(15))*y(7)+T(2)*(y(28)-y(1)*T(1));
residual(12) = lhs - rhs;
lhs = y(45);
rhs = params(46)*y(9)+y(31)*(1-params(46))+y(61)*params(47);
residual(13) = lhs - rhs;
lhs = y(36);
rhs = y(35)+y(9);
residual(14) = lhs - rhs;
lhs = y(35);
rhs = y(33)*(1-params(16))/params(16);
residual(15) = lhs - rhs;
lhs = y(36);
rhs = y(37)+y(39)-y(33);
residual(16) = lhs - rhs;
lhs = y(29);
rhs = params(17)*y(2)+(1-params(17))*(y(30)*params(18)+params(19)*y(46)+params(20)*(y(46)-y(10)))-y(67);
residual(17) = lhs - rhs;
lhs = y(42)-y(8);
rhs = params(3)*(y(88)-y(42))+params(48)*(y(37)-y(42));
residual(18) = lhs - rhs;
lhs = y(47);
rhs = params(38)*y(89)+(1-params(38))*y(11)-params(39)*(y(48)-y(60));
residual(19) = lhs - rhs;
lhs = y(49);
rhs = y(61)+params(40)*y(12)+(1-params(40))*y(90)+params(41)*y(50);
residual(20) = lhs - rhs;
lhs = y(50);
rhs = params(42)*y(92)-(y(48)-y(60))+(1-params(42))*y(91);
residual(21) = lhs - rhs;
lhs = y(59);
rhs = y(62)+params(23)*y(47)+params(24)*y(49)+params(25)*y(52);
residual(22) = lhs - rhs;
lhs = y(59);
rhs = params(6)*(y(63)+params(7)*y(53)+(1-params(7))*y(54));
residual(23) = lhs - rhs;
lhs = 0;
rhs = (1-params(7))*y(55)+params(7)*y(51)-y(63);
residual(24) = lhs - rhs;
lhs = y(55);
rhs = y(65)+y(56)+params(14)*y(54);
residual(25) = lhs - rhs;
lhs = y(56);
rhs = (1-params(15))*y(13)+T(2)*(y(47)-T(1)*y(11));
residual(26) = lhs - rhs;
lhs = y(58);
rhs = y(61)*params(47)+params(46)*y(15)+(1-params(46))*y(49);
residual(27) = lhs - rhs;
lhs = y(53);
rhs = y(52)+y(15);
residual(28) = lhs - rhs;
lhs = y(52);
rhs = (1-params(16))/params(16)*y(51);
residual(29) = lhs - rhs;
lhs = y(53);
rhs = y(54)+y(55)-y(51);
residual(30) = lhs - rhs;
lhs = y(57)-y(14);
rhs = params(3)*(y(93)-y(57))+params(48)*(y(54)-y(57));
residual(31) = lhs - rhs;
lhs = y(46);
rhs = y(34)-y(59);
residual(32) = lhs - rhs;
lhs = y(60);
rhs = params(49)*y(16)+x(it_, 1);
residual(33) = lhs - rhs;
lhs = y(61);
rhs = params(50)*y(17)+x(it_, 2);
residual(34) = lhs - rhs;
lhs = y(62);
rhs = params(51)*y(18)+x(it_, 3)+params(53)*x(it_, 4);
residual(35) = lhs - rhs;
lhs = y(63);
rhs = x(it_, 4)+params(52)*y(19);
residual(36) = lhs - rhs;
lhs = y(64);
rhs = params(54)*y(20)+x(it_, 5)-params(55)*y(26);
residual(37) = lhs - rhs;
lhs = y(67);
rhs = params(59)*y(23)+x(it_, 8);
residual(38) = lhs - rhs;
lhs = y(65);
rhs = params(56)*y(21)+x(it_, 6);
residual(39) = lhs - rhs;
lhs = y(66);
rhs = params(57)*y(22)+x(it_, 7)-params(58)*y(27);
residual(40) = lhs - rhs;
lhs = y(68);
rhs = y(34)+params(28)+params(33)-y(5);
residual(41) = lhs - rhs;
lhs = y(69);
rhs = y(28)+params(28)+params(33)-y(1);
residual(42) = lhs - rhs;
lhs = y(70);
rhs = y(31)+params(28)+params(33)-y(4);
residual(43) = lhs - rhs;
lhs = y(71);
rhs = y(30)+params(30);
residual(44) = lhs - rhs;
lhs = y(72)-y(71);
rhs = y(39)+params(28)-y(6)-(y(30)-y(3));
residual(45) = lhs - rhs;
lhs = y(73);
rhs = y(42)+params(33)-y(8);
residual(46) = lhs - rhs;
lhs = y(74);
rhs = y(41)+params(32);
residual(47) = lhs - rhs;
lhs = y(75);
rhs = 4*params(31)+y(29)*4;
residual(48) = lhs - rhs;
lhs = y(76);
rhs = y(29)*4;
residual(49) = lhs - rhs;
lhs = y(77);
rhs = y(30)+y(3)+y(24)+y(25);
residual(50) = lhs - rhs;
lhs = y(78);
rhs = y(3);
residual(51) = lhs - rhs;
lhs = y(79);
rhs = y(24);
residual(52) = lhs - rhs;
lhs = y(80);
rhs = x(it_, 5);
residual(53) = lhs - rhs;
lhs = y(81);
rhs = x(it_, 7);
residual(54) = lhs - rhs;

end
