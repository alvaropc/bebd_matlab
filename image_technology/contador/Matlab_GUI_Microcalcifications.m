function varargout = Matlab_GUI_Microcalcifications(varargin)
% MATLAB_GUI_MICROCALCIFICATIONS MATLAB code for Matlab_GUI_Microcalcifications.fig
%      MATLAB_GUI_MICROCALCIFICATIONS, by itself, creates a new MATLAB_GUI_MICROCALCIFICATIONS or raises the existing
%      singleton*.
%
%      H = MATLAB_GUI_MICROCALCIFICATIONS returns the handle to a new MATLAB_GUI_MICROCALCIFICATIONS or the handle to
%      the existing singleton*.
%
%      MATLAB_GUI_MICROCALCIFICATIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAB_GUI_MICROCALCIFICATIONS.M with the given input arguments.
%
%      MATLAB_GUI_MICROCALCIFICATIONS('Property','Value',...) creates a new MATLAB_GUI_MICROCALCIFICATIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Matlab_GUI_Microcalcifications_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Matlab_GUI_Microcalcifications_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Matlab_GUI_Microcalcifications

% Last Modified by GUIDE v2.5 09-Jun-2013 13:48:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Matlab_GUI_Microcalcifications_OpeningFcn, ...
                   'gui_OutputFcn',  @Matlab_GUI_Microcalcifications_OutputFcn, ...
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


% --- Executes just before Matlab_GUI_Microcalcifications is made visible.
function Matlab_GUI_Microcalcifications_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Matlab_GUI_Microcalcifications (see VARARGIN)
% Choose default command line output for Matlab_GUI_Microcalcifications
handles.output = hObject;
defaultStr = 0.1;
set(handles.edit10,'string',defaultStr,'userdata',defaultStr);
set(handles.edit11,'string',defaultStr,'userdata',defaultStr);
set(handles.xminvalue,'string',defaultStr,'userdata',defaultStr);
set(handles.xmaxvalue,'string',defaultStr,'userdata',defaultStr);
set(handles.Pixelvalue,'string',0.006);
handles.pixel=0.006;
handles.xmin=0.1;
handles.xmax=0.1;
handles.min=0.1;
handles.max=0.1;
handles.lengua=1;
handles.Fname=1;
handles.uiget=1;
clc;
disp ('<Welcome to Microcalcification in DCM> - MATLAB GUI');
 h = waitbar(0,'Please wait - Loading GUI...');
 steps = 1000;
 for step = 1:steps
 waitbar(step / steps)
 end
 close(h) 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Matlab_GUI_Microcalcifications wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = Matlab_GUI_Microcalcifications_OutputFcn(hObject, eventdata, handles)

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
[Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
 '*.dcm',  'DICOM files (*.dcm)'; ...
 '*.m',  'Code files (*.m)'; ...
 '*.fig','Figures (*.fig)'; ...
 '*.mat','MAT-files (*.mat)'; ...
 '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
 '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
 '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
 '*.prj', 'Deployment projects (*.prj)';...
 '*.mn', 'MuPAD Notebook Files (*.mn)';...
 '*.mu', 'MuPAD Program Files (*.mu)';...
 '*.rpt', 'Report generator files (*.rpt)';...
 '*.ssc', 'Simscape files (*.ssc)';...
 '*.*',  'All Files (*.*)'}, ...
 'Select a file to run the GUI options',...
 'Select a file',...
 'MultiSelect', 'on');
handles.Fpath=Fpath;
handles.Fname=Fname;
n=numel(Fname);
handles.multi=n;
iscell(Fname);
handles.singmult=ans;
guidata(hObject, handles);
if handles.singmult == 1
   if handles.lengua == 1
   set(handles.FileName,'String','Several');
   end
   if handles.lengua == 0
   set(handles.FileName,'String','Múltiples');
   end
   handles.img = cell(1, length(Fname));
   guidata(hObject, handles);
end

if handles.singmult == 0
   set(handles.FileName,'String',Fname);
   Mama=dicomread (Fname);
   handles.uiget=Mama;
   guidata(hObject,handles);
end
set(handles.Directory,'String',Fpath);
  
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function FileName_Callback(hObject, eventdata, handles)
% hObject    handle to FileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FileName as text
%        str2double(get(hObject,'String')) returns contents of FileName as a double

% --- Executes during object creation, after setting all properties.
function FileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Directory_Callback(hObject, eventdata, handles)
% hObject    handle to Directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Directory as text
%        str2double(get(hObject,'String')) returns contents of Directory as a double


% --- Executes during object creation, after setting all properties.
function Directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Scatter.
function Scatter_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Scatt=a;
guidata(hObject,handles);
%He determinado los tipos con el comando class
if a==1
try
isa(handles.Fpath,'char');    
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to run scatter plot/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
   for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
     try
%Normalizar
matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
      if handles.lengua == 1
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(2),
     delete(h)
     end
     if handles.lengua == 0
     h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(2),
     delete(h)
     end
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red','NumberTitle','off','Position',[500,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray;
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     x=get(get(gca,'Children'),'XData');
     handles.x = x;
     guidata(hObject,handles);
     y=get(get(gca,'Children'),'YData');
     handles.y = y;
     guidata(hObject,handles);
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
set(handles.Scatter,'Value',0);
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
set(handles.Scatter,'Value',0);
end
break

     end
    end
