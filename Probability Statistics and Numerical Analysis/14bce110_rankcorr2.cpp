#include<bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cout<<"Enter no. of entries"<<endl;
    cin>>n;
    double x[n],y[n],z,sum=0,p,a[n],b[n];
    for(int i=0;i<n;i++)
    {
        cout<<"Enter X and Y"<<endl;
        cin>>x[i]>>y[i];
        a[i]=x[i];
        b[i]=y[i];
    }
    sort(a,a+n);
    sort(b,b+n);
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            if(x[i]==a[j]){
                x[i]=n-j+1;break;
            }
        }
        for(int j=0;j<n;j++)
        {
            if(y[i]==b[j]){
                y[i]=n-j+1;break;
            }
        }
    }
    for(int i=0;i<n;i++)
    {
        z=x[i]-y[i];
        z=z*z;
        sum=sum+z;
    }
    p=1-((6*sum)/(n*(n*n-1)));
    cout<<"The rank correlation is "<<p<<endl;
    return 0;
}
