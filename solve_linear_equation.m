function [coefficients] = solve_linear_equation(f,a,b,epsilon,p,m)
%Solution of the linear equation Ax=l where x = coefficients
    %f         external source term
    %a         velocity of the transporting medium
    %b         losses/sources of the substance
    %epsilon   diffusivity
    %p         vector containing the degrees of each local polynomial
    %m         matrix which represents the bounds of each element 
    
%Initialization
A = global_stiffness_matrix(a,b,epsilon,p,m);
l = global_load_vector(f,p,m);
A = sparse(A);
%Computaion
coefficients = A\l;

end
