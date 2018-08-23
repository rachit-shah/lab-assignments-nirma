x=[1 0 1 1 1 0 0 1]
for i=1:8
    if(x(i)==1)
        x(i)=-1;
    else
        x(i)=1;
     end;
end;
for i=1:8
    plot2d2([1:8],x);
end;
a=gca();
a.x_location="middle";