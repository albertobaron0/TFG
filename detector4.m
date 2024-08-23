% Archivo: detector4.m
function resultado = detector4(x,N,M,p)

    S = 1/N * (x * x');
    Sss = S(1:M, 1:M);
    Srr = S(M+1:end, M+1:end);
    Ssr = S(1:M, M+1:end);

    C = Sss^(-0.5) * Ssr * Srr^(-0.5)';
    [~, K, ~] = svd(C);
    k = diag(K);
    
    resultado = 1;
    for i = 1:p
        resultado = resultado * 1/(1 - k(i)^2);
    end
end