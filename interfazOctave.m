#Consola - Ingresar datos
pkg load control
pkg load signal
source ("procesador_funciones.m");

function form_ingresar_transferencia_polinomios(src,event,formulario)
  f = formulario;
  
  uipanel('Parent',f,'Title','Obtener la función transferencia','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura

  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','INGRESAR COHEFICIENTES DE POLINOMIOS'); 
               
  #Labels-Inputs
  i=75; #posicion inicial inferior
  j=40;  #interlineado
  d=100; #espaciado

  label_numerador = uicontrol('Parent',f,"style", "text",'Position',[k i+j*6 75 30],'String','Numerador'); 
  input_numerador = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*6 75 30]); 

  label_denominador = uicontrol('Parent',f,"style", "text",'Position',[k i+j*5 75 30],'String','Denominador'); 
  input_denominador = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*5 75 30]); 

  nota="Nota:\nEjemplo coheficientes de polinomios: [1,2,3].\nDe derecha a izquierda coheficiente independiente, lineal, cuadratico.\nP(s)=s^2+2s+3";
  label_nota = uicontrol('Parent',f,"style", "edit",'max',50,'min',1,'Position',[k i+j-50 a 30+100],'String',nota, 'horizontalalignment', 'left', 'verticalalignment', 'top'); 
  button_confirmar = uicontrol('Parent',f,'Position',[k i+j*4 a 30],'String','Confirmar','callback',  {@callback_transferencia_dados_polinomios , input_numerador, input_denominador});
end

