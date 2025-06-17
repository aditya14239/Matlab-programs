p = input('Enter the first term of Fibonacci series:->') ;
q = input('Enter the first term of Fibonacci series:->') ;
n = input('Enter the number of terms to be print:->') ;
x(1) = p ;
x(2) = q ;
for i= 3 : n-1
    x(i) = x(i-2) + x(i-1) ;
end
fprintf(' \n Fibonacci series upto %d terms :-> ', n)
disp(x)

   