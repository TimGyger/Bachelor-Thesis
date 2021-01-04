function [M_stiffness] = stiffness_matrix(p,a,b,epsilon,x1,x2)
%Computation of the local stiffness matrix M_stiffness
    %p         degree of local polynomial (integer)
    %a         velocity of the transporting medium (function handle)
    %b         losses/sources of the substance (function handle)
    %epsilon   diffusivity (real number between 0 and 1)
    %x1        left bound of the element (real number)
    %x2        right bound of the element (real number)

%Summation of each terms of the element stiffness matrix 

M_stiffness = matrix_epsilon(p,epsilon,x1,x2) + matrix_a(p,a,x1,x2) + matrix_b(p,b,x1,x2);% + matrix_a1(p,a,epsilon,x1,x2,x3);

end