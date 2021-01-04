function sol = solution(f,a,b,epsilon,p,x_m)
%Solution of the model problem (1.1)
    %f         external source term
    %a         velocity of the transporting medium
    %b         losses/sources of the substance
    %epsilon   diffusivity
    %p         vector containing the degrees of each local polynomial
    %x_m       mesh of the domain
    
%Computation of the coefficients 
coeff = coefficients(f,a,b,epsilon,p,x_m);

sol1 = @(x) 0;
for i = 2:p(1)+1
    s1 = shape_funct(i-1);
    m = 0.5*(x_m(1) + x_m(2));
    h = x_m(2) - x_m(1);
    f1 = @(x) (x - m)*2/h;
    syms x;
    sol1 = sol1 + piecewise(x < x_m(1) ,0,x_m(1) < x < x_m(2),coeff(i)*s1(f1(x)),x > x_m(2),0);
end

sol2 = @(x) 0;
help_index = p(1)+1;
for i = 2:length(p)-1
    help_index = help_index-1;
    for j = 1:p(i)+1
        s2 = shape_funct(j-1);
        m = 0.5*(x_m(i) + x_m(i+1));
        h = x_m(i+1) - x_m(i);
        f2 = @(x) (x - m)*2/h;
        syms x;
        sol2 = sol2 + piecewise(x_m(i) > x,0,x_m(i) < x < x_m(i+1),coeff(help_index)*s2(f2(x)),x > x_m(i+1),0);
        help_index = help_index + 1;
    end
end  

s3_1 = shape_funct(0);
m = 0.5*(x_m(end-1) + x_m(end));
h = x_m(end) - x_m(end-1);
f3 = @(x) (x - m)*2/h;
sol3 = @(x) piecewise(x_m(end-1) > x,0,x_m(end-1) < x < x_m(end),coeff(help_index-1)*s3_1(f3(x)),x > x_m(end),0);
for i = 3:p(end)+1
    s3 = shape_funct(i-1);
    syms x;
    sol3 = sol3 + piecewise(x_m(end-1) > x,0,x_m(end-1) < x < x_m(end),coeff(help_index)*s3(f3(x)),x > x_m(end),0);
    help_index = help_index + 1;
end
sol = sol1 + sol2 + sol3;
end
