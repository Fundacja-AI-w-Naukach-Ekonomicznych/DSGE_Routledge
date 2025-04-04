function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = EA_SWW14_rep.static_resid_tt(T, y, x, params);
end
residual = zeros(54, 1);
    residual(1) = (y(1)) - (y(1)*params(38)+y(1)*(1-params(38))-params(39)*(y(2)-y(3)-y(33)));
    residual(2) = (y(4)) - (y(4)*params(40)+y(4)*(1-params(40))+params(41)*y(5)+y(34));
    residual(3) = (y(5)) - (params(42)*y(6)-(y(2)-y(3)-y(33))+y(5)*(1-params(42)));
    residual(4) = (y(7)) - (y(1)*params(23)+y(4)*params(24)+params(25)*y(8)+y(35));
    residual(5) = (y(7)) - (params(6)*(params(7)*y(9)+(1-params(7))*y(10)+y(36)));
    residual(6) = (y(3)-y(3)*params(8)) - ((y(3)-y(3)*params(8))*params(43)-params(44)*(100*y(37)-y(11)));
    residual(7) = (y(11)) - ((1-params(7))*y(12)+y(6)*params(7)-y(36));
    residual(8) = (y(3)) - (y(3)*params(11)+params(3)*(y(3)-y(3)*params(11))-params(45)*(params(14)*y(14)-100*y(39)));
    residual(9) = (params(14)*y(14)) - (y(12)-(y(13)+y(38)+params(14)*y(15)));
    residual(10) = (params(14)*y(16)) - (100*y(39));
    residual(11) = (y(17)) - (y(14)+y(15));
    residual(12) = (y(13)) - (y(13)*(1-params(15))+T(1)*(y(1)-y(1)*params(1)/params(2)));
    residual(13) = (y(18)) - (y(18)*params(46)+y(4)*(1-params(46))+y(34)*params(47));
    residual(14) = (y(9)) - (y(8)+y(18));
    residual(15) = (y(8)) - (y(6)*(1-params(16))/params(16));
    residual(16) = (y(9)) - (y(10)+y(12)-y(6));
    residual(17) = (y(2)) - (y(2)*params(17)+(1-params(17))*(y(3)*params(18)+params(19)*y(19))-y(40));
    residual(18) = (0) - (params(48)*(y(10)-y(15)));
    residual(19) = (y(20)) - (params(38)*y(20)+(1-params(38))*y(20)-params(39)*(y(21)-y(33)));
    residual(20) = (y(22)) - (y(34)+params(40)*y(22)+(1-params(40))*y(22)+params(41)*y(23));
    residual(21) = (y(23)) - (params(42)*y(24)-(y(21)-y(33))+(1-params(42))*y(23));
    residual(22) = (y(32)) - (y(35)+params(23)*y(20)+params(24)*y(22)+params(25)*y(25));
    residual(23) = (y(32)) - (params(6)*(y(36)+params(7)*y(26)+(1-params(7))*y(27)));
    residual(24) = (0) - ((1-params(7))*y(28)+params(7)*y(24)-y(36));
    residual(25) = (y(28)) - (y(38)+y(29)+params(14)*y(27));
    residual(26) = (y(29)) - ((1-params(15))*y(29)+T(1)*(y(20)-params(1)/params(2)*y(20)));
    residual(27) = (y(31)) - (y(34)*params(47)+params(46)*y(31)+(1-params(46))*y(22));
    residual(28) = (y(26)) - (y(25)+y(31));
    residual(29) = (y(25)) - ((1-params(16))/params(16)*y(24));
    residual(30) = (y(26)) - (y(27)+y(28)-y(24));
    residual(31) = (0) - (params(48)*(y(27)-y(30)));
    residual(32) = (y(19)) - (y(7)-y(32));
    residual(33) = (y(36)) - (y(36)*params(52)+x(4));
    residual(34) = (y(33)) - (y(33)*params(49)+x(1));
    residual(35) = (y(35)) - (y(35)*params(51)+x(3)+x(4)*params(53));
    residual(36) = (y(37)) - (y(37)*params(54)+x(5)-params(55)*y(53));
    residual(37) = (y(34)) - (y(34)*params(50)+x(2));
    residual(38) = (y(40)) - (y(40)*params(59)+x(8));
    residual(39) = (y(38)) - (y(38)*params(56)+x(6));
    residual(40) = (y(39)) - (y(39)*params(57)+x(7)-params(58)*y(54));
    residual(41) = (y(41)) - (params(28)+params(33));
    residual(42) = (y(42)) - (params(28)+params(33));
    residual(43) = (y(43)) - (params(28)+params(33));
    residual(44) = (y(44)) - (y(3)+params(30));
    residual(45) = (y(45)-y(44)) - (params(28));
    residual(46) = (y(46)) - (params(33));
    residual(47) = (y(47)) - (y(14)+params(32));
    residual(48) = (y(48)) - (4*params(31)+y(2)*4);
    residual(49) = (y(49)) - (y(2)*4);
    residual(50) = (y(50)) - (y(3)+y(3)+y(51)+y(52));
    residual(51) = (y(51)) - (y(3));
    residual(52) = (y(52)) - (y(51));
    residual(53) = (y(53)) - (x(5));
    residual(54) = (y(54)) - (x(7));

end
