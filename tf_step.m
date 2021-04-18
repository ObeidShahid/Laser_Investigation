function psi=tf_step(z,E)
global cs cw ubar ustep
%program for calculating electron wave function in GaAs/AlGaAs step QW. 
% z is the vector coordinate and E is previouslu calculated eigen energy
% ubar -potential of barrier layers in [eV]
% ustep - potential of step layer in [eV]
% cw - well width in angstrom
% step width in angstrom
%before running program ubar, ustep, cw and cs should be defined 
global ubar ustep cw cs
% band ofset in conduction band between GaAs and AlAs
delta_ec=0.836;
% Aluminium mole fraction in barrier and in step layers
x1=ubar/delta_ec;
x2=ustep/delta_ec;
% bandgaps of well, step and barrier layers
egw=1.4218;
egb=2.6688.*x1+1.4218.*(1-x1);
egs=2.6688.*x2+1.4218.*(1-x2);
mw=0.067.*(1+E/egw);
%mw=0.067;
%effective mass of barrier layer (nonparabolicity included)
mb=(x1.*0.15+(1-x1).*0.067).*(1+(E-ubar)./egb);
%mb=(x1.*0.15+(1-x1).*0.067);
%effective mass of step layer (nonparabolicity included)
ms=(x2.*0.15+(1-x2).*0.067).*(1+(E-ustep)./egs);
%ms=(x2.*0.15+(1-x2).*0.067);
kb=sqrt(0.262483445*mb*(ubar-E));
kw=sqrt(0.262483445*mw*E)      ;
if E<=ustep
ks=sqrt(0.262483445*ms*(ustep-E))  ;
r1=-(ks/ms*cosh(ks*cs)+kb/mb*sinh(ks*cs))/(ks/ms*sinh(ks*cs)+kb/mb*cosh(ks*cs));
n1=(cos(kw*cw))^2/(2*kb)+cw/2+sin(2*kw*cw)/(4*kw)+cs/2+1/(4*ks)*sinh(2*ks*cs)+1/(2*kb)*(cosh(ks*cs))^2      ;
n2=(ks/ms)/(kw/mw)*(-1/(2*kb)*sin(2*kw*cw)-1/kw*(sin(kw*cw))^2)+1/ks*(sinh(ks*cs))^2+1/(2*kb)*sinh(2*ks*cs);
n3=(ks/ms)^2/(kw/mw)^2*(1/(2*kb)*(sin(kw*cw))^2+cw/2-1/(4*kw)*sin(2*kw*cw))-cs/2+1/(4*ks)*sinh(2*ks*cs)+1/(2*kb)*(sinh(ks*cs))^2 ;
G=-1/sqrt(r1^2*n1+r1*n2+n3);
F=G*r1;
C=F;
D=(ks/ms)/(kw/mw)*G;
A=exp(kb*cw)*(C*cos(kw*cw)-D*sin(kw*cw));
H=exp(kb*cs)*(F*cosh(ks*cs)+G*sinh(ks*cs));
for i=1:length(z)
if z(i)<=-cw
psi(i)=A*exp(kb*z(i));
end
if (z(i)>-cw)&(z(i)<=0)
psi(i)=C*cos(kw*z(i))+D*sin(kw*z(i));
end
if (z(i)>0)&(z(i)<=cs)
psi(i)=F*cosh(ks*z(i))+G*sinh(ks*z(i));
end
if z(i)>cs
psi(i)=H*exp(-kb*z(i));
end
end
else ks=sqrt(0.262483445*ms*(E-ustep));
r1=(ks/ms*cos(ks*cs)+kb/mb*sin(ks*cs))/(ks/ms*sin(ks*cs)-kb/mb*cos(ks*cs));
n1=1/(2*kb)*(cos(kw*cw))^2+cs/2+cw/2+1/(4*kw)*sin(2*kw*cw)+1/(4*ks)*sin(2*ks*cs)+1/(2*kb)*(cos(ks*cs))^2;
n2=(ks/ms)/(kw/mw)*(-1/(2*kb)*sin(2*kw*cw)-1/kw*(sin(kw*cw))^2)+1/ks*(sin(ks*cs))^2+1/(2*kb)*sin(2*ks*cs);
n3=((ks*mw)/(kw*ms))^2*(1/(2*kb)*(sin(kw*cw))^2+cw/2-1/(4*kw)*sin(2*kw*cw))+cs/2-1/(4*ks)*sin(2*ks*cs)+1/(2*kb)*(sin(ks*cs))^2;
G=sqrt(1/(r1^2*n1+r1*n2+n3));
F=r1*G                       ;
C=F;
D=(ks/ms)/(kw/mw)*G;
A=exp(kb*cw)*(C*cos(kw*cw)-D*sin(kw*cw));
H=exp(kb*cs)*(F*cos(ks*cs)+G*sin(ks*cs)) ;
for i=1:length(z)
if z(i)<=-cw
psi(i)=A*exp(kb*z(i));
end
if (z(i)>-cw)&(z(i)<=0)
psi(i)=C*cos(kw*z(i))+D*sin(kw*z(i));
end
if (z(i)>0)&(z(i)<=cs)
psi(i)=F*cos(ks*z(i))+G*sin(ks*z(i));
end
if z(i)>cs
psi(i)=H*exp(-kb*z(i));
end
end
end
psi=[z' psi'];