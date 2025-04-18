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
    residual(1) = (y(28)) - (params(38)*y(82)+(1-params(38))*y(1)-params(39)*(y(29)-y(83)-y(60)));
    residual(2) = (y(31)) - (params(40)*y(4)+(1-params(40))*y(84)+params(41)*y(32)+y(61));
    residual(3) = (y(32)) - (params(42)*y(86)-(y(29)-y(83)-y(60))+(1-params(42))*y(85));
    residual(4) = (y(34)) - (y(28)*params(23)+y(31)*params(24)+params(25)*y(35)+y(62));
    residual(5) = (y(34)) - (params(6)*(params(7)*y(36)+(1-params(7))*y(37)+y(63)));
    residual(6) = (y(30)-params(8)*y(3)) - (params(43)*(y(83)-y(30)*params(8))-params(44)*(100*y(64)-y(38)));
    residual(7) = (y(38)) - ((1-params(7))*y(39)+params(7)*y(33)-y(63));
    residual(8) = (y(30)+y(39)-y(6)) - (y(3)*params(11)+params(3)*(y(83)+y(87)-y(39)-y(30)*params(11))-params(45)*(params(14)*y(41)-100*y(66)));
    residual(9) = (params(14)*y(41)) - (y(39)-(y(40)+y(65)+params(14)*y(42)));
    residual(10) = (params(14)*y(43)) - (100*y(66));
    residual(11) = (y(44)) - (y(41)+y(42));
    residual(12) = (y(40)) - ((1-params(15))*y(7)+T(2)*(y(28)-y(1)*T(1)));
    residual(13) = (y(45)) - (params(46)*y(9)+y(31)*(1-params(46))+y(61)*params(47));
    residual(14) = (y(36)) - (y(35)+y(9));
    residual(15) = (y(35)) - (y(33)*(1-params(16))/params(16));
    residual(16) = (y(36)) - (y(37)+y(39)-y(33));
    residual(17) = (y(29)) - (params(17)*y(2)+(1-params(17))*(y(30)*params(18)+params(19)*y(46)+params(20)*(y(46)-y(10)))-y(67));
    residual(18) = (y(42)-y(8)) - (params(3)*(y(88)-y(42))+params(48)*(y(37)-y(42)));
    residual(19) = (y(47)) - (params(38)*y(89)+(1-params(38))*y(11)-params(39)*(y(48)-y(60)));
    residual(20) = (y(49)) - (y(61)+params(40)*y(12)+(1-params(40))*y(90)+params(41)*y(50));
    residual(21) = (y(50)) - (params(42)*y(92)-(y(48)-y(60))+(1-params(42))*y(91));
    residual(22) = (y(59)) - (y(62)+params(23)*y(47)+params(24)*y(49)+params(25)*y(52));
    residual(23) = (y(59)) - (params(6)*(y(63)+params(7)*y(53)+(1-params(7))*y(54)));
    residual(24) = (0) - ((1-params(7))*y(55)+params(7)*y(51)-y(63));
    residual(25) = (y(55)) - (y(65)+y(56)+params(14)*y(54));
    residual(26) = (y(56)) - ((1-params(15))*y(13)+T(2)*(y(47)-T(1)*y(11)));
    residual(27) = (y(58)) - (y(61)*params(47)+params(46)*y(15)+(1-params(46))*y(49));
    residual(28) = (y(53)) - (y(52)+y(15));
    residual(29) = (y(52)) - ((1-params(16))/params(16)*y(51));
    residual(30) = (y(53)) - (y(54)+y(55)-y(51));
    residual(31) = (y(57)-y(14)) - (params(3)*(y(93)-y(57))+params(48)*(y(54)-y(57)));
    residual(32) = (y(46)) - (y(34)-y(59));
    residual(33) = (y(63)) - (params(52)*y(19)+x(it_, 4));
    residual(34) = (y(60)) - (params(49)*y(16)+x(it_, 1));
    residual(35) = (y(62)) - (params(51)*y(18)+x(it_, 3)+x(it_, 4)*params(53));
    residual(36) = (y(64)) - (params(54)*y(20)+x(it_, 5)-params(55)*y(26));
    residual(37) = (y(61)) - (params(50)*y(17)+x(it_, 2));
    residual(38) = (y(67)) - (params(59)*y(23)+x(it_, 8));
    residual(39) = (y(65)) - (params(56)*y(21)+x(it_, 6));
    residual(40) = (y(66)) - (params(57)*y(22)+x(it_, 7)-params(58)*y(27));
    residual(41) = (y(68)) - (y(34)+params(28)+params(33)-y(5));
    residual(42) = (y(69)) - (y(28)+params(28)+params(33)-y(1));
    residual(43) = (y(70)) - (y(31)+params(28)+params(33)-y(4));
    residual(44) = (y(71)) - (y(30)+params(30));
    residual(45) = (y(72)-y(71)) - (y(39)+params(28)-y(6)-(y(30)-y(3)));
    residual(46) = (y(73)) - (y(42)+params(33)-y(8));
    residual(47) = (y(74)) - (y(41)+params(32));
    residual(48) = (y(75)) - (4*params(31)+y(29)*4);
    residual(49) = (y(76)) - (y(29)*4);
    residual(50) = (y(77)) - (y(30)+y(3)+y(24)+y(25));
    residual(51) = (y(78)) - (y(3));
    residual(52) = (y(79)) - (y(24));
    residual(53) = (y(80)) - (x(it_, 5));
    residual(54) = (y(81)) - (x(it_, 7));

end