function form_ingresar_transferencia_dados_pzk(src,event,formulario)
  f = formulario;
  
  uipanel('Parent',f,'Title','Obtener la función transferencia','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura

  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','INGRESAR POLOS CEROS Y GANANCIA'); 
               
  #Labels-Inputs
  i=75; #posicion inicial inferior
  j=40;  #interlineado
  d=100; #espaciado

  label_polos = uicontrol('Parent',f,"style", "text",'Position',[k i+j*5 75 30],'String','Polos'); 
  input_polos = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*5 75 30]); 

  label_ceros = uicontrol('Parent',f,"style", "text",'Position',[k i+j*6 75 30],'String','Ceros'); 
  input_ceros = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*6 75 30]); 
  
  label_ganancia = uicontrol('Parent',f,"style", "text",'Position',[k i+j*4 75 30],'String','Ganancia'); 
  input_ganancia = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*4 75 30]); 
  
  nota="Nota\nEjemplo ceros o polos: [1,i].\nEjemplo ganancia: 1.\nSi decide ingresar un numero imaginario no ingrese su conjugado.\nEste ya se incluye, este programa genera funciones\nde transferencia solo con coheficiente reales.";
  label_nota = uicontrol('Parent',f,"style", "edit",'max', 50, 'min', 1, 'Position',[k i+j-55 a 30+100],'String',nota); 
  button_confirmar = uicontrol('Parent',f,'Position',[k i+j*3 a 30],'String','Confirmar','callback',  {@callback_transferencia_dados_pzk , input_polos, input_ceros, input_ganancia}');

end



function form_mostrar_transferencia(src,event,formulario)

  f = formulario;
  
  uipanel('Parent',f,'Title','Caracteristicas','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura
  
  % Get the structure using guidata in the local function
  myhandles = guidata(gcbo);
  val = myhandles.numberOfErrors;
  funcion_transferencia = myhandles.transferencia;
  
  
  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','Expresion de la Funcion de Transferencia'); 
  label_funcion_transferencia = uicontrol('Parent',f,"style", "text",'Position',[k h-200 a l*6],'String',evalc('funcion_transferencia')); 


end

function form_mostrar_polos(src,event,formulario)

  f = formulario;
  
  uipanel('Parent',f,'Title','Caracteristicas','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura
  
  % Get the structure using guidata in the local function
  myhandles = guidata(gcbo);
  val = myhandles.numberOfErrors;
  Polos = myhandles.polos;
  
  
  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','POLOS DE LA FUNCION DE TRANSFERENCIA'); 
  label_funcion_transferencia = uicontrol('Parent',f,"style", "text",'Position',[k h-200 a l*6],'String',evalc('Polos')); 


end

function form_mostrar_ceros(src,event,formulario)

  f = formulario;
  
  uipanel('Parent',f,'Title','Caracteristicas','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura
  
  % Get the structure using guidata in the local function
  myhandles = guidata(gcbo);
  val = myhandles.numberOfErrors;
  Ceros = myhandles.ceros;
  
  
  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','CEROS DE LA FUNCION DE TRANSFERENCIA'); 
  label_funcion_transferencia = uicontrol('Parent',f,"style", "text",'Position',[k h-200 a l*6],'String',evalc('Ceros')); 


end
function form_mostrar_ganancia(src,event,formulario)

  f = formulario;
  
  uipanel('Parent',f,'Title','Caracteristicas','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura
  
  % Get the structure using guidata in the local function
  myhandles = guidata(gcbo);
  val = myhandles.numberOfErrors;
  Ganancia = myhandles.ganancia;
  
  
  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','GANANCIA DE LA FUNCION DE TRANSFERENCIA'); 
  label_funcion_transferencia = uicontrol('Parent',f,"style", "text",'Position',[k h-200 a l*6],'String',evalc('Ganancia')); 


end

function form_estabilidad(src,event,formulario)

  f = formulario;
  
  uipanel('Parent',f,'Title','Caracteristicas','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura
  
  % Get the structure using guidata in the local function
  myhandles = guidata(gcbo);
  val = myhandles.numberOfErrors;
  Estabilidad = myhandles.estabiliad;
  
  
  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','ESTABILIDAD DE LA FUNCION DE TRANSFERENCIA'); 
  label_funcion_transferencia = uicontrol('Parent',f,"style", "text",'Position',[k h-200 a l*6],'String',evalc('Estabilidad')); 


end

function refresh_figure(src,event,figure)
  refresh(figure);
end

function form_graficar_constelacion(transferencia)
  figura_constelacion = figure;
  pzmap(transferencia);
  button_refresh = uicontrol('Parent',figura_constelacion,'String','Refrescar','callback',  {@refresh_figure, figura_constelacion}');
endfunction

function form_mostrar_constelacion(src,event,formulario)
  % Get the structure using guidata in the local function
  myhandles = guidata(gcbo);
  val = myhandles.numberOfErrors;
  Transferencia = myhandles.transferencia;  
  f = formulario;
  uipanel('Parent',f,'Title','Caracteristicas','FontSize',12,'BackgroundColor','yellow');
  form_graficar_constelacion(Transferencia);
  
end

function form_obtener_todas_caracteristicas(src,event,formulario)
  f = formulario;
  
  uipanel('Parent',f,'Title','Caracteristicas','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura
  
  % Get the structure using guidata in the local function
  myhandles = guidata(gcbo);
  val = myhandles.numberOfErrors;
  funcion_transferencia = myhandles.transferencia;
  Polos = myhandles.polos;
  Ceros = myhandles.ceros;
  Ganancia = myhandles.ganancia;
  Estabilidad = myhandles.estabiliad;
    
  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','TODAS LAS CARACTERISTICAS'); 
  edit_funcion_transferencia = uicontrol('Parent',f,"style", "edit",'enable', 'on','max',50,'min',1,'Position',[k h-65 a l*2],'String',evalc('funcion_transferencia'));
  edit_polos = uicontrol('Parent',f,"style", "edit",'enable', 'on','max',50,'min',1,'Position',[k h-135 a l*2],'String',evalc('Polos')); 
  edit_ceros = uicontrol('Parent',f,"style", "edit",'enable', 'on','max',50,'min',1,'Position',[k h-205 a l*2],'String',evalc('Ceros')); 
  edit_ganancia = uicontrol('Parent',f,"style", "edit",'enable', 'on','max',50,'min',1,'Position',[k h-275 a l*2],'String',evalc('Ganancia')); 
  edit_estabilidad = uicontrol('Parent',f,"style", "edit",'enable', 'on','max',50,'min',1,'Position',[k h-345 a l*2],'String',evalc('Estabilidad')); 
  form_graficar_constelacion(funcion_transferencia);
  
    
end

function form_inicio(src,event,formulario)
  f = formulario;
  panel = uipanel('Parent',f,'Title','ASIC – Análisis de Sistemas de Control','FontSize',12,'BackgroundColor','yellow','titleposition', 'centertop');
  panax = axes('Units','normal', 'Position', [0 0 1 1], 'Parent', panel);
  imshow("main.JPG", 'Parent', panax);
end

function mostrar (h, e, p, q )
  # Se debe iniciar la figura
  figure;
  #Con get ( var, 'String) devuelve el valor como string '
  x = -10:10;
  #x=get(x,'String');
  #Para obtener el titulo de la funcion 
  funcion1 = get(q,'String');
  #cargo la funcion a la variable Funcion2 , obtener por parametro de y
  funcion2 =  x.^2;
 
  plot (x, funcion2);
  xlabel ("x");
  ylabel (funcion1);
  title ("Simple 2-D Plot");
endfunction


form_master = figure("position", [300 200 560 420]);

form_inicio(0,0,form_master);



% create structure of handles
myhandles = guihandles(form_master); 
% Add some additional data as a new field called numberOfErrors
myhandles.numberOfErrors = 0; 
myhandles.transferencia = 0;
myhandles.polos = 0;
myhandles.ceros = 0;
myhandles.ganancia = 0;
myhandles.estabiliad = 0;

% Save the structure
guidata(form_master,myhandles) 

menu_ingresar = uimenu(form_master,'Label','Ingresar');
    uimenu(menu_ingresar,'Label','Coheficientes','Callback',  {@form_ingresar_transferencia_polinomios,form_master} );
    uimenu(menu_ingresar,'Label','Polos, ceros y ganancia','Callback',{@form_ingresar_transferencia_dados_pzk,form_master});
    
menu_caracteristica = uimenu(form_master,'Label','Características');
    uimenu(menu_caracteristica,'Label','Expresion de la funcion de transferencia','Callback',  {@form_mostrar_transferencia,form_master} );
    uimenu(menu_caracteristica,'Label','Ceros','Callback',{@form_mostrar_ceros,form_master} );   
    uimenu(menu_caracteristica,'Label','Polos','Callback',{@form_mostrar_polos,form_master} );  
    uimenu(menu_caracteristica,'Label','Ganancia','Callback',{@form_mostrar_ganancia,form_master} );  
    uimenu(menu_caracteristica,'Label','Constelacion','Callback',{@form_mostrar_constelacion, form_master} );  
    uimenu(menu_caracteristica,'Label','Analisis Estabilidad','Callback',{@form_estabilidad, form_master} );  
    uimenu(menu_caracteristica,'Label','Obtener todas las Caracteristicas','Callback',{@form_obtener_todas_caracteristicas, form_master} );
menu_inicio = uimenu(form_master,'Label','Inicio', 'Callback',{@form_inicio, form_master} );
    
#Plantilla para callbacks
#position [x,y,a,h]
 #{
function callback_ingresar_transferencia_zpk(src,event,formulario)
 
  f = formulario;
  
  uipanel('Parent',f,'Title','La mejor aplicacion del Mundo','FontSize',12,'BackgroundColor','yellow');
  
  #Global
  k=43;#margen izquierdo

  #Header
  a=500;#ancho 
  l=30; #largo
  h=360;  #altura

  label_header = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','INGRESAR COHEFICIENTES DE POLINOMIOS'); 
               
  #Labels-Inputs
  i=75; #posicion inicial inferior
  j=40;  #interlineado
  d=100; #espaciado

  label_numerador = uicontrol('Parent',f,"style", "text",'Position',[k i+j*6 75 30],'String','Numerador'); 
  input_numerador = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*6 75 30]); 

  label_denominador = uicontrol('Parent',f,"style", "text",'Position',[k i+j*5 75 30],'String','Denominador'); 
  input_denominador = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*5 75 30]); 

  button_confirmar = uicontrol('Parent',f,'Position',[k i+j*4 a 30],'String','Confirmar','callback', {@callback_transferencia_dados_polinomios , input_numerador, input_denominador});
  
 
  t3 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*4 75 30],'String','Input'); 
  e3 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*4 75 30]);  

  t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*3 75 30],'String','Input'); 
  e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*3 75 30]);  

  t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*2 75 30],'String','Input'); 
  e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*2 75 30]); 

  t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j 75 30],'String','Input'); 
  e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j 75 30]);  

  t2 = uicontrol('Parent',f,"style", "text",'Position',[k i 75 30],'String','Input'); 
  e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i 75 30]);  

  #Grafico
  t2 = uicontrol('Parent',f,"style", "text",'Position',[k*6.2 i 275 270],'String','Grafico'); 

  #Botonera
  i=30; #posicion inicial inferior
  j=100; #espaciado

  #u1 = uicontrol('Parent',f,'Position',[k  i 75 30],'String','Confirmar','callback', {@callback_transferencia_dados_polinomios , e2, e3});
  #u2 = uicontrol('Parent',f,'Position',[k+j i 75 30],'String','Borrar');
  #u3 = uicontrol('Parent',f,'Position',[k+j*2 i 75 30],'String','Cancel');
  
 
end
 
 #}


