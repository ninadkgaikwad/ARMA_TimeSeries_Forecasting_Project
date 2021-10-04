function varargout = ARIMA_ModelSimulation_GUI(varargin)
% ARIMA_MODELSIMULATION_GUI MATLAB code for ARIMA_ModelSimulation_GUI.fig
%      ARIMA_MODELSIMULATION_GUI, by itself, creates a new ARIMA_MODELSIMULATION_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_MODELSIMULATION_GUI returns the handle to a new ARIMA_MODELSIMULATION_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_MODELSIMULATION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_MODELSIMULATION_GUI.M with the given input arguments.
%
%      ARIMA_MODELSIMULATION_GUI('Property','Value',...) creates a new ARIMA_MODELSIMULATION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_ModelSimulation_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_ModelSimulation_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_ModelSimulation_GUI

% Last Modified by GUIDE v2.5 31-Jul-2016 12:00:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_ModelSimulation_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_ModelSimulation_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_ModelSimulation_GUI is made visible.
function ARIMA_ModelSimulation_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_ModelSimulation_GUI (see VARARGIN)

% Initializing the GUI

set(handles.SimModelNum,'String','');
set(handles.SimObsNum,'String','');

axes(handles.G1);
cla reset;

% Choose default command line output for ARIMA_ModelSimulation_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ARIMA_ModelSimulation_GUI',gcf);

% UIWAIT makes ARIMA_ModelSimulation_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_ModelSimulation_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Restting the GUI 

set(handles.SimModelNum,'String','');
set(handles.SimObsNum,'String','');

axes(handles.G1);
cla reset;

% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the GUI
close;

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening the next GUI
ARIMA_ModelIdentification_GUI;

function SimObsNum_Callback(hObject, eventdata, handles)
% hObject    handle to SimObsNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SimObsNum as text
%        str2double(get(hObject,'String')) returns contents of SimObsNum as a double


% --- Executes during object creation, after setting all properties.
function SimObsNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SimObsNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SimModelNum_Callback(hObject, eventdata, handles)
% hObject    handle to SimModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SimModelNum as text
%        str2double(get(hObject,'String')) returns contents of SimModelNum as a double


% --- Executes during object creation, after setting all properties.
function SimModelNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SimModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getiing WorkSpace Names for Previous App

ARIMA_ModelCreation_GUI=getappdata(0,'ARIMA_ModelCreation_GUI');

ARIMA_ModelSimulation_GUI=getappdata(0,'ARIMA_ModelSimulation_GUI');

% Get the ARIMA Models Created in the previous App

ARIMAModelCel1=getappdata(ARIMA_ModelCreation_GUI,'ARIMAModelCel1');

% Get the Desired ARIMA Model number

SimModelNum=get(handles.SimModelNum,'String');
SimModelNum=str2double(SimModelNum);

% Selecting the Desired ARIMA Model and Setting-Up in Current GUI WorkSpace

SimARIMAmodel=ARIMAModelCel1{1,SimModelNum};

setappdata(ARIMA_ModelSimulation_GUI,'SimARIMAmodel',SimARIMAmodel);


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getiing WorkSpace Names for Current GUI

ARIMA_ModelSimulation_GUI=getappdata(0,'ARIMA_ModelSimulation_GUI');

% Get the ARIMA Selected Model 

SimARIMAmodel=getappdata(ARIMA_ModelSimulation_GUI,'SimARIMAmodel');

% Get the Desired ARIMA Model number

SimObsNum=get(handles.SimObsNum,'String');
SimObsNum=str2double(SimObsNum);

% Simulating behaviour of Known-Parameter ARIMA Model

SimSeries = simulate(SimARIMAmodel,SimObsNum);

SimSeriesCurve=SimSeries';

% Plotting the Simulated Time Series for the Known-Parameter ARIMA Model

SimSeriesLen=length(SimSeries);

SimSeriesLenVector=1:SimSeriesLen;

% Ploting OriginalSeries Curve:

  axes(handles.G1);
  grid on
  hold on 
  title('Simulated Data Series');
  xlabel('Observation Numbers');
  ylabel('Simulated Observation Values');
%   xlim([0 inf]);
%   ylim([0 inf]); 
  %Plot Curve
  plot(SimSeriesCurve,SimSeriesLenVector,'LineWidth',2);  
