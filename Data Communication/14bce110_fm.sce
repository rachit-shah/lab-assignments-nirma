t= 0:1/1000:1;     // declare time interval
Ac = 9;              // amplitude of carrier signal
Am = 4;             // amplitude of modulating signal
fc = 100;           // carrier frequency
fm = 50;            // modulating frequency

//Carrier signal
Vc = Ac *cos (((2*%pi)*fc)*t);

//Modulating signal 
Vm = Am * sin (((2*%pi)*fm)*t);

//Frequency modulation signal 

m = 2;   //modulation index 
Vfm = Ac*cos(((( 2*%pi)*fc)*t)+m*sin(((2*%pi)*fm)*t));

// plot signal
subplot (311);
plot (t, Vm)
title (‘Modulating signal’)