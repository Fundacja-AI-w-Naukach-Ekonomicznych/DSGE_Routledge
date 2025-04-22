function [y, T] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(117)=y(83)+params(30);
  y(118)=y(84)+params(30);
  y(119)=y(64)*4;
  y(116)=y(82)+params(30);
  y(114)=4*params(31)+y(64)*4;
  y(121)=y(3);
  y(122)=y(59);
  y(115)=params(36)*y(117)+params(37)*y(118)+(1-params(36)-params(37))*y(116);
  y(120)=y(65)+y(3)+y(59)+y(60);
  y(113)=y(76)+params(32);
  y(112)=y(77)+params(33)-y(15);
end
