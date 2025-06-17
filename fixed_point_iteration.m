% Fixed Point Iteration

%define the fn

func = @(x) x^3+x-1;

%g = @(x) (5 - x*exp(x/2)) / 1.2;
%gp = @(x) -1*(exp(x/2) + 0.5*x*exp(x/2)) / 1.2;

%g = @(x) (5 - 1.2*x) / exp(x/2);
%gp = @(x) (-3.7 + 0.6*x) / exp(x/2);
 
g = @(x) (1-x)^(1/3);
gp = @(x) -1/(3*(1-x)^(2/3));

x = input('Enter the initial guess:');

if abs(gp(x)) >= 1
    error('The choice will not converge');
end

tolerance = 1e-6;
maxIterations = 100;

iteration = 0;
while iteration < maxIterations
    xnew = g(x);
    if func(xnew) == 0
        root = xnew;
        break;
    end
    if abs((xnew-x)/xnew) < tolerance
        break;
    end
    x = xnew;
    iteration = iteration + 1;
end
fprintf("Result after %i iterations\n", iteration);
fprintf("===========================\n");
fprintf("Approximate root: %.6f\n", xnew);
