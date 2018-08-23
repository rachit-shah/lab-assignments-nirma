#include <iostream>
using namespace std;

struct node
{
    int degree,cons;
    node* next;
};
node *top1 = NULL;
node *top2 = NULL;
node *top3 = NULL;
void push1(int d,int c)
{
    node* tmp = new node;
    tmp->degree = d;
    tmp->cons = c;
    if(top1==NULL)
    {
        top1 = tmp;
        top1->next = NULL;
    }
    else
    {
        tmp->next = top1;
        top1 = tmp;
    }
}
void push2(int d,int c)
{
    node* tmp = new node;
    tmp->degree = d;
    tmp->cons = c;
    if(top2==NULL)
    {
        top2 = tmp;
        top2->next = NULL;
    }
    else
    {
        tmp->next = top2;
        top2 = tmp;
    }
}
void push3(int d,int c)
{
    node* tmp = new node;
    tmp->degree = d;
    tmp->cons = c;
    if(top3==NULL)
    {
        top3 = tmp;
        top3->next = NULL;
    }
    else
    {
        tmp->next = top3;
        top3 = tmp;
    }
}
int main()
{
    int degree,cons;
    cout<<"\n Enter the 1st polynomial and enter a 0 to stop : ";
    do
    {
        cout<<"\n Enter the constant : ";
        cin>>cons;
        cout<<"\n Enter the degree : ";
        cin>>degree;
        push1(degree,cons);
    }while(degree!=0);
    cout<<"\n Enter the 2nd polynomial and enter a 0 to stop : ";
    do
    {
        cout<<"\n Enter the constant : ";
        cin>>cons;
        cout<<"\n Enter the degree : ";
        cin>>degree;
        push2(degree,cons);
    }while(degree!=0);
    cout<<"Ans is : ";
    node* i = top1;
    node* j = top1;
    while(i!=NULL)  //sorting 1st polynomial.
    {
        j = top1;
        while((j->next)!=NULL)
        {
            if(j->degree<(j->next)->degree)
            {
                int tmp = j->degree;
                j->degree = (j->next)->degree;
                (j->next)->degree = tmp;

                tmp = j->cons;
                j->cons = (j->next)->cons;
                (j->next)->cons = tmp;
            }
            j = j->next;
        }
        i = i->next;
    }
    i = top2;
    j = top2;
    while(i!=NULL)  //sorting 2nd polynomial.
    {
        j = top2;
        while((j->next)!=NULL)
        {
            if(j->degree<(j->next)->degree)
            {
                int tmp = j->degree;
                j->degree = (j->next)->degree;
                (j->next)->degree = tmp;

                tmp = j->cons;
                j->cons = (j->next)->cons;
                (j->next)->cons = tmp;
            }
            j = j->next;
        }
        i = i->next;
    }
    i = top1;
    j = top2;
    while(i!=NULL&&j!=NULL)
    {
        if(i->degree==j->degree)
        {
            push3(i->degree,i->cons+j->cons);
            i = i->next;
            j = j->next;
        }
        else if(i->degree>j->degree)
        {
            push3(i->degree,i->cons);
            i = i->next;
        }
        else
        {
            push3(j->degree,j->cons);
            j = j->next;
        }
    }
    while(i!=NULL)
    {
        push3(i->degree,i->cons);
        i = i->next;
    }
    while(j!=NULL)
    {
        push3(j->degree,j->cons);
        j = j->next;
    }
    i = top3;
    j = top3;
    while(i!=NULL)  //sorting result polynomial.
    {
        j = top3;
        while((j->next)!=NULL)
        {
            if(j->degree<(j->next)->degree)
            {
                int tmp = j->degree;
                j->degree = (j->next)->degree;
                (j->next)->degree = tmp;

                tmp = j->cons;
                j->cons = (j->next)->cons;
                (j->next)->cons = tmp;
            }
            j = j->next;
        }
        i = i->next;
    }
    cout<<endl<<endl;
    node *tmp = top1;
    cout<<"( ";
    while(tmp!=NULL)
    {
        cout<<tmp->cons<<"x^"<<tmp->degree<<"+ ";
        tmp = tmp->next;
    }
    cout<<") + "<<"( ";
    tmp = top2;
    while(tmp!=NULL)
    {
        cout<<tmp->cons<<"x^"<<tmp->degree<<"+ ";
        tmp = tmp->next;
    }
    cout<<" ) = ";
    tmp = top3;
    while(tmp!=NULL)
    {
        cout<<tmp->cons<<"x^"<<tmp->degree<<"+ ";
        tmp = tmp->next;
    }
    return 0;
}
