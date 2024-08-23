% Archivo: generar_estadisticos.m
function generar_estadisticos_T_p_M_N_SNRr_SNRs_modelo_file(T,p,M,N,SNR_r,SNR_s,modelo,filename)

    detector_1_H1 = zeros(1,T);
    detector_1_H0 = zeros(1,T);

    detector_2_H0  = zeros(1,T);
    detector_2_H1  = zeros(1,T);

    detector_3_H0  = zeros(1,T);
    detector_3_H1  = zeros(1,T);

    detector_4_H0  = zeros(1,T);
    detector_4_H1  = zeros(1,T);

    for t = 1:T
        s = (randn(p,N) + 1i*randn(p,N)) / sqrt(2);

        ruido_s = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);
        ruido_r = (randn(M,N) + 1i*randn(M,N)) / sqrt(2);

        if modelo == 1 
            
            Sigma_s = eye(M,M);
            Sigma_r = eye(M,M);
            ruido_s = sqrtm(Sigma_s)*ruido_s;
            ruido_r = sqrtm(Sigma_r)*ruido_r;

        elseif modelo == 2
            
            Sigma_s = rand(1,1) * eye(M);
            Sigma_r = rand(1,1) * eye(M);
            ruido_s = sqrtm(Sigma_s)*ruido_s;
            ruido_r = sqrtm(Sigma_r)*ruido_r;

        elseif modelo == 3
            
            diagonal_1 = rand(M,1);
            diagonal_2 = rand(M,1);
            Sigma_s = diag(diagonal_1);
            Sigma_r = diag(diagonal_2);
            ruido_s =  sqrtm(Sigma_s)*ruido_s;
            ruido_r =  sqrtm(Sigma_r)*ruido_r;

        elseif modelo == 4
            
            A = randn(M) + 1i * randn(M);
            Sigma_s = A'*A;
            B = randn(M) + 1i * randn(M);
            Sigma_r = B'*B;
            ruido_s = sqrtm(Sigma_s) * ruido_s;
            ruido_r = sqrtm(Sigma_r) * ruido_r;

        else
            error('Modelo debe ser 1, 2, 3, ó 4')
        end

        H_s_1 = randn(M,p) + 1i * randn(M,p);
        H_r = randn(M,p) + 1i * randn(M,p);

        alfa_r = trace(Sigma_r) * 10^(SNR_r/10) / trace(H_r*H_r');
        alfa_s = trace(Sigma_s) * 10^(SNR_s/10) / trace(H_s_1*H_s_1');

        H_s_1 = sqrt(alfa_s) * H_s_1;
        H_r = sqrt(alfa_r) * H_r;

        x_s_1 = H_s_1*s + ruido_s;
        x_r = H_r*s + ruido_r;
        x_1 = [x_s_1; x_r];

        x_s_0 = ruido_s;
        x_0 = [x_s_0; x_r];

        detector_1_H0(t) = detector1(x_0,N,M,p);
        detector_1_H1(t) = detector1(x_1,N,M,p);

        detector_2_H0(t)  = detector2(x_0,N,M,p);
        detector_2_H1(t)  = detector2(x_1,N,M,p);

        detector_3_H0(t)  = detector3(x_0,N,M,p);
        detector_3_H1(t)  = detector3(x_1,N,M,p);

        detector_4_H0(t)  = detector4(x_0,N,M,p);
        detector_4_H1(t)  = detector4(x_1,N,M,p);
        
    end

save(filename, 'detector_1_H0', 'detector_1_H1', 'detector_2_H0', 'detector_2_H1', 'detector_3_H0', ...
    'detector_3_H1', 'detector_4_H0', 'detector_4_H1');

disp(['Resultados guardados en ' filename]);

end

