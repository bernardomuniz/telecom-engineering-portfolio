%Aula 3 - Método da bissecção 

%Método da bissecção - Achar uma raiz de uma função definido um intervalo de existencia dessa raiz
%x^2 = 4 => x² - 4 = 0 (0 - 3 / 02.5)

erro = 10^-4;
f= @(x) x.^2 - 4; %função a ser verificada
xi = 0; % intervalo inicial da existencia da raiz
xf = 3; %intervalo final da existencia da raiz
Fi = f(xi);
Ff= f(xf);
if(Ff * Fi < 0)
    x = (xi + xf)/2;
end

while(abs(xf - xi) > erro)
    if(Fi < 0 && Ff > 0 && f(x) < 0)
        xi = x;
    end
    if(Fi < 0 && Ff > 0 && f(x) > 0)
        xf = x;
    end
    
    if(Fi > 0 && Ff < 0 && f(x) > 0)
        xi = x;
    end
    if(Fi > 0 && Ff < 0 && f(x) < 0)
        xf = x;
    end
    x = (xi + xf)/2;

end

x;