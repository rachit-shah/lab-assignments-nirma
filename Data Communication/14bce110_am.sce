function[x,Vm,Vc]=ampmod(Ec,Em,fm,fc,fs)
    //Ec -carrier amplitude in volts
    //Em - message signal amplitude in volts
    //fm - modulating signal frequency Hz
    //fc - carrier signal frequency in Hz
    //fs - sampling frequency in samples/sec
    t = 0:1/fs:1;
    Vm = Em*sin(2*%pi*fm*t);
    Vc = Ec*sin(2*%pi*fc*t);
    x = (Ec+Em*sin(2*%pi*fm*t)).*(sin(2*%pi*fc*t));
    subplot(3,1,1)
    plot(Vm)
    title('Modulating Signal')
    subplot(3,1,2)
    plot(Vc)
    title('Carrier Signal')
    subplot(3,1,3)
    plot(x);
    title('Amplitude Modulated Signal')
endfunction
//Example
Em = 8; //8 volts
Ec = 10; //20 volts
fm = 2; //2 Hz
fc = 10; //10 Hz
fs = 100; //samples/sec
ampmod(Ec,Em,fm,fc,fs)