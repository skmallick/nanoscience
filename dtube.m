function [D]=dtube(n,m)
%DTUBE - Calculate tube diameter for given chirality in nanometers
a=.144*sqrt(3);
D=a*sqrt(m^2+m*n+n^2)/pi;