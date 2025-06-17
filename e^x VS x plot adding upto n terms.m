value = true;
i = 1;
t = zeros(1,100);
X = zeros(1,100);
x = input('Enter the value of x:->');
while value == true
     t(i) = taylor_series(x,i);
     t(i+1) = taylor_series(x,i+1);
     if abs(t(i+1)-t(i))<0.0001
         value = false;
     end
     X(i) = i;
     count = i;
     i = i+1;
end
%error
y = exp(x);
relative_error = abs(y-t(count))/y;
fprintf('Relative truncation error is :-> %.9f',relative_error);
exact = zeros(1,count);
for i = 1: count
    exact(i) = exp(x);
end
plot(X,t,'-ok');
hold on 
plot(exact,'-*k');
hold off
legend('e^x after adding each term','exact value of e^x')
title('e^x V/S x','FontSize',15);
xlabel('Number of terms :->','FontSize',15);
ylabel('e^x :->','FontSize',15);
grid on;