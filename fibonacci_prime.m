function m = fibonacci_prime(n)
    % first of all check whether the number a fibonacci number or not 
    a = (5*n^2+4)^(1/2);   
    b = (5*n^2-4)^(1/2);
    if (a == floor(a)) || (b == floor(b))
         k = prime_or_not(n);
         if k == 1
             m = 1;
         else
             m = 0;
         end        
    else
         m = 0;
    end
end
%function m = fibonacci_prime(n)
    % first of all check whether the number a fibonacci number or not 
%    a = (5*n^2+4)^(1/2);   
%    b = (5*n^2-4)^(1/2);
%    m = false;
%    if (a == floor(a)) || (b == floor(b))
%         k = prime_or_not(n);
%         if k == true
%             m = true
%         end        
%end