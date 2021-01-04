function shape_function = shape_funct(i)
%Computation of the i-th shape function shape_function

if i == 0
    shape_function = @(x) 1/2*(1+x);

    elseif i == 1
        shape_function = @(x) 1/2*(1-x);

    else
        syms x;
        LegP1 =  legendreP(i,x);
        LegP2 =  legendreP(i-2,x);
        shape_function = 1/(sqrt(2*(2*i-1)))*(LegP1-LegP2);
        shape_function = matlabFunction(shape_function);
end
    
end    