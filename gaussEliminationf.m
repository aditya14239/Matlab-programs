% Define function gaussEliminationf
A = input('Enter the matrix A:->');
b = input('Enter the matrix b:->');
    n = size(A, 1); % Number of equations
    
    % Augmenting the coefficient matrix A with the constant vector b
    augmentedMatrix = [A, b]; % Say 'B'
    
    % Forward elimination
    for k = 1:n-1       % Pivot runs from first to second last
        for i = k+1:n   % For each pivot elimination runs from next to last
            % m21 = B21/B11 or m31 = B31/B11 ...
            factor = augmentedMatrix(i,k) / augmentedMatrix(k,k);
            % B'21 = B'21 - m21 * B'11 ...
            augmentedMatrix(i,k:end) = augmentedMatrix(i,k:end) - factor * augmentedMatrix(k,k:end);
        end
    end
    
    % Backward substitution
    
    x = zeros(n, 1);
    x(n) = augmentedMatrix(n,n+1) / augmentedMatrix(n,n); % Last variable Xn = bn/B'nn
    for i = n-1:-1:1
        % xi = [bi - B'ik * xk] / B'kk
        x(i) = (augmentedMatrix(i,n+1) - sum(augmentedMatrix(i,i+1:n) * x(i+1:n))) / augmentedMatrix(i,i);
    end
 disp(x);

