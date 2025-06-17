% Programs Bakhshali formula
response = 'y';
while response == 'y'
S = input('Enter the value of real number whose square root to be found:>');
xo = input('Enter the initial guess:>');
x(1) = xo;
for i=1:100
    a(i) = (S-x(i)^2)/(2*x(i));
    b(i) = x(i)+a(i);
    x(i+1) = (b(i)-a(i)^2/(2*b(i)));
    n=i+1;
    if abs(x(i+1)-x(i))<1e-12
        break;
    end
end
disp('Square root of S:->');
disp(x(n));
response = input('Do you want to find again(y/n):->','s');
end
