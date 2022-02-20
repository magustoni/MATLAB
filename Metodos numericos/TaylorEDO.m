function TaylorEDO(t0,t1,y0,n,k)
    %TaylorEDO(t0,t1,y0,n,k)
    %%t0 valor inicial, t1 valor final, y0=y(t0), n pasos, k orden

    if(k>1)
        
        syms t;
        syms y;
        
        fl=input('¿Se conoce la solucion exacta?(S/N)\n','s');
                    
        for i=1:k
            fprintf('Introduce la %dª derivada en forma:',i);
            dy(i)=input(' y=f(t,y)\n');
        end
        
        h=(t1-t0)/n; 
        ts=t0:h:t1;
        y1=y0;
        
        if fl=='S' || fl=='s'
            
            dy_ex=input('Introduce la solucion exacta\n');
        
            for i=1:n
                    
                t=ts(i);
                y=y0;
                y1=y0;
                    for j=1:k
                        y1=y1+((h^j)/prod(1:j))*eval(dy(j));
                    end
                y0=y1; 
                
                subplot(1,2,1)
                plot(t,y,'*r',t,eval(dy_ex),'*g')
                hold on
                subplot(1,2,2)
                plot(t,abs(y-eval(dy_ex)),'*m')
                hold on
    
                %%Descomentar para observar avance del metodo
                %fprintf('\n%2.0f%10.6f%10.6f\n',i,t1,y1);      
            end
            
            t=ts(size(ts,2));
            Error=abs(eval(dy_ex)-y1)
            
        else
        
            for i=1:n
                    
                t=ts(i);
                y=y0;
                y1=y0;
                    for j=1:k
                        y1=y1+((h^j)/prod(1:j))*eval(dy(j));
                    end
                y0=y1;  
    
                plot(t,y,'*r')
                hold on
                
                %%Descomentar para observar avance del metodo
                %fprintf('\n%2.0f%10.6f%10.6f\n',i,t1,y1);
        
            end
        end
        
        fprintf('\n y(t1)  =%10.6f\n',y1);
        
    else
        
        fprintf('Necesaria k > 1, para k = 1 usar Euler(y0,t0,t,n)\n');
                
    end