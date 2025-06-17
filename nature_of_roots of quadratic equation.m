function nature_of_roots(a,b,c)
      D = b^2-4*a*c;
      if a ~=0
         if D>0
            disp("Roots are real and distinct");
         elseif D == 0
            disp("Roots are real and equal");
         else
            disp("Roots are imaginary");
         end
      else
          disp("Please enter value of a other than 0 as equation is no longer quadratic")
      end
end
a = input("Enter value of a:->");
b = input("Enter value of b:->");
c = input("Enter value of c:->");
fprintf('Quadratic equation:-> (%d) x^2 + (%d) x + (%d)\n\n',a,b,c);
nature_of_roots(a,b,c);
