#tf(pol_numerador, pol_denominador) => Funcion_transferencia
num = [1, 5, 7];
den = [1, 5, 6];
sys = tf (num, den);

#zpk(ceros, polos, ganancia) => Funcion_transferencia
Zer = [1];
Pol = [0,2];
k = 1;
A=zpk(Zer,Pol,k);

#tf2zp(pol_numerador, pol_denominador)=> [Ceros, Polos, Ganancia]
[Zer,Pol,k]=tf2zp(sys)

#pzmap()=> [polos,ceros] || Grafica (si no se asigna)
[p,z] =pzmap(sys);


#tfdata(funcion_transferencia)=>[pol_numerador, pol_denominador]
[num,den] = tfdata(sys);





