/*Name: Rachit Shah
  Roll No:14BCE110
  Program Name:Newton-Raphson Method of finding Roots
  Date:27/1/16
*/
#include<stdio.h>
#include<conio.h>
#include<math.h>
double x0,fx,f1x,f2x,lm,m,co[20],gx;
int i,deg,doa,flag=1;
double func(double m)
{
    fx=0;
    for(i=0;i<=deg;i++)
    {
        fx=fx+co[i]*pow(m,deg-i);
    }
    return fx;
}
double func1(double m)
{
    f1x=0;
    for(i=0;i<=deg;i++)
    {
        f1x=f1x+(deg-i)*co[i]*pow(m,deg-i-1);
    }
    return f1x;
}
double func2(double m)
{
    f2x=0;
    for(i=0;i<=deg;i++)
    {
        f2x=f2x+(deg-i)*(deg-i-1)*co[i]*pow(m,deg-i-2);
    }
    return f2x;
}
double sol(double x0)
{
    double x1=0;
    x1=x0-(func(x0)/func1(x0));
    return x1;
}
int main()
{
    printf("\n***************Newton-Raphson Method for finding Roots***********************\n\n\n");
    printf("Enter degree of polynomial:");
    scanf("%d",&deg);
    for(i=0;i<=deg;i++)
    {
        printf("Enter coefficient of polynomial %d:",i);
        scanf("%lf",&co[i]);
    }
    do{
    printf("Enter x0:");
    scanf("%lf",&x0);
    printf("\nf(x0)=%lf",func(x0));
    printf("\nf'(x0)=%lf",func1(x0));
    printf("\nf''(x0)=%lf",func2(x0));

    gx=((func(x0)*func2(x0))/(func1(x0)*func1(x0)));
    }
    while(gx>1||gx<(-1));
    printf("\nEnter upto decimal places(Degree of Accuracy):");
    scanf("%d",&doa);
    lm=x0;
    printf("\nNo.\tm");
    for(i=1;;i++)
    {
       m=sol(lm);
       printf("\n%d\t%lf",flag++,m);
        if((int)(lm*pow(10,doa))==(int)(m*pow(10,doa)))
            {break;}
        else{lm=m;}
    }
    printf("\n\n\nThe answer is %lf\n",m);

    /*printf("\n\n\nThe answer is %lf\n",func(x0));
    printf("\n\n\nThe answer is %lf\n",func1(x0));
    printf("\n\n\nThe answer is %lf\n",func2(x0));*/

    return 0;

}
