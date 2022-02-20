
function PF(x,Tol,N)
%%PuntoFijo(Punto inicial, Tolerancia, Numero maximo de iteraciones)

g=input('Introduce la funcion\n','s');
y=inline(g);

%%%%%%%%%%%%%%%%
Error=Inf;
i=1;
%%%%%%%%%%%%%%%%

while (Error>Tol && i<N+1)
    
    xold=x;
    x=y(x);
    Error=abs(xold-x);
    
   %%fprintf(' p%d=%f\n Error%d=%f\n',i,x,i,Error) 
    %Activar esta línea si se desea ver la evolución entre iteraciones y sus errores
    
    i=i+1;
    
end

if (Error>Tol)
    
    fprintf('No se ha podido encontrar un punto fijo con un error entre iteraciones menor al requerido\n')
    
else
    
    if(x==Inf || x==-Inf)
        
        fprintf('El metodo diverge o la funcion no posee puntos fijos\n')
        
    else
        
        x
        Error
        N_iteraciones=i-1
        
    end
    
end
