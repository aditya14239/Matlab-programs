% polynomial fitting

n = input('Enter the number of data points:->');
x = input('Enter the x data points:->');
y = input('Enter the y data points:->');
degree = input('Enter the order of polynomial to be fitted:->');
coeff = polyfit(x,y,degree);
xfit = linspace(min(x),max(y),100);
fx = polyval(coeff,xfit);
plot(xfit,fx);