%% Task 1

load electricity
usage
%% Task 2

usage(2,3) = 2.74
%% Task 3

res = usage(:,1)
%% Task 4

comm = usage(:,2)
ind = usage(:,3)
%% Task 5

yrs = (1991:2013)'
%% Task 6

plot(yrs,res,"b--")
hold on
plot(yrs,comm,"k:")
plot(yrs,ind,"m-.")
hold off
%% Task 7

title("July Electricity Usage")
legend("res","comm","ind")
title("July Electricity Usage")
legend("res","comm","ind")title("July Electricity Usage")
legend("res","comm","ind")