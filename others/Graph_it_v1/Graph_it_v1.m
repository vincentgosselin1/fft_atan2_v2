#This is a peak widening script
#By Vincent Gosselin

#Changing graphics in Octave for nice data.
graphics_toolkit('gnuplot')

#output.txt contains the fish (interference data)
load input.txt;
#load input1.txt

printf("size is %d", size(input))


fish = input;
#fish1 = input1
figure 
plot(fish, 'o-r')

pause

% #Fish_corrected 
% for n = 1:1024
  % fish_corrected(n,1) = (fish(n,1)+3177)*(2047/3177);
% endfor
% figure 
% plot(fish_corrected)
% title ("Fish")

% #Fucked up fish#Fish_corrected 
% for n = 1:1024
  % fish_corrected1(n,1) = (fish1(n,1)+3177)*(2047/3177);
% endfor
% figure 
% plot(fish_corrected1)
% title ("Fish1")


% #Now plot fish interogram
% fish_interferogram = abs(ifft(fish_corrected))
% fish_interferogram(1) = 0;#DC OFFSET
% figure
% plot(abs(fish_interferogram))
% title ("fish Interferogram")
% max(fish_interferogram)

% #Now plot fish interogram1
% fish_interferogram1 = abs(ifft(fish_corrected1))
% fish_interferogram1(1) = 0;#DC OFFSET
% figure
% plot(abs(fish_interferogram1))
% title ("fish Interferogram1")
% max(fish_interferogram1)

