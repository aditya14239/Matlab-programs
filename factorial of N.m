N = input('Enter a non negative integer');
function m = factorial(n)
    y=1;
      for i = n:-1:1
          y = n*factorial(n-1);
      end
      m=y;
end
k = factorial(N);
disp(k)