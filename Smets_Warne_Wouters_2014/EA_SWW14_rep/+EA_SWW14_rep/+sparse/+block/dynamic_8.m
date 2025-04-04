function [y, T, residual, g1] = dynamic_8(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(y(84)-y(30))-(params(3)*(y(138)-y(84))+params(48)*(y(81)-y(84)));
if nargout > 3
    g1_v = NaN(3, 1);
g1_v(1)=(-1);
g1_v(2)=1-((-params(3))-params(48));
g1_v(3)=(-params(3));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 3);
end
end
