% Practical 1 Task 2

data  = load('Golden_ratio.txt'); % loading the data from file
Golden_ratio = data(:,1);
% plotting
subplot(2,1,1);
plot(Golden_ratio,'-ok');
xlabel('Term number:->');
ylabel('Golden ratio:->');
title('Variation of the goden ratio upto 20th term');
legend('Golden ratio')
grid on;
saveas(gcf,'Golden_ratio.jpeg');  % saving the image


% Practical 3 Task 3

data  = load('stirling_approx_and_exact.txt'); % loading the data from file
x = data(:,1);
y = data(:,2);
% plotting
subplot(2,1,2)
plot(x,'-ok');
hold on;
plot(y,'-*k');
title('Comparison of stirling approximation with exact factorial');
xlabel('x');
ylabel('f(x)');
legend('Stirling approximation','Exact factorial');
grid on;
saveas(gcf,'stirling_approx_and_exact.jpeg'); % saving the image
