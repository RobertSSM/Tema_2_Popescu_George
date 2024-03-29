
D=17;
m=1/17;
t=-80:0.1:80;
P=40;
c=1;
s=zeros(1,length(t));
w0=2*pi/P;

j=0;

for i=40:0.1:120
    j=j+1;
    c=floor(i/P);
    i=i-c*P;
    
    if(j==1)
        s(1,j+800)=m*(t(j+800));
    else if (i<=17)
            s(1,j+800)=1;
        else if (i>=17)
                s(1,j+800)=0;
            end
        end
    end
end

j=0;

for i=40:0.1:120
    j=j+1;
    c=floor(i/P);
    i=i-c*P;
    
    if(j==1)
        s(1,j)=m*(t(j+800));
    else if (i<=17)
            s(1,j)=1;
        else if (i>=17)
                s(1,j)=0;
            end
        end
    end
end


N=50;

p=-9:1:9;

Ak=zeros(length(2*p));
Ak(10)=0.5;

for k=1:2:9
       Ak(k+10)=2*abs(1/(k*pi)*sin(k*pi*17/40));
        Ak(10-k)=Ak(k+10);
end

r=linspace(-80,80,161);
f=0*r;

for k=-N:1:N
    
   if (k==0)
       continue;
   end
   
   C_k=1/(k*pi)*sin(k*pi*17/40);

   f_k=C_k*exp(1j*k*w0*r);
   f=f+f_k;
   
    
end



figure (1)

plot(t,s),grid;

figure (2)

stem(p,Ak),grid;

figure (3)

plot(r,f),grid;