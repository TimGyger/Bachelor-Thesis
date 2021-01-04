function [C_EM] = condensed_element_matrix(SM00,SM10,SM01,SM11)
%Computation of the condensed element matrix
C_EM = SM00 - SM10*inv(SM11)*SM01;
end