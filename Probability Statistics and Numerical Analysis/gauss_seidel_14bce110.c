/*
Name: Rachit Shah
Roll no:14BCE110
Program Name:- Gauss Jacobi
Date:9/3/16
*/

#include<stdio.h>
#include<math.h>
double mat[10][10];
double fx(double y,double z){
        double temp;
        temp=(mat[0][3]-(mat[0][1]*y)-(mat[0][2]*z))/mat[0][0];
        return temp;
}
double fy(double x,double z){
        double temp;
        temp=(mat[1][3]-(mat[1][0]*x)-(mat[1][2]*z))/mat[1][1];
        return temp;
}
double fz(double x,double y){
        double temp;
        temp=(mat[2][3]-(mat[2][0]*x)-(mat[2][1]*y))/mat[2][2];
        return temp;
}
double fabs(double value){
    if(value<0)
        return (-value);
    else
        return (value);
}
int main(){
    int i,j,doa,max=0;
    double x=0,y=0,z=0,temp,lx,ly,lz;
    //printf("Enter size of matrix");
    //scanf("%d",&size);
    printf("Enter elements into the matrix");
    for(i=0;i<3;i++)
    {
        for(j=0;j<4;j++)
        {
            scanf("%lf",&mat[i][j]);
        }
    }
    printf("You have given the following matrix:");
    for(i=0;i<3;i++)
    {
        for(j=0;j<4;j++){
            printf("%lf  ",mat[i][j]);
        }
        printf("\n\n");
    }
   for(i=0;i<3;i++){
        if(mat[i][0]>max){
            j=i;
            max=mat[i][0];
        }

    }
    for(i=0;i<4;i++){
        temp=mat[0][i];
        mat[0][i]=mat[j][i];
        mat[j][i]=temp;
    }
    j=0,max=0;
    for(i=0;i<3;i++){
        if(mat[i][1]>max){
            j=i;
            max=mat[i][1];
        }

    }
    for(i=0;i<4;i++){
        temp=mat[1][i];
        mat[1][i]=mat[j][i];
        mat[j][i]=temp;
    }
    j=0,max=0;
    for(i=0;i<3;i++){
        if(mat[i][2]>max){
            j=i;
            max=mat[i][2];
        }

    }
    for(i=0;i<4;i++){
        temp=mat[2][i];
        mat[2][i]=mat[j][i];
        mat[j][i]=temp;
    }
    printf("\nfollowing is the checked matrix:\n");
    for(i=0;i<3;i++){
            for(j=0;j<4;j++){
            printf(" %lf",mat[i][j]);
            }
       printf("\n");
    }

    printf("Enter the deg of accuracy\n");
    scanf("%d",&doa);
    doa=-doa;

    //printf("x%lf  ",fx(0,0));
    //printf("y%lf  ",fy(0,0));
    //printf("z%lf  ",fz(0,0));
    printf("\ni\tx(i+1)\t\ty(i+1)\t\tz(i+1)\n");
    i=0;
    while((fabs(fx(y,z)-x) > pow(10,doa)) || (fabs(fy(x,z)-y) > pow(10,doa)) || (fabs(fz(x,y)-z) > pow(10,doa)) ){
        x=fx(ly,lz);
        y=fy(lx,lz);
        z=fz(lx,ly);
        printf("%d\t%lf\t%lf\t%lf\n",i++,x,y,z);
    }
    printf("\n\nx=%lf\ty=%lf\tz=%lf\n",x,y,z);
    /*for(i=0;;i++)
    {
       x=fx(y,z);
       y=fy(x,z);
       z=fz(x,y);
       printf("\n%d\t%lf\t%lf\t%lf",i,x,y,z);

        if((int)(lm*pow(10,doa))==(int)(m*pow(10,doa)))
            {break;}
        else
        {
            lx=x;
            ly=y;
            lz=z;
        }
    }*/
    return 0;
}
