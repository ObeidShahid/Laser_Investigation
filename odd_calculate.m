function odd_function = odd_calculate(E)

h = 6.62607015E-34; 
hbar = h/(2*pi); 
me = 9.1093837015E-31; 
m = 0.067*me; 
lw = 100E-10;
Ec = 1.602176565E-19; 
V = 1*Ec; 
k = ((sqrt(2*m.*E))/hbar);
sk = ((sqrt(2*m*(V-E)))/hbar);

odd_equation_cos = k.*cot((k.*lw)/2) - (sk);

odd_function = odd_equation_cos;

end