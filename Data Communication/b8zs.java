/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author exam
 */
import java.util.Scanner;
public class b8zs {
    public static void main(String args[]){
        int count=0;
        boolean fl=true;
        StringBuffer bip=new StringBuffer();
        Scanner sc=new Scanner(System.in);
        String inp2=new String();
        
        StringBuffer out=new StringBuffer();
        inp2=sc.nextLine();
        StringBuffer inp=new StringBuffer(inp2);
        String p="000+-0+-";
        String n="000-+0+-";
        
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
        
        for(int i=0;i<bip.length();i++){
            if(bip.charAt(i)=='0'){
                count++;
                }
            else{
                count=0;
            }
            if(count==8 && bip.charAt(i-8)=='-'){
                bip.replace(i-7,i+1,n);                
            }
            if(count==8 && bip.charAt(i-8)=='+'){
                bip.replace(i-7,i+1,p);                
            }
        }
        System.out.println(bip);

    }
}
