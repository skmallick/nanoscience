function [maxChiral chiralNdx maxNdx] = findChiral(radius, maxima, chiralWavelength, chirality, xarr, yarr, col1, col2, col3, col4)
%finds which chiralities are represented in the data set, plots/labels them
%looks at possible chiralities and actual maxes to make associations within
%a set radius
%returns matrices that hold excitation/emission and chiral indeces

z=1;
for k=1:length(chiralWavelength)
    x1 = chiralWavelength(k,1);
    y1 = chiralWavelength(k,2);
    
    %compares every possible chirality to every max to find the distance
    for q=1:length(maxima)
        x2 = maxima(q,1);
        y2 = maxima(q,2);
        dist = sqrt((x2 - x1).^2 + (y2 - y1).^2);
        distance(q) = dist;
    end
    [dist ndx] = min(distance); %from the given chirality, finds closest max
    
    %if the max is w/in range, the chiral ndx relating to that max is plotted
    if(dist <= radius)
        maxChiral(z,1) = xarr(ndx); %stores the excitation wavelength at which chirality occurs
        maxChiral(z,2) = yarr(ndx); %ditto for emission
        chiralNdx(z,1) = chirality(k,1); %stores the chiral index that is associated with the max
        chiralNdx(z,2) = chirality(k,2);
        maxNdx(z,1) = maxima(ndx,1); %stores the excitation of where max occurs
        maxNdx(z,2) = maxima(ndx,2); %ditto for emission
        z=z+1;
        v1 = [x1 maxima(ndx,1)];
        v2 = [y1 maxima(ndx,2)];
        line(v1,v2,'color', col4, 'LineWidth', 5);
        scatter(x1,y1,20,col3,'filled');
        scatter(maxima(ndx,1),maxima(ndx,2),20,col2,'filled'); %plots the point where the actual maxima occurs
        s = strcat('(',num2str(chirality(k,1)),',',num2str(chirality(k,2)),')'); %and assigns a chirality to the associated max
        text(x1+5,y1,s,'color',col3,'Fontsize',12); %x1+5 creates a space between dot and text
    end
end
