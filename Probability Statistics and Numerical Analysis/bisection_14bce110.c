/*Name: Rachit Shah
  Roll No:14BCE110
  Program Name:Bisection Method of finding Roots
  Date:13/1/16
*/
#include<stdio.h>
#include<conio.h>
#include<math.h>
double co[10],m,a,b,f,lm;
int deg,i,dec;
double funct(double m)
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
    printf("Enter co-efficients of the polynomial of degree %d",deg);
    for(i=0;i<=deg;i++)
    {
        scanf("%lf",&co[i]);
    }
    //printf("%lf",funct(co,2));
    printf("Enter range: Lowerbound(a) and Upperbound(b) respectively:");
    scanf("%lf %lf",&a,&b);
    printf("Enter upto how many decimal places you want it to be accurate:");
    scanf("%d",&dec);
    printf("A\t\tB\t\tm\t\tf(m)\n");
    m=(a+b)/2;
    if(funct(m)<0)
        {
            a=m;
        }
    else{
            b=m;
        }
        lm=m;
        //printf("%f\n",mid[0]);
    for(i=1;;i++){
        m=(a+b)/2;
        printf("\n%lf\t%lf\t%lf\t%lf\n",a,b,m,funct(m));
        //printf("%f\n",mid[i]);
        //printf("%f",funct(co,mid[i]));
        if(funct(m)<0)
        {
            a=m;
            //printf("a\n");
        }
        else{
            b=m;
            //printf("b\n");
        }
        if((int)(lm*pow(10,dec))==(int)(m*pow(10,dec)))
            {break;}
        else{lm=m;}
    }
    printf("\n\nThe answer is %lf\n",m);

    return 0;
}
