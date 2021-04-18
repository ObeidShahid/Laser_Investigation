function even_function = even_calculate(E)

h = 6.62607015E-34; % Planks Constant
hbar = h/(2*pi); %Planks constant/2*pi
me = 9.1093837015E-31; % Mass of an electron
m = 0.067*me; 
lw = 100E-10;
Ec = 1.602176565E-19; %Charge of an electron
V = 1*Ec; 
k = ((sqrt(2*m.*E))/hbar);
sk = ((sqrt(2*m*(V-E)))/hbar);

even_equation_cos = k.*tan((k.*lw)/2) - (sk);

even_function = even_equation_cos;

end