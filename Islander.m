function [arr] = Islander(row, avg)
%row = image(row,:);
counter = 1;
threshold = 10;
[pks locs] = findpeaks(row, 'minpeakheight', threshold);
g=row(5)

for i=1:5%length(locs)
    num = pks(i);
    z=locs(i);
    while num > 0 && z > 1
        num = row(z-1);
        z = z-1;
    end
    z=z+1;
    ndx = z
    num2 = pks(i);
    z=locs(i);
    while num2 > 0 && z < length(row)-1
        num2 = row(z+1)
        z=z+1;
    end
    z=z-1;
    ndx2=z
    dist = ndx2-ndx
    dist2 = cast(dist/avg,'uint8')
    
    if dist2 ~= 0
        arr(counter) = 1;
        counter = counter + 1;
        %num = num * -1;
        %num = num + 1;
        if dist2 ~= 1
            for x = 1:dist2-1
                arr(counter) = 1;
                counter = counter + 1;
        
            end
        end
    end
    
    ndx=ndx2;
    num=row(ndx);
    while num < 0 && z < length(row)-1
        num = row(z+1);
        z=z+1;
    end
    z=z-1;
    ndx2=z;
    
    dist = ndx2-ndx;
    dist2 = cast(dist/avg,'uint8');
    
    if dist2 ~= 0
        arr(counter) = 0;
        counter = counter + 1;
        %num = num * -1;
        %num = num + 1;
        if dist2 ~= 1
            for x = 1:dist2-1
                arr(counter) = 0;
                counter = counter + 1;
        
            end
        end
    end
    
    
end
      

% half = avg/2;
% limit = 5;
% cutoffs = zeros(1,limit);
% for n = 1:limit
%     cutoffs(n) = (n-1)*avg+half;
% end
% total = size(ndx);
% num = 0;
% point = 1;
% point2 = 2;
% while point2 <= total(2)
%     peak1 = ndx(point);
%     peak2 = ndx(point2);
%     dist = peak2 - peak1;
%     dist2 = cast(dist/avg,'uint8');
%     if(dist2 ~= 0)
%         arr(counter) = 1;
%         counter = counter + 1;
%         for x = 1:dist2-1
%             arr(counter) = 0;
%             counter = counter + 1;
%         end
%         point = point2;
%         point2 = point2 + 1;
%     else
%         point2 = point2+1;
%     end
%     if(point2 == total(2))
%         arr(counter) = 1;
%         counter = counter + 1;
%     end
% end
% arr

        
    
        
%num = mod(dist2,2);
%         if (num == 1)
%             arr(counter) = 1;
%             counter = counter + 1;
%         elseif (num == 0)    


    
%     for x = 1;limit
%         if(mod(dist,avg) <= cutoffs(x))
%             num = cutoffs(x);
%         end
%     end
%     if(num == cutoffs(2))
%         arr(counter) = 1;
%         counter = counter+1;
%         arr(counter) = 1;
%         counter = counter+1;
%     elseif(num == cutoffs(3))
%         arr(counter) = 1;
%         counter = counter+1;
        
    
     


