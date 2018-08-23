#include<bits/stdc++.h>
using namespace std;

int main()
{
    string data;
    string sol;
    cin>>data;
    int j=0;
    int count=0;
    int n=data.size();
    //cout<<n;
    for(int i=0;i<n;i++)
    {
        if(data[i]=='0')
         {
             count=0;
             sol+='0';
         }
         else if(data[i] == '1')
         {
             count++;
             sol+='1';
         }
        if(count==5)
        {
            sol+='0';
        }

    }
    cout<<"Output is: "<<sol;

    return 0;
}
