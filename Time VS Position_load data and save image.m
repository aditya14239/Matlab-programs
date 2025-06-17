%loading data from position_time.txt

data = load('position_time.txt'); %loading the data from file

time = data(:,1);
position = data(:,2);

%plotting

plot(time,position,'-k');
xlabel('time:-')
ylabel('Distance from mean position:-')
title('Time V/S Position') ;
grid on;
% saving the image
saveas(gcf,'position_time.jpeg');