function [n m theol22 theol11 actl22 actl11 truncatedata emission excitation pledata levelpledata maxima chirality wavelength]=loadplemap(file,t,t2, radius);
%loads data into matlab, seperates emission and excitation wavelength and
%writes data table.  Then plots data as 2d contour map truncated at the
%value defined in the function

filename=load(file);
A=size(filename);
excitation=filename(1,2:A(2));
emission=filename(2:A(1),1);
pledata=filename(2:A(1),2:A(2));

%levels the data so there's at least one point in each column touching 0
levelpledata=pledata;
for n=1:A(2)-1 % subtract one for first row - column headers
    minrow=min(pledata(:,n));
    levelpledata(:,n)=pledata(:,n)-minrow;
end

%truncates data by filtering out noise
truncatedata=levelpledata;
for n=1:A(1)-1;
    for m=1:A(2)-1;
        if truncatedata(n,m)>t;
            truncatedata(n,m)=t;
        end
    end
end

col1 = [1 1 1]; %white
col2 = [1 0 1]; %magenta
col3 = [0 0 0]; %black
col4 = [0 1 1]; %cyan

fontsize1 = 22;
fontsize2 = 12;


%graphs truncated data
% set(0,'defaultaxesfontsize',12);
graphPLE(emission,excitation,truncatedata, fontsize2); %call to graphPLE, which puts data into a 2d countour map
title('PLE Map','FontName','Calibri','FontSize',fontsize1);

%graphs theoretical chiral locs
figure
graphPLE(emission,excitation,truncatedata,fontsize2);
title('Theoretical Chiral Locations','FontName','Calibri','FontSize',fontsize1);
hold on
lim = 25;
[chiralWavelength chirality] = chiral_locs(emission, excitation, lim, col3); %chiral_locs plots/labels the theo locs; returns wavelengths and chiral indeces
hold off

%graphs all the actual chiralities in the data, along with the theo points
figure
graphPLE(emission,excitation,truncatedata,fontsize2);
title('Actual (and Corresponding Theoretical) Values','FontName','Calibri','FontSize',fontsize1);
hold on
smoothpledata = smooth2a(levelpledata,1,1); %smooths the data, lowers noise
[maxima xarr yarr] = plotMax(emission, excitation, smoothpledata, col2, t2); %plots all maxes in data that surpass noise threshold, returns matrix of max locs (not max values)
[maxChiral chiralNdx maxNdx] = findChiral(radius, maxima, chiralWavelength, chirality, xarr, yarr, col4, col2, col1, col3); %plots actual maxes that match a chirality
hold off

%only plots actual chiral locations
figure
graphPLE(emission, excitation, truncatedata,fontsize2);
title('Actual Chiral Locations','FontName','Calibri','FontSize',fontsize1);
hold on
%uses matrices returned by findChiral
for i=1:length(maxNdx)
    scatter(maxNdx(i,1),maxNdx(i,2),20,col3,'filled');
    s = strcat('(',num2str(chiralNdx(i,1)),',',num2str(chiralNdx(i,2)),')');
    text(maxNdx(i,1)+5,maxNdx(i,2),s,'color',col3,'Fontsize',14); %+5 creates a 5 point space between the dot and the text
end
hold off

%compares actual chiral locs to where they should have been
figure
xlabel('Emission','FontSize',fontsize2);
ylabel('Excitation','FontSize',fontsize2);
title('Actual vs Predicted','FontName','Calibri','FontSize',fontsize1);
hold on
[maxChiral chiralNdx maxNdx] = findChiral(radius, maxima, chiralWavelength, chirality, xarr, yarr, col1, col2, col3, col4);
hold off

%finds theta and diam for all actual chiralities
[theta diam] = thetaDiam(chiralNdx);

%plots diameter vs. intensity
figure
xlabel('Diameter','FontSize',fontsize2);
ylabel('Intensity','FontSize',fontsize2);
hold on
for i=1:length(maxChiral)
    intensity(i) = truncatedata(maxChiral(i,1), maxChiral(i,2));
    scatter(diam(i),intensity(i),20,col4,'filled');
    text(diam(i), intensity(i), sprintf('%2G  %2G', chiralNdx(i,1), chiralNdx(i,2)),'horizontalAlignment','center','FontSize',12);
end
hold off

%plots angle vs intensity
figure
xlabel('Chiral Angle','FontSize',fontsize2);
ylabel('Intensity','FontSize',fontsize2);
hold on
for i=1:length(intensity)
    scatter(theta(i), intensity(i), 20, col4, 'filled');
    text(theta(i), intensity(i), sprintf('%2G  %2G', chiralNdx(i,1), chiralNdx(i,2)),'horizontalAlignment','center','FontSize',12);
end
hold off

%plots a 3D of diam vs theta vs intensity
figure
stem3(diam, theta, intensity,'filled','LineWidth',2,'MarkerFaceColor','r','MarkerEdgeColor','r','MarkerSize',10);
xlabel('Diameter','FontSize',fontsize2);
ylabel('Chiral Angle','FontSize',fontsize2);
zlabel('Intensity','FontSize',fontsize2);

%wtf?    
n=chirality(:,1);
m=chirality(:,2);
theol22=chiralWavelength(:,1);
theol11=chiralWavelength(:,2);
actl22=maxNdx(:,1);
actl11=transpose(maxNdx(:,2));



        
        

     
