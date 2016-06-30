function X=NT_chirality()
%defines matrix with data for nanotubes based on chirality. starts at 5,5 -
%ends at 20,20
%requires dtube and ctube m files.

n=[0:25];
m=[0:25];
nend=length(n);
mend=length(m);

x=0;
y=0;
z=1;
for x=1:nend %loops n index
    for y=1:mend %loops m index
        if dtube(n(x),m(y))<1.4 && dtube(n(x),m(y))>.5 && n(x)>=m(y)
            d(z)=dtube(n(x),m(y));
            c(z)=ctube(n(x),m(y));
            nvector(z)=n(x);%defines n chirality in vector
            mvector(z)=m(y);%defines m chirality in vector

    %         if d(z)<.8
    %             colorvector(z,:)=[0,0,0];
    %         elseif d(z)>=.8 && d(z)<1.1
    %             colorvector(z,:)=[0,0,1];
    %         elseif d(z)>=1.1 && d(z)<1.4
    %             colorvector(z,:)=[1,0,1];
    %         else
    %             colorvector(z,:)=[0,0,0];
    %         end
            if mod(nvector(z)-mvector(z),3)==0
                colorvector(z,:)=[1,0,0];
            else
                colorvector(z,:)=[0,0,0];
            end
            z=z+1;
        end
    end
end
length(colorvector)
X=[nvector',mvector',d',c'];
scatter(d,c,20,colorvector,'o','filled');
zz=1;
for zz=1:length(d)
    text(d(zz),c(zz),sprintf('%2G  %2G',nvector(zz),mvector(zz)),'horizontalAlignment','center','FontSize',12);
    zz=zz+1;
end
    