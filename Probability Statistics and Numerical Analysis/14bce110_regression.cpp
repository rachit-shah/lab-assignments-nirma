#include<bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cout<<"Enter number of entries:"<<endl;
    cin>>n;
    double x[n],y[n],sumx=0,sumy=0,meanx,meany,diff1=0,diff2=0,temp,m,c;
    for(int i=0;i<n;i++)
    {
        cout<<"Enter X and Y row-wise"<<endl;
        cin>>x[i]>>y[i];
        sumx=sumx+x[i];
        sumy=sumy+y[i];
    }
    meanx=sumx/n;
    meany=sumy/n;
    for(int i=0;i<n;i++)
    {
        diff1=diff1+((x[i]-meanx)*(y[i]-meany));
        diff2=diff2+((x[i]-meanx)*(x[i]-meanx));
    }
    m=diff1/diff2;
    c=meany-m*meanx;
    cout<<"Regression line is given by: y="<<m<<"x+"<<c<<endl;
    cout<<"Enter value of x for which you want to calculate y"<<endl;
    cin>>temp;
    cout<<"y="<<m*temp+c<<endl;
    return 0;
}
