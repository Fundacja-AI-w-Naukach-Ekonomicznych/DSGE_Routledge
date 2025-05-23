function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = EA_SWW14_rep.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(54, 1);
    residual(1) = (y(55)) - (params(38)*y(109)+(1-params(38))*y(1)-params(39)*(y(56)-y(111)-y(87)));
    residual(2) = (y(58)) - (params(40)*y(4)+(1-params(40))*y(112)+params(41)*y(59)+y(88));
    residual(3) = (y(59)) - (params(42)*y(114)-(y(56)-y(111)-y(87))+(1-params(42))*y(113));
    residual(4) = (y(61)) - (y(55)*params(23)+y(58)*params(24)+params(25)*y(62)+y(89));
    residual(5) = (y(61)) - (params(6)*(params(7)*y(63)+(1-params(7))*y(64)+y(90)));
    residual(6) = (y(57)-params(8)*y(3)) - (params(43)*(y(111)-y(57)*params(8))-params(44)*(100*y(91)-y(65)));
    residual(7) = (y(65)) - ((1-params(7))*y(66)+params(7)*y(60)-y(90));
    residual(8) = (y(57)+y(66)-y(12)) - (y(3)*params(11)+params(3)*(y(111)+y(120)-y(66)-y(57)*params(11))-params(45)*(params(14)*y(68)-100*y(93)));
    residual(9) = (params(14)*y(68)) - (y(66)-(y(67)+y(92)+params(14)*y(69)));
    residual(10) = (params(14)*y(70)) - (100*y(93));
    residual(11) = (y(71)) - (y(68)+y(69));
    residual(12) = (y(67)) - ((1-params(15))*y(13)+T(2)*(y(55)-y(1)*T(1)));
    residual(13) = (y(72)) - (params(46)*y(18)+y(58)*(1-params(46))+y(88)*params(47));
    residual(14) = (y(63)) - (y(62)+y(18));
    residual(15) = (y(62)) - (y(60)*(1-params(16))/params(16));
    residual(16) = (y(63)) - (y(64)+y(66)-y(60));
    residual(17) = (y(56)) - (params(17)*y(2)+(1-params(17))*(y(57)*params(18)+params(19)*y(73)+params(20)*(y(73)-y(19)))-y(94));
    residual(18) = (y(69)-y(15)) - (params(3)*(y(123)-y(69))+params(48)*(y(64)-y(69)));
    residual(19) = (y(74)) - (params(38)*y(128)+(1-params(38))*y(20)-params(39)*(y(75)-y(87)));
    residual(20) = (y(76)) - (y(88)+params(40)*y(22)+(1-params(40))*y(130)+params(41)*y(77));
    residual(21) = (y(77)) - (params(42)*y(132)-(y(75)-y(87))+(1-params(42))*y(131));
    residual(22) = (y(86)) - (y(89)+params(23)*y(74)+params(24)*y(76)+params(25)*y(79));
    residual(23) = (y(86)) - (params(6)*(y(90)+params(7)*y(80)+(1-params(7))*y(81)));
    residual(24) = (0) - ((1-params(7))*y(82)+params(7)*y(78)-y(90));
    residual(25) = (y(82)) - (y(92)+y(83)+params(14)*y(81));
    residual(26) = (y(83)) - ((1-params(15))*y(29)+T(2)*(y(74)-T(1)*y(20)));
    residual(27) = (y(85)) - (y(88)*params(47)+params(46)*y(31)+(1-params(46))*y(76));
    residual(28) = (y(80)) - (y(79)+y(31));
    residual(29) = (y(79)) - ((1-params(16))/params(16)*y(78));
    residual(30) = (y(80)) - (y(81)+y(82)-y(78));
    residual(31) = (y(84)-y(30)) - (params(3)*(y(138)-y(84))+params(48)*(y(81)-y(84)));
    residual(32) = (y(73)) - (y(61)-y(86));
    residual(33) = (y(90)) - (params(52)*y(36)+x(4));
    residual(34) = (y(87)) - (params(49)*y(33)+x(1));
    residual(35) = (y(89)) - (params(51)*y(35)+x(3)+x(4)*params(53));
    residual(36) = (y(91)) - (params(54)*y(37)+x(5)-params(55)*y(53));
    residual(37) = (y(88)) - (params(50)*y(34)+x(2));
    residual(38) = (y(94)) - (params(59)*y(40)+x(8));
    residual(39) = (y(92)) - (params(56)*y(38)+x(6));
    residual(40) = (y(93)) - (params(57)*y(39)+x(7)-params(58)*y(54));
    residual(41) = (y(95)) - (y(61)+params(28)+params(33)-y(7));
    residual(42) = (y(96)) - (y(55)+params(28)+params(33)-y(1));
    residual(43) = (y(97)) - (y(58)+params(28)+params(33)-y(4));
    residual(44) = (y(98)) - (y(57)+params(30));
    residual(45) = (y(99)-y(98)) - (y(66)+params(28)-y(12)-(y(57)-y(3)));
    residual(46) = (y(100)) - (y(69)+params(33)-y(15));
    residual(47) = (y(101)) - (y(68)+params(32));
    residual(48) = (y(102)) - (4*params(31)+y(56)*4);
    residual(49) = (y(103)) - (y(56)*4);
    residual(50) = (y(104)) - (y(57)+y(3)+y(51)+y(52));
    residual(51) = (y(105)) - (y(3));
    residual(52) = (y(106)) - (y(51));
    residual(53) = (y(107)) - (x(5));
    residual(54) = (y(108)) - (x(7));
end
