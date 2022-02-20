function GaussSeidel(Tol,N)
    
    A=input('Introduce la matriz de coeficientes del sistema (A)\n');
    b=input('Introduce la matriz de los terminos independientes (b)\n');
    X=input('Introduce los valores iniciales de las variables\n');
    M=diag(diag(A));
    
    %Las siguientes lineas son unicamente comprobaciones y modificaciones
     %en los datos introducidos
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(size(b,1)<size(b,2))
        b=b';
    end
    if(size(X,1)<size(X,2))
        X=X';
    end
    if(size(X,1)~=size(A,1))
       fprintf('El numero de valores iniciales no coincide con el numero de incognitas en el sistema\n');
       while(size(X,1)~=size(A,1))
           b=input('Introduce unos valores iniciales correctos\n');
           if(size(X,1)<size(X,2))
               X=X';
           end
       end
    end
    if(size(b,1)~=size(A,1))
       fprintf('El numero de terminos independientes no coincide con el numero de incognitas en el sistema\n');
       while(size(b,1)~=size(A,1))
           b=input('Introduce unos terminos independientes correctos\n');
           if(size(b,1)<size(b,2))
               b=b';
           end
       end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    

    i=0;
    
    if(rank(A)~=rank([A b]))
        fprintf('El sistema es incompatible\n')
    else
     if(abs(det(A))>0.01 && abs(det(M))>0.01)
         Tj=(M^-1)*(M-A);
         Error=Inf;
         while (i<N && Error>Tol)
             X=Tj*X+(M^-1)*b;
             Error=norm(A*X-b);
             i=i+1;
         end
         if(norm(eig(Tj)) >= 1 && (Error>1 || isnan(Error)))
         fprintf('El metodo de Jacobi no converge para este sistema o valores iniciales\n')
         else
             if(Error>Tol)
                 fprintf('No se ha podido encontrar una solucion con un error menor al pedido en las iteraciones especificadas\n')
                X
                Error
             else
                 X
                Error
                N_iteraciones=i
             end
         end
     else
         if(abs(det(A))<=0.01)
         fprintf('La matriz de coeficientes es singular, el sistema es indeterminado\n')
         else
         fprintf('El metodo no se puede aplicar a este sistema, pruebe a cambiar las ecuaciones de orden\n')
         end
     end
    end

