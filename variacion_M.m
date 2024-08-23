clear;
close all;

p = 2;
SNRr = 0;
SNRs = -12;
N = 50;
T = 10^2;
Pfa = 10^-1;

M_range = 5:1:10;
num_M = length(M_range);

%modelo 1

Pd_1_1 = zeros(1,num_M);
Pd_2_1 = zeros(1,num_M);
Pd_3_1 = zeros(1,num_M);
Pd_4_1 = zeros(1,num_M);

for t = 1:num_M
    M = M_range(t);

    filename = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 1);
    data_1 = load(filename);

    resultados_1_H0_1 = data_1.detector_1_H0;
    resultados_1_H1_1 = data_1.detector_1_H1;

    resultados_2_H0_1 = data_1.detector_2_H0;
    resultados_2_H1_1 = data_1.detector_2_H1;

    resultados_3_H0_1 = data_1.detector_3_H0;
    resultados_3_H1_1 = data_1.detector_3_H1;

    resultados_4_H0_1 = data_1.detector_4_H0;
    resultados_4_H1_1 = data_1.detector_4_H1;

    umbral_1_1 = prctile(resultados_1_H0_1, 100 * (1 - Pfa));
    Pd_1_1(t) = mean(resultados_1_H1_1 > umbral_1_1);

    umbral_2_1 = prctile(resultados_2_H0_1, 100 * (1 - Pfa));
    Pd_2_1(t) = mean(resultados_2_H1_1 > umbral_2_1);

    umbral_3_1 = prctile(resultados_3_H0_1, 100 * (1 - Pfa));
    Pd_3_1(t) = mean(resultados_3_H1_1 > umbral_3_1);

    umbral_4_1 = prctile(resultados_4_H0_1, 100 * (1 - Pfa));
    Pd_4_1(t) = mean(resultados_4_H1_1 > umbral_4_1);
end

