h = 6.62607004E-34;
Qe=1.602176565E-19;
Ev = 6.241509E+18;
hbar = (h)/(2*pi);
me = 9.1093837015E-31;
m=0.043*me;
lw = 10E-10:1E-10:200E-10;

n=1;
En1 = (hbar^2*pi^2*n^2)/(2*m);

width = lw.*lw;
store = 1./width;
final = store.*En1;
siconv = final./Qe.*1000;

y = sin(n*pi./lw);

n = 2;
En2 = (hbar^2*pi^2*n^2)/(2*m);

width2 = lw.*lw;
store2 = 1./width2;
final2 = store2.*En2;
siconv2 = final2./Qe.*1000;

y2 = sin(n*pi./lw);

n = 3;
En3 = (hbar^2*pi^2*n^2)/(2*m);

width3 = lw.*lw;
store3 = 1./width3;
final3 = store3.*En3;
siconv3 = final3./Qe.*1000;

y3 = sin(n*pi./lw);

semilogy(lw,siconv,lw,siconv2,lw,siconv3)
legend({'n = 1','n = 2','n = 3'},'Location','northeast')
xlabel('Well Width (Lw)') 
ylabel('Energy (meV)') 


