function [y, T, residual, g1] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  y(97)=params(6)*(y(101)+params(7)*y(91)+(1-params(7))*y(92));
  y(90)=(1-params(16))/params(16)*y(89);
  y(93)=y(103)+y(94)+params(14)*y(92);
  residual(1)=(y(85))-(params(40)*y(147)+(1-params(40))*y(23)-params(41)*(y(86)-y(98)));
  residual(2)=(y(91))-(y(90)+y(34));
  residual(3)=(y(91))-(y(92)+y(93)-y(89));
  residual(4)=(y(94))-((1-params(15))*y(32)+params(15)/(1-params(1)/params(2))*(y(85)-params(1)/params(2)*y(23)));
  residual(5)=(y(96))-(y(99)*params(49)+params(48)*y(34)+(1-params(48))*y(87));
  residual(6)=(y(87))-(y(99)+params(42)*y(25)+(1-params(42))*y(149)+params(43)*y(88));
  residual(7)=(y(97))-(y(100)+params(23)*y(85)+params(24)*y(87)+params(25)*y(90));
  residual(8)=(y(88))-(params(44)*y(151)-(y(86)-y(98))+(1-params(44))*y(150));
  residual(9)=(0)-((1-params(7))*y(93)+params(7)*y(89)-y(101));
if nargout > 3
    g1_v = NaN(34, 1);
g1_v(1)=(-(1-params(15)));
g1_v(2)=(-1);
g1_v(3)=(-params(48));
g1_v(4)=(-params(42));
g1_v(5)=(-(1-params(40)));
g1_v(6)=(-(params(15)/(1-params(1)/params(2))*(-(params(1)/params(2)))));
g1_v(7)=params(41);
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
g1_v(19)=(-(1-params(48)));
g1_v(20)=1;
g1_v(21)=(-params(24));
g1_v(22)=1;
g1_v(23)=(-(params(15)/(1-params(1)/params(2))));
g1_v(24)=(-params(23));
g1_v(25)=(-params(43));
g1_v(26)=1;
g1_v(27)=(-((1-params(16))/params(16)));
g1_v(28)=1;
g1_v(29)=(-(params(25)*(1-params(16))/params(16)));
g1_v(30)=(-params(7));
g1_v(31)=(-(1-params(42)));
g1_v(32)=(-params(40));
g1_v(33)=(-(1-params(44)));
g1_v(34)=(-params(44));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 27);
end
end
