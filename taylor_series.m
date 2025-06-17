function y = taylor_series(x,n)
         ex = 1;
         for i = 1:n-1
             ex = ex + x^i/(factorial(i));
         end
         y = ex;
end