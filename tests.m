#TF(numerador, denominador)
num = [1, 5, 7];
den = [1, 5, 6];
sys = tf (num, den);

#TF(ceros,polos,ganancia)
Zer = [1];
Pol = [0,2];
k = 1;#Multiplica -> numerador
A=zpk(Zer,Pol,k);

#Ceros_Polos_Ganacia (numerador, denominador)
[Zer,Pol,k]=tf2zp([5 2],[1 4 20])



