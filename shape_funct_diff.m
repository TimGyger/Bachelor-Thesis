function shape_function_diff = shape_funct_diff(i)
%Computation of the derivative of the i-th shape function shape_function_diff

syms x;
f = shape_funct(i);
shape_function_diff = matlabFunction(diff(f(x)));

end