end
if handles.singmult == 0
try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(2),
    delete(h)
    set(handles.Scatter,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(2),
    delete(h)
    set(handles.Scatter,'Value',0);
    end
end
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     if handles.lengua == 1
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(2),
     delete(h)
     end
     if handles.lengua == 0
     h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(2),
     delete(h)
     end
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red','NumberTitle','off','Position',[500,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray;
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
    x=get(get(gca,'Children'),'XData');
    handles.x = x;
    guidata(hObject,handles);
    y=get(get(gca,'Children'),'YData');
    handles.y = y;
    guidata(hObject,handles);
    break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   set(handles.Scatter,'Value',0);
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   set(handles.Scatter,'Value',0);
   end
 end
catch
       if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
set(handles.Scatter,'Value',0);
       end
       if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
set(handles.Scatter,'Value',0);
       end
end
end
end
if a==0 
 close(findobj('type','figure','name','Scatter - Red'))
 end
% hObject    handle to Scatter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Scatter


% --- Executes on button press in bwlabel.
function bwlabel_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.bwlabelpanel2=a;
guidata(hObject,handles);
%He determinado los tipos con el comando class
if a==1
try
isa(handles.Fpath,'char');    
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to run scatter plot/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
   for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
     try
%Normalizar
matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
      if handles.lengua == 1
     h = msgbox ('  Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(2),
     delete(h)
     end
     if handles.lengua == 0
     h = msgbox ('  Grupo de microcalcificaciones encontrado  (ZOOM 2.5X)','Mensaje:','help');
     pause(2),
     delete(h)
     end
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   break
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap gray, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
set(hObject,'Value',0);
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
set(handles.bwlabel,'Value',0);
end
break

     end
    end
end
if handles.singmult == 0
try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(2),
    delete(h)
    set(handles.bwlabel,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(2),
    delete(h)
    set(handles.bwlabel,'Value',0);
    end
end
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     if handles.lengua == 1
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(2),
     delete(h)
     end
     if handles.lengua == 0
     h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(2),
     delete(h)
     end
   break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   set(handles.bwlabel,'Value',0);
   set(handles.edit12,'String',0);
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
  set(handles.bwlabel,'Value',0);
  set(handles.edit12,'String',0);
   end
 end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap gray, title('Microcalcifications - Labelling'), zoom(2.5),zoom
end 
catch
       if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
set(handles.bwlabel,'Value',0);
       end
       if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
set(handles.bwlabel,'Value',0);
       end
end
end
end
if a==0 
 close(findobj('type','figure','name','Labelling'))
 end
% hObject    handle to bwlabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bwlabel

% --- Executes on button press in Histograma.
function Histograma_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Hist=a;
guidata(hObject,handles);
% %He determinado los tipos con el comando class
if a==1
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Histogram/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
    for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
  %Sacar histograma (ya normalizado)
  scrsz = get(0,'ScreenSize');
  figure('Name','Histogram','NumberTitle','off','Position',[50,250,450,400]), imhist(matriz, 2^16);title('Mammary - normalized Histogram - 2^1^6 bins');pan
    end
end
if handles.singmult == 0
    try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
    catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    set(handles.Histograma,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    set(handles.Histograma,'Value',0);
    end    
    end
    %Normalización
   matriz=double(handles.uiget)/double(max(max(handles.uiget)));
   %Sacar histograma (ya normalizado)
   scrsz = get(0,'ScreenSize');
   figure('Name','Histogram','NumberTitle','off','Position',[50,250,450,400]), imhist(matriz, 2^16);title('Mammary - normalized Histogram - 2^1^6 bins');pan
end
end
 if a==0 
 close(findobj('type','figure','name','Histogram'))
 end
% hObject    handle to Histograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Histograma


% --- Executes on button press in Equalized.
function Equalized_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Eq=a;
guidata(hObject,handles);
%He determinado que handles.uigetfile es uint16 con el comando class
if a==1
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Equalized Image/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
    for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
  %Sacar ecualización:
  Mama_eq=histeq(matriz);
  scrsz = get(0,'ScreenSize');
  figure('Name','Equalized Image','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap gray, title('Mammary - Equalized Image')
    end
end
if handles.singmult == 0
    try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
    catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    set(handles.Equalized,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    set(handles.Equalized,'Value',0);
    end    
    end
    %Normalización
   matriz=double(handles.uiget)/double(max(max(handles.uiget)));
   %Sacar ecualización:
  Mama_eq=histeq(matriz);
  scrsz = get(0,'ScreenSize');
  figure('Name','Equalized Image','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap gray, title('Mammary - Equalized Image')
end
end
if a==0 
 close(findobj('type','figure','name','Equalized Image'))
 end

% hObject    handle to Equalized (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Equalized


% --- Executes on button press in Complement.
function Complement_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Comp=a;
guidata(hObject,handles);
% %He determinado los tipos con el comando class
if a==1
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Complement Images/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
    for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
  %Normalizar
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
  %Sacar complementaria
  Mama_comp=imadjust(matriz,[0 1],[1 0]);
scrsz = get(0,'ScreenSize');
figure('Name','Complement Image','NumberTitle','off','Position',[75,175,500,400]), imagesc(Mama_comp), title('Mammary - Complement Image')
    end
end
if handles.singmult == 0
try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    set(handles.Complement,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    set(handles.Complement,'Value',0);

    end    
end
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
%Sacar complementaria:
Mama_comp=imadjust(matriz,[0 1],[1 0]);
scrsz = get(0,'ScreenSize');
figure('Name','Complement Image','NumberTitle','off','Position',[75,175,500,400]), imagesc(Mama_comp), title('Mammary - Complement Image')
end
end
if a==0 
 close(findobj('type','figure','name','Complement Image'))
 end
% hObject    handle to Complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Complement


% --- Executes on button press in Original.
function Original_Callback(hObject, eventdata, handles)
try
isa(handles.Fpath,'char');    
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to run scatter plot/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
   for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
  scrsz = get(0,'ScreenSize');
  figure('Name','Original *DCM File','NumberTitle','off','Position',[75,150,500,400]), imagesc(handles.img{handles.iFname}), title('Mammary - Original Image'), zoom on
   end
end
if handles.singmult == 0
scrsz = get(0,'ScreenSize');
  figure('Name','Original *DCM File','NumberTitle','off','Position',[75,150,500,400]), imagesc(handles.uiget), title('Mammary - Original Image'), zoom on
end

% hObject    handle to Original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function xminvalue_Callback(hObject, eventdata, handles)
xmin=str2double(get(hObject, 'String'));
handles.xmin=(xmin);
guidata(hObject, handles);
isnan(handles.xmin);
if ans==1
   h = msgbox ('Invalid input, please use numbers','Message:','help');
   pause(3),
   delete(h)
end
% hObject    handle to xminvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xminvalue as text
%        str2double(get(hObject,'String')) returns contents of xminvalue as a double


% --- Executes during object creation, after setting all properties.
function xminvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xminvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmaxvalue_Callback(hObject, eventdata, handles)
xmax=str2double(get(hObject, 'String'));
handles.xmax=(xmax);
guidata(hObject, handles);
isnan(handles.xmax);
if ans==1
   h = msgbox ('Invalid input, please use numbers','Message:','help');
   pause(3),
   delete(h)
end

% hObject    handle to xmaxvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmaxvalue as text
%        str2double(get(hObject,'String')) returns contents of xmaxvalue as a double


% --- Executes during object creation, after setting all properties.
function xmaxvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmaxvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Colors.
function Colors_Callback(hObject, eventdata, handles)
a=get(hObject,'value');
handles.colors=(a);
guidata(hObject, handles);
switch a
    case 2
    handles.c2=(a);
    guidata(hObject, handles);
    %colormap cool
    case 3
    handles.c3=(a);
    guidata(hObject, handles);
    %colormap gray;
    case 4
    handles.c4=(a);
    guidata(hObject, handles);
    %colormap hot;
    case 5
    handles.c5=(a);
    guidata(hObject, handles);
    %colormap hsv;
    case 6
    handles.c6=(a);
    guidata(hObject, handles);
    %colormap jet;
    case 7
    handles.c7=(a);
    guidata(hObject, handles);
    %colormap spring;
    case 8
    handles.c8=(a);
    guidata(hObject, handles);
    %colormap summer;
    case 9
    handles.c9=(a);
    guidata(hObject, handles);
    %colormap autumn;
    case 10
    handles.c10=(a);
    guidata(hObject, handles);
    %colormap winter;
    case 11
    handles.c11=(a);
    guidata(hObject, handles);
    %colormap bone;
    case 12
    handles.c12=(a);
    guidata(hObject, handles);
    %colormap copper;
    case 13
    handles.c13=(a);
    guidata(hObject, handles);
    %colormap pink;
    case 14
    handles.c14=(a);
    guidata(hObject, handles);
    %colormap lines;
    case 15
    handles.c15=(a);
    guidata(hObject, handles);
    %colormap colorcube;
    case 16
    handles.c16=(a);
    guidata(hObject, handles);
    %colormap flag;
    case 17
    handles.c17=(a);
    guidata(hObject, handles);
    %colormap prism;
    case 18
    handles.c18=(a);
    guidata(hObject, handles);
    %colormap white;
end

% hObject    handle to Colors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Colors contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Colors


% --- Executes during object creation, after setting all properties.
function Colors_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Colors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
exit
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in closef.
function closef_Callback(hObject, eventdata, handles)
set(Matlab_GUI_Microcalcifications,'Visible','off');
close all
if handles.lengua == 1
h = msgbox ('         Figures closed','Message:','help');
   pause(4),set(Matlab_GUI_Microcalcifications,'Visible','on');
   delete(h)
end
if handles.lengua == 0
h = msgbox ('         Figuras cerradas','Mensaje:','help');
   pause(4),set(Matlab_GUI_Microcalcifications,'Visible','on');
   delete(h)
end

% hObject    handle to closef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in closeg.
function closeg_Callback(hObject, eventdata, handles)
close gcf
%Si este no es exactamente el comando, Con las imágenes metidas en handle
%hacerlas todas invisibles y close all y después hacer visibles.
% hObject    handle to closeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Pixelvalue_Callback(hObject, eventdata, handles)
pixel=str2double(get(hObject, 'String'));
handles.pixel=(pixel);
guidata(hObject, handles);
isnan(handles.pixel);
if ans==1
   h = msgbox ('Invalid input, please use numbers','Message:','help');
   pause(3),
   delete(h)
end

% hObject    handle to Pixelvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pixelvalue as text
%        str2double(get(hObject,'String')) returns contents of Pixelvalue as a double


% --- Executes during object creation, after setting all properties.
function Pixelvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pixelvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Steps.
function Steps_Callback(hObject, eventdata, handles)
if handles.lengua==1
h = msgbox ({'1.-  Browse and load DICOM image/s from the same folder of the GUI or .exe.','2.-  Use the options to set values and display Images.','3.-  Close Images by clicking on each checkbox or button.','4.-  Close all Images, GUI or MATLAB by clicking buttons.','                       Thanks for using!'},'GUI - Steps:','help');
end
if handles.lengua==0
h = msgbox ({'1.-  Pulse examinar y cargue imágenes DICOM de la carpeta de la GUI o ejecutable.','2.-  Use las opciones para dar valores y ver imágenes.','3.-  Cierre imágenes pulsando botones y casillas.','4.-  Cierre todas las imagenes, la GUI o MATLAB con los botones.','                       ¡Gracias por usar esta herramienta!'},'GUI - Pasos:','help');
end
% hObject    handle to Steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Microcalcifications.
function Microcalcifications_Callback(hObject, eventdata, handles)
%He determinado los tipos con el comando class
try
isa(handles.Fpath,'char');    
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show microcalcifications',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
   for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
     try
%Normalizar
matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
break

     end
    end
end
if handles.singmult == 0
try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(2),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(2),
    delete(h)
    end
end
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
 end
catch
       if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
       end
       if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
       end
end
end
% hObject    handle to Microcalcifications (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Window.
function Window_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Wind=a;
guidata(hObject,handles);
% %He determinado los tipos con el comando class
if a==1
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Window/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
    for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
     try
     %Normalizar
     matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
     %Sacar ventana
     ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
     figure('Name','Window','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
     s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
     title(s); colormap gray; zoom
     catch
      if handles.lengua == 1   
 h = msgbox ('Please set xmin and xmax for show this figure','Message:','warn');
 pause(4),
 delete(h)
 set(handles.Window,'Value',0);
 end
  if handles.lengua == 0   
 h = msgbox ('Por favor indique xmin y xmax para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 set(handles.Window,'Value',0);
 end
     break
     end
    end
end
if handles.singmult == 0
try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end
    set(handles.Window,'Value',0);
end
try
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
%Enseñar ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap gray; zoom
catch
 if handles.lengua == 1   
 h = msgbox ('Please set xmin and xmax for show this figure','Message:','warn');
 pause(4),
 delete(h)
 set(handles.Window,'Value',0);
 end
  if handles.lengua == 0   
 h = msgbox ('Por favor indique xmin y xmax para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 set(handles.Window,'Value',0);
 end
end
end
end
if a==0 
 close(findobj('type','figure','name','Window'))
 end
% hObject    handle to Window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Window



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 min = str2double(get(hObject,'String'));
 handles.min=(min);
 guidata(hObject,handles);
 isnan(handles.min);
if ans==1
   h = msgbox ('Invalid input, please use numbers','Message:','help');
   pause(3),
   delete(h)
end
% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
max=str2double(get(hObject, 'String'));
handles.max=(max);
guidata(hObject, handles);
isnan(handles.max);
if ans==1
   h = msgbox ('Invalid input, please use numbers','Message:','help');
   pause(3),
   delete(h)
end

% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Inversion.
function Inversion_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Inv=a;
guidata(hObject,handles);
% %He determinado los tipos con el comando class
if a==1
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Complement Image/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
    for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
     try
     %Normalizar
     matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
     %Sacar ventana
     ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
     %Enseñar invertida imagen original
     if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
     end      
     %Enseñar invertida ventana radiologica
     if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
     end
     catch
      if handles.lengua == 1   
 h = msgbox ('Please set xmin and xmax for show this figure','Message:','warn');
 pause(4),
 delete(h)
 set(handles.Inversion,'Value',0);
      end
      if handles.lengua == 0   
 h = msgbox ('Por favor indique xmin y xmax para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 set(handles.Inversion,'Value',0);
      end
     break
     end
    end
end
if handles.singmult == 0
try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end    
end
try
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
  end
catch
 if handles.lengua == 1   
 h = msgbox ('Please set xmin and xmax for show this figure','Message:','warn');
 pause(4),
 delete(h)
 set(handles.Inversion,'Value',0);
 end
  if handles.lengua == 0   
 h = msgbox ('Por favor indique xmin y xmax para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 set(handles.Inversion,'Value',0);
 end
end
end
end
 if a==0 
  if handles.lengua == 1
  h = msgbox ('Use button to close Complement Images','Message:','help');
  pause(2),
  delete(h)
  end
  if handles.lengua == 0
  h = msgbox ('Pulse el botón para cerrar complementarias','Mensaje:','help');
  pause(2),
  delete(h)
  end
 end
% hObject    handle to Inversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Inversion


% --- Executes on button press in closeinv.
function closeinv_Callback(hObject, eventdata, handles)
close(findobj('type','figure','name','Complement'))
close(findobj('type','figure','name','Original Complement'))
set(handles.Inversion,'Value',0);
guidata(hObject,handles);
% hObject    handle to closeinv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in closecol.
function closecol_Callback(hObject, eventdata, handles)
close(findobj('type','figure','name','Equalized Image - Cool'))
close(findobj('type','figure','name','Equalized Image - Gray'))
close(findobj('type','figure','name','Equalized Image - Hot'))
close(findobj('type','figure','name','Equalized Image - Hsv'))
close(findobj('type','figure','name','Equalized Image - Jet'))
close(findobj('type','figure','name','Equalized Image - Spring'))
close(findobj('type','figure','name','Equalized Image - Summer'))
close(findobj('type','figure','name','Equalized Image - Autumn'))
close(findobj('type','figure','name','Equalized Image - Winter'))
close(findobj('type','figure','name','Equalized Image - Bone'))
close(findobj('type','figure','name','Equalized Image - Copper'))
close(findobj('type','figure','name','Equalized Image - Pink'))
close(findobj('type','figure','name','Equalized Image - Lines'))
close(findobj('type','figure','name','Equalized Image - Colorcube'))
close(findobj('type','figure','name','Equalized Image - Flag'))
close(findobj('type','figure','name','Equalized Image - Prism'))
close(findobj('type','figure','name','Equalized Image - White'))
close(findobj('type','figure','name','Complement Image - Cool'))
close(findobj('type','figure','name','Complement Image - Gray'))
close(findobj('type','figure','name','Complement Image - Hot'))
close(findobj('type','figure','name','Complement Image - Hsv'))
close(findobj('type','figure','name','Complement Image - Jet'))
close(findobj('type','figure','name','Complement Image - Spring'))
close(findobj('type','figure','name','Complement Image - Summer'))
close(findobj('type','figure','name','Complement Image - Autumn'))
close(findobj('type','figure','name','Complement Image - Winter'))
close(findobj('type','figure','name','Complement Image - Bone'))
close(findobj('type','figure','name','Complement Image - Copper'))
close(findobj('type','figure','name','Complement Image - Pink'))
close(findobj('type','figure','name','Complement Image - Lines'))
close(findobj('type','figure','name','Complement Image - Colorcube'))
close(findobj('type','figure','name','Complement Image - Flag'))
close(findobj('type','figure','name','Complement Image - Prism'))
close(findobj('type','figure','name','Complement Image - White'))
close(findobj('type','figure','name','Windowing - Cool'))
close(findobj('type','figure','name','Windowing - Gray'))
close(findobj('type','figure','name','Windowing - Hot'))
close(findobj('type','figure','name','Windowing - Hsv'))
close(findobj('type','figure','name','Windowing - Jet'))
close(findobj('type','figure','name','Windowing - Spring'))
close(findobj('type','figure','name','Windowing - Summer'))
close(findobj('type','figure','name','Windowing - Autumn'))
close(findobj('type','figure','name','Windowing - Winter'))
close(findobj('type','figure','name','Windowing - Bone'))
close(findobj('type','figure','name','Windowing - Copper'))
close(findobj('type','figure','name','Windowing - Pink'))
close(findobj('type','figure','name','Windowing - Lines'))
close(findobj('type','figure','name','Windowing - Colorcube'))
close(findobj('type','figure','name','Windowing - Flag'))
close(findobj('type','figure','name','Windowing - Prism'))
close(findobj('type','figure','name','Windowing - White'))
close(findobj('type','figure','name','Scatter - Red - Cool'))
close(findobj('type','figure','name','Scatter - Red - Gray'))
close(findobj('type','figure','name','Scatter - Red - Hot'))
close(findobj('type','figure','name','Scatter - Red - Hsv'))
close(findobj('type','figure','name','Scatter - Red - Jet'))
close(findobj('type','figure','name','Scatter - Red - Spring'))
close(findobj('type','figure','name','Scatter - Red - Summer'))
close(findobj('type','figure','name','Scatter - Red - Autumn'))
close(findobj('type','figure','name','Scatter - Red - Winter'))
close(findobj('type','figure','name','Scatter - Red - Bone'))
close(findobj('type','figure','name','Scatter - Red - Copper'))
close(findobj('type','figure','name','Scatter - Red - Pink'))
close(findobj('type','figure','name','Scatter - Red - Lines'))
close(findobj('type','figure','name','Scatter - Red - Colorcube'))
close(findobj('type','figure','name','Scatter - Red - Flag'))
close(findobj('type','figure','name','Scatter - Red - Prism'))
close(findobj('type','figure','name','Scatter - Red - White'))
close(findobj('type','figure','name','Labelling - Cool'))
close(findobj('type','figure','name','Labelling - Gray'))
close(findobj('type','figure','name','Labelling - Hot'))
close(findobj('type','figure','name','Labelling - Hsv'))
close(findobj('type','figure','name','Labelling - Jet'))
close(findobj('type','figure','name','Labelling - Spring'))
close(findobj('type','figure','name','Labelling - Summer'))
close(findobj('type','figure','name','Labelling - Autumn'))
close(findobj('type','figure','name','Labelling - Winter'))
close(findobj('type','figure','name','Labelling - Bone'))
close(findobj('type','figure','name','Labelling - Copper'))
close(findobj('type','figure','name','Labelling - Pink'))
close(findobj('type','figure','name','Labelling - Lines'))
close(findobj('type','figure','name','Labelling - Colorcube'))
close(findobj('type','figure','name','Labelling - Flag'))
close(findobj('type','figure','name','Labelling - Prism'))
close(findobj('type','figure','name','Labelling - White'))
close(findobj('type','figure','name','Window - Cool'))
close(findobj('type','figure','name','Window - Gray'))
close(findobj('type','figure','name','Window - Hot'))
close(findobj('type','figure','name','Window - Hsv'))
close(findobj('type','figure','name','Window - Jet'))
close(findobj('type','figure','name','Window - Spring'))
close(findobj('type','figure','name','Window - Summer'))
close(findobj('type','figure','name','Window - Autumn'))
close(findobj('type','figure','name','Window - Winter'))
close(findobj('type','figure','name','Window - Bone'))
close(findobj('type','figure','name','Window - Copper'))
close(findobj('type','figure','name','Window - Pink'))
close(findobj('type','figure','name','Window - Lines'))
close(findobj('type','figure','name','Window - Colorcube'))
close(findobj('type','figure','name','Window - Flag'))
close(findobj('type','figure','name','Window - Prism'))
close(findobj('type','figure','name','Window - White'))
close(findobj('type','figure','name','Original Complement - Cool'))
close(findobj('type','figure','name','Original Complement - Gray'))
close(findobj('type','figure','name','Original Complement - Hot'))
close(findobj('type','figure','name','Original Complement - Hsv'))
close(findobj('type','figure','name','Original Complement - Jet'))
close(findobj('type','figure','name','Original Complement - Spring'))
close(findobj('type','figure','name','Original Complement - Summer'))
close(findobj('type','figure','name','Original Complement - Autumn'))
close(findobj('type','figure','name','Original Complement - Winter'))
close(findobj('type','figure','name','Original Complement - Bone'))
close(findobj('type','figure','name','Original Complement - Copper'))
close(findobj('type','figure','name','Original Complement - Pink'))
close(findobj('type','figure','name','Original Complement - Lines'))
close(findobj('type','figure','name','Original Complement - Colorcube'))
close(findobj('type','figure','name','Original Complement - Flag'))
close(findobj('type','figure','name','Original Complement - Prism'))
close(findobj('type','figure','name','Original Complement - White'))
close(findobj('type','figure','name','Complement - Cool'))
close(findobj('type','figure','name','Complement - Gray'))
close(findobj('type','figure','name','Complement - Hot'))
close(findobj('type','figure','name','Complement - Hsv'))
close(findobj('type','figure','name','Complement - Jet'))
close(findobj('type','figure','name','Complement - Spring'))
close(findobj('type','figure','name','Complement - Summer'))
close(findobj('type','figure','name','Complement - Autumn'))
close(findobj('type','figure','name','Complement - Winter'))
close(findobj('type','figure','name','Complement - Bone'))
close(findobj('type','figure','name','Complement - Copper'))
close(findobj('type','figure','name','Complement - Pink'))
close(findobj('type','figure','name','Complement - Lines'))
close(findobj('type','figure','name','Complement - Colorcube'))
close(findobj('type','figure','name','Complement - Flag'))
close(findobj('type','figure','name','Complement - Prism'))
close(findobj('type','figure','name','Complement - White'))
set(handles.Equalizedc,'Value',0);
set(handles.Originalc,'Value',0);
set(handles.Microc,'Value',0);
set(handles.Scatterc,'Value',0);
set(handles.Bwlabel,'Value',0);
set(handles.windowc,'Value',0);
set(handles.Complementc,'Value',0);
set(handles.ALLC,'Value',0);
set (handles.edit12,'String',0)
guidata(hObject,handles);
% hObject    handle to closecol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Equalizedc.
function Equalizedc_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Eqc=a;
guidata(hObject,handles);
%He determinado que handles.uigetfile es uint16 con el comando class
if a==1
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Equalized Image/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
    for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Equalizedc,'Value',0);
end
if handles.colors==2
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Cool','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap cool, title('Mammary - Equalized Image')
end
if handles.colors==3
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap gray, title('Mammary - Equalized Image')
end
if handles.colors==4
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hot, title('Mammary - Equalized Image')
end
if handles.colors==5
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hsv, title('Mammary - Equalized Image')
end
if handles.colors==6
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap jet, title('Mammary - Equalized Image')
end
if handles.colors==7
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap spring, title('Mammary - Equalized Image')
end
if handles.colors==8
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap summer, title('Mammary - Equalized Image')
end
if handles.colors==9
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap autumn, title('Mammary - Equalized Image')
end
if handles.colors==10
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap winter, title('Mammary - Equalized Image')
end
if handles.colors==11
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap bone, title('Mammary - Equalized Image')
end
if handles.colors==12
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap copper, title('Mammary - Equalized Image')
end
if handles.colors==13
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap pink, title('Mammary - Equalized Image')
end
if handles.colors==14
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap lines, title('Mammary - Equalized Image')
end
if handles.colors==15
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap colorcube, title('Mammary - Equalized Image')
end
if handles.colors==16
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap flag, title('Mammary - Equalized Image')
end
if handles.colors==17
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap prism, title('Mammary - Equalized Image')
end
if handles.colors==18
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap white, title('Mammary - Equalized Image')
end
   catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Equalizedc,'Value',0)
    end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Equalizedc,'Value',0)
    end
    break
end
    end
end
if handles.singmult == 0
    try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
    catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    set(handles.Equalizedc,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    set(handles.Equalizedc,'Value',0);
    end    
    end
    %Normalización
   matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Equalizedc,'Value',0);
end
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Equalizedc,'Value',0)
end
if handles.colors==2
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Cool','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap cool, title('Mammary - Equalized Image')
end
if handles.colors==3
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap gray, title('Mammary - Equalized Image')
end
if handles.colors==4
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hot, title('Mammary - Equalized Image')
end
if handles.colors==5
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hsv, title('Mammary - Equalized Image')
end
if handles.colors==6
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap jet, title('Mammary - Equalized Image')
end
if handles.colors==7
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap spring, title('Mammary - Equalized Image')
end
if handles.colors==8
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap summer, title('Mammary - Equalized Image')
end
if handles.colors==9
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap autumn, title('Mammary - Equalized Image')
end
if handles.colors==10
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap winter, title('Mammary - Equalized Image')
end
if handles.colors==11
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap bone, title('Mammary - Equalized Image')
end
if handles.colors==12
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap copper, title('Mammary - Equalized Image')
end
if handles.colors==13
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap pink, title('Mammary - Equalized Image')
end
if handles.colors==14
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap lines, title('Mammary - Equalized Image')
end
if handles.colors==15
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap colorcube, title('Mammary - Equalized Image')
end
if handles.colors==16
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap flag, title('Mammary - Equalized Image')
end
if handles.colors==17
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap prism, title('Mammary - Equalized Image')
end
if handles.colors==18
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap white, title('Mammary - Equalized Image')
end
   catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Equalizedc,'Value',0)
    end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Equalizedc,'Value',0)
    end
end
end
end
if a==0    
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to Equalizedc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Equalizedc


% --- Executes on button press in Originalc.
function Originalc_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Origc=a;
guidata(hObject,handles);
%He determinado que handles.Fpath es char con el comando class
if a==1
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Complement Image/s',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Originalc,'Value',0);
end
if handles.colors==2
Mama_comp=imadjust(matriz,[0 1],[1 0]);
scrsz = get(0,'ScreenSize');
figure('Name','Complement Image - Cool','NumberTitle','off','Position',[75,175,500,400]), imagesc(Mama_comp), title('Mammary - Complement Image'), colormap cool
end
if handles.colors==3
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap gray, title('Mammary - Complement Image')
end
if handles.colors==4
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hot, title('Mammary - Complement Image')
end
if handles.colors==5
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hsv, title('Mammary - Complement Image')
end
if handles.colors==6
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap jet, title('Mammary - Complement Image')
end
if handles.colors==7
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap spring, title('Mammary - Complement Image')
end
if handles.colors==8
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap summer, title('Mammary - Complement Image')
end
if handles.colors==9
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap autumn, title('Mammary - Complement Image')
end
if handles.colors==10
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap winter, title('Mammary - Complement Image')
end
if handles.colors==11
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap bone, title('Mammary - Complement Image')
end
if handles.colors==12
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap copper, title('Mammary - Complement Image')
end
if handles.colors==13
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap pink, title('Mammary - Complement Image')
end
if handles.colors==14
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap lines, title('Mammary - Complement Image')
end
if handles.colors==15
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap colorcube, title('Mammary - Complement Image')
end
if handles.colors==16
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap flag, title('Mammary - Complement Image')
end
if handles.colors==17
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap prism, title('Mammary - Complement Image')
end
if handles.colors==18
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap white, title('Mammary - Complement Image')
end
catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Originalc,'Value',0)
    end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Originalc,'Value',0)
    end
end
end
end
if handles.singmult == 0
    try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
    catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    set(handles.Originalc,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    set(handles.Originalc,'Value',0);
    end    
    end
    %Normalización
   matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Originalc,'Value',0);
end
if handles.colors==2
Mama_comp=imadjust(matriz,[0 1],[1 0]);
scrsz = get(0,'ScreenSize');
figure('Name','Complement Image - Cool','NumberTitle','off','Position',[75,175,500,400]), imagesc(Mama_comp), title('Mammary - Complement Image'), colormap cool
end
if handles.colors==3
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap gray, title('Mammary - Complement Image')
end
if handles.colors==4
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hot, title('Mammary - Complement Image')
end
if handles.colors==5
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hsv, title('Mammary - Complement Image')
end
if handles.colors==6
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap jet, title('Mammary - Complement Image')
end
if handles.colors==7
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap spring, title('Mammary - Complement Image')
end
if handles.colors==8
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap summer, title('Mammary - Complement Image')
end
if handles.colors==9
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap autumn, title('Mammary - Complement Image')
end
if handles.colors==10
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap winter, title('Mammary - Complement Image')
end
if handles.colors==11
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap bone, title('Mammary - Complement Image')
end
if handles.colors==12
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap copper, title('Mammary - Complement Image')
end
if handles.colors==13
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap pink, title('Mammary - Complement Image')
end
if handles.colors==14
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap lines, title('Mammary - Complement Image')
end
if handles.colors==15
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap colorcube, title('Mammary - Complement Image')
end
if handles.colors==16
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap flag, title('Mammary - Complement Image')
end
if handles.colors==17
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap prism, title('Mammary - Complement Image')
end
if handles.colors==18
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap white, title('Mammary - Complement Image')
end
   catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Originalc,'Value',0)
    end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Originalc,'Value',0)
    end
end
end
end
if a==0
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to Originalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Originalc


% --- Executes on button press in Microc.
function Microc_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Micro=a;
guidata(hObject,handles);
if a == 1
%He determinado que handles.Fpath es char con el comando class
try
     isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to run script',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
%   Normalización
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
% Lo que se quiera hacer
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Microc,'Value',0)
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring

     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Summer','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone

     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper

     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Microc,'Value',0)
     end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Microc,'Value',0)
    end
    break
end
end
end
if handles.singmult == 0
    try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
    catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    set(handles.Microc,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    set(handles.Microc,'Value',0);
    end    
    end
    %Normalización
   matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Microc,'Value',0);
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Summer','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white

     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set(handles.Microc,'Value',0)
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
end
end
catch
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Microc,'Value',0);
end
end
end
if a==0
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to Microc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Microc


% --- Executes on button press in Scatterc.
function Scatterc_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.Scattc=a;
guidata(hObject,handles);
if a == 1
%He determinado que handles.Fpath es char con el comando class
try
    isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM','Mensaje:','help');
    pause(3),
    delete(h)
    end
    [Fname,Fpath] = uigetfile({'*.dcm;*''*.m; *.fig;*.mat;*.slx;*.mdl','MATLAB General files (*.m,*.fig,*.mat,*.slx,*.mdl)';
    '*.dcm',  'DICOM files (*.dcm)'; ...
    '*.m',  'Code files (*.m)'; ...
    '*.fig','Figures (*.fig)'; ...
    '*.mat','MAT-files (*.mat)'; ...
    '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
    '*.mlappinstall', 'MATLAB App Installer (*.mlappinstall)';...
    '*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v', 'Code generator files (*.rtw,*.tlc,*.tmf,*.c,*.cpp,*.h,*.mk,*.vhd,*.v)';...
    '*.prj', 'Deployment projects (*.prj)';...
    '*.mn', 'MuPAD Notebook Files (*.mn)';...
    '*.mu', 'MuPAD Program Files (*.mu)';...
    '*.rpt', 'Report generator files (*.rpt)';...
    '*.ssc', 'Simscape files (*.ssc)';...
    '*.*',  'All Files (*.*)'}, ...
    'Select file/s to show Scatter',...
    'Select file/s',...
    'MultiSelect', 'on');
    handles.Fpath=Fpath;
    handles.Fname=Fname;
    n=numel(Fname);
    handles.multi=n;
    iscell(Fname);
    handles.singmult=ans;
    guidata(hObject, handles);
    set(handles.Directory,'String',Fpath);
    if handles.singmult == 0
    set(handles.FileName,'String',Fname);
    end
    if handles.singmult == 1
    set(handles.FileName,'String','Several');
    handles.img = cell(1, length(Fname));
    guidata(hObject, handles);
    end
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
%   Normalización
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
% Lo que se quiera hacer
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
end
   xmin=xmin+paso;
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end

if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Summer - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
 scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
      scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
 scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
    scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Scatterc,'Value',0)
     end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Scatterc,'Value',0)
    end
    break
