function ratio = fibonacci_series(n)
 
  X(11) = 55 ; % Given 11th term

  golden_ratio = 1.618 ;

  X(12) = round(X(11) * golden_ratio) ; % 12th term using golden ratio

  % Next terms from the 12th term

  for t = 13:n
      X(t) = X(t-1) + X(t-2) ;
  end

  % Previous terms from the 11th term

  for t = 10:-1:1
      X(t) = X(t+2)- X(t+1) ;
  end

  % The Nth term of Fibonacci series

  a = X(n) ;
  fprintf('The %dth term of Fibonacci series is:-> %d', n, a) ;
 
  % The golden ratio variation

  ratio = zeros(1, n-1) ;
  for t = 1:(n-1)
      ratio(t) = X(t+1) / X(t) ;
  end

end

N = input("Enter the term upto you want fibonacci series:->") ;

% Plotting the golden ratio variation
 figure ;
 ratio = fibonacci_series(N) ;

 file = fopen('Golden_ratio.txt','w');
 for i = 1:(N-1)
     fprintf(file,'%f\n',ratio(i));
 end
 fclose(file);
 
 plot(2:N, ratio, '-ok') ;
 xlabel('Term number') ;
 ylabel('Golden ratio') ;
 title('Variation of the golden ratio up to the 20th term') ;
 grid on ;