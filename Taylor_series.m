ex = zeros(1,10); 
xfactorial = zeros(1,10);
for i = 1:10
      ex(i) = taylor_series(i,100);
      xfactorial(i) = factorial(i);
end
plot(ex,'-*k')
hold on 
plot(xfactorial,'-ok')
title('e^x and x! V/S x','FontSize',15);
xlabel('x :->','FontSize',15);
ylabel('e^x and x! :->','FontSize',15);
legend('e^x','x!')
grid on;


