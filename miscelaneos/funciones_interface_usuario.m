1;#Simpre! para definir un script de funciones

#funciones para interfaz usuario
#UICONTROL - Crea un menu con items
% create figure without a default toolbar
#f = figure ("toolbar", "none");
% create empty toolbar(paret, property, value)
#t = uitoolbar (f, tag, "Ingresar F.T.");



#Funka
#{
f = uimenu('Label','Ingresar Transferencia');
    uimenu(f,'Label','New Figure','Callback','disp(''figure'')');
    uimenu(f,'Label','Save','Callback','disp(''save'')');
    uimenu(f,'Label','Quit','Callback','disp(''exit'')',... 
           'Separator','on','Accelerator','Q');
#}



function pushbutton_callback(src,event,form)
  t2 = uicontrol('Parent',form,"style", "text",'String','Dominio X'); 
  e2 = uicontrol('Parent',form,"style", "edit"); 
end


form_master = figure('MenuBar','None');
menu = uimenu(form_master,'Label','Ingresar Transferencia');
    uimenu(menu,'Label','Dados coheficientes','Callback',  {@pushbutton_callback,form_master} );
    uimenu(menu,'Label','Dados polos, ceros y ganancia','Callback','disp(''save'')');
    
#{           
mh = uimenu(f,'Label','Find'); 
frh = uimenu(mh,'Label','Find and Replace ...',...
            'Callback','disp(''goto'')');
frh = uimenu(mh,'Label','Variable');                 
uimenu(frh,'Label','Name...', ...
          'Callback','disp(''variable'')');

uimenu(frh,'Label','Value...', ...
          'Callback','disp(''value'')');
}#          

