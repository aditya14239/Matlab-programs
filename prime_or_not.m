function m = prime_or_not(n)
   b = 1;
     for i = 2 : round(sqrt(n))
         if rem(n,i) == 0
            b = b-1;
         end
     end 
   m = b;
end
%function m = prime_or_not(n)
%   b = true;
%     for i = 2 : round(sqrt(n))
%         if rem(n,i) == 0
%            b = false;
%         end
%     end 
%end