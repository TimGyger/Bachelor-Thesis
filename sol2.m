function solution2 = sol2(a)

h1 = 0.7+1;
h2 = 1-0.7;
    %Element-mid-point
m1 = (-1+0.7)/2;
m2 = (0.7+1)/2;
    %inverse element mapping
f_inv1 = @(x) (x - m1)*2/h1;
f_inv2 = @(x) (x - m2)*2/h2;
b = length(a)/2;
s0 = shape_funct(0);
s1 = shape_funct(1);
syms x;
solution2 = piecewise(x<-1,0,-1<x<0.7,s0(f_inv1(x))*a(1),0.7<x<1,0);
for i = 3:b
    s_i = shape_funct(i-1);
    syms x;
    solution2 = solution2 + piecewise(x<-1,0,-1<x<0.7,s_i(f_inv1(x))*a(i),0.7<x<1,0);
end
syms x;
solution2 = solution2 + piecewise(x<-1,0,-1<x<0.7,0,0.7<x<1,s1(f_inv2(x))*a(b+2));
for i = 3:b
    s_i = shape_funct(i-1);
    syms x;
    solution2 = solution2 + piecewise(x<-1,0,-1<x<0.7,0,0.7<x<1,s_i(f_inv2(x))*a(i+b));
end
end

