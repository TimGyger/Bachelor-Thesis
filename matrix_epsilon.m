function [M_epsilon] = matrix_epsilon(p,epsilon,x1,x2)
%Computation of the local matrix M_epsilon
    %p         degree of local polynomial (integer)
    %epsilon   diffusivity (real number between 0 and 1)
    %x1        left bound of the element (real number)
    %x2        right bound of the element (real number)

%Initialize
M_epsilon = eye(p+1);
    %Element-width
h = x2-x1;

%Computation of the local matrix M_epsilon
M_epsilon(1,1) = 0.5;
M_epsilon(1,2) = -0.5;
M_epsilon(2,1) = -0.5;
M_epsilon(2,2) = 0.5;

M_epsilon = M_epsilon*epsilon*(2/h);

end