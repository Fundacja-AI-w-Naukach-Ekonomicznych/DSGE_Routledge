function [y, T, residual, g1] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  y(86)=params(6)*(y(90)+params(7)*y(80)+(1-params(7))*y(81));
  y(79)=(1-params(16))/params(16)*y(78);
  y(82)=y(92)+y(83)+params(14)*y(81);
  residual(1)=(y(74))-(params(38)*y(128)+(1-params(38))*y(20)-params(39)*(y(75)-y(87)));
  residual(2)=(y(80))-(y(79)+y(31));
  residual(3)=(y(80))-(y(81)+y(82)-y(78));
  residual(4)=(y(83))-((1-params(15))*y(29)+params(15)/(1-params(1)/params(2))*(y(74)-params(1)/params(2)*y(20)));
  residual(5)=(y(85))-(y(88)*params(47)+params(46)*y(31)+(1-params(46))*y(76));
  residual(6)=(y(76))-(y(88)+params(40)*y(22)+(1-params(40))*y(130)+params(41)*y(77));
  residual(7)=(y(86))-(y(89)+params(23)*y(74)+params(24)*y(76)+params(25)*y(79));
  residual(8)=(y(77))-(params(42)*y(132)-(y(75)-y(87))+(1-params(42))*y(131));
  residual(9)=(0)-((1-params(7))*y(82)+params(7)*y(78)-y(90));
if nargout > 3
    g1_v = NaN(34, 1);
g1_v(1)=(-(1-params(15)));
g1_v(2)=(-1);
g1_v(3)=(-params(46));
g1_v(4)=(-params(40));
g1_v(5)=(-(1-params(38)));
g1_v(6)=(-(params(15)/(1-params(1)/params(2))*(-(params(1)/params(2)))));
g1_v(7)=params(39);
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=params(6)*params(7);
g1_v(12)=(-(1+params(14)));
g1_v(13)=params(6)*(1-params(7));
g1_v(14)=(-((1-params(7))*params(14)));
g1_v(15)=(-1);
g1_v(16)=1;
g1_v(17)=(-(1-params(7)));
g1_v(18)=1;
g1_v(19)=(-(1-params(46)));
g1_v(20)=1;
g1_v(21)=(-params(24));
g1_v(22)=1;
g1_v(23)=(-(params(15)/(1-params(1)/params(2))));
g1_v(24)=(-params(23));
g1_v(25)=(-params(41));
g1_v(26)=1;
g1_v(27)=(-((1-params(16))/params(16)));
g1_v(28)=1;
g1_v(29)=(-(params(25)*(1-params(16))/params(16)));
g1_v(30)=(-params(7));
g1_v(31)=(-(1-params(40)));
g1_v(32)=(-params(38));
g1_v(33)=(-(1-params(42)));
g1_v(34)=(-params(42));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 27);
end
end
