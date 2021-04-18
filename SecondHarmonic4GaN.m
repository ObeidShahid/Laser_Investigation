global ubar ustep cw cs
ubar=1.2;  %x=0.6
ustep=0.280;
energy=0:0.001:ubar;
cw=30;
cs=30;
cw_data = [];
cs_data = [];
Vs_data = [];
ubar_data=[];
dipole_prod = [];
E21 = 0;
E32 = 0;
product = 0;
for ubar=0.7:0.01:1.4
    ubar
for ustep = 0.350:-0.01:0.230 
    ustep
 for cs = 40:-1:10
  for cw=10:1:40   
  %while cw < 100
    cw;
    cs;
    ustep;
   % ubar
%   pause
bound_energy = fzeros4('QW2GaN',0.001,ubar,0.001); %Call fzeros3
%pause
% product = product_e(bound_energy);
    if (length(bound_energy)>=3)
    
        E21 = bound_energy(2)-bound_energy(1);  %Calculate delta E21
        E32 = bound_energy(3)-bound_energy(2);  %Calculate delta E32
        %pause

        if E21<=0.242 && E21 >= 0.238 && E32<=0.242 && E32 >= 0.238  %Resonance condition
        cw_data = [cw_data cw]         
        cs_data = [cs_data cs]
        Vs_data = [Vs_data ustep]
        ubar_data= [ubar_data ubar]
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

 for i = 1:length(Vs_data)
     ustep = Vs_data(i);
     cs = cs_data(i);
     cw = cw_data(i);
     ubar=ubar_data(i);
     bound_energy=fzeros4('QW2GaN',0.001,ubar,0.001);
     product = product_eGaN(bound_energy);
     dipole_prod = [dipole_prod product(4)];
 end
 display(dipole_prod*-1);
 plot(cw_data, abs(dipole_prod),'o')
