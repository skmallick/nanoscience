function [xarr yarr] = maximums(data)
%takes a data set and returns the x and y indeces where the maxes occur
% uses extrema, which gets all extrema points and their indeces

s=size(data);
z=1;
for i=1: s(1)
    [val ndx] = extrema(data(i,:));
    for j=1:length(ndx)
        [val2 ndx2] = extrema(data(:,ndx(j)));
        x = 1;
        while  x <= length(ndx2) && ndx2(x) <= i
            if ndx2(x) == i
                yarr(z) = ndx(j);
                xarr(z) = i;
                z=z+1;
            end
            x=x+1;
        end
    end
end