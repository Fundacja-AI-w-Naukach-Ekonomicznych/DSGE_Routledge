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
lhs = y(1);
rhs = y(1)*params(38)+y(1)*(1-params(38))-params(39)*(y(2)-y(3)-y(33));
residual(1) = lhs - rhs;
lhs = y(4);
rhs = y(4)*params(40)+y(4)*(1-params(40))+params(41)*y(5)+y(34);
residual(2) = lhs - rhs;
lhs = y(5);
rhs = params(42)*y(6)-(y(2)-y(3)-y(33))+y(5)*(1-params(42));
residual(3) = lhs - rhs;
lhs = y(7);
rhs = y(1)*params(23)+y(4)*params(24)+params(25)*y(8)+y(35);
residual(4) = lhs - rhs;
lhs = y(7);
rhs = params(6)*(params(7)*y(9)+(1-params(7))*y(10)+y(36));
residual(5) = lhs - rhs;
lhs = y(3)-y(3)*params(8);
rhs = (y(3)-y(3)*params(8))*params(43)-params(44)*(100*y(37)-y(11));
residual(6) = lhs - rhs;
lhs = y(11);
rhs = (1-params(7))*y(12)+y(6)*params(7)-y(36);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = y(3)*params(11)+params(3)*(y(3)-y(3)*params(11))-params(45)*(params(14)*y(14)-100*y(39));
residual(8) = lhs - rhs;
lhs = params(14)*y(14);
rhs = y(12)-(y(13)+y(38)+params(14)*y(15));
residual(9) = lhs - rhs;
lhs = params(14)*y(16);
rhs = 100*y(39);
residual(10) = lhs - rhs;
lhs = y(17);
rhs = y(14)+y(15);
residual(11) = lhs - rhs;
lhs = y(13);
rhs = y(13)*(1-params(15))+T(1)*(y(1)-y(1)*params(1)/params(2));
residual(12) = lhs - rhs;
lhs = y(18);
rhs = y(18)*params(46)+y(4)*(1-params(46))+y(34)*params(47);
residual(13) = lhs - rhs;
lhs = y(9);
rhs = y(8)+y(18);
residual(14) = lhs - rhs;
lhs = y(8);
rhs = y(6)*(1-params(16))/params(16);
residual(15) = lhs - rhs;
lhs = y(9);
rhs = y(10)+y(12)-y(6);
residual(16) = lhs - rhs;
lhs = y(2);
rhs = y(2)*params(17)+(1-params(17))*(y(3)*params(18)+params(19)*y(19))-y(40);
residual(17) = lhs - rhs;
lhs = 0;
rhs = params(48)*(y(10)-y(15));
residual(18) = lhs - rhs;
lhs = y(20);
rhs = params(38)*y(20)+(1-params(38))*y(20)-params(39)*(y(21)-y(33));
residual(19) = lhs - rhs;
lhs = y(22);
rhs = y(34)+params(40)*y(22)+(1-params(40))*y(22)+params(41)*y(23);
residual(20) = lhs - rhs;
lhs = y(23);
rhs = params(42)*y(24)-(y(21)-y(33))+(1-params(42))*y(23);
residual(21) = lhs - rhs;
lhs = y(32);
rhs = y(35)+params(23)*y(20)+params(24)*y(22)+params(25)*y(25);
residual(22) = lhs - rhs;
lhs = y(32);
rhs = params(6)*(y(36)+params(7)*y(26)+(1-params(7))*y(27));
residual(23) = lhs - rhs;
lhs = 0;
rhs = (1-params(7))*y(28)+params(7)*y(24)-y(36);
residual(24) = lhs - rhs;
lhs = y(28);
rhs = y(38)+y(29)+params(14)*y(27);
residual(25) = lhs - rhs;
lhs = y(29);
rhs = (1-params(15))*y(29)+T(1)*(y(20)-params(1)/params(2)*y(20));
residual(26) = lhs - rhs;
lhs = y(31);
rhs = y(34)*params(47)+params(46)*y(31)+(1-params(46))*y(22);
residual(27) = lhs - rhs;
lhs = y(26);
rhs = y(25)+y(31);
residual(28) = lhs - rhs;
lhs = y(25);
rhs = (1-params(16))/params(16)*y(24);
residual(29) = lhs - rhs;
lhs = y(26);
rhs = y(27)+y(28)-y(24);
residual(30) = lhs - rhs;
lhs = 0;
rhs = params(48)*(y(27)-y(30));
residual(31) = lhs - rhs;
lhs = y(19);
rhs = y(7)-y(32);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = y(33)*params(49)+x(1);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = y(34)*params(50)+x(2);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(35)*params(51)+x(3)+params(53)*x(4);
residual(35) = lhs - rhs;
lhs = y(36);
rhs = x(4)+y(36)*params(52);
residual(36) = lhs - rhs;
lhs = y(37);
rhs = y(37)*params(54)+x(5)-x(5)*params(55);
residual(37) = lhs - rhs;
lhs = y(40);
rhs = y(40)*params(59)+x(8);
residual(38) = lhs - rhs;
lhs = y(38);
rhs = y(38)*params(56)+x(6);
residual(39) = lhs - rhs;
lhs = y(39);
rhs = y(39)*params(57)+x(7)-x(7)*params(58);
residual(40) = lhs - rhs;
lhs = y(41);
rhs = params(28)+params(33);
residual(41) = lhs - rhs;
lhs = y(42);
rhs = params(28)+params(33);
residual(42) = lhs - rhs;
lhs = y(43);
rhs = params(28)+params(33);
residual(43) = lhs - rhs;
lhs = y(44);
rhs = y(3)+params(30);
residual(44) = lhs - rhs;
lhs = y(45)-y(44);
rhs = params(28);
residual(45) = lhs - rhs;
lhs = y(46);
rhs = params(33);
residual(46) = lhs - rhs;
lhs = y(47);
rhs = y(14)+params(32);
residual(47) = lhs - rhs;
lhs = y(48);
rhs = 4*params(31)+y(2)*4;
residual(48) = lhs - rhs;
lhs = y(49);
rhs = y(2)*4;
residual(49) = lhs - rhs;
lhs = y(50);
rhs = y(3)+y(3)+y(3)+y(3);
residual(50) = lhs - rhs;
lhs = y(51);
rhs = y(3);
residual(51) = lhs - rhs;
lhs = y(52);
rhs = y(3);
residual(52) = lhs - rhs;
lhs = y(53);
rhs = x(5);
residual(53) = lhs - rhs;
lhs = y(54);
rhs = x(7);
residual(54) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
