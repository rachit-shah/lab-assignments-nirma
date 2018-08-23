function [SQNR,xq,en_code] = uniform_pcm(x,L)
  //x = input sequence
  //L = number of qunatization levels 
 xmax = max(abs(x));
xq = x/xmax;
en_code = xq;
d = 2/L;
q = d*[0:L-1];
q = q-((L-1)/2)*d;
for i = 1:L
    xq(find(((q(i)-d/2)<= xq)&(xq<=(q(i)+d/2))))=...     
    q(i).*ones(1,length(find(((q(i)-d/2)<=xq)&(xq<=(q(i)+d/2)))));
    en_code(find(xq == q(i)))= (i-1).*ones(1,length(find(xq == q(i))));
end
  xq = xq*xmax;
  SQNR = 20*log10(norm(x)/norm(x-xq));
endfunction 
function [c] = PCMEncoding(x,L,en_code)
  //Encoding: Converting Quantized decimal sample values in to binary
   //x = input sequence
   //L = number of qunatization levels 
   //en_code = normalized input sequence
n = log2(L);
c = zeros(length(x),n);
for i = 1:length(x)
  for j = n:-1:0
    if(fix(en_code(i)/(2^j))==1)
      c(i,(n-j)) =1;
      en_code(i) = en_code(i)-2^j;
    end
  end
end
disp(c)
endfunction
clc;
close;
t = 0:0.001:1;
x  = sin(2*%pi*t);
L = 16;
//Step 1
[SQNR,xq,en_code] = uniform_pcm(x,L);
//Step 2
c = PCMEncoding(x,L,en_code);
a =gca();
a.x_location ="origin";
a.y_location ="origin";
plot2d2(t*2*%pi,x);
plot2d2(t*2*%pi,xq,5);
title('Quantization of Sampled analog signal')
legend(['Analog signal','Quantized Signal'])
