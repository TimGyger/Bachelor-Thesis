function [coeff] = coefficients(f,a,b,epsilon,p,x_m)
%Coefficients of solution of the model problem (1.1)
    %f         external source term
    %a         velocity of the transporting medium
    %b         losses/sources of the substance
    %epsilon   diffusivity
    %p         vector containing the degrees of each local polynomial
    %x_m       mesh of the domain
    
%Initialization
    %m         matrix which represents the bounds of each element
m = zeros(length(x_m)-1,2);
for i = 1:length(x_m)-1
    m(i,1) = x_m(i);
    m(i,2) = x_m(i+1);
end

%Computation by multiplying the coefficients in a with the shape functions 
coeff = solve_linear_equation(f,a,b,epsilon,p,m);
end

