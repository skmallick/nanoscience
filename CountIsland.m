function [arr] = CountIsland(row, avg)

s = size(row);
counter = 1;
threshold = 15;
point1 = row(1);
% c=1286;
% x1=row;
% matlabfourier
% figure


% t2=16;
% for i=1:s(2)
%     if(row(i) > t2)
%         row(i)=t2;
%     elseif(row(i) < -t2)
%         row(i) = -t2;
%     end
% end
% x1=row;
% matlabfourier

i=1;
while i < s(2)
    if threshold < 0
        while point1 >= threshold && i < s(2)
            i = i+1;
            point1 = row(i);
        end
    else
        while point1 <= threshold && i < s(2)
            i = i+1;
            point1 = row(i);
        end
    end
    ndx1 = i;
    threshold = threshold * -1;
    point2 = point1;
    if threshold < 0
        while point2 >= threshold && i < s(2)
            i = i+1;
            point2 = row(i);
        end
    else
        while point2 <= threshold && i < s(2)
            i = i+1;
            point2 = row(i);
        end
    end
    ndx2 = i;
    dist = ndx2 - ndx1;
    dist2 = cast(dist/avg,'uint8');
    if threshold < 0
        num = 1;
    else
        num = 0;
    end
    if dist2 ~= 0
        arr(counter) = num;
        counter = counter + 1;
        %num = num * -1;
        %num = num + 1;
        if dist2 ~= 1
            for x = 1:dist2-1
                arr(counter) = num;
                counter = counter + 1;
        
            end
        end
    end
    point1 = point2;
    dist2 = 0;
end