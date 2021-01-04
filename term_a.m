function [term_a] = term_a(p1,p2,a,x1,x2)

%Initialization
term_a = zeros(p1+1);
h = x2-x1;
m = (x1+x2)/2;
%Element mapping
f = @(x) m + h*x/2;
syms x;
A1 = a(f(x));
A = @(x) A1;

for i = 1:p1+1
    for j = 1:p2+1
        s1 = shape_funct(i-1);
        s2 = shape_funct(j-1);
        s 
        F1 = A(x2)*(s(x)-s1(x2))*s2(x2);    
        F = matlabFunction(F1);        
    end
end    
end