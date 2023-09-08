function rxModSymbols = myAlamoutiEncoder(channel_1,channel_2,modSymbols_1,modSymbols_2,noise)

rxModSymbols = [];
for ii = 1:length(modSymbols_2)
    %ALAMOUTI ENCODING SCHEME
    alamoutiEncodedSymbol = [channel_1(ii),channel_2(ii)]*[modSymbols_1(ii),-modSymbols_2(ii)';modSymbols_2(ii),modSymbols_1(ii)']+[noise(2*ii-1) noise(2*ii)];
    rxModSymbols = [rxModSymbols ,alamoutiEncodedSymbol];
end
end