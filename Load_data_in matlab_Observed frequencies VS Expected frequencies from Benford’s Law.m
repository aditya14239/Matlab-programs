data = load('data_set1.dat');
leading_digit = zeros(length(data),1);
for i = 1:length(data)
    x1 = data(i);
    x = abs(x1);
    while x>=10
         x = x/10;
    end
    while x<1
        x = x*10;
    end
    leading_digit(i) = floor(x);
end
frequency = zeros(1,9);
norm_frequency = zeros(1,9);
P = zeros(1,9);
for i = 1 : 9
    count = 0;
    for j = 1 : length(leading_digit)
        if leading_digit(j) == i
             count = count +1;
        end
    end
    frequency(i) = count;
end
% normalised values
for i = 1:9
    norm_frequency(i) = frequency(i) / sum(frequency);
    P(i) = log10(i+1) - log10(i);
end
bar(1:9 ,[norm_frequency ; P],'grouped');
xticks(1:9)
title('Observed frequencies V/S Expected frequencies from Benford’s Law.','FontSize',12);
xlabel('leading digit :-','FontSize',12);
ylabel('Normalised frequency :-','FontSize',12);
legend('Calucated Frequencies','Benford frequencies')
grid on;








