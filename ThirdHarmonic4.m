global ubar ustep cw cs
ubar=0.375;  %x=0.45
ustep=0.125;
energy=0:0.001:ubar;
cw=40;
cs=57;
cw_data = [];
cs_data = [];
Vs_data = [];
ubar_data = [];
e21_data = [];
e32_data = [];
e43_data = [];
dipole_prod = [];
E21 = 0;
E32 = 0;
E43 = 0;
product = 0;

for ubar = 0.70:-0.01:0.25
    ubar
for ustep = 0.20:-0.01:0.07 
    ustep
 for cs = 70:-1:20
  for cw=80:1:100   
  %while cw < 100
    cw;
    cs;
    ustep;
   % ubar
%   pause
bound_energy = fzeros4('QW2',0.001,(ubar-0.001),0.001); %Call fzeros3
%pause
% product = product_e(bound_energy);
    if (length(bound_energy)>=4)
    
        E21 = bound_energy(2)-bound_energy(1);  %Calculate delta E21
        E32 = bound_energy(3)-bound_energy(2);  %Calculate delta E32
        E43 = bound_energy(4)-bound_energy(3);  %Calculate delta E43
        %pause

        if E21<=0.101 && E21 >= 0.099 && E32<=0.101 && E32 >= 0.099 && E43<=0.101 && E43 >= 0.099  %Resonance condition
        cw_data = [cw_data cw]         
        cs_data = [cs_data cs]
        Vs_data = [Vs_data ustep]
        ubar_data = [ubar_data ubar]
        e21_data = [e21_data E21];
        e32_data = [e32_data E32];
        e43_data = [e43_data E43];
        % dipole_prod = [dipole_prod product(4)];
        end
    end
   %cw = cw + 1;

  end
   %cw = 105-cs;   %Reset cw value based on the value of cs to avoid premature termination
 end 
   %cw = 105-cs;
end
end
display(cw_data);
display(cs_data);
display(Vs_data);
display(ubar_data);
display(e21_data);
display(e32_data);
display(e43_data);

 for i = 1:length(Vs_data)
     ustep = Vs_data(i);
     cs = cs_data(i);
     cw = cw_data(i);
     ubar=ubar_data(i); %THIS LINE WAS MISSING
     bound_energy=fzeros4('QW2',0.001,ubar,0.001);
     product = thirdharmonic_product_e(bound_energy);
     dipole_prod = [dipole_prod product(5)]; %THIS LINE SHOULD HAVE product(5)
 end
 display(abs(dipole_prod));
 plot(cw_data, dipole_prod,'o')
 title({'Product of Dipole Matrix Elements which satisfy the Energy Seperation', 'conditions of 0.080eV for Third Harmonic Generation'}, 'FontSize', 20)
 xlabel('Well Width A (cw)', 'FontSize', 20) 
 ylabel('Product of Dipole Matrix Elements', 'FontSize', 20) 
