clear;
close all;

p = 1;
M = 5;
N = 50;

T = 10^4;
Pfa = 10^-3;

SNR_range_1 = -15:1:0;
num_SNR_1 = length(SNR_range_1);


SNR_range_3 = -15:1:10;
num_SNR_3 = length(SNR_range_3);

SNR_range_4 = -30:1:5;
num_SNR_4 = length(SNR_range_4);

%modelo 1

Pd_1_1 = zeros(1,num_SNR_1);
Pd_3_1 = zeros(1,num_SNR_1);
Pd_4_1 = zeros(1,num_SNR_1);

for t = 1:num_SNR_1
    SNR = SNR_range_1(t);

    filename_1 = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNR, SNR, 1);
    data_1 = load(filename_1);

    resultados_1_H0_1 = data_1.detector_1_H0;
    resultados_1_H1_1 = data_1.detector_1_H1;

    

    resultados_3_H0_1 = data_1.detector_3_H0;
    resultados_3_H1_1 = data_1.detector_3_H1;

    resultados_4_H0_1 = data_1.detector_4_H0;
    resultados_4_H1_1 = data_1.detector_4_H1;

    umbral_1_1 = prctile(resultados_1_H0_1, 100 * (1 - Pfa));
    Pd_1_1(t) = mean(resultados_1_H1_1 > umbral_1_1);

    

    umbral_3_1 = prctile(resultados_3_H0_1, 100 * (1 - Pfa));
    Pd_3_1(t) = mean(resultados_3_H1_1 > umbral_3_1);

    umbral_4_1 = prctile(resultados_4_H0_1, 100 * (1 - Pfa));
    Pd_4_1(t) = mean(resultados_4_H1_1 > umbral_4_1);
end

figure;
plot(SNR_range_1, Pd_1_1, 'r-', 'DisplayName', 'Detector 1', 'LineWidth',1);
hold on;
plot(SNR_range_1, Pd_3_1, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(SNR_range_1, Pd_4_1, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('SNR[dB]');
ylabel('P_D');
legend('show', 'Location', 'Northwest');
grid on;



%modelo 3
Pd_1_3 = zeros(1,num_SNR_3);
Pd_3_3 = zeros(1,num_SNR_3);
Pd_4_3 = zeros(1,num_SNR_3);

for t = 1:num_SNR_3
    SNR = SNR_range_3(t);

    filename = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNR, SNR, 3);
    data_3 = load(filename);

    resultados_1_H0_3 = data_3.detector_1_H0;
    resultados_1_H1_3 = data_3.detector_1_H1;

    

    resultados_3_H0_3 = data_3.detector_3_H0;
    resultados_3_H1_3 = data_3.detector_3_H1;

    resultados_4_H0_3 = data_3.detector_4_H0;
    resultados_4_H1_3 = data_3.detector_4_H1;

    umbral_1_3 = prctile(resultados_1_H0_3, 100 * (1 - Pfa));
    Pd_1_3(t) = mean(resultados_1_H1_3 > umbral_1_3);

    

    umbral_3_3 = prctile(resultados_3_H0_3, 100 * (1 - Pfa));
    Pd_3_3(t) = mean(resultados_3_H1_3 > umbral_3_3);

    umbral_4_3 = prctile(resultados_4_H0_3, 100 * (1 - Pfa));
    Pd_4_3(t) = mean(resultados_4_H1_3 > umbral_4_3);
end

figure;
plot(SNR_range_3, Pd_1_3, 'r-', 'DisplayName', 'Detector 1', 'LineWidth',1);
hold on;
plot(SNR_range_3, Pd_3_3, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(SNR_range_3, Pd_4_3, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('SNR[dB]');
ylabel('P_D');
legend('show', 'Location', 'Northwest');
grid on;

%modelo 4

Pd_1_4 = zeros(1,num_SNR_4);
Pd_3_4 = zeros(1,num_SNR_4);
Pd_4_4 = zeros(1,num_SNR_4);

for t = 1:num_SNR_4
    SNR = SNR_range_4(t);

    filename = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNR, SNR, 4);
    data_4 = load(filename);

    resultados_1_H0_4 = data_4.detector_1_H0;
    resultados_1_H1_4 = data_4.detector_1_H1;

    
    resultados_3_H0_4 = data_4.detector_3_H0;
    resultados_3_H1_4 = data_4.detector_3_H1;

    resultados_4_H0_4 = data_4.detector_4_H0;
    resultados_4_H1_4 = data_4.detector_4_H1;

    umbral_1_4 = prctile(resultados_1_H0_4, 100 * (1 - Pfa));
    Pd_1_4(t) = mean(resultados_1_H1_4 > umbral_1_4);

   

    umbral_3_4 = prctile(resultados_3_H0_4, 100 * (1 - Pfa));
    Pd_3_4(t) = mean(resultados_3_H1_4 > umbral_3_4);

    umbral_4_4 = prctile(resultados_4_H0_4, 100 * (1 - Pfa));
    Pd_4_4(t) = mean(resultados_4_H1_4 > umbral_4_4);
end

figure;
plot(SNR_range_4, Pd_1_4, 'r-', 'DisplayName', 'Detector 1', 'LineWidth',1);
hold on;
plot(SNR_range_4, Pd_3_4, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(SNR_range_4, Pd_4_4, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('SNR[dB]');
ylabel('P_D');
legend('show', 'Location', 'Northwest');
grid on;



