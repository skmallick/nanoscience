function [l11 l22 v11 v22 E11 E22]=opticalprop(n,m)
%defines optical emission and absorption wavelengths, energies, and
%wavenumbers for a given chirality.  Based on Bachilo NL 2003 paper:
%Empirical Kataura Plot

%requires dtube and ctube mfiles

l11=0;
l22=0;
v11=0;
v22=0;
E11=0;
E22=0;

alpha=ctube(n,m);
d=dtube(n,m);
hc=1.2394E-4;

if m>n
    a=n;
    n=m;
    m=a;
end

if mod(n-m,3)==1
    v11=1E7/(157.5+1066.9*d)-771*cosd(3*alpha)^1.374/(d^2.272);
    v22=1E7/(145.6+575.7*d)+1326*cosd(3*alpha)^.828/(d^1.809);
    E11=hc*v11;
    E22=hc*v22;
    l11=1/v11*10^7;
    l22=1/v22*10^7;
elseif mod(n-m,3)==2
    v11=1E7/(157.5+1066.9*d)+347*cosd(3*alpha)^.886/(d^2.129);
    v22=1E7/(145.6+575.7*d)-1421*cosd(3*alpha)^1.11/(d^2.497);
    E11=hc*v11;
    E22=hc*v22;
    l11=1/v11*10^7;
    l22=1/v22*10^7;
end
