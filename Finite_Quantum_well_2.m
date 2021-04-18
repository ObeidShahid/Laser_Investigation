%% Individual Project Finite Quantum Well %%

h = 6.62607015E-34; % Planks Constant
hbar = h/(2*pi); %Planks constant/2*pi
me = 9.1093837015E-31; % Mass of an electron
m = 0.067*me; 
lw = 100E-10;
Ec = 1.602176565E-19; %Charge of an electron
V = 1*Ec; 
E = ((1*Ec)/1000):((1*Ec)/1000):1*Ec
k = ((sqrt(2*m.*E))/hbar);
sk = ((sqrt(2*m*(V-E)))/hbar);
% 
even_equation = k.*tan((k.*lw)/2) - sk;
odd_equation = k.*cot((k.*lw)/2) - sk;

%even_equation_cos = k.*sin((k.*lw)/2) - cos(sk);
% fun = @(E) k.*sin((k.*lw)/2) - cos(sk);
% fzeros4(fun,(Ec/1000),(Ec),(Ec/1000))
% odd_equation_sin = k.*((sin((k.*lw)/2))/(sqrt(1-(sin((k.*lw)/2)).^2))) - sk;
% x0 = 0
%  f(E) = k.*tan((k.*lw)/2) - sk;
% fun = @(E) k.*tan((k.*lw)/2) - sk
% dkdE = (sqrt(2*m))./(2*sqrt(E).*hbar);
% dskdE = -sqrt(2*m)./2*sqrt(V-E)*hbar;
% df(E) = dkdE.*tan((k*lw)/2)+ k.*sech(((k*lw)/2).^2)*(lw/2).*dkdE-dskdE;
% Efinal(1) = f(100)
% for i = 1:999
%    Efinal(i+1) = Efinal(i) - f(i)/df(i); 
% end
even_equation_cos = even_calculate(E);
odd_equation_cos = odd_calculate(E);
odd_even_cos = odd_equation_cos.*even_equation_cos;

fun = @(E) even_calculate(E);
roots = (fzeros4(fun,(Ec/1000),(Ec),(Ec/1000))/Ec)
plot((E/Ec*1000),even_equation_cos)%,(E/Ec*1000),odd_equation_cos,(E/Ec*1000),odd_even_cos*1E-8);
xlabel('Energy E (meV)', 'FontSize', 20) 
ylabel('f(E) (arbitrary units)', 'FontSize', 20) 
grid;
%plot (f(E),'*');
%x = fzero(fun,x0)

