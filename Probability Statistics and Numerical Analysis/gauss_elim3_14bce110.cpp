/*
Name: Rachit Shah
Roll no:14BCE110
Program Name:- Gauss Elimination
Date:3/2/16
*/
#include<iostream>
#include<stdio.h>
#include<conio.h>
#include<math.h>
using namespace std;
int main()
{
    int n,i,j,k,temp;
    float a[10][10],c,d[10]={0};

    cout<<"No of equation ? ";
    cin>>n;
    cout<<"Coefficient of all : \n";
    for(i=0;i<n;i++)
    {
        cout<<"equation: "<<i+1<< "   ";
        for(j=0;j<=n;j++)
            cin>>a[i][j];
    }
    for(i=n-1;i>0;i--)
    {
        if(a[i-1][0]<a[i][0])
            for(j=0;j<=n;j++)
            {
                c=a[i][j];
                a[i][j]=a[i-1][j];
                a[i-1][j]=c;
            }
    }

    for(i=0;i<n;i++)
    {
        for(j=0;j<=n;j++)
            printf("%6.1f",a[i][j]);
        printf("\n");
    }

    for(k=0;k<n-1;k++)
        for(i=k;i<n-1;i++)
        {
            c= (a[i+1][k]/a[k][k]) ;

            for(j=0;j<=n;j++)
                a[i+1][j]-=c*a[k][j];
        }





    for(i=n-1;i>=0;i--)
    {
        c=0;
        for(j=i;j<=n-1;j++)
            c=c+a[i][j]*d[j];

        d[i]=(a[i][n]-c)/a[i][i];
    }

    for(i=0;i<n;i++)
    cout<<d[i]<<endl;


    getch();
    return 0;
}

