function [M_stiffness2] = stiffness_matrix2(p,a,b,epsilon,x2)
%Computation of the local stiffness matrix M_stiffness
    %p         degree of local polynomial (integer)
    %a         velocity of the transporting medium (function handle)
    %b         losses/sources of the substance (function handle)
    %epsilon   diffusivity (real number between 0 and 1)
    %x1        left bound of the element (real number)
    %x2        right bound of the element (real number)

%Summation of each terms of the element stiffness matrix 
M_stiffness2 = zeros(2*p+2);
M_stiffness2(1:p+1,1:p+1) = matrix_epsilon(p,epsilon,-1,x2) + matrix_a(p,a,-1,x2) + matrix_b(p,b,-1,x2)+matrix_F0(p,a,epsilon,x2)+matrix_C1(p,epsilon,x2);
M_stiffness2(1:p+1,p+2:end) = matrix_D1(p,epsilon,x2);
M_stiffness2(p+2:end,1:p+1) = matrix_E1(p,a,epsilon,x2);
M_stiffness2(p+2:end,p+2:end) = matrix_epsilon(p,epsilon,x2,1) + matrix_a(p,a,x2,1) + matrix_b(p,b,x2,1)+matrix_FN(p,epsilon,x2)+matrix_B1(p,a,epsilon,x2);
end