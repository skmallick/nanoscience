function [d] = graphPLE(a,b,c,fontsize2)
%graphs  ple data

surf(a,b,c');
xlabel('Emission','FontSize',fontsize2);
ylabel('Excitation','FontSize',fontsize2);
zlabel('Intensity');
shading interp;
view(0,90);
axis image;
% saveas(A,'testfile.jpg');
%[gradplex gradpley]=gradient(levelpledata);
