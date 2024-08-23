close all;
clear;

p = 1;      
M = 5;      
N = 30;     
T = 10^4;   

SNR_r =8;
SNR_s = -12;

resultados_2_H1 = zeros(1,T);
resultados_2_H0 = zeros(1,T);

resultados_1_H0 = zeros(1,T);
resultados_1_H1 = zeros(1,T);

resultados_3_H0 = zeros(1,T);
resultados_3_H1 = zeros(1,T);

resultados_4_H0 = zeros(1,T);
resultados_4_H1 = zeros(1,T);

for t = 1:T

   s = (randn(p,N) + 1i*randn(p,N)) / sqrt(2);
   
   ruido_s = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
   ruido_r = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
   Sigma_s = rand(1,1) * eye(M);
   Sigma_r = rand(1,1) * eye(M);
   ruido_s = sqrtm(Sigma_s)*ruido_s;
   ruido_r = sqrtm(Sigma_r)*ruido_r;
 
   H_s_1 = randn(M,p) + 1i * randn(M,p);
   H_r = randn(M,p) + 1i * randn(M,p);

   alfa_r = trace(Sigma_r) * 10^(SNR_r/10) / trace(H_r*H_r');
   alfa_s = trace(Sigma_s) * 10^(SNR_s/10) / trace(H_s_1*H_s_1');

   H_s_1 = sqrt(alfa_s) * H_s_1;
   H_r = sqrt(alfa_r) * H_r;

   %10*log10(trace(H_s_1*H_s_1')/trace(Sigma_s))
   %10*log10(trace(H_r*H_r')/trace(Sigma_r))
    
   x_s = H_s_1*s + ruido_s;
   x_r = H_r*s + ruido_r;
   x_1 = [x_s; x_r];

   x_s_0 = ruido_s;
   x_0 = [x_s_0; x_r];
   
   resultados_2_H1(t) = detector2(x_1,N,M,p);
   resultados_2_H0(t) = detector2(x_0,N,M,p);

   resultados_1_H0(t) = detector1(x_0,N,M,p);
   resultados_1_H1(t) = detector1(x_1,N,M,p);

   resultados_3_H0(t) = detector3(x_0,N,M,p);
   resultados_3_H1(t) = detector3(x_1,N,M,p);

   resultados_4_H0(t) = detector4(x_0,N,M,p);
   resultados_4_H1(t) = detector4(x_1,N,M,p);

end

%modelo 2
resultados_2_H0 = sort(resultados_2_H0);
Pfa_2 = logspace(-3,0,T);
umbrales = zeros(1,T);

for t = 1:T-1
    umbrales(t) = resultados_2_H0(round((1 - Pfa_2(t)) * T));
end

Pd_2 = zeros(1,T);
for i = 1:T
    Pd_2(i) = sum(resultados_2_H1 >= umbrales(i)) / T;
end

%modelo 1
resultados_1_H0 = sort(resultados_1_H0);
Pfa_1 = logspace(-3,0,T);
umbrales = zeros(1,T);

for t = 1:T-1
    umbrales(t) = resultados_1_H0(round((1 - Pfa_1(t)) * T));
end

Pd_1 = zeros(1,T);
for i = 1:T
    Pd_1(i) = sum(resultados_1_H1 >= umbrales(i)) / T;
end

%modelo 3
resultados_3_H0 = sort(resultados_3_H0);
Pfa_3 = logspace(-3,0,T);
umbrales = zeros(1,T);

for t = 1:T-1
    umbrales(t) = resultados_3_H0(round((1 - Pfa_3(t)) * T));
end

Pd_3 = zeros(1,T);
for i = 1:T
    Pd_3(i) = sum(resultados_3_H1 >= umbrales(i)) / T;
end

%modelo 4
resultados_4_H0 = sort(resultados_4_H0);
Pfa_4 = logspace(-3,0,T);
umbrales = zeros(1,T);

for t = 1:T-1
    umbrales(t) = resultados_4_H0(round((1 - Pfa_4(t)) * T));
end

Pd_4 = zeros(1,T);
for i = 1:T
    Pd_4(i) = sum(resultados_4_H1 >= umbrales(i)) / T;
end

figure;
plot(Pfa_1, Pd_1, 'r-', 'DisplayName','Detector 1', 'Linewidth', 1);
hold on;
plot(Pfa_2, Pd_2, 'b-', 'DisplayName', 'Detector 2', 'Linewidth', 1);
hold on;
plot(Pfa_3, Pd_3, 'g-', 'DisplayName','Detector 3', 'Linewidth', 1);
hold on;
plot(Pfa_4, Pd_4, 'm-', 'DisplayName','Detector 4', 'Linewidth', 1);
xlabel('P_{FA}');
ylabel('P_{D}');
legend('show','Location', 'Southeast');
grid on;