%generar_eta.m
clear;
close all;

p = 1;
M = 5;
N = 50;
T = 10^3;
SNR_r = 8;
SNR_s = -16;

eta_range = 0:0.1:1;

for eta = eta_range
    filename_1 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_eta%d.mat', T, p, M, N, SNR_r, SNR_s, eta);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_file_eta(T,p,M,N,SNR_r,SNR_s,filename_1,eta);
end

