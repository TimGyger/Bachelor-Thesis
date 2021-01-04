function L2E = L2_error(p,epsilon,k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

bound = 1-k*p*epsilon;
pol = [p;p];
comp_sol = sol(@(x)1,@(x)1,@(x)1,epsilon,pol,[-1;bound;1]);
exact_sol = exact_solution(epsilon);

pieces = children(comp_sol);
piece_1 = pieces(2);
piece_2 = pieces(3);
diff1 = abs(piece_1-exact_sol);
square1 = diff1*diff1;
f1 = matlabFunction(square1);
diff2 = abs(piece_2-exact_sol);
square2 = diff2*diff2;
f2 = matlabFunction(square2);

L2E = sqrt(integral(f2,bound,1)+integral(f1,-1,bound));

end

