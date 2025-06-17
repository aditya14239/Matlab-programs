% Newton-Raphson method 

%define the fn
func = @(x) x^3 +x-1; funcp = @(x) 3*x^2+1;

%func = @(x) x^2 - 5; funcp = @(x) 2*x;
%func = @(x) 2*x^3 - 2*x - 5; funcp = @(x) 6*x^2 - 2;
%func = @(x) x^3 - x - 1; funcp = @(x) 3*x^2 - 1;
%func = @(x) x^3 + 2*x^2 + x - 1; funcp = @(x) 3*x^2 + 4*x + 1;
%func = @(x) 8 - 4.5*(x - sin(x)); funcp = @(x) - 4.5*(1 - cos(x));

x = input('Enter the initial guess:');
tolerance = 1e-6;
maxIterations = 100;

iteration = 0;
while iteration < maxIterations
    xnew = x - func(x) / funcp(x);
    if func(xnew) == 0
        r = xnew;
        break;
    end
    if abs((xnew-x)/xnew) < tolerance
        break;
    end
    x = xnew;
    iteration = iteration + 1;
end

r = xnew; 

fprintf("Result after %i iterations\n", iteration);
fprintf("===========================\n");
fprintf("Approximate root: %.6f\n", r);