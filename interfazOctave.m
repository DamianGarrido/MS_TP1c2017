clear;

hg = figure;
f = uipanel('Title','La mejor aplicacion del Mundo','FontSize',12,'BackgroundColor','yellow');

#Global
k=43;#margen izquierdo

#Header
a=500;#ancho 
l=30; #largo
h=360;  #altura

t2 = uicontrol('Parent',f,"style", "text",'Position',[k h a l],'String','Header'); 

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

             
#Labels-Inputs
i=75; #posicion inicial inferior
j=40;  #interlineado
d=100; #espaciado

t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*6 75 30],'String','Dominio X'); 
e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*6 75 30]); 

#t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*5 75 30],'String','Input'); 
#e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*5 75 30]); 

t3 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*4 75 30],'String','Funcion'); 
e3 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*4 75 30]);  

#t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*3 75 30],'String','Input'); 
#e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*3 75 30]);  

#t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j*2 75 30],'String','Input'); 
#e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j*2 75 30]); 

#t2 = uicontrol('Parent',f,"style", "text",'Position',[k i+j 75 30],'String','Input'); 
#e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i+j 75 30]);  

#t2 = uicontrol('Parent',f,"style", "text",'Position',[k i 75 30],'String','Input'); 
#e2 = uicontrol('Parent',f,"style", "edit",'Position',[k+d i 75 30]);  

#Ploteo
t2 = uicontrol('Parent',f,"style", "text",'Position',[k*6.2 i 275 270],'String','Grafico'); 

#Botonera
i=30; #posicion inicial inferior
j=100; #espaciado

u1 = uicontrol('Parent',f,'Position',[k i 75 30],'String','Graficar','callback', {@mostrar , e2, e3});
u2 = uicontrol('Parent',f,'Position',[k+j i 75 30],'String','Borrar');
u3 = uicontrol('Parent',f,'Position',[k+j*2 i 75 30],'String','Cancel');