end
end
end
if handles.singmult == 0
    try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
    catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(3),
    delete(h)
    set(handles.Scatterc,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    set(handles.Scatterc,'Value',0);
    end    
    end
    %Normalización
   matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Scatterc,'Value',0);
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
end
   xmin=xmin+paso;
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end

if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
    end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Summer - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)

end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
  end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)

end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
 scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end

 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)

end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
      scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
  end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
 scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
  end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
    scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
end
end
catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Scatterc,'Value',0)
     end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Scatterc,'Value',0)
    end
end
end
end
if a==0
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to Scatterc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Scatterc


% --- Executes on button press in Bwlabel.
function Bwlabel_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.labelc=a;
guidata(hObject,handles);
if a == 1
%He determinado que handles.Fpath es char con el comando class
try
    isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s with Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM con el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end
    set(handles.Bwlabel,'Value',0)
    return
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
% Normalización
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
% Lo que se quiera hacer
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
      Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Cool','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap cool, title('Microcalcifications - Labelling'), zoom(2.5),zoom 
   break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set(handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Gray','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap gray, title('Microcalcifications - Labelling'), zoom(2.5),zoom   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hot','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hot, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
 catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hsv','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hsv, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Jet','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap jet, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end

catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Spring','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap spring, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Summer','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap summer, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Autumn','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap autumn, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Winter','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap winter, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Bone','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap bone, title('Microcalcifications - Labelling'), zoom(2.5),zoom   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Copper','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap copper, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Pink','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap pink, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Lines','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap Lines, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Colorcube','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap colorcube, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Flag','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap flag, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Prism','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap prism, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - White','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap white, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
catch
    if handles.lengua == 1
 h = msgbox ('    Please choose a color','Message:','help');
 pause(4),
 delete(h)
 set(handles.Bwlabel,'Value',0)
     end
    if handles.lengua == 0
 h = msgbox ('    Por favor elija un color','Mensaje:','help');
 pause(4),
 delete(h)
 set(handles.Bwlabel,'Value',0)
    end
    break
end
end
end
if handles.singmult == 0
% Normalización
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Cool','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap cool, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
% FALTA MOVER DE SITIO A ANTES DEL BREAK EL MAMA_ET
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set(handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Gray','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap gray, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hot','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hot, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hsv','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hsv, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Jet','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap jet, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Spring','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap spring, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Summer','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap summer, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Autumn','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap autumn, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Winter','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap winter, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Bone','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap bone, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Copper','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap copper, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Pink','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap pink, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Lines','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap Lines, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Colorcube','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap colorcube, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Flag','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap flag, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Prism','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap prism, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
   set(handles.Bwlabel,'Value',0)
end
if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - White','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap white, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
end
end
end
end
if a==0
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to Bwlabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bwlabel


% --- Executes on button press in ALLC.
function ALLC_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.allcol=a;
guidata(hObject,handles);
if a == 1
set(handles.Equalizedc,'Value',1);
set(handles.Originalc,'Value',1);
set(handles.Microc,'Value',1);
set(handles.Scatterc,'Value',1);
set(handles.Bwlabel,'Value',1);
set(handles.windowc,'Value',1);
set(handles.Complementc,'Value',1);
set(handles.ALLC,'Value',1);
%He determinado que handles.Fpath es char con el comando class
try
    isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s with Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM con el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end
    set(handles.Equalizedc,'Value',0);
    set(handles.Originalc,'Value',0);
    set(handles.Microc,'Value',0);
    set(handles.Scatterc,'Value',0);
    set(handles.Bwlabel,'Value',0);
    set(handles.windowc,'Value',0);
    set(handles.Complementc,'Value',0);
    set(handles.ALLC,'Value',0);
    return
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
% Normalización
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
% Lo que se quiera hacer
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Complementc,'Value',0)
break
end
if handles.colors==2
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end
catch
    if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
    end
    if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
    end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==3
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==4
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==5
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==6
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==7
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==8
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==9
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==10
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==11
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==12
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==13
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==14
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==15
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==16
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==17
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==18
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==2
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Cool','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap cool; zoom
catch
    if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
    end
    if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
    end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==3
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Gray','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap gray; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==4
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hot','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hot; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==5
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hsv','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hsv; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==6
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Jet','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap jet; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==7
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Spring','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap spring; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==8
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Summer','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap summer; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==9
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Autumn','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap autumn; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==10
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Winter','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap winter; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==11
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Bone','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap bone; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==12
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Copper','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap copper; zoom
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==13
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Pink','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap pink; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==14
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Lines','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap lines; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==15
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Colorcube','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap colorcube; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==16
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Flag','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap flag; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==17
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Prism','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap prism; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==18
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - White','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap white; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
      Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Cool','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap cool, title('Microcalcifications - Labelling'), zoom(2.5),zoom 
   break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set(handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Gray','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap gray, title('Microcalcifications - Labelling'), zoom(2.5),zoom   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hot','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hot, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
 catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hsv','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hsv, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Jet','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap jet, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end

catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Spring','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap spring, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Summer','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap summer, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Autumn','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap autumn, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Winter','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap winter, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Bone','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap bone, title('Microcalcifications - Labelling'), zoom(2.5),zoom   
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Copper','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap copper, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Pink','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap pink, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
   Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Lines','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap Lines, title('Microcalcifications - Labelling'), zoom(2.5),zoom
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Colorcube','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap colorcube, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Flag','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap flag, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Prism','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap prism, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found (ZOOM 2.5X)','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado (ZOOM 2.5X)','Mensaje:','help');
     pause(3),
     delete(h)
   end
 Mama_et=bwlabel (ventana_bw,8);
number=max(max(Mama_et));
set (handles.edit12,'String',number)
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - White','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap white, title('Microcalcifications - Labelling'), zoom(2.5),zoom  
   break
    end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   set (handles.edit12,'String',0)
end
catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Bwlabel,'Value',0)
break
end
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
end
   xmin=xmin+paso;
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end

if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Summer - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
   scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
 scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
      scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
    if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
 scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
   if handles.lengua ==1
   h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
   end
   if handles.lengua ==0
   h = msgbox ('  Grupo de microcalcificaciones encontrado','Mensaje:','help');
     pause(3),
     delete(h)
   end
    scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Scatterc,'Value',0)
