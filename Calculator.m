value = 1;
while value == 1
    fprintf('\n\nChoice 1: Perform addition and display the result\n');
    fprintf('Choice 2: Perform subtraction and display the result\n');
    fprintf('Choice 3: Perform multiplication and display the result\n');
    fprintf('Choice 4: Perform division and display the result\n');
    fprintf('Choice 5: Perform exponentiation and display the result\n');
    fprintf('Choice 6: Exit\n\n');
    choice = input('Please enter a number from 1 to 6 for the operation do you want:-> ');
    i = 1:6;
    if any(choice == i)
      if choice ~=6
          if choice == 5
              a = input('Enter the base:->');
              b = input('Enter the exponent:->');
          else
              a = input('Enter the first number:->');
              b = input('Enter the second number:->');
          end
      end 
    else
         fprintf('\nPlease enter valid choice\n');
    end
    switch choice
        case 1
            fprintf('Addition of the numbers is %f',a+b);
        case 2
            fprintf('Subtraction of the numbers is %f',a-b);
        case 3
            fprintf('Multiplication of the numbers is %f',a*b);
        case 4
            if b ~=0
                fprintf('Division of the numbers is %f',a/b);
            else
                fprintf('Invalid operation, Please enter second number other than 0');
            end
        case 5
            fprintf('Exponentiation of %f is %f',a,a^b);
        case 6
            fprintf('exit....\n\n')
            value = 0;
    end
end