#include <stdio.h>
#include <stdlib.h>

struct tree
{
    int value;
    struct tree* left;
    struct tree* right;
}* head;

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
void inorder(struct tree *temp)
{
    if(temp!=NULL)
    {
        inorder(temp->left);
        printf("%d - ",temp->value);
        inorder(temp->right);
    }
}

int main()
{
    head = NULL;
    int i;
    int a[]={5,2,6,10,15,18};
    for(i=0; i<6; i++){
        head = maketree(head, a[i]);
    }
    inorder(head);
    return 0;
}