break
end
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring

     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Summer','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone

     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper

     break
   end
   xmin=xmin+paso;
end
if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
set(handles.Microc,'Value',0)
break
end
end
if handles.colors==2
Mama_comp=imadjust(matriz,[0 1],[1 0]);
scrsz = get(0,'ScreenSize');
figure('Name','Complement Image - Cool','NumberTitle','off','Position',[75,175,500,400]), imagesc(Mama_comp), title('Mammary - Complement Image'), colormap cool
end
if handles.colors==3
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap gray, title('Mammary - Complement Image')
end
if handles.colors==4
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hot, title('Mammary - Complement Image')
end
if handles.colors==5
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hsv, title('Mammary - Complement Image')
end
if handles.colors==6
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap jet, title('Mammary - Complement Image')
end
if handles.colors==7
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap spring, title('Mammary - Complement Image')
end
if handles.colors==8
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap summer, title('Mammary - Complement Image')
end
if handles.colors==9
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap autumn, title('Mammary - Complement Image')
end
if handles.colors==10
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap winter, title('Mammary - Complement Image')
end
if handles.colors==11
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap bone, title('Mammary - Complement Image')
end
if handles.colors==12
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap copper, title('Mammary - Complement Image')
end
if handles.colors==13
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap pink, title('Mammary - Complement Image')
end
if handles.colors==14
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap lines, title('Mammary - Complement Image')
end
if handles.colors==15
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap colorcube, title('Mammary - Complement Image')
end
if handles.colors==16
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap flag, title('Mammary - Complement Image')
end
if handles.colors==17
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap prism, title('Mammary - Complement Image')
end
if handles.colors==18
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap white, title('Mammary - Complement Image')
end
if handles.colors==2
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Cool','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap cool, title('Mammary - Equalized Image')
end
if handles.colors==3
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap gray, title('Mammary - Equalized Image')
end
if handles.colors==4
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hot, title('Mammary - Equalized Image')
end
if handles.colors==5
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hsv, title('Mammary - Equalized Image')
end
if handles.colors==6
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap jet, title('Mammary - Equalized Image')
end
if handles.colors==7
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap spring, title('Mammary - Equalized Image')
end
if handles.colors==8
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap summer, title('Mammary - Equalized Image')
end
if handles.colors==9
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap autumn, title('Mammary - Equalized Image')
end
if handles.colors==10
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap winter, title('Mammary - Equalized Image')
end
if handles.colors==11
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap bone, title('Mammary - Equalized Image')
end
if handles.colors==12
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap copper, title('Mammary - Equalized Image')
end
if handles.colors==13
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap pink, title('Mammary - Equalized Image')
end
if handles.colors==14
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap lines, title('Mammary - Equalized Image')
end
if handles.colors==15
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap colorcube, title('Mammary - Equalized Image')
end
if handles.colors==16
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap flag, title('Mammary - Equalized Image')
end
if handles.colors==17
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap prism, title('Mammary - Equalized Image')
end
if handles.colors==18
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap white, title('Mammary - Equalized Image')
end
catch
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Equalizedc,'Value',0);
set(handles.Originalc,'Value',0);
set(handles.Microc,'Value',0);
set(handles.Scatterc,'Value',0);
set(handles.Bwlabel,'Value',0);
set(handles.windowc,'Value',0);
set(handles.Complementc,'Value',0);
set(handles.ALLC,'Value',0);
set (handles.edit12,'String',0)
return
end
end
end
if handles.singmult==0
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Complementc,'Value',0)
end
if handles.colors==2
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Cool','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap cool, title('Mammary - Equalized Image')
end
if handles.colors==3
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap gray, title('Mammary - Equalized Image')
end
if handles.colors==4
 Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hot, title('Mammary - Equalized Image')
