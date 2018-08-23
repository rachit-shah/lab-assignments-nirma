/*Name: Rachit Shah
  Roll No:14BCE110
  Program Name:False Position Method of finding Roots
  Date:20/1/16
*/
#include<stdio.h>
#include<conio.h>
#include<math.h>
double a,b,fa,fb,m,fm,co[20],f,lm;
int i,deg,doa;
double func(double m)
{
    f=0;
    for(i=0;i<=deg;i++)
    {
        f=f+co[i]*pow(m,deg-i);
    }
    return f;
}
int main()
{
    printf("Enter degree of polynomial:");
    scanf("%d",&deg);
    for(i=0;i<=deg;i++)
    {
        printf("Enter coefficient of polynomial %d:",i);
        scanf("%lf",&co[i]);
    }
    printf("Enter starting interval:");
    scanf("%lf",&a);
    printf("Enter ending interval:");
    scanf("%lf",&b);
    printf("Enter upto decimal places(Degree of Accuracy):");
    scanf("%d",&doa);
    printf("A\t\tf(A)\t\tB\t\tf(B)\t\tm\t\tf(m)\n");
    m=(a*func(b)-b*func(a))/(func(b)-func(a));
    //printf("%lf",mi[0]);
    if(func(m)<0)
    {
        a=m;
    }
    else
    {
        b=m;
    }
    lm=m;
    for(i=1;;i++)
    {
       m=(a*func(b)-b*func(a))/(func(b)-func(a));
       printf("\n%lf\t%lf\t%lf\t%lf\t%lf\t%lf",a,func(a),b,func(b),m,func(m));
       if(func(m)<0)
        {
            a=m;
        }
        else
        {
            b=m;
        }
        if((int)(lm*pow(10,doa))==(int)(m*pow(10,doa)))
            {break;}
        else{lm=m;}
    }
    printf("\n\n\nThe answer is %lf\n",m);

    return 0;

}
