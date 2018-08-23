#include<stdio.h>
#include<stdlib.h>
struct node{
	struct node *next;
	int value;
}*top;

void push(int item)
{
	struct node *temp=top;
	temp=(struct node*)malloc(sizeof(struct node));
	temp->value=item;
	temp->next=top;
	top=temp;
}
int pop()
{
	struct node *temp=top;
	temp=(struct node*)malloc(sizeof(struct node));
	int item;
	if(top==NULL)
	{
		printf("Stack is empty");
		return;
	}
	else
	{
		temp=top;
		item=temp->value;
		top=top->next;
		free(temp);
		return item;
	}
}
void display(){
	struct node *temp=top;
     if(temp!=NULL)
     { 
          printf("\nElements in stack are:\n");
          while(temp!=NULL)
          {
               printf("\t%d\n",temp->value);
               temp=temp->next;
          } 
     printf("\n");
     }
     else
     printf("\nStack is Empty");
}
	
	
	

int main()
{
	/*push(1);
	push(3);
	display();
	pop();
	printf("%d",pop());*/
	char choice,item,cont;
	
	do{
		printf("Enter a choice:\n");
		printf("1.Push\n");
		printf("2.Pop\n");
		printf("3.Display Stack\n");
		printf("4.Exit\n");
		scanf(" %c",&choice);
		switch(choice)
		{
			case '1':printf("Enter element to push\n");
				   scanf(" %c",&item);
				   push(item);
				   break;
			case '2':pop();
				   break;
			case '3':display();
				   break;
			case '4':exit(0);break;
			default:printf("Wrong choice.Try again");
					break;
		}
		printf("Do you want to continue?\n 1. for YES\n 2. for NO\n");
		scanf(" %c",&cont);
	}
	while(cont=='1');
	
	return 0;
}
