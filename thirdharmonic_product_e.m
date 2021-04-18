
function product=thirdharmonic_product_e(energije)
%program for calculationg matrix elements product 
%for Al_x1Ga_{1-x1)As/GaAs/Al_x2Ga_{1-x2}As step QW
% input 'energije' is a vektor of eigen energies 
zl=300;
zd=300;
zz=-zl:zd;
psi0=tf_step(zz,energije(1));
psi1=tf_step(zz,energije(2));
psi2=tf_step(zz,energije(3));
psi3=tf_step(zz,energije(4));
m01=sum(psi0(:,2).*zz'.*psi1(:,2));
m12=sum(psi1(:,2).*zz'.*psi2(:,2));
m23=sum(psi2(:,2).*zz'.*psi3(:,2));
m03=sum(psi0(:,2).*zz'.*psi3(:,2));
product=[m01 m12 m23 m03 m01*m12*m23*m03];
end

