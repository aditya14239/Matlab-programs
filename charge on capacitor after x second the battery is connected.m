R = 500e3;
C = 8e-6;
emf = 12;
qo = emf*C;
t = input('Enter the time after which you need the charge on capacitor\n\n');
a = -t/(R*C);
ex = recursive_relation(a,10);
q = qo*(1-ex);
fprintf('The charge on capacitor after %f second the battery is connected:-> %f C',t,q);


