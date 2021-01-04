function [S_00] = stiffness_matrix00(A)
%Partition of the element stiffness Matrix A 

S_00 = A(1:2,1:2);
end