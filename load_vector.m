function [load_v] = load_vector(p,f,x1,x2)
%%% Computation of the local load vector l^k


%% Input:

% p         degree of local polynomial (integer)
% f         external source term (function handle)
% x1        left bound of the element (real number)
% x2        right bound of the element (real number)


%% Initialization:

load_v = zeros(p+1,1);
% Element-width
h = x2-x1;
% Element-mid-point
m = (x1+x2)/2;
% Element mapping
g = @(x) m + h*x/2;

% f through g (Substitution) to work on reference element
syms x;
G = f(g(x));
G = @(x) G; 

%% Computation of the element load vector:

for i = 1:p+1
        u1 = shape_funct(i-1);
        F = G(x)*u1(x);    
        F = matlabFunction(F);
        load_v(i) = integral(F,-1,1);
end

load_v = load_v*(h/2);

end