num_of_bits = 20000;
srcBits = randi([0,1], num_of_bits, 1);
modOrder = 16;
 
modOut = qammod(srcBits, modOrder, "Inputtype", "Bit");
 
% Constellation of 16-QAM 
scatterplot(modOut);
 
% Adding AWG Noise 
SNR = 15; % Increase SNR for better results
chanOut = awgn(modOut, SNR);
scatterplot(chanOut);

% Demodulator
demodOut = qamdemod(chanOut, modOrder, ...
    "Outputtype", "bit",...
    "PlotConstellation", true, ...
    "UnitAveragePower", true);
 
%  To calculate BER
 
isBitError = srcBits~=demodOut;
numBitErrors = nnz(isBitError); % no. of non zero elements
BER = numBitErrors/num_of_bits;
