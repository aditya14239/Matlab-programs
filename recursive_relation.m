function y =  recursive_relation(x,n)
         y = 0;
         t = zeros(1,n);
         t(1) = 1;
         for i = 1:n
             t(i+1) = (x/i)*t(i);
             y =  y + t(i);
         end
end


