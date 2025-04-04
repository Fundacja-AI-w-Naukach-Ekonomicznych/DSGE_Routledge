function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(87)=params(49)*y(33)+x(1);
  y(88)=params(50)*y(34)+x(2);
  y(89)=params(51)*y(35)+x(3)+params(53)*x(4);
  y(90)=x(4)+params(52)*y(36);
  y(94)=params(59)*y(40)+x(8);
  y(92)=params(56)*y(38)+x(6);
  y(107)=x(5);
  y(108)=x(7);
  y(91)=params(54)*y(37)+x(5)-params(55)*y(53);
  y(93)=params(57)*y(39)+x(7)-params(58)*y(54);
end
