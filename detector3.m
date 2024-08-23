% Archivo: detector2_H1.m
function resultado = detector3(x,N,M,p)
    
    %algoritmo iterativo bajo H1
    S = 1/N * (x * x');
    Sigma = eye(2*M);
    T = 100;
    R_it1 = zeros(1,T);
    
    R_it1_1 = eye(2*M);
    R_it1_p = -log(det(R_it1_1)) - trace(R_it1_1^-1 * S);
    R_it1(1) = real(R_it1_p);

    for t = 2:T

        D = Sigma^-1;
        S_tilde = D^0.5 * S * D^0.5;
    
        %autovectores, autovalores
        [W_p_tilde, Lambda_p_tilde] = eig(S_tilde);
        Lambda_p_tilde = diag(real(Lambda_p_tilde));
        [Lambda_p_tilde, orden] = sort(Lambda_p_tilde, 'descend');
        W_p_tilde = W_p_tilde(:, orden);
        %cojo los p mayores
        Lambda_p_tilde = Lambda_p_tilde(1:p);
        W_p_tilde = W_p_tilde(:, 1:p);
        
        diferencia = Lambda_p_tilde - 1;
        diferencia_positiva = diag(max(diferencia, 0));
            
        H_H = sqrtm(Sigma) * W_p_tilde * diferencia_positiva * W_p_tilde' * sqrtm(Sigma);
        
        X = S - H_H;
        
        Sigma_tilde = real(diag(diag(X)));

        Sigma = Sigma_tilde;
        
        R_1_gorro = H_H + Sigma;

        R_plot = -log(det(R_1_gorro)) - trace(R_1_gorro^-1 * S);

        R_it1(t) = real(R_plot);
        
        crecimiento = abs((R_it1(t) - R_it1(t-1)) / R_it1(t-1));

        if crecimiento < 0.00001
            break;
        end
    
    end
    
    %bajo H0
    Sss = S(1:M, 1:M);
    diagonal_Sss = diag(Sss);
    Sigma_ss_gorro = diag(diagonal_Sss);
    Rs_0 = Sigma_ss_gorro;

    %ahora para Rr_0 repito el algoritmo iterativo con Srr (MxM)

    Sigma_2 = eye(M);
    R_it2 = zeros(1,T);
    S_rr = S(M+1:end, M+1:end);
    
    R_it2_1 = eye(M);
    R_it2_p = -log(det(R_it2_1)) - trace(R_it2_1^-1 * S_rr);
    R_it2(1) = real(R_it2_p);

   for t = 2:T

        D_2 = Sigma_2^-1;
        S_tilde_rr = D_2^0.5 * S_rr * D_2^0.5;
    
        %autovectores, autovalores
        [W_p_tilde_2, Lambda_p_tilde_2] = eig(S_tilde_rr);
        Lambda_p_tilde_2 = diag(real(Lambda_p_tilde_2));
        [Lambda_p_tilde_2, orden_2] = sort(Lambda_p_tilde_2, 'descend');
        W_p_tilde_2 = W_p_tilde_2(:, orden_2);
        %cojo los p mayores
        Lambda_p_tilde_2 = Lambda_p_tilde_2(1:p);
        W_p_tilde_2 = W_p_tilde_2(:, 1:p);

        diferencia_2 = Lambda_p_tilde_2 - 1;
        diferencia_positiva_2 = diag(max(diferencia_2, 0));
            
        H_H_2 = sqrtm(Sigma_2) * W_p_tilde_2 * diferencia_positiva_2 * W_p_tilde_2' * sqrtm(Sigma_2);
        
        X_2 = S_rr - H_H_2;
        
        Sigma_tilde_2 = real(diag(diag(X_2)));

        Sigma_2 = Sigma_tilde_2;
        
        R_r0_gorro = H_H_2 + Sigma_2;

        R_plot_2 = -log(det(R_r0_gorro)) - trace(R_r0_gorro^-1 * S_rr);

        R_it2(t) = real(R_plot_2);
        
        crecimiento_2 = abs((R_it2(t) - R_it2(t-1)) / R_it2(t-1));

        if crecimiento_2 < 0.00001
            break;
        end
    
   end

   R_it1 = nonzeros(R_it1);
   R_it2 = nonzeros(R_it2);

   R_0_gorro = blkdiag(Rs_0, R_r0_gorro);

   resultado = det(R_0_gorro)/det(R_1_gorro); 
   resultado = real(resultado);