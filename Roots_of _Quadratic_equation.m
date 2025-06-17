function  [r1,r2] = roots(a,b,c)
      if a~=0
            D = b^2 - 4*a*c;
            if (D>0) || (D==0)     % Roots are real
                r1 = (-b+sqrt(D))/(2*a);
                r2 = (-b-sqrt(D))/(2*a);
                fprintf('Roots are :->%d and %d ',r1,r2);
                %plot
                x = linspace(-20,20);
                f = a*x.^2+b*x+ c;
                plot(x,f,'-k');
                hold on;
                plot(r1,0,'ok');
                hold on;
                plot(r2,0,'ok');
                title('Quadratic equation with its roots');
                xlabel('x :->');
                ylabel('f(x) :->');
                grid on;
            else                   % Roots are imaginary
                r1 = -b/(2*a);
                r2 = sqrt(-D)/(2*a);
                fprintf('First Root is :-> %d + i %d \n\n',r1,r2);
                fprintf('Second Root is :-> %d - i %d \n\n',r1,r2);
            end
      else
            disp("Please enter value of a other than 0 as equation is no longer quadratic \n");
      end
end
a = input("Enter value of a:->");
b = input("Enter value of b:->");
c = input("Enter value of c:->");
fprintf('Quadratic equation:-> (%d) x^2 + (%d) x + (%d)\n\n',a,b,c);
[x,y] = roots(a,b,c);
