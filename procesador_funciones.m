#Consola - Ingresar datos
  foo = 0;
  
  #Funciones auxiliares
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
  
  function mostrar_menu 
    fprintf("Menu Opciones\n")
    fprintf("0.Salir\n")
    fprintf("1.Transferencia dados 2 polinomios\n")
    fprintf("2.Transferencia dados ceros, polos y ganancia\n")
    fprintf("3.Indicar polos de la transferencia actual\n")
    fprintf("99.Mostrar menu nuevamente\n")
  endfunction  
  
  #Main
  ft = 0;
  mostrar_menu
  opcion = input('Ingrese una opcion: ');
  while(opcion ~= 0)
    switch(opcion)
    case 1  
      ft = transferencia_dados_polinomios
    case 2
      ft = transferencia_dados_ceros_polos_ganancia
    case 3
      indicar_polos(ft)
    case 99
      mostrar_menu
    otherwise
      fprintf("Opcion no reconocida\n")
    endswitch
    opcion = input('Ingrese una opcion: ');
  endwhile
  

  
  
  
  
