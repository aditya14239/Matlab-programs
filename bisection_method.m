% Bisection method

%define the fn

func = @(x) x^3+x-1;

a = input('Enter the lower limit:');
b = input('Enter the upper limit:');
tolerance = 1e-6;
maxIterations = 100;

if func(a)*func(b) > 0
    error("Function values at endpoints must have opposite signs.");
end
iteration = 0;
while abs((b-a)/b)>tolerance && iteration < maxIterations
    c = (a + b) / 2;
    if func(c) == 0
        root = c;
        return;
    elseif func(a)*func(c) < 0
        b = c;
    else
        a = c;
    end
    
    iteration = iteration + 1;
end

fprintf("Result after %i iterations\n", iteration);
fprintf("===========================\n");
fprintf("Approximate root: %.6f\n", c);

