N = 1024; 	// Number of points
fs = 4096;	// Sampling frequency
t = (0:N-1)/fs;	// Time vector

fm = 50;// Message Freq 1
Em = 3;// Amplitude of modulating signal
m = 3;// Modulation Index
fc = 300;//Carrier frequency
Vm = Em*cos(2*%pi*fm*t);  // Modulating signal

// Frequency Modulation (FM)
Vfm = cos(2*%pi*fc*t+Vm); 

Vf = (2/N)*abs(mtlb_fft(Vfm,2048))*1024; //Frequency modulation in time domain

f = (fs*(0:N/2))/N;

subplot(2,1,1);	//Time domain plot
plot(t(1:N/2),Vfm(1:N/2),t(1:N/2),Vm(1:N/2),"r");
title(‘Time Domain Representation’);
xlabel(‘Time’);
ylabel(‘Modulated signal’);