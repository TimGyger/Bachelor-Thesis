function [C_ELV] = condensed_element_load_vector(LV0,SM10,SM11,LV1)
%Computation of the condensed element load vector
C_ELV = LV0 - SM10*inv(SM11)*LV1;
end