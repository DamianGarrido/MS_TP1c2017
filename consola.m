#Consola - Ingresar datos
pkg load control
pkg load signal
source ("procesador_funciones.m");

ft = 0;
mostrar_menu
opcion = input('Ingrese una opcion: ');
while(opcion ~= 0)
  switch(opcion)
  case 1  
    ft = transferencia_dados_polinomios;
  case 2
    ft = transferencia_dados_ceros_polos_ganancia;
  case 3
    indicar_polos(ft);
  case 4
    indicar_ceros(ft);
  case 5
    indicar_ganancia(ft);
  case 6
    indicar_polos_ceros_ganancia(ft);
  case 7
    mostrar_transferencia(ft);
  case 8
    mostrar_constelacion(ft);
  case 9
    indicar_estabilidad(ft);
  case 10
    mostrar_todas_caracteristicas(ft);
  case 99
    mostrar_menu
  otherwise
    fprintf("Opcion no reconocida\n")
  endswitch
  opcion = input('Ingrese una opcion: ');
endwhile
  