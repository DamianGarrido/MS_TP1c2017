#Consola - Ingresar datos
pkg load control
pkg load signal
source ("procesador_funciones.m");

funcion_transferencia = 0;

function form_ingresar_transferencia_polinomios(src,event,formulario)
  

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

  nota="Nota\n Ejemplo coheficientes de polinomios: [1,2,3].\nDe derecha a izquierda termino independiente, lineal, cuadratico"
  label_nota = uicontrol('Parent',f,"style", "text",'Position',[k i+j-50 a 30+100],'String',nota); 
  button_confirmar = uicontrol('Parent',f,'Position',[k i+j*4 a 30],'String','Confirmar','callback',  {@callback_transferencia_dados_polinomios , input_numerador, input_denominador});
end


function form_mostrar_transferencia(src,event,formulario)
  
  f = formulario;
  
  uipanel('Parent',f,'Title','La mejor aplicacion del Mundo','FontSize',12,'BackgroundColor','yellow');
  
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
  label_funcion_transferencia = uicontrol('Parent',f,"style", "text",'Position',[k h-100 a l*3],'String',evalc('funcion_transferencia')); 


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


#form_master = figure('MenuBar','None'); MenuBar funciona bien aleatoriamente
form_master = figure('Toolbar','none'); 
% create structure of handles
myhandles = guihandles(form_master); 
% Add some additional data as a new field called numberOfErrors
myhandles.numberOfErrors = 0; 
myhandles.transferencia = 0;
% Save the structure
guidata(form_master,myhandles) 

menu_ingresar = uimenu(form_master,'Label','Ingresar Transferencia');
    uimenu(menu_ingresar,'Label','Dados coheficientes','Callback',  {@form_ingresar_transferencia_polinomios,form_master} );
    #uimenu(menu_ingresar,'Label','Dados polos, ceros y ganancia','Callback','disp(''save'')');
    
menu_caracteristica = uimenu(form_master,'Label','Seleccionar alguna característica');
    uimenu(menu_caracteristica,'Label','Expresion de la funcion de transferencia','Callback',  {@form_mostrar_transferencia,form_master} );
    #uimenu(menu_caracteristica,'Label','XXXXX','Callback','disp(''save'')');  
    
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


