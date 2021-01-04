function [S_11] = stiffness_matrix11(A)
%Partition of the element stiffness Matrix A

S_11 = A(3:end,3:end);
end