function [arr] = IslandCounter(row,avg)

[val ndx] = extrema(row);

for i=1:length(ndx)
    num = val(i);
    z=i;
    while num > 0 && z > 0
        num = row(z-1);
        z = z-1;
    end
    num2 = val(i);
    z=i;
    while num > 0 &&
    
end
        