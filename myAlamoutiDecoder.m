function [rxSymbols_1,rxSymbols_2] = myAlamoutiDecoder(rxModSymbols,channel_1,channel_2)

% orthogonal coloumn representation result
rxModSymbols_rearranged = reshape(rxModSymbols,2,[]);
rxModSymbols_rearranged(2,:) = (rxModSymbols_rearranged(2,:)').'; %[y1,y2*]
rxSymbols_1 =[];
rxSymbols_2 =[];
%ALAMOUTI DECODING SCHEME
for ij = 1:length(channel_2)
    %coherent detection form
    R1 = ([channel_1(ij)',channel_2(ij)]*rxModSymbols_rearranged(:,ij))/sqrt(abs(channel_1(ij))^2 + abs(channel_2(ij))^2); %Y1
    R2 = ([channel_2(ij)',-channel_1(ij)]*rxModSymbols_rearranged(:,ij))/sqrt(abs(channel_1(ij))^2 + abs(channel_2(ij))^2);%Y2
    rxSymbols_1 = [rxSymbols_1,R1];
    rxSymbols_2 = [rxSymbols_2,R2];
end
end