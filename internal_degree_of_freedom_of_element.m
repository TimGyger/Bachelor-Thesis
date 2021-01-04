function [internal_DoF] = internal_degree_of_freedom_of_element(f,a,b,epsilon,p,m,u,i)
%Computation of internal degrees of freedom
    %f         external source term (function handle)
    %a         velocity of the transporting medium (function handle)
    %b         losses/sources of the substance (function handle)
    %epsilon   diffusivity (real number between 0 and 1)
    %p         vector containing the degrees of each local polynomia (vector of integer)
    %m         matrix which represents the bounds of each element (matrix of integers)
    %u         external degrees of freedom (vector of real numbers)
    %i         i-th element (integer)

%Computation of stiffness matrix    
C = stiffness_matrix(p(i),a,b,epsilon,m(i,1),m(i,2)); 

%Computation of load vector  
lv = load_vector(p(i),f,m(i,1),m(i,2));

u = [0;u;0];
%Computation of internal degrees of freedom  
internal_DoF = inv(stiffness_matrix11(C))*(load_vector1(lv)-stiffness_matrix01(C)*u(i:i+1));
end