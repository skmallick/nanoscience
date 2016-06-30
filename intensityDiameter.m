function [diam] = intensityDiameter(chiralNdx)

for i=1:length(chiralNdx)
    diam(i) = dtube(chiralNdx(i,1), chiralNdx(i,2));
end


