#include<stdio.h>
int main()
{
    double x[50],y[50],a[50],b[50],meanx=0,meany=0,sumab=0,suma2=0,sumb2=0,corr;
    int size,i;
    printf("Enter number of elements of the list");
    scanf("%d",&size);
    printf("\nEnter elements into the first list:");
    for(i=0;i<size;i++)
    {
        scanf("%lf",&x[i]);
        meanx=meanx+x[i];
    }
    meanx/=size;
    printf("\nEnter elements into the second list:");
    for(i=0;i<size;i++)
    {
        scanf("%lf",&y[i]);
        meany=meany+y[i];
    }
    meany/=size;
    for(i=0;i<size;i++)
    {
        a[i]=x[i]-meanx;
        b[i]=y[i]-meany;
        sumab=sumab+(a[i]*b[i]);
        suma2=suma2+(a[i]*a[i]);
        sumb2=sumb2+(b[i]*b[i]);
    }
    corr=sumab/sqrt(suma2*sumb2);
    printf("Correlation of the two list is %lf",corr);






}
