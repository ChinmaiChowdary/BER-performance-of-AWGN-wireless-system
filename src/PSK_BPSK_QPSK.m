% BER performance of PSK, BPSK and QPSK MATLAB code:
clear;
clc;
close all;


num_of_bits = 1000;
SNR = 15; 
srcData = randi([0 M-1], num_of_bits, 1);



 

% 2-psk, also known as BPSK
 M = 1; % Modulation Order

% PSK modulation
PSKmodOut = pskmod(srcData, M, pi/M);
scatterplot(PSKmodOut);
% AWGN
chanOut = awgn(PSKmodOut, SNR);
scatterplot(chanOut);
% PSK Demodulation
PSKdemodOut = pskdemod(chanOut, M, pi/M); 
% BER of PSK
isBitError_PSK = srcData~=PSKdemodOut;
numBitErrors_PSK = nnz(isBitError_PSK); % no. of non zero elements
BER_PSK = numBitErrors_PSK/num_of_bits;
 
M = 2; % Modulation Order

% BPSK modulation
BPSKmodOut = pskmod(srcData, M, pi/M);
scatterplot(BPSKmodOut);
% AWGN
chanOut = awgn(BPSKmodOut, SNR);
scatterplot(chanOut);
% BPSK Demodulation
BPSKdemodOut = pskdemod(chanOut, M, pi/M); 
% BER of PSK
isBitError_BPSK = srcData~=BPSKdemodOut;
numBitErrors_BPSK = nnz(isBitError_BPSK); % no. of non zero elements
BER_BPSK = numBitErrors_BPSK/num_of_bits;
 
 
% 4-psk, also known as QPSK
 
M = 4; % Modulation Order
srcData = randi([0 M-1], num_of_bits, 1);
% QPSK modulation
QPSKmodOut = pskmod(srcData, M, pi/M);
scatterplot(QPSKmodOut);
% AWGN
chanOut = awgn(QPSKmodOut, SNR);
scatterplot(chanOut);
% QPSK Demodulation
QPSKdemodOut = pskdemod(chanOut, M, pi/M); 
% BER of QPSK
isBitError_QPSK = srcData~=QPSKdemodOut;
numBitErrors_QPSK = nnz(isBitError_QPSK); % no. of non zero elements
BER_QPSK = numBitErrors_QPSK/num_of_bits;
