function f = exact_solution(epsilon)

a1 = 1/(2*epsilon)*(1+sqrt(1+4*epsilon));
a2 = 1/(2*epsilon)*(1-sqrt(1+4*epsilon));
c1 = exp(-a1)*(exp(-2*a2)-1)/(exp(-2*a1)-exp(-2*a2));
c2 = exp(-a2)*(-exp(-2*a1)+1)/(exp(-2*a1)-exp(-2*a2));

f = @(x) c1*exp(a1*x)+c2*exp(a2*x)+1;

end