end
if handles.colors==5
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap hsv, title('Mammary - Equalized Image')
end
if handles.colors==6
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap jet, title('Mammary - Equalized Image')
end
if handles.colors==7
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap spring, title('Mammary - Equalized Image')
end
if handles.colors==8
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap summer, title('Mammary - Equalized Image')
end
if handles.colors==9
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap autumn, title('Mammary - Equalized Image')
end
if handles.colors==10
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap winter, title('Mammary - Equalized Image')
end
if handles.colors==11
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap bone, title('Mammary - Equalized Image')
end
if handles.colors==12
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap copper, title('Mammary - Equalized Image')
end
if handles.colors==13
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap pink, title('Mammary - Equalized Image')
end
if handles.colors==14
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap lines, title('Mammary - Equalized Image')
end
if handles.colors==15
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap colorcube, title('Mammary - Equalized Image')
end
if handles.colors==16
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap flag, title('Mammary - Equalized Image')
end
if handles.colors==17
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap prism, title('Mammary - Equalized Image')
end
if handles.colors==18
Mama_eq=histeq(matriz);
 scrsz = get(0,'ScreenSize');
 figure('Name','Equalized Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_eq) , colormap white, title('Mammary - Equalized Image')
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Summer','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Windowing - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Windowing; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
  catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==2
Mama_comp=imadjust(matriz,[0 1],[1 0]);
scrsz = get(0,'ScreenSize');
figure('Name','Complement Image - Cool','NumberTitle','off','Position',[75,175,500,400]), imagesc(Mama_comp), title('Mammary - Complement Image'), colormap cool
end
if handles.colors==3
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Gray','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap gray, title('Mammary - Complement Image')
end
if handles.colors==4
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hot','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hot, title('Mammary - Complement Image')
end
if handles.colors==5
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Hsv','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap hsv, title('Mammary - Complement Image')
end
if handles.colors==6
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Jet','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap jet, title('Mammary - Complement Image')
end
if handles.colors==7
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Spring','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap spring, title('Mammary - Complement Image')
end
if handles.colors==8
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Summer','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap summer, title('Mammary - Complement Image')
end
if handles.colors==9
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Autumn','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap autumn, title('Mammary - Complement Image')
end
if handles.colors==10
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Winter','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap winter, title('Mammary - Complement Image')
end
if handles.colors==11
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Bone','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap bone, title('Mammary - Complement Image')
end
if handles.colors==12
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Copper','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap copper, title('Mammary - Complement Image')
end
if handles.colors==13
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Pink','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap pink, title('Mammary - Complement Image')
end
if handles.colors==14
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Lines','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap lines, title('Mammary - Complement Image')
end
if handles.colors==15
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Colorcube','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap colorcube, title('Mammary - Complement Image')
end
if handles.colors==16
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Flag','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap flag, title('Mammary - Complement Image')
end
if handles.colors==17
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - Prism','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap prism, title('Mammary - Complement Image')
end
if handles.colors==18
Mama_comp=imadjust(matriz,[0 1],[1 0]);
 scrsz = get(0,'ScreenSize');
 figure('Name','Complement Image - White','NumberTitle','off','Position',[75,225,500,400]), imagesc(Mama_comp) , colormap white, title('Mammary - Complement Image')
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap cool
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Gray','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hot','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hot
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Hsv','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap hsv
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Jet','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap jet
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Spring','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap spring
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Summer - Cool','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap summer
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Autumn','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap autumn
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Winter','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap winter
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Bone','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap bone
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Copper','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap copper
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Pink','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap pink
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Lines','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap lines
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Colorcube','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap colorcube
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Flag','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap flag
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - Prism','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap prism
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end

if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('  Groups of microcalcifications found','Message:','help');
     pause(3),
     delete(h)
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red - White','NumberTitle','off','Position',[200,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap white
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==2
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Cool','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap cool, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==3
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Gray','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap gray, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==4
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hot','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hot, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==5
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Hsv','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap hsv, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==6
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Jet','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap jet, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==7
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Spring','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap spring, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==8
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Summer','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap summer, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==9
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Autumn','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap autumn, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==10
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Winter','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap winter, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==11
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Bone','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap bone, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==12
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Copper','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap copper, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==13
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Pink','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap pink, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==14
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Lines','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap Lines, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==15
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Colorcube','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap colorcube, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==16
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Flag','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap flag, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==17
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - Prism','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap prism, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==18
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     h = msgbox ('Groups of microcalcifications found  (ZOOM 2.5X)','Message:','help');
     pause(4),
     delete(h)

     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   h = msgbox ('No microcalcifications found in this DICOM File','Message:','warn');
   pause(4),
   delete(h)
 end
 if (distance<2)
Mama_et=bwlabel (ventana_bw,8);
scrsz = get(0,'ScreenSize');
figure('Name','Labelling - White','NumberTitle','off','Position',[750,225,500,400]),imagesc(Mama_et)
colorbar, colormap white, title('Microcalcifications - Labelling'), zoom(2.5),zoom
 end
   catch
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(4),
delete(h)
end
end
if handles.colors==2
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Cool','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap cool; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==3
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Gray','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap gray; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==4
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hot','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hot; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==5
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hsv','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hsv; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==6
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Jet','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap jet; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==7
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Spring','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap spring; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==8
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Summer','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap summer; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==9
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Autumn','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap autumn; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==10
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Winter','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap winter; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==11
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Bone','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap bone; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==12
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Copper','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap copper; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==13
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Pink','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap pink; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==14
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Lines','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap lines; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==15
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Colorcube','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap colorcube; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==16
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Flag','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap flag; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==17
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Prism','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap prism; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==18
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - White','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap white; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==2
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==3
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==4
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==5
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==6
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==7
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==8
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==9
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==10
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==11
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==12
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==13
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==14
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==15
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==16
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==17
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==18
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
catch
    if handles.lengua == 1
    h = msgbox ('    Please choose a color','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor elija un color','Mensaje:','help');
    pause(3),
    delete(h)
    end
    set(handles.Equalizedc,'Value',0);
    set(handles.Originalc,'Value',0);
    set(handles.Microc,'Value',0);
    set(handles.Scatterc,'Value',0);
    set(handles.Bwlabel,'Value',0);
    set(handles.windowc,'Value',0);
    set(handles.Complementc,'Value',0);
    set(handles.ALLC,'Value',0);
    
end
end    
end
if a==0
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to ALLC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ALLC


% --- Executes on button press in windowc.
function windowc_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.wc=a;
guidata(hObject,handles);
if a == 1
%He determinado que handles.Fpath es char con el comando class
try
    isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s with Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM con el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end
    set(handles.windowc,'Value',0)
    return
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
% Normalización
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
% Lo que se quiera hacer
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.windowc,'Value',0)
break
end
if handles.colors==2
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Cool','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap cool; zoom
catch
    if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
    end
    if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
    end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==3
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Gray','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap gray; zoom
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==4
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hot','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hot; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==5
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hsv','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hsv; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==6
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Jet','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap jet; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==7
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Spring','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap spring; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==8
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Summer','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap summer; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==9
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Autumn','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap autumn; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==10
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Winter','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap winter; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==11
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Bone','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap bone; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==12
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Copper','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap copper; zoom
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==13
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Pink','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap pink; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==14
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Lines','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap lines; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==15
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Colorcube','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap colorcube; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==16
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Flag','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap flag; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==17
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Prism','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap prism; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
if handles.colors==18
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - White','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap white; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
break  
 end
