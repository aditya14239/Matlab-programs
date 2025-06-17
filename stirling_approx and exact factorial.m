function m = stirling_approx(n)
         m = n^n*exp(-n)*sqrt(2*pi*n);
end
function a = exact_factorial(n)
   a=1;
   for i = 2:n
       a = a*i;
   end
end
f = zeros();
for i = 1:4
    f(1,i) = stirling_approx(i);
    f(2,i) = exact_factorial(i);
end

file = fopen('stirling_approx_and_exact.txt','w');
 for i = 1:4
     fprintf(file,'%f\t%f \n',f(1,i),f(2,i));
 end
fclose(file);

%plot
figure;
plot(f(1,:),'-*k');
hold on 
plot(f(2,:),'ok');
title('Comparison of stirling approximation with exact factorial');
xlabel('x');
ylabel('f(x)');
legend('Stirling approximation','Exact factorial');
grid on;
