% Downloadable MATLAB code, copyright Amritanshu Palaria
% H2 ground state from a non-relativistic Hartree Fock treatment using STO-4G basis set and Born Oppenheimer approximation  
% Program written by Amritanshu Palaria @ NCN, Apr 12, 2006
% For theoretical reference, please see "Computational Physics" by Thijssen
clear all;
% initialization
Z=1,S=1,A=0,F=0,V=0,D=0,g=0,Vecp=0,Vec=0,Val=0,EVal=0;
for y=1:41
    clear T,S,A,F,V,D,g,Vecp,Vec,Val,EVal;
    % y = 11;
    disp('Step '); disp(y);
    r = 0.45+0.05*y; % distance between nucleii in a.u.(units of a0, ie. Bohr radius)... since the problem is essentially 1-D, this is all that is needed
    disp('H-H bondlength'); disp(r);
    NNr=1/r;
    % alphas for the 4 Gaussian basis functions for each H atom
    alpha1 = [13.00773 1.962079 0.444529 0.1219492]; 
    alpha = [alpha1 alpha1];
    asize=size(alpha);
    % one H nucleus at origin, the other at r
    ra=[0 0 0 0 r r r r]; % the location of the atom with the ith basisfunction
    % first 4 basis fns come from the atom at origin
    % the next 4 come from the one at r
    % the S (overlap), T (K.E.) and A (Coulomb) matrices
    for i=1:8 % run over all basis functions
        for j=1:i % do not run over all basis functions to exploit symmetry
            % intermediate variables
            as = alpha(i)+alpha(j);
            ap = alpha(i)*alpha(j);
            rat=ap/as;
            % location of the gaussian resulting from product of
            % the 2 gaussian basis functions
            rp=(alpha(i)*ra(i)+alpha(j)*ra(j))/as;
            S(i,j)=(pi/as)^1.5*exp(-rat*(ra(i)-ra(j))^2);
            S(j,i)=S(i,j); % using symmetry
            T(i,j)=0.5*rat*(6-4*rat*(ra(i)-ra(j))^2)*S(i,j);
            T(j,i)=T(i,j); % using symmetry
            if (rp==0)
                F0=1+sqrt(pi)/2*erf(sqrt(as*(rp-r)^2))/sqrt(as*(rp-r)^2);
            elseif (rp==r)
                F0=sqrt(pi)/2*erf(sqrt(as*(rp-0)^2))/sqrt(as*(rp-0)^2)+1;
            else
                F0=sqrt(pi)/2*(erf(sqrt(as*(rp-0)^2))/sqrt(as*(rp-0)^2)+erf(sqrt(as*(rp-r)^2))/sqrt(as*(rp-r)^2));
            end
            A(i,j)=-2*pi*Z/as*exp(-rat*(ra(i)-ra(j))^2)*F0;
            A(j,i)=A(i,j); % using symmetry
        end
    end
    S
    T
    A
    [V,D]=eig(S); % gives eigenvectors in columns of V, this diagnolizes S
    for i=1:asize(2)
        V(:,i)=V(:,i)/(D(i,i)^0.5);
    end
    % the two-electron integrals P taking care of all symmetries
    % it is noted that the gaussian functions evaluate to REAL values
    % and the g operator is real and symmetric w.r.t. 1 and 2
    for i=1:8
        for j=1:i % do not run over all basis functions to exploit symmetry
            as1=alpha(i)+alpha(j);
            ap1=alpha(i)*alpha(j);
            rp=(alpha(i)*ra(i)+alpha(j)*ra(j))/as1;
            for k=1:i-1 % do not run over all basis functions to exploit symmetry
                for l=1:k % do not run over all basis functions to exploit symmetry
                    as2=alpha(k)+alpha(l);
                    ap2=alpha(k)*alpha(l);
                    rq=(alpha(k)*ra(k)+alpha(l)*ra(l))/as2;
                    if ((rp-rq)==0)
                        F0=1;
                    else
                        F0=sqrt(pi)/2*erf(sqrt(as1*as2*(rp-rq)^2/(as1+as2)))/sqrt(as1*as2*(rp-rq)^2/(as1+as2));
                    end
                    g(i,j,k,l)=2*pi^2.5/as1/as2/(as1+as2)^0.5*exp(-ap1*(ra(i)-ra(j))^2/as1-ap2*(ra(k)-ra(l))^2/as2)*F0;
                    g(k,l,i,j)=g(i,j,k,l); % using symmetry
                    g(j,i,k,l)=g(i,j,k,l); % using symmetry
                    g(i,j,l,k)=g(i,j,k,l); % using symmetry
                    g(j,i,l,k)=g(i,j,k,l); % using symmetry
                    g(k,l,j,i)=g(i,j,k,l); % using symmetry
                    g(l,k,i,j)=g(i,j,k,l); % using symmetry
                    g(l,k,j,i)=g(i,j,k,l); % using symmetry
                end
                k=i;
                for l=1:j
                    as2=alpha(k)+alpha(l);
                    ap2=alpha(k)*alpha(l);
                    rq=(alpha(k)*ra(k)+alpha(l)*ra(l))/as2;
                    if ((rp-rq)==0)
                        F0=1;
                    else
                        F0=sqrt(pi)/2*erf(sqrt(as1*as2*(rp-rq)^2/(as1+as2)))/sqrt(as1*as2*(rp-rq)^2/(as1+as2));
                    end
                    g(i,j,k,l)=2*pi^2.5/as1/as2/(as1+as2)^0.5*exp(-ap1*(ra(i)-ra(j))^2/as1-ap2*(ra(k)-ra(l))^2/as2)*F0;
                    g(k,l,i,j)=g(i,j,k,l); % using symmetry
                    g(j,i,k,l)=g(i,j,k,l); % using symmetry
                    g(i,j,l,k)=g(i,j,k,l); % using symmetry
                    g(j,i,l,k)=g(i,j,k,l); % using symmetry
                    g(k,l,j,i)=g(i,j,k,l); % using symmetry
                    g(l,k,i,j)=g(i,j,k,l); % using symmetry
                    g(l,k,j,i)=g(i,j,k,l); % using symmetry
                end
            end
        end
    end
    % Self-consistent loop
    C=ones(1,asize(2)); %initial guess
    nor=C*S*C'
    disp('Initial Guess');
    C=C/nor
    Elast=1;
    EVal=0;
    P=C'*C;
    count=0;
    rplot=-2:0.01:3; % range in atomic units (bohr) for plotting the probability density
    % figure();
    % Generating Fock matrix
    while((abs(EVal(1)-Elast))>0.000001)
        count=count+1;
        disp('Step #');
        disp(count);
        Elast = EVal(1)
        for i=1:8
            for j=1:8
                J=0;
                for k=1:8
                    for l=1:8
                        J=J+P(k,l)*g(i,j,k,l);
                    end
                end
                F(i,j)=T(i,j)+A(i,j)+J;
            end
        end
        % solve the generalized eigenvalue problem FC=ESC
        % inverse of V is its conjugate transpose because V is unitary
        Fp=V'*F*V; % modified Fock matrix
        [Vecp,Val]=eig(Fp);
        Vec=V*Vecp;
        EigVal=diag(Val,0)
        [EVal,index]=sort(EigVal);
        disp('Ground State eigenvalue from this step is (in a.u., i.e. Hartree):');
        Erec(count)=EVal(1) % lowest eigenvalue
        GrCoeff=Vec(:,index(1)); % eigenvector corresponding to ground state
        disp('C matrix from this step is:');
        C=GrCoeff.' %new C matrix, this is normalized w.r.t. S ie. C*S*C'=1
        disp('Input density matrix for next step is:');
        P=0.8*P+0.2*C'*C %new input density matrix
        GndWvFn=C(1:4)*exp(-(alpha(1:4)).'*(rplot.*rplot))+C(5:8)*exp(-(alpha(5:8)).'*((rplot-r).*(rplot-r))); % ground state wavefunction from STO-4G approximation
        %     Uncomment the next 4 lines if you need a plot of probability with step of convergence
        %     hold on;
        %     plot(rplot,(abs(GndWvFn)).^2,'r--','LineWidth',1.5);
        %     xlabel('r position');
        %     ylabel('Probability density');
        %     title('Plot of the probability density vs. r position with step of convergence');
    end
    Qs=0;
    for i=1:8
        for j=1:8
            for k=1:8
                for l=1:8
                    Qs=Qs+g(i,j,k,l)*C(i)*C(j)*C(k)*C(l);
                end
            end
        end
    end
    disp('The final total energy (including nuclear-nuclear repulsion) after convergence for this H-H bond is ');
    Eg(y)=2*C*(T+A)*C'+Qs+NNr; % the energy from h for each e, the e-e interaction and the nucleus-nucleus interaction added
    disp(Eg(y));
    if Eg(y)==min(Eg)
        rmin = r;
        Erecmin = Erec;
        WvFnmin = GndWvFn;
    end
end

