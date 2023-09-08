%% create myDemodulator function with inputs = [rxModSymbols and constellation(M)] and output = [demodulatedSymbols,demodulatedBits] %%
function [demodulatedSymbols,demodulatedBits] = myDemodulator(rxModSymbols,constellation)
%% define constellation type and constellation points %%
%  BPSK  constellation = [1,-1];  
%  QPSK  constellation = [1+1j,1-1j,-1+1j,-1-1j]*(1/sqrt(2)); 
%  16QAM constellation = [1+1j,1+3j,1-1j,1-3j,3+1j,3+3j,3-1j,3-3j,-1+1j,-1+3j,-1-1j,-1-3j,-3+1j,-3+3j,-3-1j,-3-3j]*(1/sqrt(10));
M = length(constellation);                               % calculating Modulation order
%% mapping rxModSymbols to their nearest constellation by minimum distance %%
for a = 1:length(rxModSymbols)                           % repeating loop for all elements of rxModSymbols 
distances = abs(constellation-rxModSymbols(a)).^2;       % calculating distances from constellations
[~,Index_minValue] = min(distances);                     % finding minimum distance
demodulatedSymbols(a) = constellation(Index_minValue);   % mapping to nearest constellation
grp_det_bits(a,:) = dec2bin(Index_minValue - 1,log2(M)); % finding binary form of constellation
end
demodulatedBits = str2num(reshape(grp_det_bits',[],1));  % degrouping grp_det_bits
demodulatedBits = demodulatedBits';
end