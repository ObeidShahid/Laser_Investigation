kl = 0;

%potential barrier - 0.5
for(i=0.6:-0.1:0.2)
ubar=i; 

%Potential step - 0.2
for(j=0.4:-0.1:0.1)
ustep=j; 

%Well width - 50
for(k=150:-1:45)
cw=k; 

%Step width - 20
for(o=100:-1:20)
cs=o;

%int counter = 1;
energy=0:0.001:ubar;

global ubar ustep cw cs set

y=QW2(energy);

%subplot(2,2,1)
%plot(energy,y)

kl = kl + 1
bound_energy=fzeros4('QW2',0.001,ubar,0.001);

bound_diff(1) = (bound_energy(2)-bound_energy(1));
bound_diff(2) = (bound_energy(3)-bound_energy(2));
%bound_diff(3) = (bound_energy(3)-bound_energy(1))

%if((0.176>=bound_diff(1)>=0.175)&&(0.183>=bound_diff(2)>=0.182))
store_parameters(kl,1)= ubar;
store_parameters(kl,2)= ustep;
store_parameters(kl,3)= cw;
store_parameters(kl,4)= cs;
store_parameters(kl,5)= bound_diff(1);
store_parameters(kl,6)= bound_diff(2);
%end

%counter = counter + 1;
end
end
end
end

% plot(store_parameters(:,3),store_parameters(:,5))
% title('How CS effects the difference in bound energies')
% xlabel('CS A') 
% ylabel('Bound Energy eV') 
% grid;
% 
% hold on
% plot(store_parameters(:,3),store_parameters(:,6))
% legend('E2 - E1', 'E3 - E2')
% hold off
            final_parameter(1,1) = 0;
            final_parameter(1,2) = 0;
            final_parameter(1,3) = 0;
            final_parameter(1,4) = 0;
            final_parameter(1,5) = 0;
            final_parameter(1,6) = 0;
set=1;
for(lol=1:1:kl)
    
    if(0.095<store_parameters(lol,5) && store_parameters(lol,5)<0.12)
        if(0.095<store_parameters(lol,6) && store_parameters(lol,6)<0.12)
            final_parameter(set,1) = store_parameters(lol,1);
            final_parameter(set,2) = store_parameters(lol,2);
            final_parameter(set,3) = store_parameters(lol,3);
            final_parameter(set,4) = store_parameters(lol,4);
            final_parameter(set,5) = store_parameters(lol,5);
            final_parameter(set,6) = store_parameters(lol,6);
            set = set + 1;
        end
    end
end

% z_left=-300
% 
% z_right=300
% 
% z=z_left:z_right
% 
% wfunc1=tf_step(z,bound_energy(1))
% 
% wfunc2=tf_step(z,bound_energy(2))
% 
% wfunc3=tf_step(z,bound_energy(3))
% 
% subplot(3,2,1)
% plot(wfunc1(:,1),wfunc1(:,2))
% title('Wavefunction 1')
% xlabel('Z Coordinate') 
% ylabel('Wave Function') 
% grid;
% 
% subplot(3,2,2)
% plot(wfunc1(:,1),wfunc1(:,2).^2) 
% title('Wavefunction 1')
% xlabel('Z Coordinate') 
% ylabel('Probability of Finding Electron') 
% grid;
% 
% subplot(3,2,3)
% plot(wfunc2(:,1),wfunc2(:,2))
% title('Wavefunction 2')
% xlabel('Z Coordinate') 
% ylabel('Wave Function') 
% grid;
% 
% subplot(3,2,4)
% plot(wfunc2(:,1),wfunc2(:,2).^2)
% title('Wavefunction 2')
% xlabel('Z Coordinate') 
% ylabel('Probability of Finding Electron') 
% grid;
% 
% subplot(3,2,5)
% plot(wfunc3(:,1),wfunc3(:,2))
% title('Wavefunction 3')
% xlabel('Z Coordinate') 
% ylabel('Wave Function') 
% grid;
% 
% subplot(3,2,6)
% plot(wfunc3(:,1),wfunc3(:,2).^2)
% title('Wavefunction 3')
% xlabel('Z Coordinate') 
% ylabel('Probability of Finding Electron') 
% grid;
% 
