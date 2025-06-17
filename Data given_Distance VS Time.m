Time = [0.5; 1; 1.5; 2; 2.5; 3; 3.5; 4; 4.5; 5; 5.5; 6; 6.5];
Distance = [1.2; 1.7; 2.2; 2.7; 3.2; 3.7; 4.2; 4.7; 5.2; 5.7; 6.2; 6.7; 7.2];
Data = table(Time,Distance);
disp(Data);
x = Data.Distance;
t = Data.Time;
plot(t,x,'-ok');
title('Distance V/S Time','FontSize',12);
xlabel('Time t (sec) :->','FontSize',12);
ylabel('Distance Covered (m) :->','FontSize',12);
grid on;
% Slope
slope = (Distance(6) - Distance(2))/(Time(6) - Time(2));
fprintf('The constant velocity by which object is moving :-> %f m/s',slope);