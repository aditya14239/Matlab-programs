 N = input('Enter the number of terms upto you want to plot Fibonacci series :-> ');
 F = zeros(1,N);
 for n = 2:N
     a = ((1+sqrt(5))^n + (sqrt(5)-1)^n)/(2^n*sqrt(5)) ;
     b = ((1+sqrt(5))^(n-2) + (sqrt(5)-1)^(n-2))/(2^(n-2)*sqrt(5)) ;
     F(n) = sqrt(a*b); 
 end
 X(1)= 0;
 X(2)= 1;
 for n = 3:N
     X(n) = X(n-1) + X(n-2);
 end

 fprintf('The Actual Fibonacci series :->\n')
 disp(X)
 fprintf('\nThe Fibonacci series using equations :->\n')
 disp(F)
 
 % Comparing the results using plots
 figure(1);
 plot(F,'-k');
 hold on 
 plot(X,'ok');
 title('Fibonacci Series') ;
 legend('Fibonacci series using equations','Actual Fibonacci series') ;

 % Relative Error 
 a = zeros(1,N) ;
 for n = 2:N
     a(n) = abs(X(n)-F(n))/((X(n))*(N-1)) ;
 end
 d = sum(a) ;
 fprintf('The Relative error is :-> %d',d)
 