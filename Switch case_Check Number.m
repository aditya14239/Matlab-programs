n = input('Enter the number to be checked:->');
a  = prime_or_not(n);
b = factorial_prime(n);
c = fibonacci_prime(n);
switch 1
    case a && b && c
        fprintf('%f is a prime, a fibonacci prime as well as factorial prime',n);
    case a && b
        fprintf('%f is a prime as well as factorial prime',n);
    case a && c
        fprintf('%f is a prime as well as fibonacci prime number ',n);
    case a
        fprintf('%f is a prime number',n);
    otherwise
        fprintf('%f is nor a prime nor a fibonacci prime and nor a factorial prime',n)
end
%switch true
%    case a && b && c
%       fprintf('%f is a prime, a fibonacci prime as well as factorial prime',n);
%    case a && b
%        fprintf('%f is a prime as well as factorial prime',n);
%    case a && c
%        fprintf('%f is a prime as well as fibonacci prime number ',n);
%    case a
%        fprintf('%f is a prime number',n);
%    otherwise
%        fprintf('%f is nor a prime nor a fibonacci prime and nor a factorial prime',n)
%end
% then fibonacci, factorial, and primeornot function also changed see that