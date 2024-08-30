function generar_estadisticos_T_p_M_N_SNRr_SNRs_file_eta(T,p,M,N,SNR_r,SNR_s,filename,eta)

    detector_3_H0  = zeros(1,T);
    detector_3_H1  = zeros(1,T);

    detector_4_H0  = zeros(1,T);
    detector_4_H1  = zeros(1,T);

    for t = 1:T
        s = (randn(p,N) + 1i*randn(p,N)) / sqrt(2);

        ruido_s = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
        ruido_r = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);

        %ruido modelo 3
        diagonal_1 = rand(M,1);
        diagonal_2 = rand(M,1);
        Sigma_s_3 = diag(diagonal_1);
        Sigma_r_3 = diag(diagonal_2);

        %ruido modelo 4
        A = randn(M) + 1i * randn(M);
        Sigma_s_tilde_4 = A'*A;
        B = randn(M) + 1i * randn(M);
        Sigma_r_tilde_4 = B'*B;
    
        %creo nueva matriz de covarianza con parametro a variar
        Sigma_s_tilde = eta*Sigma_s_tilde_4 + (1-eta)*Sigma_s_3;
        Sigma_r_tilde = eta*Sigma_r_tilde_4 + (1-eta)*Sigma_r_3;
        ruido_s = sqrtm(Sigma_s_tilde)*ruido_s;
        ruido_r = sqrtm(Sigma_r_tilde)*ruido_r;

        H_s_1 = randn(M,p) + 1i * randn(M,p);
        H_r = randn(M,p) + 1i * randn(M,p);

        alfa_r = trace(Sigma_r_tilde) * 10^(SNR_r/10) / trace(H_r*H_r');
        alfa_s = trace(Sigma_s_tilde) * 10^(SNR_s/10) / trace(H_s_1*H_s_1');

        H_s_1 = sqrt(alfa_s) * H_s_1;
        H_r = sqrt(alfa_r) * H_r;

        x_s_1 = H_s_1*s + ruido_s;
        x_r = H_r*s + ruido_r;
        x_1 = [x_s_1; x_r];

        x_s_0 = ruido_s;
        x_0 = [x_s_0; x_r];

        detector_3_H0(t)  = detector3(x_0,N,M,p);
        detector_3_H1(t)  = detector3(x_1,N,M,p);

        detector_4_H0(t)  = detector4(x_0,N,M,p);
        detector_4_H1(t)  = detector4(x_1,N,M,p);
        
    end

save(filename, 'detector_3_H0', 'detector_3_H1', 'detector_4_H0', 'detector_4_H1');

disp(['Resultados guardados en ' filename]);

end
