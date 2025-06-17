data = readtable('corona_India_latest.csv');
x1 = data{:,2}';
x2 = data{:,3}';
x3 = data{:,5}';
x4 = data{:,6}';
% Bar graph for total number of confirmed cases for different states
figure
bar(x1,x2,'k');
title('Total confirmed cases for different states','FontSize',12);
xlabel('States :-','FontSize',12);
ylabel('Number of confirmed Cases :-','FontSize',12);
grid on;
% Bar graph of combined active and death cases for different states
figure
bar(x1 , [x4 ; x3],'grouped');
title('Bar graph of combined active and death cases for different states','FontSize',12);
xlabel('States :-','FontSize',12);
ylabel('Number of cases :-','FontSize',12);
legend('Active cases','Death cases')
grid on;
% Total number of confirmed cases
Tot_Confirmed = sum(x2);
fprintf('Total number of confirmed cases in India is %f',Tot_Confirmed);

