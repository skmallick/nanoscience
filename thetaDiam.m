function [theta diam] = thetaDiam(chiralNdx)
%given a chirality, returns angle and diameter
%uses ctube and dtube

for i=1:length(chiralNdx)
    theta(i) = ctube(chiralNdx(i,1), chiralNdx(i,2));
    diam(i) = dtube(chiralNdx(i,1), chiralNdx(i,2));
end