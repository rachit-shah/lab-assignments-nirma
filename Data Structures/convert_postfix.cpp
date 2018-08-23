/*Name: Rachit Shah
  Roll No:14BCE110
  Program Name:Evaluating Postfix Expression
  Date:29/1/16
*/
#include<iostream>
#include<cctype>
#include<cmath>
#include<cstdlib>

using namespace std;

struct stack1{
int top;
char values[20];
};

int pop(struct stack1 *opera)
{
    if(opera->top==-1)
    {
        cout<<"Stack Underflow";
        exit(1);
    }
    return opera->values[opera->top--];
}

void push(struct stack1 *opera,char val)
{
    if(opera->top==20)
    {
        cout<<"Stack overflow";
        exit(1);
    }
    opera->values[++opera->top]=val;
}

int prec(char a,char b)
{
    int val;
    switch(a)
    {
        case '+':   if(b=='+' || b=='-')
                        val=0;
                    else
                        val=1;
                    break;
        case '-':   if(b=='+' || b=='-')
                        val=0;
                    else
                        val=1;
                    break;
        case '*':   if(b=='$' || b=='(')
                        val=1;
                    else
                        val=0;
                    break;
        case '/':   if(b=='$' || b=='(')
                        val=1;
                    else
                        val=0;
                    break;
        case '$':   if(b=='$' || b=='(')
                        val=1;
                    else
                        val=0;
                    break;
        case '(':   val=1;
                    break;
    }
    return val;
}
string conv(string expr)
{
    string postfix;
    struct stack1 oper;
    oper.top=-1;
    for(int i=0;i<expr.length();i++)
    {
        if(isalpha(expr[i]))
        {
            postfix+=expr[i];
            //cout<<postfix<<" ";
        }
        else
        {
            if(oper.top==-1 || expr[i]=='(')
                push(&oper,expr[i]);
            else if(expr[i]==')')
            {
                char temp=pop(&oper);
                while(temp!='(')
                {
                    postfix+=temp;
                    temp=pop(&oper);
                }
            }
            else
            {
                while(oper.values[oper.top]!=expr[i])
                {
                    if(prec(oper.values[oper.top],