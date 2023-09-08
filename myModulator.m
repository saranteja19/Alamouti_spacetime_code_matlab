%% create myModulator function with inputs = [txBits and constellation(M)] and output = [modSymbols] %%
function [modSymbols] = myModulator(txBits,constellation)
%% define constellation type and constellation points %%
%  BPSK  constellation = [1,-1];  
%  QPSK  constellation = [1+1j,1-1j,-1+1j,-1-1j]*(1/sqrt(2)); 
%  16QAM constellation = [1+1j,1+3j,1-1j,1-3j,3+1j,3+3j,3-1j,3-3j,-1+1j,-1+3j,-1-1j,-1-3j,-3+1j,-3+3j,-3-1j,-3-3j]*(1/sqrt(10));
M = length(constellation);
%% convert txBits into integer by grouping bits for constellation mapping %%
% grouping log2(M) bits together
grp_txBits = reshape(txBits,log2(M),[])';
% convert grouped bits to integer
string_grptxBits = num2str(grp_txBits);
symNumVec = bin2dec(string_grptxBits);
%% mapping integers to respective constellation points %%
modSymbols = constellation(symNumVec+1);
end