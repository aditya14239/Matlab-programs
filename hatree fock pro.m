a=[0.298073 1.242567 5.782948 38.474970]
for p=1:4
    for q=1:4
       
        f= @(r) 4*pi*r^2*exp(-(a(p)+a(q))*r^2
        S(p,q)=integral(f,-10,10)
    end
end
for p=1:4
    for q=1:4
                u=@(r) -8*pi*r^4*a(p)*a(q)*exp(-(a(p)+a(q))*r^2)
        
            
                t=-@(r) 2*pi*r*exp(-(a(p)+a(q))*r^2)
     
        
        h(p,q)=integral(u,-10,10)+integral(t,-10,10)
    end
end
for p=1:4
    for r=1:4
        for q=1:4
            for s=1:4
                Q(p,r,q,s)=2*pi^(5/2)/((a(p)+a(q))*(a(r)+a(s))*(a(p)+a(q)+a(r)+a(s))^(1/2))  
            end
        end
    end  
end
[V,D]=eig(S)
for i=1:4
        V(:,i)=V(:,i)/(D(i,i)^0.5)
end
 
C=ones(1,4)
    Elast=1
    EVal=0
while((abs(EVal(1)-Elast))>1e-10)
    for p=1:4
        for q=1:4
            nor=C(p)*S(p,q)*C(q)
        end
    end
    C=C/nor
        Elast=EVal(1)
        for p=1:4
            for q=1:4
                J=0;
                for r=1:4
                    for s=1:4
                        J=J+C(r)*C(s)*Q(p,r,q,s)
                    end
                end
                F(p,q)=h(p,q)+J
            end
        end
  Fp=V'*F*V
  [Vecp,Val]=eig(Fp)
  Vec=V*Vecp;
  EigVal=diag(Val)
  [EVal,index]=sort(EigVal)
  C_new=Vec(:,index(1))
  Qs=0;hs=0
  for p=1:4
      for q=1:4
          hs=hs+h(p,q)*C(p)*C(q)
             for r=1:4
                for s=1:4
                    Qs=Qs+Q(p,r,q,s)*C(p)*C(q)*C(r)*C(s)
                end
            end
     end
  end
  Eg=2*hs+Qs
  C=C_new
end
fprintf("Approximate root: %.6f\n", Eg);