end
catch
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.windowc,'Value',0)
return
end
end
end
if handles.singmult==0

%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.windowc,'Value',0)
end
if handles.colors==2
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Cool','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap cool; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==3
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Gray','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap gray; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==4
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hot','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hot; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==5
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Hsv','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap hsv; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==6
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Jet','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap jet; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==7
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Spring','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap spring; zoom
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==8
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Summer','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap summer; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==9
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Autumn','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap autumn; zoom
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==10
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Winter','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap winter; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==11
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Bone','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap bone; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==12
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Copper','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap copper; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==13
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Pink','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap pink; zoom
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==14
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Lines','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap lines; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==15
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Colorcube','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap colorcube; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==16
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Flag','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap flag; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==17
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - Prism','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap prism; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
if handles.colors==18
try
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
figure('Name','Window - White','NumberTitle','off','Position',[300,225,500,400]);imagesc(ventana)
s=['Window; ',num2str(handles.min),' - ',num2str(handles.max);];
title(s); colormap white; zoom
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.windowc,'Value',0)
 end
end
catch
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.windowc,'Value',0)
end    
end
end
if a==0
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to windowc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of windowc


% --- Executes on button press in PC.
function PC_Callback(hObject, eventdata, handles)
try connector on
    close gcf
