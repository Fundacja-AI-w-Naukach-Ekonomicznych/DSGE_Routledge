function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(101)=params(54)*y(39)+x(4);
  y(98)=params(51)*y(36)+x(1);
  y(100)=params(53)*y(38)+x(3)+x(4)*params(55);
  y(99)=params(52)*y(37)+x(2);
  y(105)=params(61)*y(43)+x(8);
  y(103)=params(58)*y(41)+x(6);
  y(123)=x(5);
  y(124)=x(7);
  y(102)=params(56)*y(40)+x(5)-params(57)*y(61);
  y(104)=params(59)*y(42)+x(7)-params(60)*y(62);
  y(106)=x(9)+x(5)+params(62)*y(44)-params(57)*y(61);
  y(107)=x(10)+x(5)+params(63)*y(45)-params(57)*y(61);
end
