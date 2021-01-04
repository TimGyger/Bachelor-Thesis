function [M_b] = matrix_b(p,b,x1,x2)
%Computation of the local matrix M_b
    %p         degree of local polynomial (integer)
    %b         losses/sources of the substance (function handle)
    %x1        left bound of the element (real number)
    %x2        right bound of the element (real number)
    
%Initialization
M_b = zeros(p+1);
    %Element-width
h = x2-x1;
    %Element-mid-point
m = (x1+x2)/2;
    %Element mapping
f = @(x) m + h*x/2;

%b throug f (Substitution) to work on reference element
syms x;
B1 = b(f(x));
B = @(x) B1;

%Computation of the local matrix M_b
for i = 1:p+1
    for j = 1:p+1
        s1 = shape_funct(i-1);
        s2 = shape_funct(j-1);
        F1 = B(x)*s1(x)*s2(x);
        F = matlabFunction(F1);
        M_b(i,j) = integral(F,-1,1);
    end
end 


M_b = M_b*(h/2);
end