function [S_10] = stiffness_matrix10(A)
%Partition of the element stiffness Matrix A

S_10 = A(1:2,3:end);
end

