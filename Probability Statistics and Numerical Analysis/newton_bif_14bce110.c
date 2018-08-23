#include<stdio.h>
#include<conio.h>
#include<math.h>
double fact(double x)
{
    if(x==1)
        return 1;
    return (x)*fact(x-1);
}
int main()
{
    int n,i,j;
    double arr[100][100],h,num,p,yp,z,z2;
    printf("\n***************************************Newton's Backward Interpolation************************************************\n");
    printf("Enter number of entries:\n");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        printf("Enter X and Y row-wise\n");
        scanf("%lf",&arr[i][0]);
        scanf("%lf",&arr[i][1]);
    }
    for(i=2;i<n+1;i++)
    {
        for(j=0;j<n-i+1;j++)
        {
            arr[j][i]=arr[j+1][i-1]-arr[j][i-1];
        }
    }
    printf("\n********************************Forward Difference Table*************************************\n");
    printf("\nX\t\tY\t\t");
    for(i=1;i<n;i++)
    {
        printf("^%dY\t\t",i);
    }
    printf("\n");
    for(i=0;i<n;i++)
    {
        for(j=0;j<n-i+1;j++)
        {
            printf("%lf\t",arr[i][j]);
        }
        printf("\n");
    }
    h=arr[1][0]-arr[0][0];
    printf("h=%lf",h);
    printf("\nEnter x if you want to calculate f(x):");
    scanf("%lf",&num);
    p=(num-arr[n-1][0])/h;
    printf("\np=%lf",p);
    //printf("%lf",fact(5));
    z=p;
    z2=p;
    for(i=1;i<n;i++)
    {
        yp=yp+((z*arr[n-i-1][i+1])/fact(i));
        z2=z2+1;
        z=z*z2;
    }
    yp=yp+arr[n-1][1];
    printf("\nYp=%lf",yp);
    return 0;
}
