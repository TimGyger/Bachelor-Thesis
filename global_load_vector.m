function [global_load_v] = global_load_vector(f,p,m)
%Computation of the global load vector global_load_v
    %f         external source term
    %p         vector containing the degrees of each local polynomial
    %m         matrix which represents the bounds of each element 
    
%Initialization
global_load_v = zeros((sum(p)+1),1);

%Computation of the global load vector
global_load_v(1:(p(1)+1)) = load_vector(p(1),f,m(1,1),m(1,2));

a = p(1) + 1;

for i = 2:(length(p))    
    b = a + p(i);
    global_load_v(a:b) = load_vector(p(i),f,m(i,1),m(i,2));
    a = b;
end

end
