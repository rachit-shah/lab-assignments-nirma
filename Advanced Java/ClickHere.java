/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clickhere;
/**
 *
 * @author Rachit
 */
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.util.Random;
import javax.swing.*;
public class ClickHere implements ActionListener {

    /**
     * @param args the command line arguments
     */
    JFrame j;
    JButton butt[];
    JLabel labl;
    JPanel pan;
    int cnt=0;
    
    public ClickHere(){
        Font norm = new Font("Arial Black",Font.PLAIN,20);
        j = new JFrame("ClickHere");
        j.setLayout(new GridLayout(2,1));
        pan = new JPanel();
        j.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        j.setSize(500,300);
        j.add(pan);
        //pan.setLayout(new FlowLayout());
        labl = new JLabel("Click a button",SwingConstants.CENTER);
        labl.setOpaque(true);
        labl.setHorizontalAlignment(JLabel.CENTER);
        labl.setFont(norm);
        labl.setBackground(new Color(63,68,62));
        labl.setForeground(new Color(223,220,222));
        j.add(labl);
        j.setVisible(true);
       pan.setLayout(new GridLayout(1,4));
        butt=new JButton[4];
        String txt="";
        Random r = new Random();
        int cl = r.nextInt(4);
      
        for(int i=0;i<4;i++){
            if(cl==i){
                txt="Click Here";
            }
            else
                txt="Not Here";
            butt[i]=new JButton(txt);
            pan.add(butt[i]);
            butt[i].addActionListener(this);
            butt[i].setOpaque(true);
            butt[i].setBackground(new Color(62, 63, 68));
            butt[i].setBorder(BorderFactory.createMatteBorder(0, 0, 0, 1, Color.WHITE));
            butt[i].setFocusPainted(false);
            butt[i].setFont(norm);
            butt[i].setForeground(new Color(223,220,222));
        }
    }
    public static void main(String[] args) {
        new ClickHere();
    }
    public void again(){
         String txt="";
        Random r = new Random();
        int cl = r.nextInt(4);
      
        for(int i=0;i<4;i++){
            if(cl==i){
                txt="Click Here";
            }
            else
                txt="Not Here";
            butt[i].setText(txt);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(cnt<10){
        if(e.getActionCommand()=="Click Here"){
            labl.setText("Good Job. Do it again!");
            cnt++;
            again();
        }
        else{
            labl.setText("Wrong. Try again!");
            again();
        }
        }
        else
            j.dispatchEvent(new WindowEvent(j, WindowEvent.WINDOW_CLOSING));
    
    }
}