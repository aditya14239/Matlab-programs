function m = factorial_prime(n)
    X = zeros(1,n) ;
    X(1) = 1;
    for i = 2:n
        X(i) = i*X(i-1);
    end
    b = prime_or_not(n);
    % checking factorial prime or not
    if b == 1
        m = 0 ;
        for i = 1:n
            if ((X(i)-1)==n) || ((X(i)+1)==n)
                  m = m+1 ;
            end  
        end 
    else 
        m = 0;
    end
end
% function m = factorial_prime(n)
%    X = zeros(1,n) ;
%    X(1) = 1;
%    for i = 2:n
%        X(i) = i*X(i-1);
%    end
%    b = prime_or_not(n);
%    m = false;
     % checking factorial prime or not
%    if b == true   (this is not string just write it)
%        for i = 1:n
%            if ((X(i)-1)==n) || ((X(i)+1)==n)
%                  m = true;
%            end  
%        end 
%end