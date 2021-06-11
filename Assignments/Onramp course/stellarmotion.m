%% Task 1

lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta
lambda = (lambdaStart:lambdaDelta:lambdaEnd)'
%% Task 2 & 7

s = spectra(:,2)
%% Task 3

loglog(lambda,s,".-")
xlabel("Wavelength")
ylabel("Intensity")
%% Task 4

[sHa,idx] = min(s)
lambdaHa = lambda(idx)
%% Task 5

hold on
loglog(lambdaHa,sHa,"rs","MarkerSize",8)
hold off
%% Task 6

z = lambdaHa / 656.28 - 1
speed = z * 299792.458