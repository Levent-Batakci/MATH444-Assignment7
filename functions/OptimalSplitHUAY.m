function [j,s] = OptimalSplitHUAY(I,C,X)
% I is the index vector
% C is the full annotation vector
% X is the full data matrix.

p = 15000;
Xt = X'; %I like working with column data vectors.
t = C;
j = 1; 

minF = 100000; 
min_ind = 0; 
min_val = 0; 

while j<p
    
    accept = 0;
    while accept==0
        if (t(j)==t(j+1))
            j=j+1;
        else
            s = 0.5*(t(j)+t(j+1));
            accept = 1; 
        end
    end
    
    c1 = (1/nnz(t<=s)).*sum(Xt(:,t<=s),2);
    c2 = (1/nnz(t>s)).*sum(Xt(:,t>s),2);
    
    Fmean = sum( norm(Xt(:,t<=s)-c1,2).^2 ) + sum( norm(Xt(:,t>s)-c2,2).^2 );
    if (Fmean<minF)
       minF = Fmean;  
       min_ind = j; 
       min_val = s; 
    end
    j=j+1; 
end

j = min_ind; 
s = min_val; 

end