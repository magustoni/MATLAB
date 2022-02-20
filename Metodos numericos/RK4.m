function RK4(t0,t1,y0,n)
    %RK4(t0,t1,y0,n)
    %%t0 valor inicial, t1 valor final, y0=y(t0), n numero de pasos
    
    syms t;
    syms y;
    dy=input('Introduce la ecuacion diferencial en forma: y´=f(t,y)\n');
    fl=input('¿Se conoce la solucion exacta(S/N)?\n','s');
    
    h=(t1-t0)/n;
    ts=t0:h:t1;
    y1=y0;
    
    if fl=='S' || fl=='s'
        
        dy_ex=input('Introduce la solucion exacta\n');
        
        for i=1:n
        
            t=ts(i);
            y=y0;
            
                f1=eval(dy);
                t=ts(i)+h/2;
                y=y0+f1*h/2;
                f2=eval(dy);
                y=y0+f2*h/2;
                f3=eval(dy);
                t=ts(i)+h;
                y=y0+f3*h;
                f4=eval(dy);
                
                
            y1=y0+h*(f1+2*f2+2*f3+f4)/6;
            y0=y1;
            
            subplot(1,2,1)
            plot(t,y,'.r',t,eval(dy_ex),'.g')
            hold on
            subplot(1,2,2)
            plot(t,abs(y-eval(dy_ex)),'.m')
            hold on
            
        end
                
        t=ts(size(ts,2));
        Error=abs(eval(dy_ex)-y1)
        
    else
        
        for i=1:n
            
            t=ts(i);
            y=y0;
            
                f1=eval(dy);
                t=t+P*h;
                y=y+Q*h*f1;
                f2=eval(dy);
                
            y1=y0+A*h*f1+B*h*f2;
            y0=y1; 
            
        end
        
    end
        
        
fprintf('\ny(t1)=  %10.16f\n',y1);   
        