1;#Simpre! para definir un script de funciones

function retval  = transferencia_dados_polinomios 
  x = input('Ingrese coheficientes numerador [a,b,c,...]: ');
  y = input('Ingrese coheficientes denominador [a,b,c,...]: ');
  retval = tf(x,y)
endfunction

function retval  = transferencia_dados_ceros_polos_ganancia
  x = input('Ingrese ceros [a,b,c,...]: ');
  y = input('Ingrese polos [a,b,c,...]: '); 
  z = input('Ingrese ganancia [a,b,c,...]: ');
  retval = zpk(x,y,z)

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
  
  

  
  
  
  
