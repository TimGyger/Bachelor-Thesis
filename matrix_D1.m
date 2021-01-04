function [D_1] = matrix_D1(p,epsilon,x2)

%Initialization
D_1 = zeros(p+1);
    %Element-width
h1 = x2+1;
h2 = 1-x2;
    %Element-mid-point
m1 = (-1+x2)/2;
m2 = (x2+1)/2;
    %inverse element mapping
f_inv1 = @(x) (x - m1)*2/h1;
f_inv2 = @(x) (x - m2)*2/h2;
    
for i = 1:p+1
    for j = 1:p+1
        s1 = shape_funct(i-1);
        s2 = shape_funct(j-1);
        s3 = shape_funct_diff(i-1);
        s4 = shape_funct_diff(j-1);
        s_11 = s1(f_inv1(x2));
        s_22 = s2(f_inv2(x2));
        if i <= 2
            s_31 = s3();
          
        else
            s_31 = s3(f_inv1(x2));
            
        end
        if j <= 2
            
            s_42 = s4();
        else
            s_42 = s4(f_inv2(x2));
        end 
        D_1(i,j) = 0.5*epsilon*(s_31*s_22+s_11*s_42);
    end
end 

D_1 = round(D_1,10);
end