catch
    if handles.lengua==1
    h = msgbox ('View ?-button to installation instructions','Message:','help');
    end
    if handles.lengua==0
    h = msgbox ('Ver el botón de ayuda, "?", para instrucciones de instalación','Mensaje:','help');
    end
end

% hObject    handle to PC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
if handles.lengua==1
h = msgbox ({'1.-  Download apps.','2.-  Choose Connect to your computer.','3.-  Follow the instructions and see data in the command window;','you may need to change folders permissions','4.-  For further information and downloads see webpage.','                       Thanks for using!'},'Connect to Android/IOS:','help');
url = 'http://www.mathworks.com/connector';
web(url)
end
if handles.lengua==0
h = msgbox ({'1.-  Descargar aplicaciones.','2.-  Elija "Connect to your computer".','3.-  Siga las instrucciones y los datos de la ventana de comandos;','quizás sean necesarios cambios en los permisos de carpetas','4.-  Para más información y descargas consulte la web abierta.','                       ¡Gracias por usar esta herramienta!'},'Conectar a Android/IOS:','help');
url = 'http://www.mathworks.com/connector';
web(url)
end
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Complementc.
function Complementc_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
handles.compc=a;
guidata(hObject,handles);
if a == 1
%He determinado que handles.Fpath es char con el comando class
try
    isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s with Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM con el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end
    set(handles.Complementc,'Value',0)
    return
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
% Normalización
  matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
% Lo que se quiera hacer
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Complementc,'Value',0)
break
end
if handles.colors==2
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end
catch
    if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
    end
    if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
    end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==3
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end
catch
 h = msgbox ('Please set xmin and xmax in the Image table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
end
if handles.colors==4
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==5
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==6
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==7
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==8
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==9
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==10
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==11
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==12
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==13
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==14
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==15
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==16
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==17
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
if handles.colors==18
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
break  
 end
end
catch
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Complementc,'Value',0)
return
end
end
end
if handles.singmult==0
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
isa(handles.colors,'double');
if handles.colors==1
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Complementc,'Value',0)
end
if handles.colors==2
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Cool','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap cool
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==3
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Gray','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap gray
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==4
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hot','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hot
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==5
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Hsv','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap hsv
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==6
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Jet','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap jet
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==7
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Spring','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap spring
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==8
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Summer','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap summer
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==9
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Autumn','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap autumn
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==10
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Winter','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap winter
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==11
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Bone','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap bone
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==12
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Copper','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap copper
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==13
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Pink','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap pink
  end
