close all;
clear;

resultados_1_H0 = zeros(1,T);
resultados_1_H1 = zeros(1,T);

resultados_2_H1 = zeros(1,T);
resultados_2_H0 = zeros(1,T);

resultados_3_H0 = zeros(1,T);
resultados_3_H1 = zeros(1,T);

resultados_4_H0 = zeros(1,T);
resultados_4_H1 = zeros(1,T);

for t = 1:T

    s = (randn(p,N) + 1i*randn(p,N)) / sqrt(2);

    %ruido modelo 3
    ruido_s_3 = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
    ruido_r_3 = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
    diagonal_1 = rand(M,1);
    diagonal_2 = rand(M,1);
    Sigma_s_3 = diag(diagonal_1);
    Sigma_r_3 = diag(diagonal_2);
    ruido_s_3 =  sqrtm(Sigma_s_3)*ruido_s_3;
    ruido_r_3 =  sqrtm(Sigma_r_3)*ruido_r_3;

    %ruido modelo 4
    ruido_s_4 = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
    ruido_r_4 = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
    A = randn(M) + 1i * randn(M);
    Sigma_s_tilde_4 = A'*A;
    B = randn(M) + 1i * randn(M);
    Sigma_r_tilde_4 = B'*B;
    ruido_s_4 = sqrtm(Sigma_s_tilde_4) * ruido_s_4;
    ruido_r_4 = sqrtm(Sigma_r_tilde_4) * ruido_r_4;
    
    %creo nueva matriz de ruido con parametro a variar
    eta = linspace(0,1,10);
    Sigma_s_tilde = eta*ruido_s_4 + (1-eta)*ruido_s_3;
    Sigma_r_tilde = eta*ruido_r_4 + (1-eta)*ruido_r_3;    
end
