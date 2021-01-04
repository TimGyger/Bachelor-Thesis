function [F_0] = matrix_F0(p,a,epsilon,x2)

%Initialization
F_0 = zeros(p+1);
    %Element-width
h = x2+1;
    %Element-mid-point
m = (-1+x2)/2;
    %inverse element mapping
f_inv = @(x) (x - m)*2/h;

    
for i = 1:p+1
    for j = 1:p+1
        s1 = shape_funct(i-1);
        s2 = shape_funct(j-1);
        s3 = shape_funct_diff(i-1);
        s4 = shape_funct_diff(j-1);
        s_11 = s1(f_inv(-1));
        s_21 = s2(f_inv(-1));
        if i <= 2
            s_31 = s3();
        else
            s_31 = s3(f_inv(-1));
        end
        if j <= 2
            s_41 = s4();
        else
            s_41 = s4(f_inv(-1));
        end 
        F_0(i,j) = a(-1)*(-1)*s_11*s_21 - epsilon*(s_31*s_21-s_11*s_41);
    end
end 

F_0 = round(F_0,10);
end
