function [y, T, residual, g1] = static_14(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(20, 1);
  residual(1)=(y(8))-(y(6)*(1-params(16))/params(16));
  residual(2)=(y(9))-(y(10)+y(12)-y(6));
  residual(3)=(y(2))-(y(2)*params(17)+(1-params(17))*(y(3)*params(18)+params(19)*y(19))-y(43));
  residual(4)=(0)-(params(50)*(y(10)-y(15)));
  residual(5)=(params(14)*y(14))-(y(12)-(y(13)+y(41)+params(14)*y(15)));
  residual(6)=(y(19))-(y(7)-y(35));
  residual(7)=(y(1))-(y(1)*params(40)+y(1)*(1-params(40))-params(41)*(y(2)-y(3)-y(36)));
  residual(8)=(y(4))-(y(4)*params(42)+y(4)*(1-params(42))+params(43)*y(5)+y(37));
  residual(9)=(y(5))-(params(44)*y(6)-(y(2)-y(3)-y(36))+y(5)*(1-params(44)));
  residual(10)=(y(9))-(y(8)+y(18));
  residual(11)=(y(7))-(y(1)*params(23)+y(4)*params(24)+params(25)*y(8)+y(38));
  residual(12)=(y(7))-(params(6)*(params(7)*y(9)+(1-params(7))*y(10)+y(39)));
  residual(13)=(y(3))-(params(36)*y(21)+params(37)*y(22)+(1-params(36)-params(37))*y(20));
  residual(14)=(y(3))-(y(3)*params(11)+params(3)*(y(3)-y(3)*params(11))-params(47)*(params(14)*y(14)-100*y(42)));
  residual(15)=(y(13))-(y(13)*(1-params(15))+params(15)/(1-params(1)/params(2))*(y(1)-y(1)*params(1)/params(2)));
  residual(16)=(y(18))-(y(18)*params(48)+y(4)*(1-params(48))+y(37)*params(49));
  residual(17)=(y(20)-y(20)*params(8))-((y(20)-y(20)*params(8))*params(45)-params(46)*(100*y(40)-y(11)));
  residual(18)=(y(22)-y(22)*params(8))-(params(45)*(y(22)-y(22)*params(8))-params(46)*(100*y(40)-y(11)+100*y(45)));
  residual(19)=(y(21)-y(21)*params(8))-(params(45)*(y(21)-y(21)*params(8))-params(46)*(100*y(40)-y(11)+100*y(44)));
  residual(20)=(y(11))-((1-params(7))*y(12)+y(6)*params(7)-y(39));
if nargout > 3
    g1_v = NaN(53, 1);
g1_v(1)=1;
g1_v(2)=(-1);
g1_v(3)=(-params(25));
g1_v(4)=(-1);
g1_v(5)=(-1);
g1_v(6)=(-(1-params(7)));
g1_v(7)=(-((1-params(17))*params(19)));
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-params(50));
g1_v(11)=(-(params(6)*(1-params(7))));
g1_v(12)=params(50);
g1_v(13)=params(14);
g1_v(14)=(-1);
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=1-params(17);
g1_v(18)=params(41);
g1_v(19)=1;
g1_v(20)=(-params(43));
g1_v(21)=1-(1-params(44));
g1_v(22)=(-((1-params(16))/params(16)));
g1_v(23)=1;
g1_v(24)=(-params(44));
g1_v(25)=(-params(7));
g1_v(26)=(-1);
g1_v(27)=1-params(48);
g1_v(28)=(-params(23));
g1_v(29)=(-params(15));
g1_v(30)=1;
g1_v(31)=1;
g1_v(32)=(-(params(6)*params(7)));
g1_v(33)=(-((1-params(17))*params(18)));
g1_v(34)=(-params(41));
g1_v(35)=(-1);
g1_v(36)=1;
g1_v(37)=1-(params(11)+params(3)*(1-params(11)));
g1_v(38)=params(14);
g1_v(39)=params(47)*params(14);
g1_v(40)=1;
g1_v(41)=1-(1-params(15));
g1_v(42)=(-params(24));
g1_v(43)=(-(1-params(48)));
g1_v(44)=(-(1-params(36)-params(37)));
g1_v(45)=1-params(8)-params(45)*(1-params(8));
g1_v(46)=(-params(37));
g1_v(47)=1-params(8)-params(45)*(1-params(8));
g1_v(48)=(-params(36));
g1_v(49)=1-params(8)-params(45)*(1-params(8));
g1_v(50)=(-params(46));
g1_v(51)=(-params(46));
g1_v(52)=(-params(46));
g1_v(53)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 20, 20);
end
end
