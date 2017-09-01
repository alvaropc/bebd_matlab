function varargout = buscaventanaguidepro(varargin)
% BUSCAVENTANAGUIDEPRO MATLAB code for buscaventanaguidepro.fig
%      BUSCAVENTANAGUIDEPRO, by itself, creates a new BUSCAVENTANAGUIDEPRO or raises the existing
%      singleton*.
%
%      H = BUSCAVENTANAGUIDEPRO returns the handle to a new BUSCAVENTANAGUIDEPRO or the handle to
%      the existing singleton*.
%
%      BUSCAVENTANAGUIDEPRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BUSCAVENTANAGUIDEPRO.M with the given input arguments.
%
%      BUSCAVENTANAGUIDEPRO('Property','Value',...) creates a new BUSCAVENTANAGUIDEPRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before buscaventanaguidepro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to buscaventanaguidepro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help buscaventanaguidepro

% Last Modified by GUIDE v2.5 09-Jun-2013 00:47:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @buscaventanaguidepro_OpeningFcn, ...
                   'gui_OutputFcn',  @buscaventanaguidepro_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%--- Outputs from this function are returned to the command line.

% --- Executes just before buscaventanaguidepro is made visible.
function buscaventanaguidepro_OpeningFcn(hObject, eventdata, handles, varargin)
%parámetros de la guide madre
mamai=varargin{1};
handles.mamai=mamai

handles.pixel=varargin{2};
handles.xmin=varargin{3};
handles.xmax=varargin{4};
filename=varargin{5};
handles.filename=filename
%Primeros handles necesarios para el funcionamiento de la guide

set(handles.edit10,'String',filename)


%Matriz doble en handle
handles.double=double(mamai);
%Matriz normalizada en handle
handles.norm=(handles.double)/(max(max(handles.double)))
%Guardo los datos en handles


% Choose default command line output for buscaventanaguidepro
handles.output = hObject;
%handles.handles.padre=varargin{1}/{2} y así... uso varargin para cargar
%los datos de la gui padre.
% Update handles structure%Ejercicio para el ajuste automático de ventana.
%CON ESTO REUNIMOS LOS VALORES USADOS ANTERIORMENTE PARA SUSTITUIRLOS EN EL
%SCRIPT "BUSCAVENTANATOTAL"



%Parámetros
pixel=handles.pixel
xmin=handles.xmin
xmax=handles.xmax
paso=0.01;
margen=100;
%AQUI HAY UNA DIFERENCIA CON "BUSCAVENTANATOTAL" Y ES QUE A LA HORA DE
%NORMALIZAR LA MATRIZ YA NO HACE FALTA PONER EL "DOUBLE"

%Búqueda de ventana
while xmin<xmax
   ventana=imadjust(handles.norm,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
  distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
%Condición de malignidad considerando 1cm2 
 
   if (distance<=sqrt(2))
     axes(handles.axes1);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Ventana Radiológica',num2str(xmin),' ',num2str(xmax); ];
     colormap gray
     title(s);
     break
   end
   xmin=xmin+paso

end
   if(distance>sqrt(2))
       msgbox('Buscaventana no ha encontrado microcalcificaciones')
   end

%TERMINA BUSCAVENTANA
handles.x1=x
handles.y1=y

axes(handles.axes2);imhist(handles.norm,2^16);
guidata(hObject, handles);

% UIWAIT makes buscaventanaguidepro wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function varargout = buscaventanaguidepro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% 


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)

%BOTON CON EL QUE LOCALIZO EL FICHERO DICOM

% --- Executes on button press in examinar.


%CON ESTO RECOGEMOS LO DEL RECUADRO Y LO LLAMAMOS XMAX
function edit1_Callback(hObject, eventdata, handles)

handles.xmax_1=str2double(get(hObject, 'String'));

guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%CON ESTO RECOGEMOS EL VALOR DEL PIXEL

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 handles.pixel_1=str2double(get(hObject, 'String'));

guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%CON ESTO HACEMOS QUE SE RECOJA LO QUE SE ESCRIBE EN EL RECUADRO EN
%NÚMERO, Y ESO SERÁ XMIN.
function edit3_Callback(hObject, eventdata, handles)


handles.xmin_1=str2double(get(hObject, 'String'));

guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%CON ESTO SELECCIONAMOS EL DIRECTORIO EN EL QUE TRABAJA EL PROGRAMA












% --- Executes during object creation, after setting all properties.
function examinar_CreateFcn(hObject, eventdata, handles)
%

function edit10_Callback(hObject, eventdata, handles)
%Nombre de la imagen


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


   
% --- Executes on button press in buscaventana.
function buscaventana_Callback(hObject, eventdata, handles)

%AQUÍ PONEMOS EL SCRIPT "BUSCAVENTANATOTAL" QUE NORMALIZARÁ LA MATRIZ Y REPRESENTARÁ
%LA IMAGEN


