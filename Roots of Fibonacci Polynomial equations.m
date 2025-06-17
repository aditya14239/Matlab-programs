fprintf('The Roots of Fibonacci Polynomial equations F(3) = 0 and F(4) = 0 \n\n');
syms x;
f = cell(1,5);
f{1} = 0;
f{2} = 1;
f{3} = x;
for i = 3 : 5
   f{i} = x*f{i-1} + f{i-2};
   if i == 4 || i == 5
      roots = solve(f{i},x);
      fprintf('Roots of Fibonacci polynomial F(%i) = %s are :->\n\n',i-1,f{i});
      disp(roots)
   end
end
