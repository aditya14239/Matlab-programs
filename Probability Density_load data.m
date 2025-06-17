%loading data from probability_1.txt

data = load('probability_1.txt');
x = data(:,1);
P = data(:,2);
%plotting
subplot(2,1,1);
plot(x,P,'-k');
xlabel('Position:->');
ylabel('Probability Density:->');
title('Probability Density V/S Position');
legend('w = 0.01');
grid on;
saveas(gcf,'probability_1.jpeg'); % saving the image

% loading data from probability_2.txt
data = load('probability_2.txt');
x = data(:,1);
P = data(:,2);
% plotting
subplot(2,1,2);
plot(x,P,'-k');
xlabel('Position:->');
ylabel('Probability Density:->');
title('Probability Density V/S Position');
legend('w = 0.10');
grid on;
saveas(gcf,'probability_1.jpeg'); % saving the image


