clear;
close;
clc;
x=[1 0 1 0 0 1 1 0]

z=0;
for i=1:length(x)
    
    
    t=[z:0.5:z+0.5]
        a=gca();
        a.data_bounds=[0,-1.5;length(x),1.5]
        a.grid=[1,-1]
       
        if(x(i)==1)
            plot(t,1)
        else
            plot(t,-1)
        end
    t=[z+0.5:0.5:z+1]
    plot(t,0)
    
    z=z+1;
end