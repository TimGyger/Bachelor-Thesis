function [external_DoF] = external_degree_of_freedom(f,a,b,epsilon,p,m)
%Solution of the linear equation Ax=l where x = external_DoF
    %f         external source term (function handle)
    %a         velocity of the transporting medium (function handle)
    %b         losses/sources of the substance (function handle)
    %epsilon   diffusivity (real number between 0 and 1)
    %p         vector containing the degrees of each local polynomia (vector of integer)
    %m         matrix which represents the bounds of each element (matrix of integers) 
    
%Initialization
[A,l] = global_condensed_stiffness_matrix_and_load_vector(f,a,b,epsilon,p,m);
A = sparse(A);
%Computaion
external_DoF = A\l;

end