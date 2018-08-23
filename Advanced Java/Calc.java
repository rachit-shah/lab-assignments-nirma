/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calc;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import javax.script.ScriptException;

/**
 *
 * @author Rachit
 */
public class Calc {

    /**
     * @param args the command line arguments
     */
    JButton butt[];
    JFrame j;
    JLabel labl;
    JPanel pan;
    JLabel foot;
    int dot=0;
    public Calc(){
        j = new JFrame();
        j.setLayout(new BorderLayout());
        butt = new JButton[20];
        labl = new JLabel("");
        labl.setFont(new Font("Arial", Font.PLAIN, 30));
        labl.setPreferredSize(new Dimension(100,75));
        j.add(labl,BorderLayout.NORTH);
        pan = new JPanel();
        j.add(pan,BorderLayout.CENTER);
        foot = new JLabel("CALCULATOR",SwingConstants.CENTER);
        foot.setFont(new Font("Arial", Font.PLAIN, 30));
        j.add(foot,BorderLayout.SOUTH);
        pan.setLayout(new GridLayout(5,4,10,10));
        int cnt=0,num=1;
        for(int i=1; i<20;i++){
            String txt = "";
            if(i%4==0){
                switch(cnt){
                    case 0: txt="+";break;
                    case 1: txt="-";break;
                    case 2: txt="*";break;
                    case 3: txt="/";break;
                    default:txt="";break;
                }
                cnt++;
            }
            else if (i==13)
                txt="0";
            else if (i==14)
                txt=".";
            else if (i==15)
                txt="%";
            else if (i==17)
                txt="BCK";
            else if (i==18)
                txt="CLR";
            else if (i==19)
                txt="=";
            else
                txt=String.valueOf(num++);
            
                        
                       
            butt[i-1]=new JButton(txt);
            butt[i-1].setPreferredSize(new Dimension(1, 1));
            butt[i-1].setFont(new Font("Arial", Font.PLAIN, 20));
            pan.add(butt[i-1]);
            butt[i-1].addActionListener(new ActionListener() {

                @Override
                public void actionPerformed(ActionEvent ae) {
                    String n = ae.getActionCommand();
                    String o = labl.getText();
                    
                    if(n=="="){
                        char c =o.charAt(o.length()-1);
                        if(!Character.isDigit(c)){
                            o=o.substring(0, o.length()-1);
                        }
                        
                        ScriptEngineManager mgr = new ScriptEngineManager();
                        ScriptEngine engine = mgr.getEngineByName("JavaScript");
                        try {
                            labl.setText(engine.eval(o).toString());
                        } catch (ScriptException ex) {
                            Logger.getLogger(Calc.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                    else if (n=="BCK"){
                        if(o.charAt(o.length()-1)=='.'){
                            dot=0;
                            
                        }
                        labl.setText(o.substring(0, o.length()-1));
                    }
                    else if (n=="CLR"){
                        dot=0;
                        labl.setText("");
                    }
                    else if (!Character.isDigit(n.charAt(0))){
                        char c =o.charAt(o.length()-1);
                        if(!Character.isDigit(c)){
                            o=o.substring(0, o.length()-1);
                            labl.setText(o+n);
                        }
                        else
                            labl.setText(o+n);   
                    }
                    else if (n=="."){
                        if(dot==0)
                        {labl.setText(o+n);dot++;}
                        
                        
                    }
                    
                    else{
                    labl.setText(o+n);
                    }
                }
            });
        }
        j.setVisible(true);
        pan.setVisible(true);
        j.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        j.setSize(350,600);
        
        
        
    }
    public static void main(String[] args) {
        new Calc();
    }

   
}
