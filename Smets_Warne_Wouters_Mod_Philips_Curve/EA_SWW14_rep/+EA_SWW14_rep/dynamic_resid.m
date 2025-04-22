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
residual = zeros(62, 1);
    residual(1) = (y(33)) - (params(40)*y(95)+(1-params(40))*y(1)-params(41)*(y(34)-y(96)-y(68)));
    residual(2) = (y(36)) - (params(42)*y(4)+(1-params(42))*y(97)+params(43)*y(37)+y(69));
    residual(3) = (y(37)) - (params(44)*y(99)-(y(34)-y(96)-y(68))+(1-params(44))*y(98));
    residual(4) = (y(39)) - (y(33)*params(23)+y(36)*params(24)+params(25)*y(40)+y(70));
    residual(5) = (y(39)) - (params(6)*(params(7)*y(41)+(1-params(7))*y(42)+y(71)));
    residual(6) = (y(35)) - (params(36)*y(53)+params(37)*y(54)+(1-params(36)-params(37))*y(52));
    residual(7) = (y(52)-params(8)*y(11)) - (params(45)*(y(102)-y(52)*params(8))-params(46)*(100*y(72)-y(43)));
    residual(8) = (y(54)-params(8)*y(13)) - (params(45)*(y(104)-y(54)*params(8))-params(46)*(100*y(72)-y(43)+100*y(77)));
    residual(9) = (y(53)-params(8)*y(12)) - (params(45)*(y(103)-y(53)*params(8))-params(46)*(100*y(72)-y(43)+100*y(76)));
    residual(10) = (y(43)) - ((1-params(7))*y(44)+params(7)*y(38)-y(71));
    residual(11) = (y(35)+y(44)-y(6)) - (params(11)*y(3)+params(3)*(y(96)+y(100)-y(44)-y(35)*params(11))-params(47)*(params(14)*y(46)-100*y(74)));
    residual(12) = (params(14)*y(46)) - (y(44)-(y(45)+y(73)+params(14)*y(47)));
    residual(13) = (params(14)*y(48)) - (100*y(74));
    residual(14) = (y(49)) - (y(46)+y(47));
    residual(15) = (y(45)) - ((1-params(15))*y(7)+T(2)*(y(33)-y(1)*T(1)));
    residual(16) = (y(50)) - (params(48)*y(9)+y(36)*(1-params(48))+y(69)*params(49));
    residual(17) = (y(41)) - (y(40)+y(9));
    residual(18) = (y(40)) - (y(38)*(1-params(16))/params(16));
    residual(19) = (y(41)) - (y(42)+y(44)-y(38));
    residual(20) = (y(34)) - (params(17)*y(2)+(1-params(17))*(y(35)*params(18)+params(19)*y(51)+params(20)*(y(51)-y(10)))-y(75));
    residual(21) = (y(47)-y(8)) - (params(3)*(y(101)-y(47))+params(50)*(y(42)-y(47)));
    residual(22) = (y(55)) - (params(40)*y(105)+(1-params(40))*y(14)-params(41)*(y(56)-y(68)));
    residual(23) = (y(57)) - (y(69)+params(42)*y(15)+(1-params(42))*y(106)+params(43)*y(58));
    residual(24) = (y(58)) - (params(44)*y(108)-(y(56)-y(68))+(1-params(44))*y(107));
    residual(25) = (y(67)) - (y(70)+params(23)*y(55)+params(24)*y(57)+params(25)*y(60));
    residual(26) = (y(67)) - (params(6)*(y(71)+params(7)*y(61)+(1-params(7))*y(62)));
    residual(27) = (0) - ((1-params(7))*y(63)+params(7)*y(59)-y(71));
    residual(28) = (y(63)) - (y(73)+y(64)+params(14)*y(62));
    residual(29) = (y(64)) - ((1-params(15))*y(16)+T(2)*(y(55)-T(1)*y(14)));
    residual(30) = (y(66)) - (y(69)*params(49)+params(48)*y(18)+(1-params(48))*y(57));
    residual(31) = (y(61)) - (y(60)+y(18));
    residual(32) = (y(60)) - ((1-params(16))/params(16)*y(59));
    residual(33) = (y(61)) - (y(62)+y(63)-y(59));
    residual(34) = (y(65)-y(17)) - (params(3)*(y(109)-y(65))+params(50)*(y(62)-y(65)));
    residual(35) = (y(51)) - (y(39)-y(67));
    residual(36) = (y(71)) - (params(54)*y(22)+x(it_, 4));
    residual(37) = (y(68)) - (params(51)*y(19)+x(it_, 1));
    residual(38) = (y(70)) - (params(53)*y(21)+x(it_, 3)+x(it_, 4)*params(55));
    residual(39) = (y(72)) - (params(56)*y(23)+x(it_, 5)-params(57)*y(31));
    residual(40) = (y(69)) - (params(52)*y(20)+x(it_, 2));
    residual(41) = (y(75)) - (params(61)*y(26)+x(it_, 8));
    residual(42) = (y(73)) - (params(58)*y(24)+x(it_, 6));
    residual(43) = (y(74)) - (params(59)*y(25)+x(it_, 7)-params(60)*y(32));
    residual(44) = (y(76)) - (x(it_, 9)+x(it_, 5)+params(62)*y(27)-params(57)*y(31));
    residual(45) = (y(77)) - (x(it_, 10)+x(it_, 5)+params(63)*y(28)-params(57)*y(31));
    residual(46) = (y(78)) - (y(39)+params(28)+params(33)-y(5));
    residual(47) = (y(79)) - (y(33)+params(28)+params(33)-y(1));
    residual(48) = (y(80)) - (y(36)+params(28)+params(33)-y(4));
    residual(49) = (y(86)) - (y(52)+params(30));
    residual(50) = (y(87)) - (y(53)+params(30));
    residual(51) = (y(88)) - (y(54)+params(30));
    residual(52) = (y(85)) - (params(36)*y(87)+params(37)*y(88)+(1-params(36)-params(37))*y(86));
    residual(53) = (y(81)-y(85)) - (y(44)+params(28)-y(6)-(y(35)-y(3)));
    residual(54) = (y(82)) - (y(47)+params(33)-y(8));
    residual(55) = (y(83)) - (y(46)+params(32));
    residual(56) = (y(84)) - (4*params(31)+y(34)*4);
    residual(57) = (y(89)) - (y(34)*4);
    residual(58) = (y(90)) - (y(35)+y(3)+y(29)+y(30));
    residual(59) = (y(91)) - (y(3));
    residual(60) = (y(92)) - (y(29));
    residual(61) = (y(93)) - (x(it_, 5));
    residual(62) = (y(94)) - (x(it_, 7));

end
