function [error] = Error(arr)
a=1;
b=0;
z=1;
for i=2:length(arr)
    if(arr(i)==a)
        if(arr(i-1)~=b)
            err(z)=i;
        end
    elseif(arr(i)==b)
        if(arr(i-1)~=a)
            err(z)=i;
        end
    end
    z=z+1;
end

z=1;
for n=1:length(err)
    if(err(n)~=0)
        error(z)=err(n);
        z=z+1;
    end
end
