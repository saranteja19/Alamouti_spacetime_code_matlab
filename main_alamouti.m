%% start anew statements %%
clc;
clearvars;
close all;

%% input bits(txBits) generation %%
NumBits = 10^5;                             
constellation_QPSK = [1+1j,1-1j,-1+1j,-1-1j]*(1/sqrt(2)); 
snr_in_db = -20:1:30;

txBits_1 = randi([0,1],NumBits,1)';
txBits_2 = randi([0,1],NumBits,1)';


for jj = 1:length(snr_in_db)

snr = 10^(snr_in_db(jj)/10);

% MAPPING TO QPSK CONSTELATION
modSymbols_1 = myModulator(txBits_1,constellation_QPSK);
modSymbols_2 = myModulator(txBits_2,constellation_QPSK);

% RAYLIEH FADING CHANELS
channel_1 = randn(1,length(modSymbols_2),"like",1i);% TRANSMITTER-1 TO RECEIVER
channel_2 = randn(1,length(modSymbols_2),"like",1i);% TRANSMITTER-2 TO RECEIVER

% AWGN NOISE
noise = 1/sqrt(2*snr)*(randn(1,2*length(modSymbols_1)) + 1i*randn(1,2*length(modSymbols_1))); 

% ALAMOUTI ENCODING
rxModSymbols = myAlamoutiEncoder(channel_1,channel_2,modSymbols_1,modSymbols_2,noise);

% ALAMOUTI DECODING
[rxSymbols_1,rxSymbols_2] = myAlamoutiDecoder(rxModSymbols,channel_1,channel_2);

% DEMODULATION
[demodulatedSymbols_1,demodulatedBits_1] = myDemodulator(rxSymbols_1,constellation_QPSK);
[demodulatedSymbols_2,demodulatedBits_2] = myDemodulator(rxSymbols_2,constellation_QPSK);

% ERROR PROBABILITY
error1 = demodulatedBits_1 - txBits_1;
error2 = demodulatedBits_2 - txBits_2;
Pe(jj) = (nnz(error1)+nnz(error2))/length(error1);

end

semilogy(snr_in_db,Pe)
axis([-20 20 10^-5 1])
xlabel("SNR (dB)");
ylabel("Error Probability (P_e) OF ALAMOUTI QPSK")


