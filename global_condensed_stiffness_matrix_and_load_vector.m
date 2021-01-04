function [G_C_SM,G_C_LV] = global_condensed_stiffness_matrix_and_load_vector(f,a,b,epsilon,p,m)
%Computation of the global stiffness matrix global_stiffness_m
    %a         velocity of the transporting medium
    %b         losses/sources of the substance
    %epsilon   diffusivity
    %p         vector containing the degrees of each local polynomial
    %m         matrix which represents the bounds of each element 
    
%Initialization
MA = zeros(length(p)+1);
MV = zeros(length(p)+1,1);
%Computation of the global stiffness matrix
A = stiffness_matrix(p(1),a,b,epsilon,m(1,1),m(1,2));
lv = load_vector(p(1),f,m(1,1),m(1,2));
MA(1:2,1:2) = condensed_element_matrix(stiffness_matrix00(A),stiffness_matrix10(A),stiffness_matrix01(A),stiffness_matrix11(A));
MV(1:2) = condensed_element_load_vector(load_vector0(lv),stiffness_matrix10(A),stiffness_matrix11(A),load_vector1(lv));                  
a1 = 2;

for i = 2:(length(p)-1)
    B = stiffness_matrix(p(i),a,b,epsilon,m(i,1),m(i,2));
    lv2 = load_vector(p(i),f,m(i,1),m(i,2));
    a2 = a1 + 1;
    MA(a1:a2,a1:a2) = MA(a1:a2,a1:a2) + condensed_element_matrix(stiffness_matrix00(B),stiffness_matrix10(B),stiffness_matrix01(B),stiffness_matrix11(B));
    MV(a1:a2) = MV(a1:a2) + condensed_element_load_vector(load_vector0(lv2),stiffness_matrix10(B),stiffness_matrix11(B),load_vector1(lv2));
    a1 = a2;     
end
    B = matrix_epsilon(p(end),epsilon,m(end,1),m(end,2)) + matrix_a(p(end),a,m(end,1),m(end,2)) + matrix_b(p(end),b,m(end,1),m(end,2));
    lv2 = load_vector(p(end),f,m(end,1),m(end,2));
    MA(end-1:end,end-1:end) = MA(end-1:end,end-1:end) + condensed_element_matrix(stiffness_matrix00(B),stiffness_matrix10(B),stiffness_matrix01(B),stiffness_matrix11(B));
    MV(end-1:end) = MV(end-1:end) + condensed_element_load_vector(load_vector0(lv2),stiffness_matrix10(B),stiffness_matrix11(B),load_vector1(lv2)); 
G_C_SM = MA(2:end-1,2:end-1);
G_C_LV = MV(2:end-1);
end