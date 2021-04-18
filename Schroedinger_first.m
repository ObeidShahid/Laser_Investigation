% -- Variable Definition -- %
h = 6.62607004E-34;
Qe=1.602176565E-19;
Ev = 6.241509E+18;
hbar = (h)/(2*pi);
me = 9.1093837015E-31;
m=0.043*me;
lw = 10E-10:1E-10:200E-10;

%% N = 1 %%
n=1;
En1 = (hbar^2*pi^2*n^2)/(2*m);

multi = lw.*lw;
temp = 1./multi;
final = temp.*En1;
converted = final./Qe.*1000;

y = sin(n*pi./lw);

%% N = 2 %%
n = 2;
En2 = (hbar^2*pi^2*n^2)/(2*m);

multi2 = lw.*lw;
temp2 = 1./multi2;
finalarray2 = temp2.*En2;
converted2 = finalarray2./Qe.*1000;

y1 = sin(n*pi./lw);

%% N = 3 %%
n = 3;
En3 = (hbar^2*pi^2*n^2)/(2*m);

multi3 = lw.*lw;
newarray3 = 1./multi3;
finalarray3 = newarray3.*En3;
converted3 = finalarray3./Qe.*1000;

y2 = sin(n*pi./lw);

%n3n2 = converted2 - converted1; ,lw,n3n2

%% PLOT %%
%subplot(2,1,1)
semilogy(lw,converted,lw,converted2,lw,converted3)
legend({'n = 1','n = 2','n = 3'},'Location','northeast', 'FontSize', 16)
xlabel('Well Width (lw)', 'FontSize', 20) 
ylabel('Energy (meV)', 'FontSize', 20) 
%subplot(2,1,2)
%plot(lw,y,lw,y1,lw,y2)


