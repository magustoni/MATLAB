%%NewtonRaphson(Punto inicial,Tolerancia,Numero maximo de iteraciones)
function NR(x,Tol,N)

    c=input('Introduce la funcion\n','s');
    y=inline(c);
    dc=input('Introduce la derivada de la funcion\n','s');
    dy=inline(dc);
    
    %%%%%%%%%%%%%%%
    Error=abs(y(x));
    i=0;
    %%%%%%%%%%%%%%%
    
    while (Error>Tol && i<N)
        
        x=x-y(x)/dy(x);
        Error=abs(y(x));
        i=i+1;
        
    end
    
    
    if (Error>Tol)
        
        fprintf('No se ha podido encontrar una solucion con un error menor al requerido\n')
        
    else
        
        x
        Error
        N_iteraciones=i
    
    end
    
    
    
    