h = 6.62607015E-34; 
hbar = h/(2*pi); 
me = 9.1093837015E-31; 
m = 0.067*me; 
lw = 100E-10;
Ec = 1.602176565E-19; 
V = 1*Ec; 
E = ((1*Ec)/1000):((1*Ec)/1000):1*Ec
k = ((sqrt(2*m.*E))/hbar);
sk = ((sqrt(2*m*(V-E)))/hbar);

even_parity = k.*tan((k.*lw)/2) - sk;
odd_parity = k.*cot((k.*lw)/2) - sk;

even_equation_cos = Even_Parity_Function(E);
odd_equation_cos = Odd_Parity_Function(E);
odd_even_cos = odd_equation_cos.*even_equation_cos;

fun = @(E) Even_Parity_Function(E);
roots = (fzeros4(fun,(Ec/1000),(Ec),(Ec/1000))/Ec);

plot((E/Ec*1000),even_equation_cos)
xlabel('Energy E (meV)') 
ylabel('f(E) (arbitrary units)') 
grid;


