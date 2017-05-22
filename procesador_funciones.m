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

function mostrar_transferencia(transferencia)
 transferencia
endfunction

function mostrar_menu 
  fprintf("Menu Opciones\n")
  fprintf("0.Salir\n")
  fprintf("1.Transferencia dados 2 polinomios\n")
  fprintf("2.Transferencia dados ceros, polos y ganancia\n")
  fprintf("3.Indicar polos de la transferencia actual\n")
  fprintf("4.Indicar ceros de la transferencia actual\n")
  fprintf("5.Marcar ganancia de la transferencia actual\n")
  fprintf("6.Mostrar transferencia actual.\n")
  fprintf("99.Mostrar menu nuevamente\n")
endfunction  
  
  

  
  
  
  
