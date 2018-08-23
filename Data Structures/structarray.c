#include<stdio.h>
#include<conio.h>
//struct array{
    int arr[50],count1=0,count2=10000000;
//};
int* set(int arr[],int i,int value)
{
    arr[i]=value;
    return arr;
}
int get(int arr[],int i)
{
    return arr[i];
}
int lowerbound(int arr[])
{
    return count2;
}
int upperbound(int arr[])
{
    return count1;
}

int main(){
    //struct array A;
    int index,value;
    char choice;
    do{
    printf("ARRAY\n\nSelect a choice:\n1.Set a value in a array\n2.Get a value from array\n3.Get Upperbound of array\n4.Get Lowerbound of array\n");
    scanf("%d",&choice);
    switch(choice)
    {
        case 1:printf("Enter index and value\n");
                scanf("%d %d",&index,&value);
                set(arr,index,value);
                if(count1<index)
                {
                    count1=index;
                }
                if(count2>index)
                {
                    count2=index;
                }
                break;
        case 2:printf("Enter index\n");
                scanf("%d",&index);
                get(arr,index);
                break;
        case 3:printf("%d\n",upperbound(arr));
                break;
        case 4:printf("%d\n",lowerbound(arr));
                break;
        default:printf("Wrong choice\n");break;
    }
    printf("Do you want to continue?\nPress 1 for Yes or 0 for NO");
    scanf("%d",&choice);
    }
    while(choice==1);
    return 0;


}
