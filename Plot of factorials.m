function a = factorial(n)
   a=1;
   for i = 2:n
       a = a*i;
   end
end
f = zeros(1,10);
for i = 1:10
    f(i) = factorial(i);
end
%plotting
figure;
plot(f,'-ok');
title('f(x)=x! V/S x');
xlabel('x');
ylabel('f(x)');
grid on;

