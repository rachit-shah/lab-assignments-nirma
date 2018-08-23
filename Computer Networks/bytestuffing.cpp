#include<bits/stdc++.h>
using namespace std;

int main()
{
    char flag='#';
    char esc='$';
    string data;
    cin>>data;
    string output="#";
    for(int i=0;i<data.size();i++)
    {
        if(data[i]==flag)
        {
            output+=esc;
            output+=flag;
        }
        else if(data[i]==esc)
        {
            output+=esc;
            output+=esc;
        }
        else
        {
            output+=data[i];
        }
    }
    output+=flag;
    cout<<output;
    return 0;
}
