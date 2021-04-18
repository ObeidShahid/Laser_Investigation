global ubar ustep cw cs
ubar=0.375;  %x=0.45
ustep=0.165;
energy=0:0.001:ubar;
cw=23;
cs=75;
cw_data = [];
cs_data = [];
Vs_data = [];
dipole_prod = [];
E21 = 0;
E32 = 0;
product = 0;

for ustep = 0.35:-0.01:0.02 
    ustep
 for cs = 100:-1:5
  for cw=1:100   
  %while cw < 100
    cw;
    cs;
    ustep;
   % ubar
%   pause
bound_energy = fzeros4('QW2',0.001,ubar,0.001); %Call fzeros3
%pause
% product = product_e(bound_energy);
    if (length(bound_energy)>=3)
    
        E21 = bound_energy(2)-bound_energy(1);  %Calculate delta E21
        E32 = bound_energy(3)-bound_energy(2);  %Calculate delta E32
        %pause

        if E21<=0.117 && E21 >= 0.114 && E32<=0.117 && E32 >= 0.115  %Resonance condition
        cw_data = [cw_data cw]         
        cs_data = [cs_data cs]
        Vs_data = [Vs_data ustep]
        % dipole_prod = [dipole_prod product(4)];
        end
    end
   %cw = cw + 1;

  end
   %cw = 105-cs;   %Reset cw value based on the value of cs to avoid premature termination
 end 
   %cw = 105-cs;
end
display(cw_data);
display(cs_data);
display(Vs_data);

 for i = 1:length(Vs_data)
     ustep = Vs_data(i);
     cs = cs_data(i);
     cw = cw_data(i);
     bound_energy=fzeros4('QW2',0.001,ubar,0.001);
     product = product_e(bound_energy);
     dipole_prod = [dipole_prod product(4)];
 end
 display(dipole_prod*-1);
 plot(cw_data, dipole_prod*-1,'.')
