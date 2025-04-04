function [y, T, residual, g1] = static_11(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(12, 1);
  residual(1)=(y(20))-(params(38)*y(20)+(1-params(38))*y(20)-params(39)*(y(21)-y(33)));
  residual(2)=(y(22))-(y(34)+params(40)*y(22)+(1-params(40))*y(22)+params(41)*y(23));
  residual(3)=(y(23))-(params(42)*y(24)-(y(21)-y(33))+(1-params(42))*y(23));
  residual(4)=(y(32))-(y(35)+params(23)*y(20)+params(24)*y(22)+params(25)*y(25));
  residual(5)=(y(32))-(params(6)*(y(36)+params(7)*y(26)+(1-params(7))*y(27)));
  residual(6)=(0)-((1-params(7))*y(28)+params(7)*y(24)-y(36));
  residual(7)=(y(28))-(y(38)+y(29)+params(14)*y(27));
  residual(8)=(y(29))-((1-params(15))*y(29)+params(15)/(1-params(1)/params(2))*(y(20)-params(1)/params(2)*y(20)));
  residual(9)=(y(31))-(y(34)*params(47)+params(46)*y(31)+(1-params(46))*y(22));
  residual(10)=(y(26))-(y(25)+y(31));
  residual(11)=(y(25))-((1-params(16))/params(16)*y(24));
  residual(12)=(y(26))-(y(27)+y(28)-y(24));
if nargout > 3
    g1_v = NaN(30, 1);
g1_v(1)=params(39);
g1_v(2)=1;
g1_v(3)=(-params(41));
g1_v(4)=1-(1-params(42));
g1_v(5)=(-params(42));
g1_v(6)=(-params(7));
g1_v(7)=(-((1-params(16))/params(16)));
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=(-(params(6)*(1-params(7))));
g1_v(12)=(-params(14));
g1_v(13)=(-1);
g1_v(14)=(-(1-params(7)));
g1_v(15)=1;
g1_v(16)=(-1);
g1_v(17)=(-1);
g1_v(18)=1-(1-params(15));
g1_v(19)=(-params(23));
g1_v(20)=(-params(15));
g1_v(21)=(-params(24));
g1_v(22)=(-(1-params(46)));
g1_v(23)=1-params(46);
g1_v(24)=(-1);
g1_v(25)=(-params(25));
g1_v(26)=(-1);
g1_v(27)=1;
g1_v(28)=(-(params(6)*params(7)));
g1_v(29)=1;
g1_v(30)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 12);
end
end
