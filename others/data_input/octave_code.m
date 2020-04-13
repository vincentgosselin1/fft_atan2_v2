#multiplication of two functions and showing their FFts.
graphics_toolkit('gnuplot')

x = 0:1:1023;

y = round(100* sin (x/0.01));
figure
plot (x,y , 'o-r')
title("function y")

#expected fft abs
y_fft = abs(ifft(y));
figure
plot (y_fft , 'o-r')
title("function abs(ifft(y))")

pause
#
