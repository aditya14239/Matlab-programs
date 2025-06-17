Height = [150; 152; 154; 156; 158; 160; 162; 164; 166; 168; 170];
Number_of_persons_height = [1; 2; 4; 10; 7; 5; 4; 8; 3; 6; 4];
Age = [20; 21; 22; 23; 24; 25; 26; 27; 28; 29; 30];
Number_of_persons_age = [2; 5; 8; 1; 4; 7; 3; 6; 9; 4; 5];
Data = table(Height,Number_of_persons_height,Age,Number_of_persons_age);
disp(Data);
Total_persons = sum(Number_of_persons_height);
Norm_Number_of_persons_height = zeros(1,length(Height));
Norm_Number_of_persons_age = zeros(1,length(Height));
% plotting normalised histograms
for i = 1:length(Height)
      Norm_Number_of_persons_height(i) = Number_of_persons_height(i)/Total_persons;
      Norm_Number_of_persons_age(i) = Number_of_persons_age(i)/Total_persons;
end
figure (1)
bar(Height,Norm_Number_of_persons_height,'k');
title('Normalised Histogram for Height of people','FontSize',12);
xlabel('Height:->','FontSize',12);
ylabel('Normalised number of people:->','FontSize',12);
grid on;
figure (2)
bar(Age,Norm_Number_of_persons_age,'k');
title('Normalised Histogram for Age of people','FontSize',12);
xlabel('Age :->','FontSize',12);
ylabel('Normalised number of people :->','FontSize',12);
grid on;