% Inputs
f = input("Enter the frequency for simple harmoinc oscillator:->");
A = input("Enter the amplitude for simple harmoinc oscillator:->");
T = input("Enter the time:->"); % 1/5 sec = 0.2 sec
x = zeros(); t = zeros();
t(1) = 0; x(1) = 0;
w = 2*pi*f;
h = T/1000; % interval size
for i = 1:999
    t(i+1) = t(i) + h;  % time array
    x(i+1) = A*sin(w*t(i+1));  %position array
end

%plotting
plot(t,x,'-k');
xlabel('time:-')
ylabel('Distance from mean position:-')
title('Time V/S Position') ;
grid on;

% opening and writing on a file
file = fopen('position_time.txt','w');
for i = 1: length(t)
    if t(i)<=0.2
       fprintf(file,'%f\t%f\n',t(i),x(i));
    end
end
fclose(file);