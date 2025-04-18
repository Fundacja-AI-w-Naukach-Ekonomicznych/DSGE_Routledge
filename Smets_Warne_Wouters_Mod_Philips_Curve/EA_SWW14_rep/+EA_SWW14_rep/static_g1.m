function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = EA_SWW14_rep.static_g1_tt(T, y, x, params);
end
g1 = zeros(54, 54);
g1(1,2)=params(39);
g1(1,3)=(-params(39));
g1(1,33)=(-params(39));
g1(2,5)=(-params(41));
g1(2,34)=(-1);
g1(3,2)=1;
g1(3,3)=(-1);
g1(3,5)=1-(1-params(42));
g1(3,6)=(-params(42));
g1(3,33)=(-1);
g1(4,1)=(-params(23));
g1(4,4)=(-params(24));
g1(4,7)=1;
g1(4,8)=(-params(25));
g1(4,35)=(-1);
g1(5,7)=1;
g1(5,9)=(-(params(6)*params(7)));
g1(5,10)=(-(params(6)*(1-params(7))));
g1(5,36)=(-params(6));
g1(6,3)=1-params(8)-params(43)*(1-params(8));
g1(6,11)=(-params(44));
g1(6,37)=params(44)*100;
g1(7,6)=(-params(7));
g1(7,11)=1;
g1(7,12)=(-(1-params(7)));
g1(7,36)=1;
g1(8,3)=1-(params(11)+params(3)*(1-params(11)));
g1(8,14)=params(45)*params(14);
g1(8,39)=params(45)*(-100);
g1(9,12)=(-1);
g1(9,13)=1;
g1(9,14)=params(14);
g1(9,15)=params(14);
g1(9,38)=1;
g1(10,16)=params(14);
g1(10,39)=(-100);
g1(11,14)=(-1);
g1(11,15)=(-1);
g1(11,17)=1;
g1(12,1)=(-params(15));
g1(12,13)=1-(1-params(15));
g1(13,4)=(-(1-params(46)));
g1(13,18)=1-params(46);
g1(13,34)=(-params(47));
g1(14,8)=(-1);
g1(14,9)=1;
g1(14,18)=(-1);
g1(15,6)=(-((1-params(16))/params(16)));
g1(15,8)=1;
g1(16,6)=1;
g1(16,9)=1;
g1(16,10)=(-1);
g1(16,12)=(-1);
g1(17,2)=1-params(17);
g1(17,3)=(-((1-params(17))*params(18)));
g1(17,19)=(-((1-params(17))*params(19)));
g1(17,40)=1;
g1(18,10)=(-params(48));
g1(18,15)=params(48);
g1(19,21)=params(39);
g1(19,33)=(-params(39));
g1(20,23)=(-params(41));
g1(20,34)=(-1);
g1(21,21)=1;
g1(21,23)=1-(1-params(42));
g1(21,24)=(-params(42));
g1(21,33)=(-1);
g1(22,20)=(-params(23));
g1(22,22)=(-params(24));
g1(22,25)=(-params(25));
g1(22,32)=1;
g1(22,35)=(-1);
g1(23,26)=(-(params(6)*params(7)));
g1(23,27)=(-(params(6)*(1-params(7))));
g1(23,32)=1;
g1(23,36)=(-params(6));
g1(24,24)=(-params(7));
g1(24,28)=(-(1-params(7)));
g1(24,36)=1;
g1(25,27)=(-params(14));
g1(25,28)=1;
g1(25,29)=(-1);
g1(25,38)=(-1);
g1(26,20)=(-params(15));
g1(26,29)=1-(1-params(15));
g1(27,22)=(-(1-params(46)));
g1(27,31)=1-params(46);
g1(27,34)=(-params(47));
g1(28,25)=(-1);
g1(28,26)=1;
g1(28,31)=(-1);
g1(29,24)=(-((1-params(16))/params(16)));
g1(29,25)=1;
g1(30,24)=1;
g1(30,26)=1;
g1(30,27)=(-1);
g1(30,28)=(-1);
g1(31,27)=(-params(48));
g1(31,30)=params(48);
g1(32,7)=(-1);
g1(32,19)=1;
g1(32,32)=1;
g1(33,36)=1-params(52);
g1(34,33)=1-params(49);
g1(35,35)=1-params(51);
g1(36,37)=1-params(54);
g1(36,53)=params(55);
g1(37,34)=1-params(50);
g1(38,40)=1-params(59);
g1(39,38)=1-params(56);
g1(40,39)=1-params(57);
g1(40,54)=params(58);
g1(41,41)=1;
g1(42,42)=1;
g1(43,43)=1;
g1(44,3)=(-1);
g1(44,44)=1;
g1(45,44)=(-1);
g1(45,45)=1;
g1(46,46)=1;
g1(47,14)=(-1);
g1(47,47)=1;
g1(48,2)=(-4);
g1(48,48)=1;
g1(49,2)=(-4);
g1(49,49)=1;
g1(50,3)=(-2);
g1(50,50)=1;
g1(50,51)=(-1);
g1(50,52)=(-1);
g1(51,3)=(-1);
g1(51,51)=1;
g1(52,51)=(-1);
g1(52,52)=1;
g1(53,53)=1;
g1(54,54)=1;

end
