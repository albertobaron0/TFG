% Archivo: detector1.m
function resultado = detector1(x,N,M,p)

    S = 1/N * (x * x');
    Sss = S(1:M, 1:M);
    Srr = S(M+1:end, M+1:end);
    
    autovalores_S = eig(S);
    autovalores_S_orden = sort(autovalores_S, 'descend');
    sigma_hat_1 = 1/(2*M - p) * sum(autovalores_S_orden(p+1:2*M));
    
    autovalores_Srr = eig(Srr);
    autovalores_Sss = eig(Sss);
    autovalores_Sss_orden = sort(autovalores_Sss, 'descend');
    autovalores_Srr_orden = sort(autovalores_Srr, 'descend');

    pr = p;
    sigma_hat_0 = 1/(2*M - pr) * (sum(autovalores_Sss_orden(1:M)) + sum(autovalores_Srr_orden(pr+1:M)));
    
    while autovalores_Srr_orden(pr) < sigma_hat_0
           if pr>1
                pr = pr - 1;
                sigma_hat_0 = 1/(2*M - pr) * (sum(autovalores_Sss_orden(1:M)) + sum(autovalores_Srr_orden(pr+1:M)));
           else
               break
           end
    end

    numerador = (prod(autovalores_Srr_orden(1:pr))) * sigma_hat_0^(2*M - pr) ;

    denominador = (prod(autovalores_S_orden(1:p))) * sigma_hat_1^(2*M - p) ;
    
    resultado = numerador/denominador;
end