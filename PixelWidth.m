function [vals] = PixelWidth(myImg)
img = imread(myImg);
%img = dither(img);
img = double(img);
[r c] = size(img);
arr = zeros(1,r);
for i = 1:r
    x1 = img(i,:);
    matlabfourier;
    arr(i) = max(X2);
% arr = zeros(1,50);
% for i = 150:200
%     x1 = img(:,i);
%     x1 = transpose(x1);
%     matlabfourier;
%     arr(i-149) = max(X2);
end
%arr = smooth2a(arr,1,1); %arbitrary for now
plot(arr);
idx = find(diff(diff(arr)>0)<0)+1;
idx
[a idx2] = findpeaks(arr);
idx2
s = size(idx);
maxVals = zeros(1,s(2));
for n = 1:s(2)
    maxVals(n) = arr(idx(n));
end
maxVals = sort(maxVals, 'descend');
maxNdx = 0;
maxNdx2 = 0;
for a = 1:s(2)
    if arr(idx(a)) == maxVals(1)
        maxNdx = idx(a);
    end
    if arr(idx(a)) == maxVals(2)
        maxNdx2 = idx(a);
    end
end
pxl = zeros(1,6);
y = 1;
maxNdx = maxNdx-1;
avgIntense = 0;
for x = 1:6
    x1 = img(maxNdx,:);
    if x <= 3    
        avgIntense=avgIntense+x1;
    end
    matlabfourier;
    [maxFreq ndx] = max(X2);
    ndx = F1(ndx);
    pxl(y) = (1/ndx)/2;
    y = y+1;
    maxNdx = maxNdx+1;
    if x == 3
        maxNdx = maxNdx2-1;
    end
end
avg = mean(pxl);
pxl
avg
avgIntense=avgIntense/3;
asd = avgIntense;
x1=img(22,:);
x1 = x1 - mean(x1);
vals=CountIsland(x1,avg);
end





