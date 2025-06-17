function  [r1,r2] = roots(a,b,c)
      if a~=0
            D = b^2 - 4*a*c;
            if (D>0) || (D==0)   % Roots are real
                r1 = (-b+sqrt(D))/(2*a);
                r2 = (-b-sqrt(D))/(2*a);
                fprintf('Roots are :->%d and %d \n\n',r1,r2);
            else                 % Roots are imaginary
                r1 = (-b + 1i*sqrt(-D))/(2*a);
                r2 = (-b - 1i*sqrt(-D))/(2*a);
                fprintf('First Root is :-> %f + i (%f) \n\n',real(r1), imag(r1));
                fprintf('Second Root is :-> %f + i (%f) \n\n',real(r2),imag(r2));
            end
      else
            disp("Please enter value of a other than 0 as equation is no longer quadratic \n\n");
      end
end
a = input("Enter value of a:->");
b = input("Enter value of b:->");
c = input("Enter value of c:->");
fprintf('Quadratic equation:-> (%d) x^2 + (%d) x + (%d)\n\n',a,b,c);
 function [e1,e2] = error_roots(u,v,m,n,t)    % Error_function
      X = [u , v];
      if  isreal(X) == true   % checking whether roots are real or not
          p = round(u,5);
          q = round(v,5);
          e1 = m*p^2 + n*p + t;
          e2 = m*q^2 + n*q + t;
          fprintf('Errors in finding roots of quadratic equation are :-> %d and %d \n\n',abs(e1), abs(e2));
      else
          disp("For errors, roots should be real")
      end
end
[x,y] = roots(a,b,c);
[error_1,error_2] = error_roots(x,y,a,b,c);