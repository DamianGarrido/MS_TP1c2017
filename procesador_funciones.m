1;#Simpre! para definir un script de funciones

#Transferencia dados polos y ceros imaginarios
function retval  = polinomio_dadas_raices(raices) 
  s = tf('s');
  productoria = 1;
  for raiz = raices
    if(imag(raiz) == 0)
      productoria = productoria *(s - raiz);
    else
      productoria = productoria *((s - real(raiz))^2 + (imag(raiz))^2);
    endif
  endfor
  retval = productoria;
endfunction

function retval  = transferencia_dados_polinomios 
  x = input('Ingrese coheficientes numerador [a,b,c,...]: ');
  y = input('Ingrese coheficientes denominador [a,b,c,...]: ');
  retval = tf(x,y)
endfunction

function callback_transferencia_dados_polinomios(h, e, numerador, denominador) 
  matrix_num = str2num(get(numerador, 'String'));
  matrix_den = str2num(get(denominador, 'String'));
  funcion_transferencia = tf(numerador,denominador);
  guadar_transferencia(funcion_transferencia);
  imprimir_mensaje(funcion_transferencia);
endfunction

function guadar_transferencia(transferencia) 
  transferencia
endfunction

function imprimir_mensaje(transferencia) 
  transferencia
endfunction

function retval  = transferencia_dados_ceros_polos_ganancia
  fprintf("Si decide ingresar un complejo no ingrese su conjugado, este ya se incluye segun el T.F.A\n");
  fprintf("Este programa solo genera transferencias con coheficientes reales\n");
  ceros = input('Ingrese ceros [a,b,c,...]: ');
  polos = input('Ingrese polos [a,b,c,...]: ') ;
  ganancia = input('Ingrese ganancia k: ');
  
  pol_numerador = polinomio_dadas_raices(ceros);
  pol_denominador = polinomio_dadas_raices(polos);
  
  s = tf('s');
  retval = ganancia*pol_numerador/pol_denominador
 
endfunction

function indicar_polos(transferencia)
 [Zer,Pol,k]=tf2zp(transferencia);
 Pol
endfunction

function indicar_ceros(transferencia)
 [Zer,Pol,k]=tf2zp(transferencia);
 Zer
endfunction

function indicar_ganancia(transferencia)
 [Zer,Pol,k]=tf2zp(transferencia);
 k
endfunction

function indicar_polos_ceros_ganancia(transferencia)
 [Zer,Pol,k]=tf2zp(transferencia);
 Zer,Pol,k
endfunction

function mostrar_transferencia(transferencia)
 transferencia
endfunction

function mostrar_constelacion(transferencia)
 pzmap(transferencia)
endfunction

function indicar_estabilidad(transferencia)
  [Zer,Pol,k]=tf2zp(transferencia);
  parte_real = real(Pol);
  if (parte_real <= 0)
    printf("estable\n");
  else
    printf("inestable\n");
  endif
endfunction

function mostrar_todas_caracteristicas(transferencia)
  tf = transferencia;
  mostrar_transferencia(tf);
  indicar_polos_ceros_ganancia(tf);
  mostrar_constelacion(tf);
  indicar_estabilidad(tf);
endfunction

function mostrar_menu 
  fprintf("Menu Opciones\n")
  fprintf("0.Salir\n")
  fprintf("1.Ingresar transferencia dados 2 polinomios\n")
  fprintf("2.Ingresar transferencia dados ceros, polos y ganancia\n")
  fprintf("3.Indicar polos\n")
  fprintf("4.Indicar ceros\n")
  fprintf("5.Marcar ganancia\n")
  fprintf("6.Mostrar polos, ceros y ganancia\n")
  fprintf("7.Mostrar transferencia como cociente de polinomios.\n")
  fprintf("8.Mostrar constelacion de polos y ceros.\n")
  fprintf("9.Indicar estabilidad.\n")
  fprintf("10.Obtener todas las caracteristicas de la transferencia.\n")  
  fprintf("99.Mostrar menu nuevamente\n")
endfunction  
  
  

  
  
  
  
