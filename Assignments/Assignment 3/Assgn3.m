%model parameters
mc=1.5 
mp=0.5
g=9.82
L=1
d1=0.01
d2=0.01
A=[0,0,1,0;0,0,0,1;0,g*mp/mc,-d1/mc,-d2/(L*mc);0,g*(mp+mc)/(L*mc),-d1/(L*mc),-d2*(mc+mp)/(L*L*mc*mp)] %state matrices
B=[0;0;1/mc;1/(L*mc)]
C1=[1,0,0,0]  %q1 as output 
C2=[0,1,0,0]  %q2 as output
D=0
sys1=ss(A,B,C1,D) %build state-space model for q1
sys2=ss(A,B,C2,D) %build state-space model for q2

P1=pole(sys1)
P2=pole(sys2)
e=eig(A)
[z1,gain1]=zero(sys1)
[z2,gain2]=zero(sys2)
s1=isstable(sys1) %if s1=1, system is stable, else not
s2=isstable(sys2)
%plots zero pole map of the system 
pzmap(sys1) 
pzmap(sys2)
o1=rank(obsv(sys1)) %if o1=4 system is obseravble, else not
o2=rank(obsv(sys2))
c1=rank(ctrb(sys1)) %if c1=4 system is controllable, else not
c2=rank(ctrb(sys2))

sys1_tf=tf(sys1) %converts state-space model to transfer function
sys2_tf=tf(sys2)
[b1,a1]=ss2tf(A,B,C1,D) %converts state-space model to transfer function
[b2,a2]=ss2tf(A,B,C2,D)
sys1_zpg=zpk(sys1) %converts to zero-pole-gain model
sys2_zpg=zpk(sys2)

ob1=obsv(sys1)    %controllability of system
ob2=obsv(sys2)

co1=ctrb(sys1)    %observability of system
co2=ctrb(sys2)

%a state feedback controller using pole placement
p =[-1 -0.5 -3 -2]
K = place(A,B,p)

Q=diag([2000 5 4 0.00003])
R=50000
N=[0;0;0;0]
K=lqr(sys1,Q,R,N)
A1=A-B*K
sys_lqr=ss(A1,B,C1,D)
P=pole(sys_lqr)
rlocus(sys_lqr)
S=isstable(sys_lqr)