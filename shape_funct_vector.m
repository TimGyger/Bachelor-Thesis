function [SFV] = shape_funct_vector(p)
%Computation of the used shape functions shape_function
        %p      highest index of needed shap function (integer)

%Initialization
SFV = cell(p+1,1);

for i = 0:p
    s = shape_funct(i);
    SFV(i+1) = s;
end    

end    