catch
if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==14
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Lines','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap lines
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==15
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Colorcube','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap colorcube
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==16
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Flag','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap flag
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==17
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - Prism','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap prism
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
if handles.colors==18
try
%Ventana
ventana=imadjust(matriz,[handles.min handles.max],[0 1]);
%Enseñar invertida imagen original
  if handles.min+handles.max==1
        matriz_1=imadjust(matriz,[0 1],[1 0]); 
        figure('Name','Original Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(matriz_1)
        s=['Original Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end      
%Enseñar invertida ventana radiologica
  if handles.min+handles.max~=1       
        ventana_1=imadjust(matriz,[handles.min handles.max],[handles.max handles.min]);
        figure('Name','Complement - White','NumberTitle','off','Position',[310,225,500,400]);imagesc(ventana_1)
        s=['Complement; ',num2str(handles.min),' - ',num2str(handles.max);];
        title(s)
        colormap white
  end
catch
 if handles.lengua==1
    h = msgbox ('Please set xmin and xmax in the Images table to show this figure','Message:','warn');
 pause(4),
 delete(h)
 end
 if handles.lengua==0
    h = msgbox ('Por favor elija xmin y xmax en la tabla Imágenes para mostrar esta figura','Mensaje:','warn');
 pause(4),
 delete(h)
 end
  set(handles.Complementc,'Value',0)
 end
end
catch
if handles.lengua == 1
h = msgbox ('    Please choose a color','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox ('    Por favor escoja un color','Mensaje:','help');
pause(3),
delete(h)
end
set(handles.Complementc,'Value',0)
end    
end
end
if a==0
if handles.lengua == 1
h = msgbox (' Use button to close colored Images','Message:','help');
pause(3),
delete(h)
end
if handles.lengua == 0
h = msgbox (' Use el botón para cerrar imágenes coloreadas','Mensaje:','help');
pause(3),
delete(h)
end
end
% hObject    handle to Complementc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Complementc
% --------------------------------------------------------------------
function Language_Callback(hObject, eventdata, handles)

% hObject    handle to Language (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function English_Callback(hObject, eventdata, handles)
% hObject    handle to English (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.lengua=1;
set(gcbo,'Checked','on');
set(handles.Untitled_3,'Checked','off')
handles = CambiarLengua (handles);
guidata(hObject, handles);

% --- Executes on button press in scattor.
function scattor_Callback(hObject, eventdata, handles)
try
isa(handles.Fpath,'char');    
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s with Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM con el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end
end
try
if handles.singmult == 1
   for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
     try
%Normalizar
matriz=double(handles.img{handles.iFname})/double(max(max(handles.img{handles.iFname})));
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red','NumberTitle','off','Position',[500,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray;
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     figure('Name','Locations in Original Image - Filled','NumberTitle','off','Position',[75,150,500,400]), imagesc(handles.img{handles.iFname}), title('Mammary - Original Image + Scatter'), zoom on
     colormap gray
     hold on
     scatter (y,x,2.5,'b','fill');
     hold off
     x=get(get(gca,'Children'),'XData');
     handles.x = x;
     guidata(hObject,handles);
     y=get(get(gca,'Children'),'YData');
     handles.y = y;
     guidata(hObject,handles);
     close(findobj('type','figure','name','Scatter - Red'))
     scrsz = get(0,'ScreenSize');
     figure('Name','Locations in Original Image','NumberTitle','off','Position',[75,150,500,400]), imagesc(handles.img{handles.iFname}), title('Mammary - Original Image + Scatter'), zoom on
     colormap gray
     hold on
     plot([handles.x{:}],[handles.y{:}],'dr');
     hold off
     break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
   break
 end
   catch
if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
end
if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
end
break

     end
    end
end
if handles.singmult == 0
try
    Mama=dicomread (handles.Fname);
    handles.uiget=Mama;
    guidata(hObject,handles);
catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(2),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(2),
    delete(h)
    end
end
%Normalización:
matriz=double(handles.uiget)/double(max(max(handles.uiget)));
try
%Parámetros
paso=0.01;
margen=100;
xmax=handles.xmax;
xmin=handles.xmin;
pixel=handles.pixel;
while xmin<xmax
   ventana=imadjust(matriz,[xmin xmax],[0 1]);
   ventana_bw=im2bw(ventana);
   [x,y]=find(ventana_bw==1);
   x1=min(x);
   x2=max(x);
   y1=min(y);
   y2=max(y);
   distance=sqrt((x1-x2)^2+(y1-y2)^2)*pixel;
   %Condición de malignidad considerando 1cm2
   if (distance<=sqrt(2))
     scrsz = get(0,'ScreenSize');
     figure('Name','Scatter - Red','NumberTitle','off','Position',[500,225,500,400]);imagesc(ventana);ylim([x1-margen x2+margen]);xlim([y1-margen y2+margen]);
     s=['Microcalcifications - Suspicious; ',num2str(xmin),' - ',num2str(xmax);];
     title(s); colormap gray;
     hold on
     scatter(y,x,3.5,'r','fill'); 
     hold off
     figure('Name','Locations in Original Image - Filled','NumberTitle','off','Position',[75,150,500,400]), imagesc(handles.uiget), title('Mammary - Original Image + Scatter'), zoom on
     colormap gray
     hold on
     scatter (y,x,2.5,'b','fill');
     hold off
    x=get(get(gca,'Children'),'XData');
    handles.x = x;
    guidata(hObject,handles);
    y=get(get(gca,'Children'),'YData');
    handles.y = y;
    guidata(hObject,handles);
    scrsz = get(0,'ScreenSize');
    figure('Name','Locations in Original Image','NumberTitle','off','Position',[75,150,500,400]), imagesc(handles.uiget), title('Mammary - Original Image + Scatter'), zoom on
    colormap gray
    hold on
    plot([handles.x{:}],[handles.y{:}],'dr');
    hold off
    close(findobj('type','figure','name','Scatter - Red'))
    break
   end
   xmin=xmin+paso;
end
 if (distance>2)
   if handles.lengua == 1
   h = msgbox ('No microcalcifications found','Message:','warn');
   pause(2),
   delete(h)
   end
   if handles.lengua == 0
   h = msgbox ('No se han encontrado microcalcificaciones','Mensaje:','warn');
   pause(2),
   delete(h)
   end
 end
catch
       if handles.lengua == 1
h = msgbox ('Please set xmin, xmax and pixel for the script','Message:','warn');
pause(2),
delete(h)
       end
       if handles.lengua == 0
h = msgbox ('Por favor elija xmin, xmax y pixel para el script','Mensaje:','warn');
pause(2),
delete(h)
       end
end
end
 close(findobj('type','figure','name','Scatter  -  Red'))
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s with Browse button','Message:','help');
    pause(1),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM con el botón Examinar','Mensaje:','help');
    pause(1),
    delete(h)
    end
end
% hObject    handle to scattor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.lengua=0;
set(gcbo,'Checked','on');
set(handles.English,'Checked','off')
handles = CambiarLengua (handles);
guidata(hObject, handles);


function [handles] = CambiarLengua(handles)
if handles.lengua == 0
set (handles.Browse, 'string','Examinar')
set (handles.Compile,'String','Compilar GUI')
set (handles.Folder, 'string','Carpeta')
set (handles.Language, 'Label','Idioma') 
set (handles.uipanel2, 'Title','Microcalcificaciones')
set (handles.English, 'Label','Inglés')
set (handles.Untitled_3, 'Label','Español')
set (handles.bwlabel, 'string','Agrupaciones = ')
set (handles.Microcalcifications, 'string','Ver microcalcificaciones')
set (handles.scattor, 'string','Localización original')
set (handles.uipanel4, 'Title','Cerrar')
set (handles.closef, 'string','Figuras & Reiniciar GUI')
set (handles.FileName, 'string','Nombre del archivo')
set (handles.Directory, 'string','Directorio')
set (handles.uipanel3, 'Title','Imágenes')
set (handles.Histograma, 'string','Histograma normalizado')
set (handles.Equalized, 'string','Equalizada')
set (handles.Complement, 'string','Complementaria original')
set (handles.Window, 'string','Ventana')
set (handles.Inversion, 'string','Complementaria')
set (handles.closeinv, 'string','Cerrar complementarias')
set (handles.uipanel5, 'Title','Colores')
set (handles.Equalizedc, 'string','Equalizada')
set (handles.Originalc, 'string','Complementaria original')
set (handles.Microc, 'string','Microcalcificaciones')
set (handles.Bwlabel, 'string','Agrupaciones')
set (handles.closecol, 'string','Cerrar coloreadas')
set (handles.windowc, 'string','Ventana')
set (handles.Complementc, 'string','Complementaria')
set (handles.ALLC, 'string','TODAS')
set (handles.Colors, 'string',{'             Colores','cool','gray','hot','hsv','jet','spring','summer','autumn','winter','bone','copper','pink','lines','colorcube','flag','prism','white',})
 else
   set (handles.Browse, 'string','Browse')
   set (handles.Compile,'String','Compile GUI')
   set (handles.Folder, 'string','Folder')
   set (handles.Language, 'Label','Language') 
   set (handles.uipanel2, 'Title','Microcalcifications')
   set (handles.English, 'Label','English')
   set (handles.Untitled_3, 'Label','Spanish')
   set (handles.bwlabel, 'string','Groups            =  ')
   set (handles.Microcalcifications, 'string','Show microcalcifications')
   set (handles.scattor, 'string','Original Locations')
   set (handles.uipanel4, 'Title','Close')
   set (handles.closef, 'string','Figures & Reset GUI')
   set (handles.FileName, 'string','FileName')
   set (handles.Directory, 'string','Directory')
   set (handles.uipanel3, 'Title','Images')
   set (handles.Histograma, 'string','normalized Histogram')
   set (handles.Equalized, 'string','Equalized')
   set (handles.Complement, 'string','original Complement')
   set (handles.Window, 'string','Window')
   set (handles.Inversion, 'string','Complement')
   set (handles.closeinv, 'string','Close inversions')
   set (handles.uipanel5, 'Title','Colors')
   set (handles.Equalizedc, 'string','Equalized')
   set (handles.Originalc, 'string','original Complement')
   set (handles.Microc, 'string','Microcalcifications')
   set (handles.Bwlabel, 'string','Groups')
   set (handles.closecol, 'string','Close colored')
   set (handles.windowc, 'string','Window')
   set (handles.Complementc, 'string','Complement')
   set (handles.ALLC, 'string','ALL')
   set (handles.Colors, 'string',{'             Colors','cool','gray','hot','hsv','jet','spring','summer','autumn','winter','bone','copper','pink','lines','colorcube','flag','prism','white',})

end
% function [Fname] = process_each_file(Fname)
% % handles.uiget=ans;
% guidata(hObject,handles);


% --- Executes on button press in Suma.
function Suma_Callback(hObject, eventdata, handles)
% handles.imagmic&&handles.uiget;
% figure, imagesc(ans)
% hObject    handle to Suma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Equalizedc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Equalizedc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Roipoly.
function Roipoly_Callback(hObject, eventdata, handles)
try
    isa(handles.Fpath,'char');
catch
    if handles.lengua == 1
    h = msgbox ('    Please load DICOM File/s with Browse button','Message:','help');
    pause(3),
    delete(h)
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor cargue archivo/s DICOM con el botón Examinar','Mensaje:','help');
    pause(3),
    delete(h)
    end
end
if handles.singmult == 0
if handles.lengua == 1
    h = msgbox ('    Draw and double click','Message:','help');
    pause(2),
    delete(h)
end
if handles.lengua == 0
    h = msgbox ('    Dibuje y haga doble click para limpiar','Mensaje:','help');
    pause(2),
    delete(h)
end
figure('Name','Roipoly_1','NumberTitle','off','Position',[500,225,500,400]), imagesc(handles.uiget),title('Roipoly-cleaning')
mascara=roipoly;
figure('Name','Roipoly_2','NumberTitle','off','Position',[500,250,500,400]), imagesc(mascara),title('Roipoly-cleaning')
Mama_roi=handles.uiget;
Mama_roi(mascara)=0;
figure('Name','Roipoly_3','NumberTitle','off','Position',[500,275,500,400]), imagesc(Mama_roi),title('Roipoly-cleaned')
end
if handles.singmult == 1
for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
  filename = strcat(handles.Fpath, handles.Fname{handles.iFname});
  image = dicomread(filename);
  handles.img{handles.iFname} = image;
if handles.lengua == 1
    h = msgbox ('    Draw and double click','Message:','help');
    pause(2),
    delete(h)
end
if handles.lengua == 0
    h = msgbox ('    Dibuje y haga doble click para limpiar','Mensaje:','help');
    pause(2),
    delete(h)
end
figure('Name','Roipoly_1','NumberTitle','off','Position',[500,225,500,400]), imagesc(handles.img{handles.iFname}),title('Roipoly-cleaning')
mascara=roipoly;
figure('Name','Roipoly_2','NumberTitle','off','Position',[500,250,500,400]), imagesc(mascara),title('Roipoly-cleaning')
Mama_roi=handles.img{handles.iFname};
Mama_roi(mascara)=0;
figure('Name','Roipoly_3','NumberTitle','off','Position',[500,275,500,400]), imagesc(Mama_roi),title('Roipoly-cleaned')
end
end
% hObject    handle to Roipoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DICOM_info.
function DICOM_info_Callback(hObject, eventdata, handles)
a = get(hObject,'Value');
if a==1
    try
isa(handles.Fpath,'char');
if handles.singmult == 0
b=get(handles.FileName,'String');
handles.info=b;
guidata(hObject,handles);
handles.iminfo = imageinfo(handles.info);
guidata(hObject,handles);
end
if handles.singmult == 1
  for iFname = 1:handles.multi
  handles.iFname=iFname;
  guidata(hObject, handles);
handles.iminfo = imageinfo(handles.Fname{handles.iFname});
guidata(hObject,handles);
  end
end
    catch
    if handles.lengua == 1
    h = msgbox ('    Please use Browse button','Message:','help');
    pause(2),
    delete(h)
    set(handles.DICOM_info,'Value',0);
    end
    if handles.lengua == 0
    h = msgbox ('    Por favor use el botón Examinar','Mensaje:','help');
    pause(2),
    delete(h)
    set(handles.DICOM_info,'Value',0);
    end
    end
set(handles.DICOM_info,'Value',0);    
end
% hObject    handle to DICOM_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DICOM_info


% --- Executes on button press in Compile.
function Compile_Callback(hObject, eventdata, handles)
deploytool
deploytool -?
 doc compiler/deploytool
% hObject    handle to Compile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Folder.
function Folder_Callback(hObject, eventdata, handles)
nfolder=uigetdir('','Select DICOM Directory');
if ~ischar(nfolder)
    disp('no valid Directory selected.')
    return;
end
handles.dfolder=nfolder;
guidata(hObject, handles);
copyfile('Matlab_GUI_Microcalcifications.fig',(handles.dfolder),'f')
copyfile('Matlab_GUI_Microcalcifications.m',(handles.dfolder),'f')
cd(handles.dfolder)
% hObject    handle to Folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
