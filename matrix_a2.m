function [M_a2] = matrix_a2(p,epsilon,x2,x3)

%Initialization
M_a2 = zeros(p+1);
    %Element-widths
h = x3-x2;
    %Element-mid-points
m = (x2+x3)/2;
    %inverse element mappings
f_inv = @(x) (x - m)*2/h;


if x2 == -1
    M_a2 = zeros(p+1);
else    
for i = 1:p+1
    for j = 1:p+1
        s1 = shape_funct(i-1);
        s2 = shape_funct(j-1);
        s3 = shape_funct_diff(i-1);
        s4 = shape_funct_diff(j-1);
        s_1 = s1(f_inv(x2)); 
        s_2 = s2(f_inv(x2));
        if i <= 2
            s_3 = s3();
        else
            s_3 = s3(f_inv(x2));
        end
        if j <= 2
            s_4 = s4();
        else
            s_4 = s4(f_inv(x2));
        end 
        M_a2(i,j) = 0.5*epsilon*(s_3*s_2-s_1*s_4);
    end
end 
end
M_a2 = round(M_a2,10);
end