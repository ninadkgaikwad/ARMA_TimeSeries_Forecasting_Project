function varargout = ARIMA_ModelEstimateViewer_GUI(varargin)
% ARIMA_MODELESTIMATEVIEWER_GUI MATLAB code for ARIMA_ModelEstimateViewer_GUI.fig
%      ARIMA_MODELESTIMATEVIEWER_GUI, by itself, creates a new ARIMA_MODELESTIMATEVIEWER_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_MODELESTIMATEVIEWER_GUI returns the handle to a new ARIMA_MODELESTIMATEVIEWER_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_MODELESTIMATEVIEWER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_MODELESTIMATEVIEWER_GUI.M with the given input arguments.
%
%      ARIMA_MODELESTIMATEVIEWER_GUI('Property','Value',...) creates a new ARIMA_MODELESTIMATEVIEWER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_ModelEstimateViewer_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_ModelEstimateViewer_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_ModelEstimateViewer_GUI

% Last Modified by GUIDE v2.5 24-Aug-2016 18:21:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_ModelEstimateViewer_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_ModelEstimateViewer_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_ModelEstimateViewer_GUI is made visible.
function ARIMA_ModelEstimateViewer_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_ModelEstimateViewer_GUI (see VARARGIN)

% Getting Previous GUI Workspace Name

ARIMA_ModelEstimation_GUI=getappdata(0,'ARIMA_ModelEstimation_GUI');

% Getting the Model Estimate Cell Structure from the Previous GUI

ARIMAmodelEstimate=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstimate');

% Computing Length of above Cell Structure

LenEsitmateModels=length(ARIMAmodelEstimate);

% Initializing the GUI Elements

set(handles.ModelEstimateViewer,'String','');

% Displaying Model Estimate Details in the Test Box
    
clc;

% Creating File CommandLine_Output to store Netcdf File Details
diary('CommandLine_Output2')

diary on;

for i=1:LenEsitmateModels

ARIMAmodelEstimate{1,i}

end

diary off;

output=fileread('CommandLine_Output2');

% Displaying File Data to Edit Box 
 set(handles.ModelEstimateViewer,'String',output);

 delete('CommandLine_Output2');  

% Choose default command line output for ARIMA_ModelEstimateViewer_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Creating Current GUI WorkSpace Name

setappdata(0,'ARIMA_ModelEstimateViewer_GUI',gcf);

% UIWAIT makes ARIMA_ModelEstimateViewer_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_ModelEstimateViewer_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ModelEstimateViewer_Callback(hObject, eventdata, handles)
% hObject    handle to ModelEstimateViewer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ModelEstimateViewer as text
%        str2double(get(hObject,'String')) returns contents of ModelEstimateViewer as a double


% --- Executes during object creation, after setting all properties.
function ModelEstimateViewer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ModelEstimateViewer (see GCBO)
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

% Close the Current GUI

close;