xmin=handles.xmin_1
xmax=handles.xmax_1
pixel=handles.pixel_1
%Ejercicio para el ajuste automático de ventana.
%CON ESTO REUNIMOS LOS VALORES USADOS ANTERIORMENTE PARA SUSTITUIRLOS EN EL
%SCRIPT "BUSCAVENTANATOTAL"



%Parámetros
paso=0.01;
margen=100;
%AQUI HAY UNA DIFERENCIA CON "BUSCAVENTANATOTAL" Y ES QUE A LA HORA DE
%NORMALIZAR LA MATRIZ YA NO HACE FALTA PONER EL "DOUBLE"

%Búqueda de ventana
while xmin<xmax
   ventana=imadjust(handles.norm,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
  distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
%Condición de malignidad considerando 1cm2 
 
   if (distance<=sqrt(2))
     axes(handles.axes1);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Ventana Radiológica',num2str(xmin),' ',num2str(xmax); ];
     colormap gray
     title(s);
     break
   end
   xmin=xmin+paso

end
hold on
scatter(y,x,3.3,'r','fill'); 
hold off
handles.x=get(get(gca,'Children'),'XData');

handles.y=get(get(gca,'Children'),'YData');
 guidata(hObject,handles); 
   if(distance>sqrt(2))
       msgbox('Buscaventana no ha encontrado microcalcificaciones')
   end



% --- Executes during object creation, after setting all properties.
function buscaventana_CreateFcn(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)





%BOTÓN PARA VISUALIZAR LA IMAGEN TAL Y COMO ES SIN MODIFICACIONES.
function imagen_Callback(hObject, eventdata, handles)
%vista de la imagen original en el axes

axes(handles.axes1);imagesc(handles.mamai)
    
colormap gray
% --- Executes during object creation, after setting all properties.
function imagen_CreateFcn(hObject, eventdata, handles)




%TEXTOS ESTÁTICOS DE LA VENTANA RADIOLOGICA


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




%A PARTIR DE AQUI SE AÑADE LA FUNCIÓN DE VENTANA RADIOLÓGICA
%AQUI SE RECOGE EL MÍNIMOfunction 

function tminimo_Callback(hObject, eventdata, handles)

handles.minimo=str2double(get(hObject, 'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.

function tminimo_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function tmaximo_Callback(hObject, eventdata, handles)

handles.maximo=str2double(get(hObject, 'String'));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function tmaximo_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ventana.
function ventana_Callback(hObject, eventdata, handles)

if handles.minimo+handles.maximo==0
    msgbox('No ha seleccionado minimo y/o máximo')
end
if handles.minimo+handles.maximo~=0
ventana=imadjust(handles.norm,[handles.minimo handles.maximo],[0 1]);
axes(handles.axes1);imagesc(ventana);
end


%realizo la inversión para la función de inversión. luego me llevaré para
%allá ventana1.
 



% --- Executes during object creation, after setting all properties.
function ventana_CreateFcn(hObject, eventdata, handles)


%FALTA HACER EL HANDLES DE V1 V2 !!!
% --- Executes on button press in histograma.
function histograma_Callback(hObject, eventdata, handles)
% hObject    handle to histograma (see GCBO)
handles.v1=str2double(get(handles.edit14, 'string'));
handles.v2=str2double(get(handles.edit15, 'string'));


    if handles.v1+ handles.v2==0
   axes(handles.axes2);imhist(handles.norm,2^16);
    else
   axes(handles.axes2);imhist(handles.norm,2^16); xlim([handles.v1 handles.v2]);
    end
guidata(hObject, handles);
   
      
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in instrucciones.
function instrucciones_Callback(hObject, eventdata, handles)

msgbox('Bienvenido a buscaventanaguidepro. Este programa está orientado a la búsqueda de microcalcificaciones, no obstante, ofrece más funciones que podrá realizar al cargar un archivo dicom a través del botón "Examinar". Las funciones del programa están categorizadas por un encabezado rojo, existiendo las categorías de "Modificación de imagen" (para cambiar aspectos relacionados con la visualización de la imagen), "Ventana radiológica" (donde podrá escoger la ventana radiológica que desea visualizar), "Buscaventana" (donde podra ejecutar el script "buscaventanatotal"), y "Otras" (donde se sitúan otas funciones como la visualización de la imagen). Una vez que haya cargado su imagen, puede visualizarla pulsando en "Ver imagen original" (de manera predeterminada se verá en escala de grises). Con el botón "Histograma" será capaz de ver el histograma asociado a su imagen dicom. Puede variar el rango observable del histograma introduciendo el valor mínimo y máximo que desea ver en los recuadros de la izquierda y derecha, respectivamente, situados debajo del botón. Con el botón "Ventana radiológica", verá la imagen dicom seleccionada dentro del rango de intensidad que desee, puede seleccionar el mínimo y máximo de esa ventana en los cuadros de texto situados a la izquierda. Con la ventana desplegable "Color" podrá seleccionar el color con el que se visualiza la imagen, clicando en "Invertir" los colores se invertirán. Con el botón "+" podrá hacer zoom en la imagen y con el botón "-" podra desactivar dicho zoom. "Buscaventana" es la función principal del programa, con este botón ejecuta un script capaz de buscar microcalcificaciones en su imagen dentro del rango seleccionado (el cual se modifica en los cuadros de texto situados encima del botón, ["xmin", y "xmax"]), siempre y cuando señalice el tamaño de pixel de la imagen. De momento esto es todo lo que puede hacer "buscaventanaguidepro", espero le sirva de ayuda. Creado por Álvaro Ponce Cabrera, alumno de 2º de Biomedicina de la facultad de Medicina de la Universidad de Sevilla.','Instrucciones')




%BOTON DE ZOOM -
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

axes(handles.axes1)
zoom out
zoom off
%BOTÓN DE ZOOM +
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)

axes(handles.axes1)
zoom on


% --- Executes on button press in arrastre.
function arrastre_Callback(hObject, eventdata, handles)
a=get(hObject,'value')
if a==1
    
axes(handles.axes1); pan
end
    
    if a==0
    
axes(handles.axes1); pan
    end


% --- Executes on selection change in color.
function color_Callback(hObject, eventdata, handles)

v=get(hObject,'value')
switch v
    case 2
        axes(handles.axes1);colormap cool;
    case 3
        
         axes(handles.axes1);colormap gray;
    case 4
         axes(handles.axes1);colormap hot;
    case 5
         axes(handles.axes1);colormap hsv;
    case 6
         axes(handles.axes1);colormap jet;
  
end
% --- Executes during object creation, after setting all properties.
function color_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







function edit14_Callback(hObject, eventdata, handles)
%
% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)




% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%COMANDO INVERTIR
% --- Executes on button press in invertir.
function invertir_Callback(hObject, eventdata, handles)


a=get(hObject,'Value')   

v1=handles.minimo
v2=handles.maximo
   

    if a==1  
       
           
      %invertido imagen original.
        if v1+v2==0
        matriz1=imadjust(handles.norm,[0 1],[1 0]); 
        axes(handles.axes1);imagesc(matriz1);
        end
        %invertido ventana radiologica
        if v1+v2~=0       
        ventana1=imadjust(handles.norm,[v1 v2],[v2 v1]);
        axes(handles.axes1);imagesc(ventana1);
        end
     
    else 
        if v1+v2==0
        matriz2=imadjust(handles.norm,[0 1],[0 1]); 
        axes(handles.axes1);imagesc(matriz2);
        else
        ventana2=imadjust(handles.norm,[v1 v2],[v1 v2]);
        axes(handles.axes1);imagesc(ventana2);
        end
    end    
    if a==0
        %normal buscaventanapro
            
        
        if v1+v2~=0       
        ventana3=imadjust(handles.norm,[v1 v2],[0 1]);
        axes(handles.axes1);imagesc(ventana3);
        end
    end
   
% Hint: get(hObject,'Value') returns toggle state of invertir


% --- Executes on button press in ecualizada.
function ecualizada_Callback(hObject, eventdata, handles)

%AL ESCRIBIRLO ASÍ, ME LEE LA MATRIZ COMO UN TEXTO O ALGO ASÍ...NO SE
%EXACTAMANTE...

ecualizada=histeq(handles.mamai);
axes(handles.axes1);imagesc(ecualizada);   





% --- Executes on button press in refrescar.
function refrescar_Callback(hObject, eventdata, handles)
%Valores a 0
set(handles.edit3,'string',0);
set(handles.edit1,'string',0);
set(handles.edit2,'string',0);
set(handles.edit14,'string',0);
set(handles.edit15,'string',0);
set(handles.edit10,'string',0);
set(handles.tminimo,'string',0);
set(handles.tmaximo,'string',0);
%Imitación del inicio de la GUIDE

%Parámetros
pixel=handles.pixel
xmin=handles.xmin
xmax=handles.xmax
paso=0.01;
margen=100;
%AQUI HAY UNA DIFERENCIA CON "BUSCAVENTANATOTAL" Y ES QUE A LA HORA DE
%NORMALIZAR LA MATRIZ YA NO HACE FALTA PONER EL "DOUBLE"

%Búqueda de ventana
while xmin<xmax
   ventana=imadjust(handles.norm,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
  distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
%Condición de malignidad considerando 1cm2 
 
   if (distance<=sqrt(2))
     axes(handles.axes1);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     
     colormap gray
     
     break
   end
   xmin=xmin+paso

end
   if(distance>sqrt(2))
       msgbox('Buscaventana no ha encontrado microcalcificaciones')
   end

%TERMINA BUSCAVENTANA
axes(handles.axes2);imhist(handles.norm,2^16);
handles.x1=x
handles.y1=y
guidata(hObject, handles);
%añadir que se haga buscaventana tal como se mando (proyecto subgui)


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
a=get(hObject,'Value')   
if a==1 
figure,imagesc(handles.mamai);   colormap gray
s=[handles.filename]
title(s);
hold on
scatter(handles.y1,handles.x1,4,'r','fill'); 
hold off
end
if a==0
    close figure 1;
end
