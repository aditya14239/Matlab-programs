n = input("Enter a number to be checked ");

% array of factorial of numbers
function factorial_prime(n)
X = zeros(1,n) ;
X(1) = 1;
for i = 2:n
    X(i) = i * X(i-1);
end
% checking prime or not
b = 0 ;
for i = 2 : n-1 
      if rem(n,i) == 0 
         b = b+1 ;
      end
end
% checking factorial prime or not
if b == 0
    a = 0 ;
    for i = 1:n
        
        if ((X(i)-1)==n) || ((X(i)+1)==n)
            a = a+1 ;
        end
    end
    if a == 1
        fprintf('%i is a factorial prime',n) ;
    else
        fprintf('%i is a not factorial prime',n) ;
    end
else 
    fprintf('%i is a not factorial prime',n) ;
end
end
factorial_prime(n)