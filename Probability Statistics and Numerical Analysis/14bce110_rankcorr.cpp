#include<bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cout<<"Enter no. of entries"<<endl;
    cin>>n;
    double x,y,z,sum=0,p;
    for(int i=0;i<n;i++)
    {
        cout<<"Enter X and Y"<<endl;
        cin>>x>>y;
        z=x-y;
        z=z*z;
        sum=sum+z;

    }
    p=1-((6*sum)/(n*(n*n-1)));
    cout<<"The rank correlation is "<<p<<endl;
    return 0;
}
