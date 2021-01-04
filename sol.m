function solution = sol(f,a,b,epsilon,p,x_m)
%Solution of the model problem (1.1)
    %f         external source term (function handle)
    %a         velocity of the transporting medium (function handle)
    %b         losses/sources of the substance (function handle)
    %epsilon   diffusivity (real number between 0 and 1)
    %p         vector containing the degrees of each local polynomial (vector of integers)
    %x_m       mesh of the domain (vector of real numbers)
    
%Initialization
    %m         matrix which represents the bounds of each element
m = zeros(length(x_m)-1,2);
for i = 1:length(x_m)-1
    m(i,1) = x_m(i);
    m(i,2) = x_m(i+1);
end    

%Computation of the external degrees of freedom 
ext_DoF = external_degree_of_freedom(f,a,b,epsilon,p,m);

%Computation of the internal degrees of freedom of first element
int_DoF1 = internal_degree_of_freedom_of_element(f,a,b,epsilon,p,m,ext_DoF,1);

%Element-mid-point
m1 = 0.5*(x_m(1) + x_m(2));
%Element-width
h = x_m(2) - x_m(1);
%Inverse-mapping
f1 = @(x) (x - m1)*2/h;

%Initialization
sol1 = @(x) 0;

%External shape-functions
s0 = shape_funct(0);
s1 = shape_funct(1);


syms x;
sol1 = sol1 + piecewise(x < x_m(1) ,0,x_m(1) < x < x_m(2),ext_DoF(1)*s0(f1(x)),x > x_m(2),0);
for i = 2:p(1)
    s2 = shape_funct(i);
    syms x;
    sol1 = sol1 + piecewise(x < x_m(1) ,0,x_m(1) < x < x_m(2),int_DoF1(i-1)*s2(f1(x)),x > x_m(2),0);
end

%Initialization
sol2 = @(x) 0;
for i = 2:length(p)-1
    
    %Element-mid-point
    m1 = 0.5*(x_m(i) + x_m(i+1));
    %Element-width
    h = x_m(i+1) - x_m(i);
    %Inverse-mapping
    f2 = @(x) (x - m1)*2/h;
    
    %Computation of the internal degrees of freedom of i-th element
    int_DoF2 = internal_degree_of_freedom_of_element(f,a,b,epsilon,p,m,ext_DoF,i);
    syms x;
    sol2 = sol2 + piecewise(x < x_m(i) ,0,x_m(i) < x < x_m(i+1),ext_DoF(i-1)*s1(f2(x)),x > x_m(i+1),0) + piecewise(x < x_m(i) ,0,x_m(i) < x < x_m(i+1),ext_DoF(i)*s0(f2(x)),x > x_m(i+1),0);
    for j = 2:p(i)
        s2 = shape_funct(j);
        syms x;
        sol2 = sol2 + piecewise(x_m(i) > x,0,x_m(i) < x < x_m(i+1),int_DoF2(j-1)*s2(f2(x)),x > x_m(i+1),0);
    end
end  
%Computation of the internal degrees of freedom of last element
int_DoF3 = internal_degree_of_freedom_of_element(f,a,b,epsilon,p,m,ext_DoF,length(p));

%Element-mid-point
m1 = 0.5*(x_m(end-1) + x_m(end));
%Element-width
h = x_m(end) - x_m(end-1);
%Inverse-mapping
f3 = @(x) (x - m1)*2/h;

%Initialization
sol3 = @(x) 0;
syms x;
sol3 = sol3 + piecewise(x < x_m(end-1) ,0,x_m(end-1) < x < x_m(end),ext_DoF(end)*s1(f3(x)),x > x_m(end),0);
for i = 2:p(end)
    s3 = shape_funct(i);
    syms x;
    sol3 = sol3 + piecewise(x < x_m(end-1) ,0,x_m(end-1) < x < x_m(end),int_DoF3(i-1)*s3(f3(x)),x > x_m(end),0);
end

solution = sol1 + sol2 + sol3;
end
