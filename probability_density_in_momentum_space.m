% probability_density_in_momentum_space

function y = probability_density(p,w)
         h = 1; m = 1;
         y = 1/sqrt(m*w*pi*h)*exp(-p^2/(2*h*m*w)).^2;
end
w = [0.01,0.10];   % different w values
p = linspace(-5,5,5000);
P_momentum = zeros();
for i = 1:2
    for j =1 :5000
          P_momentum(i,j) = probability_density(p(j),w(i));  
    end
end
% opening and writing on file

file = fopen('probability_in_momentum.txt','w');
for j =1 :5000
    if p(j) >=-1 && p(j) <=1
       fprintf(file,'%f\t%f\t%f \n',p(j),P_momentum(1,j),P_momentum(2,j));
    end
end
fclose(file);

% loading the data from probability_in_momentum.txt

data = load('probability_in_momentum.txt');
momentum = data(:,1);
P_1 = data(:,2);
P_2 = data(:,3);
subplot(3,1,1);
plot(momentum,P_1,'-k');
xlabel('Momentum:->');
ylabel('Probability Density:->');
title('Probability Density V/S Momentum');
legend('w = 0.01');
grid on;
subplot(3,1,2);
plot(momentum,P_2,'-k');
xlabel('Momentum:->');
ylabel('Probability Density:->');
title('Probability Density V/S Momentum');
legend('w = 0.10');
grid on;

% loading the data from probability_2.txt

data = load ('probability_2.txt');
position = data(:,1);
P_position = data(:,2);
subplot(3,1,3)
plot(momentum,P_2,'-k')
hold on;
plot(position,P_position,'--k');
xlabel('Position and momentum:->');
ylabel('Probability Density:->');
title('Probability Density V/S Position and Momentum space');
legend('Momentum (w = 0.10)','position (w = 0.10)');
grid on;



