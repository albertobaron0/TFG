% Archivo: detector2_H1.m
function resultado = detector2(x,N,M,p)
    
    %algoritmo iterativo bajo H1
    S = 1/N * (x * x');
    Sigma = eye(2*M);
    T = 100;
    R = zeros(1,T);
    
    %inicializo R(t=1)
    R_1 = eye(2*M);
    R_1_p = -log(det(R_1)) - trace(R_1^-1 * S);
    R(1) = real(R_1_p);

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
        %diag(H_H)
        
        Sigma_tilde = 1/M * blkdiag(real(trace(X(1:M, 1:M)))*eye(M), real(trace(X(M+1:end, M+1:end)))*eye(M));
        
        Sigma = Sigma_tilde;
        
        R_1_gorro = H_H + Sigma;

        R_plot = -log(det(R_1_gorro)) - trace(R_1_gorro^-1 * S);

        R(t) = real(R_plot);
        
        crecimiento = abs((R(t) - R(t-1)) / R(t-1));

        if crecimiento < 0.0000001
            break;
        end
    
    end

    R = nonzeros(R);

    %bajo H0
    Sss = S(1:M, 1:M);
    sigma2_S_gorro = 1/M * trace(Sss);
    Rs_0 = sigma2_S_gorro * eye(M);
    
    Srr = S(M+1:end, M+1:end);
    [W_rr, lambda_rr] = eig(Srr);
    lambda_rr = diag(lambda_rr);
    [lambda_rr, orden_2] = sort(lambda_rr, 'descend');
    W_rr = W_rr(:, orden_2);

    sigma2_r = 1/(M-p) * (sum(lambda_rr(p+1:M)));
    
    d = max(lambda_rr(1:p) - sigma2_r, 0);
    D_0 = diag([d; zeros(M-p, 1)]);
    
    H_r_H_r_hermitico = W_rr * D_0 * W_rr';
    
    Rr_0 = H_r_H_r_hermitico + sigma2_r * eye(M);
    
    R_0 = blkdiag(Rs_0, Rr_0);

    resultado = det(R_0)/det(R_1_gorro); 
    resultado = real(resultado);