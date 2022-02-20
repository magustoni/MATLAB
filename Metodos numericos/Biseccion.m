function Biseccion(a,b,Tol,N)
%%Biseccion(Intervalo inicial (a,b),Tolerancia,Numero maximo de iteraciones)

    g=input('Introduce la funcion\n','s');
    y=inline(g);
    
    %%%%%%%%%%%%%%%%
    x=(a+b)/2;
    Error=abs(y(x));
    i=1;
    c=a;
    d=b;
    %%%%%%%%%%%%%%%%
    
while(Error>Tol && i<N+1)
    
    x=(c+d)/2;
    
    if y(x)*y(c)<0
        d=x;
    else
        c=x;
    end 
    
    Error=abs(y(x));
    
    %%fprintf(' p%d=%f\n Error%d=%f\n',i,x,i,Error) 
     %Activar esta línea si se desea ver la evolución entre iteraciones y sus errores
     
    i=i+1;

end


if (Error>abs(b-x) || Error>abs(a-x))
    
    fprintf('No se ha podido encontrar una solucion en el intervalo dado\n')
    
else
    
    if (Error>Tol)
        
        fprintf('No se ha podido encontrar una solucion con un error menor al requerido\n')
        
    else
    
    x
    Error
    N_iteraciones=i-1
    
    end

end