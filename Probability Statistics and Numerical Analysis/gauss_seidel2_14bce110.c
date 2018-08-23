#include<stdio.h>
#include<conio.h>
#include<math.h>
float a[20][20],b[20][20],temp;

int condition(int m,int n,int row){
        int iCount1;
        float sum=0;
        for(iCount1=0;iCount1<m-1;iCount1++){
            if(a[row][iCount1]<0){
                sum=sum-a[row][iCount1];
            }
            else
            sum=sum+a[row][iCount1];
        }
        sum=sum-a[row][n];
        if(a[row][n]>sum)return 1;
        else return 0;
}
void exchange(int m,int row1,int row2){
    float temp;
    int iCount;
    for(iCount=0;iCount<m;iCount++){
        temp=a[row1][iCount];
        a[row1][iCount]=a[row2][iCount];
        a[row2][iCount]=temp;
    }

}


void main(){
    int m,n,count=0,flag=0;
    printf("****************************Gauss Seidel*******************************\n");       //to take the number of column and rows.
    printf("\nEnter the number of equations in your problem:");
    scanf("%d",&n);
    printf("\nEnter the number of variables in each equation of your problem:");
    scanf("%d",&m);
    m++;

    int iCount,iCount1,iCount2=0;
    for(iCount=0;iCount<n;iCount++){
        printf("\nEnter the co-efficients of the equation no.%d",iCount+1);

            for(iCount1=0;iCount1<m;iCount1++){
               printf("\nEnter the value of Co-efficient: ");
                scanf("%f",&a[iCount][iCount1]);
            }
       printf("\n\n");
    }

   printf("\nfollowing is the matrix:\n");

    for(iCount=0;iCount<n;iCount++){


            for(iCount1=0;iCount1<m;iCount1++){
            printf("  %f",a[iCount][iCount1]);
            }
       printf("\n");
    }

for(iCount=0;iCount<n;iCount++){
    iCount2=iCount+1;
    int j=!condition(m,iCount,iCount);
    count=0;
    while(j){

        if(count<n){
       if(iCount2==n) iCount2=0;
       int i=condition(m,iCount,iCount2);
        if(i){
            exchange(m,iCount,iCount2);
        }
        iCount2++;
        j=!condition(m,iCount,iCount);
        count++;
        }
        else {
            printf("\nEnter valid expression!\n");
            break;
            flag=1;
        }
    }

}

    if(flag==0){
             printf("\nfollowing is the checked matrix:\n");
    for(iCount=0;iCount<n;iCount++){
            for(iCount1=0;iCount1<m;iCount1++){
            printf("  %f",a[iCount][iCount1]);
            }
       printf("\n");
    }
    int i=0,j=0,k=0,n;
    printf("\nEnter the precision upto which you want the answer !\n");
    scanf("%d",&n);
    float x[50],y[50],z[50],p[50],q[50],r[50],w[50],s[50];
    y[0]=0,z[0]=0,w[0]=0;
        printf("\nXi\t\tYi\t\tZi\t\tWi\n");
    do{




               x[i]=(a[0][m-1]-a[0][1]*y[i-1]-a[0][2]*z[i-1]-a[0][3]*w[i-1])/a[0][0];
               p[i]=x[i]*pow(10,n);
               printf("%f\t",x[i]);

               y[i]=(a[1][m-1]-a[1][0]*x[i]-a[1][2]*z[i-1]-a[1][3]*w[i-1])/a[1][1];
               q[i]=y[i]*pow(10,n);
               printf("%f\t",y[i]);

               z[i]=(a[2][m-1]-a[2][0]*x[i]-a[2][1]*y[i]-a[2][3]*w[i-1])/a[2][2];
               r[i]=z[i]*pow(10,n);
               printf("%f\t\n",z[i]);

               w[i]=(a[3][m-1]-a[3][0]*x[i]-a[3][1]*y[i]-a[3][2]*z[i-1])/a[3][3];
               s[i]=w[i]*pow(10,n);
               printf("%f\n",w[i]);
               i++;





    }while(p[i-1]!=p[i-2]&&q[i-1]!=q[i-2]&&r[i-1]!=r[i-2]);

    }
    }



