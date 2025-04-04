function [y, T] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(102)=4*params(31)+y(56)*4;
  y(103)=y(56)*4;
  y(105)=y(3);
  y(106)=y(51);
  y(98)=y(57)+params(30);
  y(104)=y(57)+y(3)+y(51)+y(52);
  y(101)=y(68)+params(32);
  y(100)=y(69)+params(33)-y(15);
end
