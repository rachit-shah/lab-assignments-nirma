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
int values[20];
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

void push(struct stack1 *opera,int val)
{
    if(opera->top==20)
    {
        cout<<"Stack overflow";
        exit(1);
    }
    opera->values[++opera->top]=val;
}

int eval(string expr)
{
struct stack1 oper;
oper.top=-1;
int op1,op2,value;
for(int i=0;i<expr.length();i++)
{
    if(isdigit(expr[i]))
    {
    push(&oper,(expr[i]-'0'));
    }
    else
    {
    op2=pop(&oper);
    op1=pop(&oper);
    switch(expr[i])
    {
    case '+':   value=op1+op2;
                break;
    case '-':   value=op1-op2;
                break;
    case '*':   value=op1*op2;
                break;
    case '/':   value=op1/op2;
                break;
    case '$':   value=pow(op1,op2);
                break;
    }
    push(&oper,value);
    }
}
return pop(&oper);
}

int main()
{
string expr;
cout<<"Enter the postfix expression :";
cin>>expr;
cout<<"the value of postfix expression is "<<eval(expr);
return 0;
}
