function [global_stiffness_m] = global_stiffness_matrix(a,b,epsilon,p,m)
%Computation of the global stiffness matrix global_stiffness_m
    %a         velocity of the transporting medium
    %b         losses/sources of the substance
    %epsilon   diffusivity
    %p         vector containing the degrees of each local polynomial
    %m         matrix which represents the bounds of each element 
    
%Initialization
global_stiffness_m = zeros(sum(p)+1);

%Computation of the global stiffness matrix
global_stiffness_m(1:(p(1)+1),1:(p(1)+1)) = stiffness_matrix(p(1),a,b,epsilon,m(1,1),m(1,2));

a1 = p(1) + 1;

for i = 2:(length(p))
    a2 = a1 + p(i);
    global_stiffness_m(a1:a2,a1:a2) = global_stiffness_m(a1:a2,a1:a2) + stiffness_matrix(p(i),a,b,epsilon,m(i,1),m(i,2));
    a1 = a2; 
end

b1 = 1;
b2 = p(1) + 2;
for i = 1:(length(p)-1)
    b3 = b2 + p(i+1);
    b4 = b1 + p(i);
    global_stiffness_m(b2:b3,b1:b4) = matrix_a2(p(i),p(i+1),a,m(i,1),m(i,2),m(i+1,2));
    b1 = b4 + 1;
    b2 = b3 + 1;
end    
end