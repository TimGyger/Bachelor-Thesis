function [S_01] = stiffness_matrix01(A)
%Partition of the element stiffness Matrix A

S_01 = A(3:end,1:2);
end