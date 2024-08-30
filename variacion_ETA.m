clear;
close all

p = 1;
M = 5;
N = 50;
T = 10^3;
Pfa = 10^-2;
SNR_r = 8;
SNR_s = -16;

eta_range = 0:0.3:1;
num_eta = length(eta_range);

Pd_3 = zeros(1,num_eta);
Pd_4 = zeros(1,num_eta);

for t = 1:num_eta
    eta = eta_range(t);

    filename = sprintf('resultados_T%d_p%d_M%d_N%d_SNRr%d_SNRs%d_eta%d.mat', T, p, M, N, SNR_r, SNR_s, eta);
    data = load(filename);

    resultados_3_H0 = data.detector_3_H0;
    resultados_3_H1 = data.detector_3_H1;

    resultados_4_H0 = data.detector_4_H0;
    resultados_4_H1 = data.detector_4_H1;

    umbral_3_1 = prctile(resultados_3_H0, 100 * (1 - Pfa));
    Pd_3(t) = mean(resultados_3_H1 > umbral_3_1);

    umbral_4_1 = prctile(resultados_4_H0, 100 * (1 - Pfa));
    Pd_4(t) = mean(resultados_4_H1 > umbral_4_1);
end

figure;
plot(eta_range, Pd_3, 'g-', 'DisplayName', 'Detector 3', 'LineWidth',1);
hold on;
plot(eta_range, Pd_4, 'm-', 'DisplayName', 'Detector 4', 'LineWidth',1);
xlabel('\eta');
ylabel('P_D');
legend('show', 'Location', 'southeast');
grid on;