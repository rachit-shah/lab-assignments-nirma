/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stopwatch;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Calendar;
import javax.swing.*;
import javax.swing.border.Border;
/**
 *
 * @author Rachit
 */
public class StopWatch implements ActionListener {

    JFrame f;
    JButton startstop;
    JButton pauseresume;
    JLabel labl;
    Timer timer;
    Calendar cal1;
    Calendar cal2;
    long tPause;
    boolean paused = false;
    long tStart;
    long tStop;
    long tElapse;
    String padzeros(int x){
        String ans="";
        ans = Integer.toString(x);
        if(x<10){
            ans = "0"+ans;
        }
        return ans;   
    }
    
    public StopWatch(){
        f = new JFrame("StopWatch");
        Font norm = new Font("Arial Black",Font.PLAIN,20);
        startstop = new JButton("Start");
        startstop.setFont(norm);
        pauseresume = new JButton("Pause");
        pauseresume.setFont(norm);
        cal1 = Calendar.getInstance();
        cal2 = Calendar.getInstance();
        f.setSize(300, 150);
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        labl = new JLabel("StopWatch");
        labl.setOpaque(true);
        labl.setHorizontalAlignment(JLabel.CENTER);
        labl.setFont(norm);
        labl.setBackground(new Color(63,68,62));
        labl.setForeground(new Color(223,220,222));
        startstop.setOpaque(true);
        pauseresume.setOpaque(true);
        startstop.setBackground(new Color(62, 63, 68));
        startstop.setBorder(BorderFactory.createMatteBorder(0, 0, 0, 1, Color.WHITE));
        startstop.setFocusPainted(false);
        pauseresume.setBorder(null);
        pauseresume.setFocusPainted(false);
        pauseresume.setBackground(new Color(62, 63, 68));
        startstop.setForeground(new Color(223,220,222));
        pauseresume.setForeground(new Color(223,220,222));
        
        f.setLayout(new GridLayout(2,1));
        f.add(labl);
        JPanel pan = new JPanel();
        f.add(pan);
        pan.setLayout(new GridLayout(1,2));
        pan.add(startstop);
        pan.add(pauseresume);
        startstop.addActionListener(this);
        pauseresume.addActionListener(this);
        f.setVisible(true); 
        if(labl.getText()=="StopWatch"){
            pauseresume.setEnabled(false);
        }
        else{
            pauseresume.setEnabled(true);
        }
        
        timer = new Timer(1, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent ae) {
                int millis = (int) (System.currentTimeMillis() - tStart);
                int days = millis / 86400000;
                int hrs = (millis / 3600000) - (days * 24);
                int min = (millis / 60000) - (days * 1440) - (hrs * 60);
                int sec = (millis / 1000) % 60;
                int mil = (millis - (days * 86400000) - (hrs * 3600000) - (min * 60000) - (sec * 1000))/10;
                String time = new String(""+padzeros(hrs)+"hrs "+padzeros(min)+"min "+padzeros(sec)+"sec "+padzeros(mil)+"ms ");
                //String time = new String(""+hrs+" hrs"+min+" min"+sec+" sec");
                labl.setText(time);
            }
        });
    }
    public static void main(String[] args) {
        new StopWatch();
    }
    

    @Override
    public void actionPerformed(ActionEvent ae) {
        pauseresume.setEnabled(true);
        if(ae.getActionCommand()=="Start"||ae.getActionCommand()=="Resume"){
            if(!paused){
                tStart = System.currentTimeMillis();
                timer.start();
                startstop.setText("Stop");
            }
            else{
                tStart = System.currentTimeMillis()+tPause;
                tPause=0;
                timer.start();
                paused = false;
                pauseresume.setText("Pause");
                //startstop.addActionListener(this);
            }
        }
        else if (ae.getActionCommand()=="Stop"){
            timer.stop();
            startstop.setText("Start");
        }
        else if (ae.getActionCommand()=="Pause"){
            long cur = System.currentTimeMillis();
            tPause -= (cur - tStart);
            timer.stop();
            paused = true;
            pauseresume.setText("Resume");
            //startstop.removeActionListener(this);
            startstop.setText("Reset");
        }
        else if (ae.getActionCommand()=="Reset"){
            labl.setText("00hrs 00min 00sec 00ms");
            startstop.setText("Start");
            pauseresume.setText("Pause");
            pauseresume.setEnabled(false);
            tPause=0;
            paused=false;
        }
    }
    
}
