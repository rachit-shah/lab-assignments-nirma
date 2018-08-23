#include <stdio.h>
#include <stdlib.h>

struct tree
{
    int value;
    struct tree* left;
    struct tree* right;
}* head;
int flag=0;
struct tree* maketree(struct tree* temp, int data)
{
    if(temp==NULL)
    {
        temp = (struct tree*) malloc(sizeof(struct tree));
        temp->value = data;
        temp->left = NULL;
        temp->right = NULL;
    }
    else if(data < temp->value){
        temp->left = maketree(temp->left, data);
    }
    else {
        temp->right = maketree(temp->right, data);
    }
    return temp;

}
void strictly(struct tree* temp)
{
    if(flag==0)
        printf("Yes,strictly binary tree");
    else
        printf("Not strictly binary");
}
void inorder(struct tree *temp)
{

    if(temp!=NULL)
    {
        inorder(temp->left);
        printf("%d - ",temp->value);
        inorder(temp->right);
        if(!((temp->left==NULL&&temp->right==NULL)||(temp->left!=NULL&&temp->right!=NULL)))
        flag=1;
    }
}

int main()
{
    head = NULL;
    int i,size,v;
    printf("How many numbers do you want to enter?");
    scanf("%d",&size);
    for(i=0; i<size; i++){
        printf("Enter the number to be entered");
        scanf("%d",&v);
        head = maketree(head,v);
    }
    inorder(head);
    strictly(head);
    return 0;
}

