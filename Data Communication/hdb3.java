/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author exam
 */
import java.util.Scanner;
public class hdb3 {
    public static void main(String args[]){
        int count=0;
        boolean fl=true;
        StringBuffer bip=new StringBuffer();
        Scanner sc=new Scanner(System.in);
        String inp2=new String();
        
        StringBuffer out=new StringBuffer();
        inp2=sc.nextLine();
        StringBuffer inp=new StringBuffer(inp2);
        String po="000+";
        String pe="-00-";
        String no="000-";
        String ne="+00+";
        
        for(int i=0;i<inp.length();i++){
            if(inp.charAt(i)=='1'){
                if(fl==true){
                    bip.append('+');
                    fl=false;
                }
                else{
                    bip.append('-');
                    fl=true;
                }
            }
            else{
                bip.append('0');
            }
        }
        int count2=0;
        for(int i=0;i<bip.length();i++){
            if(bip.charAt(i)=='0'){
                count++;
                }
            else{
                count=0;
                count2++;
            }
            if(count==4 && bip.charAt(i-4)=='-' && count2%2==0){
                bip.replace(i-3,i+1,ne);                
            }
            if(count==4 && bip.charAt(i-4)=='-' && count2%2==1){
                bip.replace(i-3,i+1,no);                
            }
            if(count==4 && bip.charAt(i-4)=='+' && count2%2==0){
                bip.replace(i-3,i+1,pe);                
            }
            if(count==4 && bip.charAt(i-4)=='+' && count2%2==1){
                bip.replace(i-3,i+1,po);                
            }
        }
        System.out.println(bip);

    }
}
