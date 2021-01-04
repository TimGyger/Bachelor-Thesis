function [E_1] = matrix_E1(p,a,epsilon,x2)

%Initialization
E_1 = zeros(p+1);
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
        
        s_12 = s1(f_inv2(x2));
        s_21 = s2(f_inv1(x2));
        
        if i <= 2
            
            s_32 = s3();
        else
            
            s_32 = s3(f_inv2(x2));
        end
        if j <= 2
            s_41 = s4();
            
        else
            s_41 = s4(f_inv1(x2));
            
        end 
        E_1(i,j) = a(x2)*s_12*s_21 - 0.5*epsilon*(s_32*s_21+s_12*s_41);
    end
end 

E_1 = round(E_1,10);
end
