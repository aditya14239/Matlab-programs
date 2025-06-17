%Part A
I = [1 0 ; 0 1]; % Identity matrix 
% Pauli matrices Sx and Sz
Sx = [0 1 ; 1 0];   
Sz = [1 0 ; 0 -1];
exponential_Sx = cosh(1)*I + sinh(1)*Sx;
exponential_Sz = cosh(1)*I + sinh(1)*Sz;
product_exponential = exponential_Sz*exponential_Sx;
fprintf('\nThe e^σx matrix is :->\n\n');
disp(exponential_Sx);
fprintf('\nThe e^σz matrix is :->\n\n');
disp(exponential_Sz);
fprintf('\nThe product of exponentials e^σz and e^σx in part A is :->\n\n');
disp(product_exponential);

%Part B
exponential_Sx_sum_Sz = I + (Sx + Sz) + (Sx + Sz)^2/factorial(2) + (Sx + Sz)^3/factorial(3);
fprintf('\nThe exponential e^(σz+σx) using taylor series is :->\n\n');
disp(exponential_Sx_sum_Sz);
%checking whether e^(σz+σx) = (e^σz)*(e^σx) or not
if  exponential_Sx_sum_Sz  == product_exponential
    fprintf('\n\ne^(σz+σx) is equal to (e^σz)*(e^σx)\n\n')
else
    fprintf('\n\ne^(σz+σx) is not equal to (e^σz)*(e^σx)\n\n')
end

%Part C
com_Sz_Sx = Sz*Sx - Sx*Sz;
com_Sz_com_Sz_Sx = Sz*com_Sz_Sx - com_Sz_Sx*Sz;
com_Sx_com_Sz_Sx = Sx*com_Sz_Sx - com_Sz_Sx*Sx;
com_Sx_com_Sz_com_Sz_Sx = Sx*com_Sz_com_Sz_Sx - com_Sz_com_Sz_Sx*Sx;
Z = Sx + Sz + com_Sz_Sx/2 + com_Sz_com_Sz_Sx/12 - com_Sx_com_Sz_Sx/12 + com_Sx_com_Sz_com_Sz_Sx/24 ;
exponential_Z = expm(Z);
fprintf('\n\nThe product of exponentials e^σz and e^σx in part C is :->\n\n');
disp(exponential_Z);
if  exponential_Z  == product_exponential
    fprintf('\n\n\The product of exponentials e^σz and e^σx in part A and C are equal\n\n')
else
    fprintf('\n\nThe product of exponentials e^σz and e^σx in part A and C are not equal\n\n')
end






