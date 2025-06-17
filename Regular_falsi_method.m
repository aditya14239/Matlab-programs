% Regula Falsi method 

%define the fn
func = @(x) x^3-5;

%func = @(x) x^2 - 5;
%func = @(x) 2*x^3 - 2*x - 5;
%func = @(x) x^3 - x - 1;
%func = @(x) x^3 + 2*x^2 + x - 1;
%func = @(x) 8 - 4.5*(x - sin(x));

a = input('Enter the lower limit:');
b = input('Enter the upper limit:');
tolerance = 1e-6;
maxIterations = 100;

if func(a)*func(b) > 0
    error("Function values at endpoints must have opposite signs.");
end
c = 0.0;

if func(c) ==0
    disp("Root of Equation = ");
    disp(c);
else 
 iteration = 0;
 while iteration < maxIterations
    cnew = (a*func(b) - b*func(a)) / (func(b) - func(a));
    if func(cnew) == 0
        root = cnew;
        return;
    elseif func(a)*func(cnew) < 0
        b = cnew;
    else
        a = cnew;
    end
    if abs((cnew-c)/cnew) < tolerance
        break;
    end
    c = cnew;
    iteration = iteration + 1;
 end
end
root = cnew;

fprintf("Result after %i iterations\n", iteration);
fprintf("===========================\n");
fprintf("Approximate root: %.6f\n", root);
