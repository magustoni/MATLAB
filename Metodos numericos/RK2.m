function RK2(t0,t1,y0,n)
    %RK(t0,t1,y0,n)
    %%t0=valor inicial, t1=valor final, y0=y(t0), n numero de pasos
    
    %%%Euler --> A = 1 B = 0
    %%%Cauchy (EulerMod) --> A = 0 B = 1 P = Q = 0.5
    %%%Heun --> A = B = 0.5 P = Q = 1
    
    A=0;B=0;P=0;Q=0;
    while (A+B~=1)
        A=input("A =");
        B=input("B =");
    end
    while(B*P~=0.5)
        P=input("P =");
    end
    while(B*Q~=0.5)
        Q=input("Q =");
    end
    
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
                t=t+P*h;
                y=y+Q*h*f1;
                f2=eval(dy);
                
            y1=y0+A*h*f1+B*h*f2;
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