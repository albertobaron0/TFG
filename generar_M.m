clear;
close all;

p = 2;
N = 50;
T = 10^2;
SNRr = 0;
SNRs = -12;

M_range = 5:1:10;

for M = M_range
    filename_1 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 1);
    filename_2 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 2);
    filename_3 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 3);
    filename_4 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 4);

    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNRr,SNRs,1,filename_1);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNRr,SNRs,2,filename_2);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNRr,SNRs,3,filename_3);
    generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNRr,SNRs,4,filename_4);
end