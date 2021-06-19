%% Task 1

load Cchord
n = numel(y)
t = 0:n-1
%% Task 2

t = t/fs
plot(t,y)
%% Task 3

yfft = abs(fft(y))
%% Task 4

f = 0:n-1
%% Task 5

f = f*fs/n
plot(f,yfft)
xlim([0 1000])