figure;
plot(M_range, Pd_1_1, 'r-', 'DisplayName', 'Detector 1', 'LineWidth',1);
hold on;
plot(M_range, Pd_2_1, 'b-', 'DisplayName', 'Detector 2', 'LineWidth',1);
hold on;
plot(M_range, Pd_3_1, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(M_range, Pd_4_1, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('M');
ylabel('P_D');
title('M vs Pd Modelo 1');
legend('show');
grid on;

%modelo 2

Pd_1_2 = zeros(1,num_M);
Pd_2_2 = zeros(1,num_M);
Pd_3_2 = zeros(1,num_M);
Pd_4_2 = zeros(1,num_M);

for t = 1:num_M
    M = M_range(t);

    filename = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 2);
    data_2 = load(filename);

    resultados_1_H0_2 = data_2.detector_1_H0;
    resultados_1_H1_2 = data_2.detector_1_H1;

    resultados_2_H0_2 = data_2.detector_2_H0;
    resultados_2_H1_2 = data_2.detector_2_H1;

    resultados_3_H0_2 = data_2.detector_3_H0;
    resultados_3_H1_2 = data_2.detector_3_H1;

    resultados_4_H0_2 = data_2.detector_4_H0;
    resultados_4_H1_2 = data_2.detector_4_H1;

    umbral_1_2 = prctile(resultados_1_H0_2, 100 * (1 - Pfa));
    Pd_1_2(t) = mean(resultados_1_H1_2 > umbral_1_2);

    umbral_2_2 = prctile(resultados_2_H0_2, 100 * (1 - Pfa));
    Pd_2_2(t) = mean(resultados_2_H1_2 > umbral_2_2);

    umbral_3_2 = prctile(resultados_3_H0_2, 100 * (1 - Pfa));
    Pd_3_2(t) = mean(resultados_3_H1_2 > umbral_3_2);

    umbral_4_2 = prctile(resultados_4_H0_2, 100 * (1 - Pfa));
    Pd_4_2(t) = mean(resultados_4_H1_2 > umbral_4_2);
end

figure;
plot(M_range, Pd_1_2, 'r-', 'DisplayName', 'Detector 1', 'LineWidth',1);
hold on;
plot(M_range, Pd_2_2, 'b-', 'DisplayName', 'Detector 2', 'LineWidth',1);
hold on;
plot(M_range, Pd_3_2, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(M_range, Pd_4_2, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('M');
ylabel('P_D');
title('M vs Pd Modelo 2');
legend('show');
grid on;


%modelo 3

Pd_1_3 = zeros(1,num_M);
Pd_2_3 = zeros(1,num_M);
Pd_3_3 = zeros(1,num_M);
Pd_4_3 = zeros(1,num_M);

for t = 1:num_M
    M = M_range(t);

    filename = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 3);
    data_3 = load(filename);

    resultados_1_H0_3 = data_3.detector_1_H0;
    resultados_1_H1_3 = data_3.detector_1_H1;

    resultados_2_H0_3 = data_3.detector_2_H0;
    resultados_2_H1_3 = data_3.detector_2_H1;

    resultados_3_H0_3 = data_3.detector_3_H0;
    resultados_3_H1_3 = data_3.detector_3_H1;

    resultados_4_H0_3 = data_3.detector_4_H0;
    resultados_4_H1_3 = data_3.detector_4_H1;

    umbral_1_3 = prctile(resultados_1_H0_3, 100 * (1 - Pfa));
    Pd_1_3(t) = mean(resultados_1_H1_3 > umbral_1_3);

    umbral_2_3 = prctile(resultados_2_H0_3, 100 * (1 - Pfa));
    Pd_2_3(t) = mean(resultados_2_H1_3 > umbral_2_3);

    umbral_3_3 = prctile(resultados_3_H0_3, 100 * (1 - Pfa));
    Pd_3_3(t) = mean(resultados_3_H1_3 > umbral_3_3);

    umbral_4_3 = prctile(resultados_4_H0_3, 100 * (1 - Pfa));
    Pd_4_3(t) = mean(resultados_4_H1_3 > umbral_4_3);
end

figure;
plot(M_range, Pd_1_3, 'r-', 'DisplayName', 'Detector 1', 'LineWidth',1);
hold on;
plot(M_range, Pd_2_3, 'b-', 'DisplayName', 'Detector 2', 'LineWidth',1);
hold on;
plot(M_range, Pd_3_3, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(M_range, Pd_4_3, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('M');
ylabel('P_D');
title('M vs Pd Modelo 3');
legend('show');
grid on;


%modelo 4

Pd_1_4 = zeros(1,num_M);
Pd_2_4 = zeros(1,num_M);
Pd_3_4 = zeros(1,num_M);
Pd_4_4 = zeros(1,num_M);

for t = 1:num_M
    M = M_range(t);

    filename = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_modelo%d.mat', T, p, M, N, SNRr, SNRs, 4);
    data_4 = load(filename);

    resultados_1_H0_4 = data_4.detector_1_H0;
    resultados_1_H1_4 = data_4.detector_1_H1;

    resultados_2_H0_4 = data_4.detector_2_H0;
    resultados_2_H1_4 = data_4.detector_2_H1;

    resultados_3_H0_4 = data_4.detector_3_H0;
    resultados_3_H1_4 = data_4.detector_3_H1;

    resultados_4_H0_4 = data_4.detector_4_H0;
    resultados_4_H1_4 = data_4.detector_4_H1;

    umbral_1_4 = prctile(resultados_1_H0_4, 100 * (1 - Pfa));
    Pd_1_4(t) = mean(resultados_1_H1_4 > umbral_1_4);

    umbral_2_4 = prctile(resultados_2_H0_4, 100 * (1 - Pfa));
    Pd_2_4(t) = mean(resultados_2_H1_4 > umbral_2_4);

    umbral_3_4 = prctile(resultados_3_H0_4, 100 * (1 - Pfa));
    Pd_3_4(t) = mean(resultados_3_H1_4 > umbral_3_4);

    umbral_4_4 = prctile(resultados_4_H0_4, 100 * (1 - Pfa));
    Pd_4_4(t) = mean(resultados_4_H1_4 > umbral_4_4);
end

figure;
plot(M_range, Pd_1_4, 'r-', 'DisplayName', 'Detector 1', 'LineWidth',1);
hold on;
plot(M_range, Pd_2_4, 'b-', 'DisplayName', 'Detector 2', 'LineWidth',1);
hold on;
plot(M_range, Pd_3_4, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(M_range, Pd_4_4, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('M');
ylabel('P_D');
title('M vs Pd Modelo 4');
legend('show');
grid on;