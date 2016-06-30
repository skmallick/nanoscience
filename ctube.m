function [C] = ctube(n,m)
%Calculate tube chiral angle for given chirality in nanometers
if m>n
    a=n;
    n=m;
    m=a;
end
X=(2*n+m)/(2*sqrt(m^2+m*n+n^2));
C=acosd(X);