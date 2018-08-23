/*
Name: Rachit Shah
Roll no:14BCE110
Program Name:- A code to find Mode, Median, Range, Mean
Date:5/1/16
*/

#include<stdio.h>
int main()
{
    printf("\n****************MEAN,MEDIAN,MODE and RANGE******************\n\n");
	int n,i,j;
	float temp=0;
	float max=0;
	float sum=0;
	int ans=0;
	float mean,median,mode,range;
	int choice;
	float arr[100];
	printf("How many numbers do you want to enter ?");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		scanf("%f",&arr[i]);
		sum=sum+arr[i];
	}
	for(i=0;i<n;i++){					//Logic for sorting(Bubble sorting)
		for(j=0;j<n-i-1;j++){
			if(arr[j]>arr[j+1]){
				temp=arr[j];
				arr[j]=arr[j+1];
				arr[j+1]=temp;
			}
		}
	}
	do{
	printf("Enter your choice\n");
	printf("1.Mean\n");
	printf("2.Median\n");
	printf("3.Mode\n");
	printf("4.Range\n");
	scanf("%d",&choice);
	switch(choice)
	{
	case 1:
		mean=sum/n;
		printf("Mean of given numbers is %2.3f\n",mean);
		break;
	case 2:
		if(n%2!=0)
		{
			median=arr[n/2];				//if numbers are odd
		}
		else
		{
			median=(arr[(n-1)/2]+arr[(n+1)/2])/2;		//if total elements are even
		}
		printf("Median of given numbers is %2.3f\n",median);
		break;
	case 3:
		max=1;							/*loop will check number and its consecutive number if same its freq 										  will be stored in temp...*/
		for(i=0;i<n-1;i++){
			if(arr[i]==arr[i+1]){
				temp++;

			}
			else
			temp=1;
			if(temp>max){
				max=temp;
				mode=arr[i];
			}
		}
		printf("Mode of given numbers is %2.3f\n",mode);
		break;
	case 4:
		range=arr[n-1]-arr[0];
		printf("Range of given numbers is %2.3f\n",range);
		break;

}
	printf("Do you want to continue?\n1.yes\n2.no\n");
	scanf("%d",&ans);
}while(ans==1);
}

