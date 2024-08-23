clear;
close all;

p = 1;
M = 5;
N = 50;
T = 10^4;

SNR_range_1 = -15:1:0;
%SNR_range_2 = -15:1:10;
SNR_range_3 = -15:1:10;
SNR_range_4 = -30:1:5;

for SNR_1 = SNR_range_1
    filename_1 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNR_1, SNR_1, 1);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNR_1,SNR_1,1,filename_1);
end
%{
for SNR_2 = SNR_range_2
    filename_2 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNR_2, SNR_2, 2);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNR_2,SNR_2,2,filename_2);
end
%}
for SNR_3 = SNR_range_3
    filename_3 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNR_3, SNR_3, 3);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNR_3,SNR_3,2,filename_3);
end

for SNR_4 = SNR_range_4
    filename_4 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNR_4, SNR_4, 4);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNR_4,SNR_4,4,filename_4);
end

