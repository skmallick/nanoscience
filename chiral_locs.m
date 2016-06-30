function [chiralWavelength chirality] = chiral_locs(emission, excitation, lim, col3)
%plots and labels theoretical chiral locations based on input
%returns two Nx2 matrices: chiralWavelength stores all the emission and
%excitation points, chirality stores the chiral index associated with each
%plotted point

z=1;
for i=1:lim
    for j=1:lim
        if(i>j)
            [l11 l22] = opticalprop(i,j);
            if l11 >= emission(1)-100 && l11 <= emission(length(emission))+100 && l22 >= excitation(1)-100 && l22 <= excitation(length(excitation))+100
                chirality(z,1) = i;
                chirality(z,2) = j;
                chiralWavelength(z,1) = l11;
                chiralWavelength(z,2) = l22;
                z=z+1;
                scatter(l11,l22,20,col3,'filled');
                s = strcat('(',num2str(i),',',num2str(j),')');
                text(l11+5,l22,s,'color',col3,'Fontsize',12); %l11+5 creates a 5 point space between the dot and the text
            end
        end
    end
end