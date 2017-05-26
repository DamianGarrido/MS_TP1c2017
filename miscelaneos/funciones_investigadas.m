#tf(pol_numerador, pol_denominador) => Funcion_transferencia
num = [1, 5, 7];
den = [0, 1, -1];
sys = tf (num, den);

#zpk(ceros, polos, ganancia) => Funcion_transferencia
Zer = [1];
Pol = [0,2];
k = 1;
A=zpk(Zer,Pol,k);

#tf2zp(pol_numerador, pol_denominador)=> [Ceros, Polos, Ganancia]
[Zer,Pol,k]=tf2zp(sys);

#pzmap()=> [polos,ceros] || Grafica (si no se asigna)
[p,z] =pzmap(sys);


#tfdata(funcion_transferencia)=>[pol_numerador, pol_denominador]
[num,den] = tfdata(sys);

parte_real = real([-1,-3+i,i,12312]);
if (parte_real <= 0)
  #printf("estable");
else
  #printf("inestable");
endif




#Transferencia dados polos y ceros imaginarios
function retval  = polinomio_dadas_raices(raices) 
  s = tf('s');
  productoria = 1;
  for raiz = raices
    productoria = productoria *((s-real(raiz))^2 + (imag(raiz))^2);
  endfor
  retval = productoria;
endfunction

ceros = input('ingrese ceros :');
#pol_numerador = polinomio_dadas_raices(ceros);
  productoria = 1;
  for cero = ceros
    productoria = productoria *((s-real(cero))^2 + (imag(cero))^2);
  endfor
productoria

#polos = input('ingrese polos :');
#pol_denominador = polinomio_dadas_raices(polos);

#s = tf('s');
#g=pol_numerador/pol_denominador








