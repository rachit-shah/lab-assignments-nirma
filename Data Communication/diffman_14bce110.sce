clear;
close;
clc;
x=[1 0 1 0 0 1 1 0]

z=0;q=1;
for i=1:length(x)
    
    
    t=[z:0.5:z+0.5]
        a=gca();
        a.data_bounds=[0,-1.5;length(x),1.5]
        a.grid=[1,-1]
       
        if(x(i)==0)
            if(q==1)
                q=-1;
            else
                q=1;
            end
            plot(t,q)
        else
            
            plot(t,q)
        end
    t=[z+0.5:0.5:z+1]
    if(q==1)
        q=-1;
    else
        q=1;
    end
    plot(t,q)
    
    z=z+1;
end