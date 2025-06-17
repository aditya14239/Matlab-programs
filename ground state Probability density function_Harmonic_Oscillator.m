% Defining ground state Probability density function

function y = probability_density(x,w)
         h = 1; m = 1;
         y = sqrt(m*w/(pi*h))*exp(-m*w*x^2/(h*2)).^2;
end
w = [0.01,0.10,0.5]; % different values of w
x = linspace(-5,5,500); % positions in interval of 10 cm
P = zeros();
for i = 1:3
    for j =1 :500
          P(i,j) = probability_density(x(j),w(i));  
    end
end

% plotting 
grayColor = [.7 .7 .7];
plot(x,P(1,:), 'Color', grayColor);
hold on;
plot(x,P(2,:),'--k');
hold on;
plot(x,P(3,:),'k');
hold off;
xlabel('Position:-');
ylabel('Probability Density:-');
title('Probability Density V/S Position');
legend('w = 0.01','w = 0.10','w = 0.5');
grid on;

% opening and writing on file

file = fopen('probability_1.txt','w');
for j =1 :500
    fprintf(file,'%f\t%f \n',x(j),P(1,j));
end
fclose(file);

file = fopen('probability_2.txt','w');
for j =1 :500
    fprintf(file,'%f\t%f \n',x(j),P(2,j));
end
fclose(file);

%  if i do like this 
%  file = fopen('probability_2.txt','w');
%     fprintf(file,'%f\t%f \n',x,P(2,:));  % direct entering the whole array and if it create some problem
%  fclose(file);

%   Then do like this
%     g = [x ; P(2,:)]    %similarly with P(1,:)
%     file = fopen('probability_2.txt','w');
%        fprintf(file,'%f\t%f \n',x,g);
%     fclose(file);

