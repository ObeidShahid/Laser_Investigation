function y=QW2GaN(e)
%function program that defines function zeros of which are bound energies of step graded GaN/Al_x2Ga_1-x2N/Al_x1Ga_1-x1N quantum well
% ubar -potential of barrier layers in [eV]
% ustep - potential of step layer in [eV]
% cw - well width in angstrom
% step width in angstrom
%before running program ubar, ustep, cw and cs should be defined 
global ubar ustep cw cs
% band ofset in conduction band between GaN and AlN
delta_ec=2;
% Aluminium mole fraction in barrier and in step layers
x1=ubar/delta_ec;
x2=ustep/delta_ec;
% bandgaps of well, step and barrier layers
egw=3.45;
egb=6.28.*x1+3.45.*(1-x1);
egs=6.28.*x2+3.45.*(1-x2);
for i=1:length(e);
mw=0.18.*(1+e(i)./egw);
%mw=0.067;
%effective mass of barrier layer (nonparabolicity included)
mb=(x1.*0.27+(1-x1).*0.18).*(1+(e(i)-ubar)./egb);
%mb=(x1.*0.15+(1-x1).*0.067);
%effective mass of step layer (nonparabolicity included)
ms=(x2.*0.27+(1-x2).*0.18).*(1+(e(i)-ustep)./egs);
%ms=(x2.*0.15+(1-x2).*0.067);
%wave vectors in barrier and well
kb=sqrt(0.262483445*mb*(ubar-e(i)));
kw=sqrt(0.262483445*mw*e(i));
%final function
if e(i)<=ustep 
ks=sqrt(0.262483445*ms*(ustep-e(i)));,
y(i)=sin(kw*cw)*(sinh(ks*cs)*kb/mb*((kw/mw)^2-(ks/ms)^2)+cosh(ks*cs)*ks/ms*((kw/mw)^2-(kb/mb)^2))-cos(kw*cw)*kw/mw*(sinh(ks*cs)*((kb/mb)^2+(ks/ms)^2)+2*cosh(ks*cs)*kb/mb*ks/ms);
else ks=sqrt(0.262483445*ms*(e(i)-ustep));,
y(i)=sin(kw*cw)*(sin(ks*cs)*kb/mb*((kw/mw)^2+(ks/ms)^2)+cos(ks*cs)*ks/ms*((kw/mw)^2-(kb/mb)^2))-cos(kw*cw)*kw/mw*(sin(ks*cs)*((kb/mb)^2-(ks/ms)^2)+2*cos(ks*cs)*kb/mb*ks/ms);

end
end
