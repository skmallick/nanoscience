function [arr] = Island(row)
row = smooth2a(row,5,5);
figure
plot(1:1286, row);
[imax jmax imin jmin] = extrema(row)
a = [imax, imin];
b = [jmax, jmin];
c = [a;b];
c = transpose(c);
c = sortrows(c,2);
s = size(b);
for i = 1:s(2)
    deriv = diff(c);
    deriv2 = diff(deriv);
    if c(i,1) > 0 && deriv2(i,1) < 0
        arr(i) = 1;
    else
        arr(i) = 0;
    end
end
arr
