clc;
clear all;
close all;
u=audiorecorder(8000,8,1);
disp('Start the recording');
recordblocking(u,10);
disp('Voice recorded');
v=getaudiodata(u);
folder=uigetdir(path,'Save the file');
file=input('Enter the file name: ','s');
filename=strcat(file,'.wav');
filename=strcat(folder,'\',filename);
disp('The path for saved file is: ');
disp(filename);
audiowrite(filename,v,10000);
[x,Fs]=audioread(filename);
get(u)
Ac=10;
fc=2000;
fs=8000;
t=[1:10*fs]'/fs;
wc=2*pi*fc*t;
c=Ac*cos(wc);
k=menu('Choose the type of modulation','Amplitude modulation','Frequency modulation');
switch k;
    case 1
        a=modulate(x,fc,fs,'am');
        b=demod(a,fc,fs,'am');
        subplot(4,1,1);
        plot(t',x);
        xlabel('Time');
        ylabel('Amplitude');
        title('Input Signal');
        subplot(4,1,2);
        plot(t(1:200),c(1:200));
        xlabel('Time');
        ylabel('Amplitude');
        title('Carrier Signal');
        grid on;
        subplot(4,1,3);
        plot(t',a);
        xlabel('Time');
        ylabel('Amplitude');
        title('Amplitude Modulated Signal');
        grid on;
        subplot(4,1,4);
        plot(t',b);
        xlabel('Time');
        ylabel('Amplitude')
        title('Amplitude Demodulated Signal');
        grid on;
        pause(5);
        sound(b)
    case 2
        a=modulate(x,fc,fs,'fm');
        b=demod(a,fc,fs,'fm');
        subplot(4,1,1);
        plot(t',x);
        xlabel('Time');
        ylabel('Amplitude');
        title('Input Signal');
        subplot(4,1,2);
        plot(t(1:200),c(1:200));
        xlabel('Time');
        ylabel('Amplitude');
        title('Carrier Signal');
        grid on;
        subplot(4,1,3);
        plot(t',a);
        xlabel('Time');
        ylabel('Amplitude');
        title('Frequency Modulated Signal');
        grid on;
        subplot(4,1,4);
        plot(t',b);
        xlabel('Time');
        ylabel('Amplitude')
        title('Frequency Demodulated Signal');
        grid on;
        pause(5);
        sound(b)
end