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
residual = zeros(62, 1);
    residual(1) = (y(1)) - (y(1)*params(40)+y(1)*(1-params(40))-params(41)*(y(2)-y(3)-y(36)));
    residual(2) = (y(4)) - (y(4)*params(42)+y(4)*(1-params(42))+params(43)*y(5)+y(37));
    residual(3) = (y(5)) - (params(44)*y(6)-(y(2)-y(3)-y(36))+y(5)*(1-params(44)));
    residual(4) = (y(7)) - (y(1)*params(23)+y(4)*params(24)+params(25)*y(8)+y(38));
    residual(5) = (y(7)) - (params(6)*(params(7)*y(9)+(1-params(7))*y(10)+y(39)));
    residual(6) = (y(3)) - (params(36)*y(21)+params(37)*y(22)+(1-params(36)-params(37))*y(20));
    residual(7) = (y(20)-y(20)*params(8)) - ((y(20)-y(20)*params(8))*params(45)-params(46)*(100*y(40)-y(11)));
    residual(8) = (y(22)-y(22)*params(8)) - (params(45)*(y(22)-y(22)*params(8))-params(46)*(100*y(40)-y(11)+100*y(45)));
    residual(9) = (y(21)-y(21)*params(8)) - (params(45)*(y(21)-y(21)*params(8))-params(46)*(100*y(40)-y(11)+100*y(44)));
    residual(10) = (y(11)) - ((1-params(7))*y(12)+y(6)*params(7)-y(39));
    residual(11) = (y(3)) - (y(3)*params(11)+params(3)*(y(3)-y(3)*params(11))-params(47)*(params(14)*y(14)-100*y(42)));
    residual(12) = (params(14)*y(14)) - (y(12)-(y(13)+y(41)+params(14)*y(15)));
    residual(13) = (params(14)*y(16)) - (100*y(42));
    residual(14) = (y(17)) - (y(14)+y(15));
    residual(15) = (y(13)) - (y(13)*(1-params(15))+T(1)*(y(1)-y(1)*params(1)/params(2)));
    residual(16) = (y(18)) - (y(18)*params(48)+y(4)*(1-params(48))+y(37)*params(49));
    residual(17) = (y(9)) - (y(8)+y(18));
    residual(18) = (y(8)) - (y(6)*(1-params(16))/params(16));
    residual(19) = (y(9)) - (y(10)+y(12)-y(6));
    residual(20) = (y(2)) - (y(2)*params(17)+(1-params(17))*(y(3)*params(18)+params(19)*y(19))-y(43));
    residual(21) = (0) - (params(50)*(y(10)-y(15)));
    residual(22) = (y(23)) - (params(40)*y(23)+(1-params(40))*y(23)-params(41)*(y(24)-y(36)));
    residual(23) = (y(25)) - (y(37)+params(42)*y(25)+(1-params(42))*y(25)+params(43)*y(26));
    residual(24) = (y(26)) - (params(44)*y(27)-(y(24)-y(36))+(1-params(44))*y(26));
    residual(25) = (y(35)) - (y(38)+params(23)*y(23)+params(24)*y(25)+params(25)*y(28));
    residual(26) = (y(35)) - (params(6)*(y(39)+params(7)*y(29)+(1-params(7))*y(30)));
    residual(27) = (0) - ((1-params(7))*y(31)+params(7)*y(27)-y(39));
    residual(28) = (y(31)) - (y(41)+y(32)+params(14)*y(30));
    residual(29) = (y(32)) - ((1-params(15))*y(32)+T(1)*(y(23)-params(1)/params(2)*y(23)));
    residual(30) = (y(34)) - (y(37)*params(49)+params(48)*y(34)+(1-params(48))*y(25));
    residual(31) = (y(29)) - (y(28)+y(34));
    residual(32) = (y(28)) - ((1-params(16))/params(16)*y(27));
    residual(33) = (y(29)) - (y(30)+y(31)-y(27));
    residual(34) = (0) - (params(50)*(y(30)-y(33)));
    residual(35) = (y(19)) - (y(7)-y(35));
    residual(36) = (y(39)) - (y(39)*params(54)+x(4));
    residual(37) = (y(36)) - (y(36)*params(51)+x(1));
    residual(38) = (y(38)) - (y(38)*params(53)+x(3)+x(4)*params(55));
    residual(39) = (y(40)) - (y(40)*params(56)+x(5)-params(57)*y(61));
    residual(40) = (y(37)) - (y(37)*params(52)+x(2));
    residual(41) = (y(43)) - (y(43)*params(61)+x(8));
    residual(42) = (y(41)) - (y(41)*params(58)+x(6));
    residual(43) = (y(42)) - (y(42)*params(59)+x(7)-params(60)*y(62));
    residual(44) = (y(44)) - (x(9)+x(5)+y(44)*params(62)-params(57)*y(61));
    residual(45) = (y(45)) - (x(10)+x(5)+y(45)*params(63)-params(57)*y(61));
    residual(46) = (y(46)) - (params(28)+params(33));
    residual(47) = (y(47)) - (params(28)+params(33));
    residual(48) = (y(48)) - (params(28)+params(33));
    residual(49) = (y(54)) - (y(20)+params(30));
    residual(50) = (y(55)) - (y(21)+params(30));
    residual(51) = (y(56)) - (y(22)+params(30));
    residual(52) = (y(53)) - (params(36)*y(55)+params(37)*y(56)+(1-params(36)-params(37))*y(54));
    residual(53) = (y(49)-y(53)) - (params(28));
    residual(54) = (y(50)) - (params(33));
    residual(55) = (y(51)) - (y(14)+params(32));
    residual(56) = (y(52)) - (4*params(31)+y(2)*4);
    residual(57) = (y(57)) - (y(2)*4);
    residual(58) = (y(58)) - (y(3)+y(3)+y(59)+y(60));
    residual(59) = (y(59)) - (y(3));
    residual(60) = (y(60)) - (y(59));
    residual(61) = (y(61)) - (x(5));
    residual(62) = (y(62)) - (x(7));

end
