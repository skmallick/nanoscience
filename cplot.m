function cplot()
A=importdata('-pastespecial');
contourf(A(:,1:2),256)