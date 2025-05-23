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
g1 = zeros(62, 62);
g1(1,2)=params(41);
g1(1,3)=(-params(41));
g1(1,36)=(-params(41));
g1(2,5)=(-params(43));
g1(2,37)=(-1);
g1(3,2)=1;
g1(3,3)=(-1);
g1(3,5)=1-(1-params(44));
g1(3,6)=(-params(44));
g1(3,36)=(-1);
g1(4,1)=(-params(23));
g1(4,4)=(-params(24));
g1(4,7)=1;
g1(4,8)=(-params(25));
g1(4,38)=(-1);
g1(5,7)=1;
g1(5,9)=(-(params(6)*params(7)));
g1(5,10)=(-(params(6)*(1-params(7))));
g1(5,39)=(-params(6));
g1(6,3)=1;
g1(6,20)=(-(1-params(36)-params(37)));
g1(6,21)=(-params(36));
g1(6,22)=(-params(37));
g1(7,11)=(-params(46));
g1(7,20)=1-params(8)-params(45)*(1-params(8));
g1(7,40)=params(46)*100;
g1(8,11)=(-params(46));
g1(8,22)=1-params(8)-params(45)*(1-params(8));
g1(8,40)=params(46)*100;
g1(8,45)=params(46)*100;
g1(9,11)=(-params(46));
g1(9,21)=1-params(8)-params(45)*(1-params(8));
g1(9,40)=params(46)*100;
g1(9,44)=params(46)*100;
g1(10,6)=(-params(7));
g1(10,11)=1;
g1(10,12)=(-(1-params(7)));
g1(10,39)=1;
g1(11,3)=1-(params(11)+params(3)*(1-params(11)));
g1(11,14)=params(47)*params(14);
g1(11,42)=params(47)*(-100);
g1(12,12)=(-1);
g1(12,13)=1;
g1(12,14)=params(14);
g1(12,15)=params(14);
g1(12,41)=1;
g1(13,16)=params(14);
g1(13,42)=(-100);
g1(14,14)=(-1);
g1(14,15)=(-1);
g1(14,17)=1;
g1(15,1)=(-params(15));
g1(15,13)=1-(1-params(15));
g1(16,4)=(-(1-params(48)));
g1(16,18)=1-params(48);
g1(16,37)=(-params(49));
g1(17,8)=(-1);
g1(17,9)=1;
g1(17,18)=(-1);
g1(18,6)=(-((1-params(16))/params(16)));
g1(18,8)=1;
g1(19,6)=1;
g1(19,9)=1;
g1(19,10)=(-1);
g1(19,12)=(-1);
g1(20,2)=1-params(17);
g1(20,3)=(-((1-params(17))*params(18)));
g1(20,19)=(-((1-params(17))*params(19)));
g1(20,43)=1;
g1(21,10)=(-params(50));
g1(21,15)=params(50);
g1(22,24)=params(41);
g1(22,36)=(-params(41));
g1(23,26)=(-params(43));
g1(23,37)=(-1);
g1(24,24)=1;
g1(24,26)=1-(1-params(44));
g1(24,27)=(-params(44));
g1(24,36)=(-1);
g1(25,23)=(-params(23));
g1(25,25)=(-params(24));
g1(25,28)=(-params(25));
g1(25,35)=1;
g1(25,38)=(-1);
g1(26,29)=(-(params(6)*params(7)));
g1(26,30)=(-(params(6)*(1-params(7))));
g1(26,35)=1;
g1(26,39)=(-params(6));
g1(27,27)=(-params(7));
g1(27,31)=(-(1-params(7)));
g1(27,39)=1;
g1(28,30)=(-params(14));
g1(28,31)=1;
g1(28,32)=(-1);
g1(28,41)=(-1);
g1(29,23)=(-params(15));
g1(29,32)=1-(1-params(15));
g1(30,25)=(-(1-params(48)));
g1(30,34)=1-params(48);
g1(30,37)=(-params(49));
g1(31,28)=(-1);
g1(31,29)=1;
g1(31,34)=(-1);
g1(32,27)=(-((1-params(16))/params(16)));
g1(32,28)=1;
g1(33,27)=1;
g1(33,29)=1;
g1(33,30)=(-1);
g1(33,31)=(-1);
g1(34,30)=(-params(50));
g1(34,33)=params(50);
g1(35,7)=(-1);
g1(35,19)=1;
g1(35,35)=1;
g1(36,39)=1-params(54);
g1(37,36)=1-params(51);
g1(38,38)=1-params(53);
g1(39,40)=1-params(56);
g1(39,61)=params(57);
g1(40,37)=1-params(52);
g1(41,43)=1-params(61);
g1(42,41)=1-params(58);
g1(43,42)=1-params(59);
g1(43,62)=params(60);
g1(44,44)=1-params(62);
g1(44,61)=params(57);
g1(45,45)=1-params(63);
g1(45,61)=params(57);
g1(46,46)=1;
g1(47,47)=1;
g1(48,48)=1;
g1(49,20)=(-1);
g1(49,54)=1;
g1(50,21)=(-1);
g1(50,55)=1;
g1(51,22)=(-1);
g1(51,56)=1;
g1(52,53)=1;
g1(52,54)=(-(1-params(36)-params(37)));
g1(52,55)=(-params(36));
g1(52,56)=(-params(37));
g1(53,49)=1;
g1(53,53)=(-1);
g1(54,50)=1;
g1(55,14)=(-1);
g1(55,51)=1;
g1(56,2)=(-4);
g1(56,52)=1;
g1(57,2)=(-4);
g1(57,57)=1;
g1(58,3)=(-2);
g1(58,58)=1;
g1(58,59)=(-1);
g1(58,60)=(-1);
g1(59,3)=(-1);
g1(59,59)=1;
g1(60,59)=(-1);
g1(60,60)=1;
g1(61,61)=1;
g1(62,62)=1;

end
