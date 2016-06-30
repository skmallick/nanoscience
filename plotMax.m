function [maxima xarr yarr] = plotMax(emission, excitation, data, col2, t2)
%plots all the points where maxima occur in the data
%returns maxima, an Nx2 matrix that has the x-y coor of the maxes (in terms
%of emission/excitation); also returns xarr and yarr, which have the i-j
%indexes of where the maxes occur

z=1;
[xarr yarr] = maximums(data); %call to maximums
for x=1:length(xarr)
    xval = emission(xarr(x));
    yval = excitation(yarr(x));
    if data(xarr(x),yarr(x)) > t2 %compares maxes to threshold to filter through noise
        scatter(xval,yval,20,col2,'filled');
        maxima(z,1) = xval;
       	maxima(z,2) = yval;
        z=z+1;
    end
end