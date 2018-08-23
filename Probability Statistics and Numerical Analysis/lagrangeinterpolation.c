#include<stdio.h>
#include<conio.h>
#include<math.h>
int main()
{
    int n,i,j;
    double x[100],y[100],ans=0,num,temp=1,temp2=1;
    printf("\n***************************************Lagrange Interpolation************************************************\n");
    printf("Enter number of entries:\n");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        printf("Enter X and Y row-wise\n");
        scanf("%lf",&x[i]);
        scanf("%lf",&y[i]);
    }
    printf("\nYou have entered\n");
    printf("\nX\t\tY\t\t");
    for(i=0;i<n;i++)
    {
        printf("\n%lf\t%lf\n",x[i],y[i]);
    }
    printf("\nEnter value you want to find:");
    scanf("%lf",&num);
    for(i=0;i<n;i++)
    {
        temp=1;temp2=1;
        for(j=0;j<n;j++)
        {
            if(i!=j){
            temp*=(num-x[j]);
            temp2*=(x[i]-x[j]);
            }

        }
        ans+=(temp*y[i])/temp2;

    }
    printf("\ny%lf=%lf",num,ans);
    return 0;
}
