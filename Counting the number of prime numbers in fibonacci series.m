% Generating fibonacci series upto 20 terms
F(1) = 0;
F(2) = 1;
for i= 3 : 20
    F(i) = F(i-2) + F(i-1) ;
end

count_primes = zeros(1,20);

% Counting the number of prime numbers in between F(i) and F(i+2) for i index
for i = 3:18
    m=0;
    for j = F(i)+1:F(i+2)-1
        b=0;
        % check prime
        for k = 2 : round(sqrt(j))
            if rem(j,k) == 0
                b = b+1; 
            end
        end
        if b == 0
            m =m+1;  
        end
    end 
    count_primes(i)=m;
end
count = zeros(1,16);
for i= 3:18
    count(i)=count_primes(i);
end
% Plotting 
figure(1);
plot(count,'-b');
xlabel('i:->')
ylabel('Number of prime numbers:->')
title('Number of Prime Number in between F(i) and F(i+2) V/S i') ;
grid on;