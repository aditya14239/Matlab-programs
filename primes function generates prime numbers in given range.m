 range = 1e5 ;  % given range
 prime_numbers = primes(range) ; % primes function generates prime numbers in given range 
 last_digits_prime_no= rem(prime_numbers, 10) ; %array of last digits of generated prime numbers
 last_digit = [1, 3, 7, 9] ; % 1, 3, 7, 9 can be the last digits of a prime number
 
 % Counting the frequency

  frequency = zeros(size(last_digit));
  for i = 1:length(last_digit)
        b = 0;
      for j = 1:length(last_digits_prime_no)
          if last_digits_prime_no(j) == last_digit(i)
             b = b + 1;
          end
      end
      frequency(i) = b;
  end
 
 % Normalizing the frequency

  norm_frequency = zeros(size(frequency)); % initializing array of normalized frequencies 
 for i = 1: length(frequency)
     norm_frequency(i) = frequency(i)/sum(frequency);
 end
 
 %Plotting the bar graph
 figure;
 bar(last_digit, norm_frequency, 'b');
 xlabel('Digits');
 ylabel('Normalized Frequency');
 title('Normalized Frequency');
 grid on;

 for i = 1 :length(last_digit)
     fprintf('frequency of last digit to be %d is:-> %d\n',last_digit(i), norm_frequency(i));
 end