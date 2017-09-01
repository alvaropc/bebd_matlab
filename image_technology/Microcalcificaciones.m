function varargout = Microcalcificaciones(varargin)
% MICROCALCIFICACIONES MATLAB code for Microcalcificaciones.fig
%      MICROCALCIFICACIONES, by itself, creates a new MICROCALCIFICACIONES or raises the existing
%      singleton*.
%
%      H = MICROCALCIFICACIONES returns the handle to a new MICROCALCIFICACIONES or the handle to
%      the existing singleton*.
%
%      MICROCALCIFICACIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MICROCALCIFICACIONES.M with the given input arguments.
%
%      MICROCALCIFICACIONES('Property','Value',...) creates a new MICROCALCIFICACIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Microcalcificaciones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Microcalcificaciones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Microcalcificaciones

% Last Modified by GUIDE v2.5 09-Jun-2013 02:08:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Microcalcificaciones_OpeningFcn, ...
                   'gui_OutputFcn',  @Microcalcificaciones_OutputFcn, ...
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


% --- Executes just before Microcalcificaciones is made visible.
function Microcalcificaciones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Microcalcificaciones (see VARARGIN)

% Choose default command line output for Microcalcificaciones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Microcalcificaciones wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Microcalcificaciones_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function xmin_Callback(hObject, eventdata, handles)

handles.xmin=str2double(get(hObject, 'String'));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function xmin_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Xmax_Callback(hObject, eventdata, handles)

handles.xmax=str2double(get(hObject, 'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Xmax_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pixel_Callback(hObject, eventdata, handles)

handles.pixel=str2double(get(hObject, 'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pixel_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in subguide.
function subguide_Callback(hObject, eventdata, handles)

uiget=uigetfile('.dcm','Seleccione archivos','Multiselect','on')

for i=1:length(uiget)
  
    mamai=dicomread(uiget{i});
    buscaventanaguidepro(mamai,handles.pixel,handles.xmin,handles.xmax,uiget{i})
    %añadir condicion if close, más mensaje final
    
    
end
guidata(hObject, handles);
