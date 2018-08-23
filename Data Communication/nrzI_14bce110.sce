x=[1 0 1 1 1 0 0 1]
if(x(1)==1)
    x(1)=-1;
else
    x(1)=1;
end
for i=2:8
    if(x(i)==1&x(i-1)==1)
        x(i)=-1;
        
    elseif(x(i)==1&x(i-1)==-1)
        x(i)=1;
    elseif(x(i)==0)
        x(i)=x(i-1);
     end
end
for i=1:8
    plot2d2([1:8],x);
end;
a=gca();
a.x_location="middle";