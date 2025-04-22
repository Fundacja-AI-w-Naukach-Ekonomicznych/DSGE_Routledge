function [y, T, residual, g1] = static_13(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(12, 1);
  residual(1)=(y(23))-(params(40)*y(23)+(1-params(40))*y(23)-params(41)*(y(24)-y(36)));
  residual(2)=(y(25))-(y(37)+params(42)*y(25)+(1-params(42))*y(25)+params(43)*y(26));
  residual(3)=(y(26))-(params(44)*y(27)-(y(24)-y(36))+(1-params(44))*y(26));
  residual(4)=(y(35))-(y(38)+params(23)*y(23)+params(24)*y(25)+params(25)*y(28));
  residual(5)=(y(35))-(params(6)*(y(39)+params(7)*y(29)+(1-params(7))*y(30)));
  residual(6)=(0)-((1-params(7))*y(31)+params(7)*y(27)-y(39));
  residual(7)=(y(31))-(y(41)+y(32)+params(14)*y(30));
  residual(8)=(y(32))-((1-params(15))*y(32)+params(15)/(1-params(1)/params(2))*(y(23)-params(1)/params(2)*y(23)));
  residual(9)=(y(34))-(y(37)*params(49)+params(48)*y(34)+(1-params(48))*y(25));
  residual(10)=(y(29))-(y(28)+y(34));
  residual(11)=(y(28))-((1-params(16))/params(16)*y(27));
  residual(12)=(y(29))-(y(30)+y(31)-y(27));
if nargout > 3
    g1_v = NaN(30, 1);
g1_v(1)=params(41);
g1_v(2)=1;
g1_v(3)=(-params(43));
g1_v(4)=1-(1-params(44));
g1_v(5)=(-params(44));
g1_v(6)=(-params(7));
g1_v(7)=(-((1-params(16))/params(16)));
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=1;
g1_v(11)=(-(params(6)*params(7)));
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-(1-params(7)));
g1_v(15)=1;
g1_v(16)=(-1);
g1_v(17)=(-1);
g1_v(18)=1-(1-params(15));
g1_v(19)=(-params(23));
g1_v(20)=(-params(15));
g1_v(21)=(-params(24));
g1_v(22)=(-(1-params(48)));
g1_v(23)=1-params(48);
g1_v(24)=(-1);
g1_v(25)=(-params(25));
g1_v(26)=(-1);
g1_v(27)=1;
g1_v(28)=(-(params(6)*(1-params(7))));
g1_v(29)=(-params(14));
g1_v(30)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 12, 12);
end
end
