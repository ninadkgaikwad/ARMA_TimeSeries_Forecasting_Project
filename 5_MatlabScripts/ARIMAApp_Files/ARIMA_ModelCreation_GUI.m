function varargout = ARIMA_ModelCreation_GUI(varargin)
% ARIMA_MODELCREATION_GUI MATLAB code for ARIMA_ModelCreation_GUI.fig
%      ARIMA_MODELCREATION_GUI, by itself, creates a new ARIMA_MODELCREATION_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_MODELCREATION_GUI returns the handle to a new ARIMA_MODELCREATION_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_MODELCREATION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_MODELCREATION_GUI.M with the given input arguments.
%
%      ARIMA_MODELCREATION_GUI('Property','Value',...) creates a new ARIMA_MODELCREATION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_ModelCreation_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_ModelCreation_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_ModelCreation_GUI

% Last Modified by GUIDE v2.5 16-Aug-2016 18:34:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_ModelCreation_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_ModelCreation_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_ModelCreation_GUI is made visible.
function ARIMA_ModelCreation_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_ModelCreation_GUI (see VARARGIN)

% Initializing a Global Variable

global NextModel;
NextModel=0;

global ARIMAModelCell;
ARIMAModelCell=cell(1,1); 

% Initializing the GUI

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);

set(handles.r3,'Value',0);
set(handles.r4,'Value',1);

set(handles.r5,'Value',1);
set(handles.r6,'Value',0);


set(handles.ch1,'Value',0);
set(handles.ch2,'Value',0);

set(handles.ch3,'Value',0);
set(handles.ch4,'Value',0);


set(handles.r1,'Enable','on');
set(handles.r2,'Enable','on');

set(handles.r3,'Enable','off');
set(handles.r4,'Enable','off');

set(handles.r5,'Enable','off');
set(handles.r6,'Enable','off');


set(handles.ch1,'Enable','on');
set(handles.ch2,'Enable','on');

set(handles.ch3,'Enable','off');
set(handles.ch4,'Enable','off');


set(handles.ModelNum,'String','');
set(handles.ARIMAmodelDisplay,'String','');


set(handles.P,'String','');
set(handles.D,'String','');
set(handles.Q,'String','');

set(handles.ARlags,'String','');
set(handles.MAlags,'String','');

set(handles.Season,'String','');
set(handles.SARlags,'String','');
set(handles.SMAlags,'String','');

set(handles.ARCoeff,'String','');
set(handles.MACoeff,'String','');

set(handles.Const,'String','');
set(handles.Var,'String','');


set(handles.P,'Enable','off');
set(handles.D,'Enable','off');
set(handles.Q,'Enable','off');

set(handles.ARlags,'Enable','off');
set(handles.MAlags,'Enable','off');

set(handles.Season,'Enable','off');
set(handles.SARlags,'Enable','off');
set(handles.SMAlags,'Enable','off');

set(handles.ARCoeff,'Enable','off');
set(handles.MACoeff,'Enable','off');

set(handles.Const,'Enable','off');
set(handles.Var,'Enable','off');

% Choose default command line output for ARIMA_ModelCreation_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ARIMA_ModelCreation_GUI',gcf);
% UIWAIT makes ARIMA_ModelCreation_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_ModelCreation_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Global Variable for ARIMA Models
global NextModel;
global ARIMAModelCell;

% Displaying ARIMA Models Information in Display Box

    clc;

    % Creating File CommandLine_Output to store Netcdf File Details
    diary('CommandLine_Output1')

    diary on;

    ARIMAModelCell{1,NextModel}

    diary off;

    output=fileread('CommandLine_Output1');

    % Displaying File Data to Edit Box 
     set(handles.ARIMAmodelDisplay,'string',output);

     delete('CommandLine_Output1');

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Global Variable for ARIMA Models
global NextModel;
global ARIMAModelCell;

% Getting the Number of User-Defined ARIMA Models

ModelNum=get(handles.ModelNum,'String');
ModelNum=str2double(ModelNum);

% Displaying ARIMA Models Information in Display Box

if (NextModel==ModelNum)
    
    clc;

    % Creating File CommandLine_Output to store Netcdf File Details
    diary('CommandLine_Output1')

    diary on;

    for i=1:ModelNum
    
    ARIMAModelCell{1,i}
    
    end

    diary off;

    output=fileread('CommandLine_Output1');

    % Displaying File Data to Edit Box 
     set(handles.ARIMAmodelDisplay,'string',output);

     delete('CommandLine_Output1');
     
elseif ((NextModel<ModelNum)&&(NextModel>0))
    
    clc;

    % Creating File CommandLine_Output to store Netcdf File Details
    diary('CommandLine_Output1')

    diary on;

    for i=1:NextModel
    
    ARIMAModelCell{1,i}
    
    end

    diary off;

    output=fileread('CommandLine_Output1');

    % Displaying File Data to Edit Box 
     set(handles.ARIMAmodelDisplay,'string',output);

     delete('CommandLine_Output1');    
    
 
end

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get Current GUI WorkSpace Name

ARIMA_ModelCreation_GUI=getappdata(0,'ARIMA_ModelCreation_GUI');

% Get Number of Models

ModelNum=get(handles.ModelNum,'String');
ModelNum=str2double(ModelNum);

% Get All ARIMA Parameter Values

P=get(handles.P,'String');
P=str2double(P);

D=get(handles.D,'String');
D=str2double(D);

Q=get(handles.Q,'String');
Q=str2double(Q);

ARlags=get(handles.ARlags,'String');
ARlags=strread(ARlags,'%f','delimiter',',');
ARlags=ARlags';

MAlags=get(handles.MAlags,'String');
MAlags=strread(MAlags,'%f','delimiter',',');
MAlags=MAlags';


Season=get(handles.Season,'String');
Season=str2double(Season);

SARlags=get(handles.SARlags,'String');
SARlags=strread(SARlags,'%f','delimiter',',');
SARlags=SARlags';

SMAlags=get(handles.SMAlags,'String');
SMAlags=strread(SMAlags,'%f','delimiter',',');
SMAlags=SMAlags';


ARCoeff=get(handles.ARCoeff,'String');
ARCoeff=strread(ARCoeff,'%f','delimiter',',');
ARCoeff=ARCoeff';

MACoeff=get(handles.MACoeff,'String');
MACoeff=strread(MACoeff,'%f','delimiter',',');
MACoeff=MACoeff';

Const=get(handles.Const,'String');
Const=str2double(Const);

Var=get(handles.Var,'String');
Var=str2double(Var);

% Utilising Global Variable for Storing N number of models

global NextModel;

% Create Cell Structure in Global Workspace to hold ARIMA Models

global ARIMAModelCell;

% Incrementing GLobal Variable for Storing New Models

NextModel=NextModel+1;

if (NextModel>ModelNum)
    
   NextModel=1;     
    
end

if (NextModel<=ModelNum)

    if (NextModel==1)

       % Create Cell Structure in Global Workspace to hold ARIMA Models

       %global ARIMAModelCell;

       ARIMAModelCell=cell(1,ModelNum);  


    end

    % Get ARIMA Model Option Number

    ModelOption=getappdata(ARIMA_ModelCreation_GUI,'Model');

    % Switch Case for Creating Desired ARIMA Model

    switch ModelOption

        case 1

            ARIMAModelCell(1,NextModel)= {arima('D',D,'MA',MACoeff,'AR',ARCoeff,'ARLags',ARlags,'Constant',Const,'Variance',Var)};

        case 2

            ARIMAModelCell(1,NextModel)={arima('D',D,'MA',MACoeff,'AR',ARCoeff,'MALags',MAlags,'Constant',Const,'Variance',Var)};        

        case 3

            ARIMAModelCell(1,NextModel)={arima('D',D,'MA',MACoeff,'AR',ARCoeff,'ARLags',ARlags,'MALags',MAlags,'Constant',Const,'Variance',Var)};        

        case 4 

            ARIMAModelCell(1,NextModel)={arima('D',D,'MA',MACoeff,'AR',ARCoeff,'Constant',Const,'Variance',Var)};        

        case 5        

            ARIMAModelCell(1,NextModel)={arima(P,D,Q)};        

        case 6   

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'Constant',Const)};        

        case 7

            ARIMAModelCell(1,NextModel)={arima('D',D,'MALags',MAlags,'Constant',Const)};         

        case 8

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Constant',Const)};   

        case 9

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'Seasonality',Season,'SARLags',SARlags,'Constant',Const)};         

        case 10

            ARIMAModelCell(1,NextModel)={arima('D',D,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'Constant',Const)};        

        case 11

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'Constant',Const)};        

        case 12

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'Seasonality',Season,'SMALags',SMAlags,'Constant',Const)};        

        case 13  

            ARIMAModelCell(1,NextModel)={arima('D',D,'MALags',MAlags,'Seasonality',Season,'SMALags',SMAlags,'Constant',Const)};       

        case 14 

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Seasonality',Season,'SMALags',SMAlags,'Constant',Const)};        

        case 15 

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'Seasonality',Season,'SARLags',SARlags,'SMALags',SMAlags,'Constant',Const)};        

        case 16

            ARIMAModelCell(1,NextModel)={arima('D',D,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'SMALags',SMAlags,'Constant',Const)};         

        case 17

            ARIMAModelCell(1,NextModel)={arima('D',D,'ARLags',ARlags,'MALags',MAlags,'Seasonality',Season,'SARLags',SARlags,'SMALags',SMAlags,'Constant',Const)};         

    end

else
    
   error('Cannot create ARIMA Models more than Model Numbers'); 
    
end


function SMAlags_Callback(hObject, eventdata, handles)
% hObject    handle to SMAlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SMAlags as text
%        str2double(get(hObject,'String')) returns contents of SMAlags as a double


% --- Executes during object creation, after setting all properties.
function SMAlags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SMAlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D_Callback(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D as text
%        str2double(get(hObject,'String')) returns contents of D as a double


% --- Executes during object creation, after setting all properties.
function D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Const_Callback(hObject, eventdata, handles)
% hObject    handle to Const (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Const as text
%        str2double(get(hObject,'String')) returns contents of Const as a double


% --- Executes during object creation, after setting all properties.
function Const_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Const (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MAlags_Callback(hObject, eventdata, handles)
% hObject    handle to MAlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MAlags as text
%        str2double(get(hObject,'String')) returns contents of MAlags as a double


% --- Executes during object creation, after setting all properties.
function MAlags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MAlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ARCoeff_Callback(hObject, eventdata, handles)
% hObject    handle to ARCoeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARCoeff as text
%        str2double(get(hObject,'String')) returns contents of ARCoeff as a double


% --- Executes during object creation, after setting all properties.
function ARCoeff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARCoeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q_Callback(hObject, eventdata, handles)
% hObject    handle to Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q as text
%        str2double(get(hObject,'String')) returns contents of Q as a double


% --- Executes during object creation, after setting all properties.
function Q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MACoeff_Callback(hObject, eventdata, handles)
% hObject    handle to MACoeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MACoeff as text
%        str2double(get(hObject,'String')) returns contents of MACoeff as a double


% --- Executes during object creation, after setting all properties.
function MACoeff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MACoeff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ARlags_Callback(hObject, eventdata, handles)
% hObject    handle to ARlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARlags as text
%        str2double(get(hObject,'String')) returns contents of ARlags as a double


% --- Executes during object creation, after setting all properties.
function ARlags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Var_Callback(hObject, eventdata, handles)
% hObject    handle to Var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Var as text
%        str2double(get(hObject,'String')) returns contents of Var as a double


% --- Executes during object creation, after setting all properties.
function Var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Season_Callback(hObject, eventdata, handles)
% hObject    handle to Season (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Season as text
%        str2double(get(hObject,'String')) returns contents of Season as a double


% --- Executes during object creation, after setting all properties.
function Season_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Season (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SARlags_Callback(hObject, eventdata, handles)
% hObject    handle to SARlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SARlags as text
%        str2double(get(hObject,'String')) returns contents of SARlags as a double


% --- Executes during object creation, after setting all properties.
function SARlags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SARlags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function P_Callback(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of P as text
%        str2double(get(hObject,'String')) returns contents of P as a double


% --- Executes during object creation, after setting all properties.
function P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
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

% Getting Current GUI WorkSpace Name

ARIMA_ModelCreation_GUI=getappdata(0,'ARIMA_ModelCreation_GUI');

% Re-initialize Edit Box Strings

set(handles.P,'String','');
set(handles.D,'String','');
set(handles.Q,'String','');

set(handles.ARlags,'String','');
set(handles.MAlags,'String','');

set(handles.Season,'String','');
set(handles.SARlags,'String','');
set(handles.SMAlags,'String','');

set(handles.ARCoeff,'String','');
set(handles.MACoeff,'String','');

set(handles.Const,'String','');
set(handles.Var,'String','');

% Getting Radio Button Values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');

r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');

% Getting Check Box Values

ch1=get(handles.ch1,'Value');
ch2=get(handles.ch2,'Value');

ch3=get(handles.ch3,'Value');
ch4=get(handles.ch4,'Value');

% Enabling Appropriate Edit Boxes according to Radio Button and Check Box Values

if (r1==1) % Known
    
    if ((ch1==1)&&(ch2==0)) % AR
        
        set(handles.P,'Enable','off');
        set(handles.D,'Enable','on');
        set(handles.Q,'Enable','off');

        set(handles.ARlags,'Enable','on');
        set(handles.MAlags,'Enable','off');

        set(handles.Season,'Enable','off');
        set(handles.SARlags,'Enable','off');
        set(handles.SMAlags,'Enable','off');

        set(handles.ARCoeff,'Enable','on');
        set(handles.MACoeff,'Enable','on');

        set(handles.Const,'Enable','on');
        set(handles.Var,'Enable','on');  
        
        Model=1;
        setappdata(ARIMA_ModelCreation_GUI,'Model',Model);
        
    elseif ((ch1==0)&&(ch2==1)) % MA
        
        set(handles.P,'Enable','off');
        set(handles.D,'Enable','on');
        set(handles.Q,'Enable','off');

        set(handles.ARlags,'Enable','off');
        set(handles.MAlags,'Enable','on');

        set(handles.Season,'Enable','off');
        set(handles.SARlags,'Enable','off');
        set(handles.SMAlags,'Enable','off');

        set(handles.ARCoeff,'Enable','on');
        set(handles.MACoeff,'Enable','on');

        set(handles.Const,'Enable','on');
        set(handles.Var,'Enable','on');         
        
        Model=2;
        setappdata(ARIMA_ModelCreation_GUI,'Model',Model);
        
    elseif ((ch1==1)&&(ch2==1)) % AR+MA
        
        set(handles.P,'Enable','off');
        set(handles.D,'Enable','on');
        set(handles.Q,'Enable','off');

        set(handles.ARlags,'Enable','on');
        set(handles.MAlags,'Enable','on');

        set(handles.Season,'Enable','off');
        set(handles.SARlags,'Enable','off');
        set(handles.SMAlags,'Enable','off');

        set(handles.ARCoeff,'Enable','on');
        set(handles.MACoeff,'Enable','on');

        set(handles.Const,'Enable','on');
        set(handles.Var,'Enable','on');   

        Model=3;
        setappdata(ARIMA_ModelCreation_GUI,'Model',Model);        
        
    elseif ((ch1==0)&&(ch2==0)) % AR+MA
        
        set(handles.P,'Enable','off');
        set(handles.D,'Enable','on');
        set(handles.Q,'Enable','off');

        set(handles.ARlags,'Enable','off');
        set(handles.MAlags,'Enable','off');

        set(handles.Season,'Enable','off');
        set(handles.SARlags,'Enable','off');
        set(handles.SMAlags,'Enable','off');

        set(handles.ARCoeff,'Enable','on');
        set(handles.MACoeff,'Enable','on');

        set(handles.Const,'Enable','on');
        set(handles.Var,'Enable','on');  

        Model=4;
        setappdata(ARIMA_ModelCreation_GUI,'Model',Model);        
        
    end    
  
    
elseif (r2==1) % Unknown
    
    if (r3==1) % PDQ
        
        set(handles.P,'Enable','on');
        set(handles.D,'Enable','on');
        set(handles.Q,'Enable','on');

        set(handles.ARlags,'Enable','off');
        set(handles.MAlags,'Enable','off');

        set(handles.Season,'Enable','off');
        set(handles.SARlags,'Enable','off');
        set(handles.SMAlags,'Enable','off');

        set(handles.ARCoeff,'Enable','off');
        set(handles.MACoeff,'Enable','off');

        set(handles.Const,'Enable','off');
        set(handles.Var,'Enable','off'); 

        Model=5;
        setappdata(ARIMA_ModelCreation_GUI,'Model',Model);        
        
    elseif (r4==1) % Lags
        
        if (r5==1) % Non-Seasonal
            
            if ((ch1==1)&&(ch2==0)) % AR
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','off');

                set(handles.Season,'Enable','off');
                set(handles.SARlags,'Enable','off');
                set(handles.SMAlags,'Enable','off');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off'); 

            Model=6;
            setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
            elseif ((ch1==0)&&(ch2==1)) % MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','off');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','off');
                set(handles.SARlags,'Enable','off');
                set(handles.SMAlags,'Enable','off');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off');                
                
                Model=7;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
                
            elseif ((ch1==1)&&(ch2==1)) % AR+MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','off');
                set(handles.SARlags,'Enable','off');
                set(handles.SMAlags,'Enable','off');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off');                
               
                Model=8;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
                
            end
            
        elseif (r6==1) % Seasonal
            
            if ((ch1==1)&&(ch2==0)&&(ch3==1)&&(ch4==0)) % SAR+AR
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','off');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','on');
                set(handles.SMAlags,'Enable','off');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off');
               
                Model=9;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                  
                
            elseif ((ch1==0)&&(ch2==1)&&(ch3==1)&&(ch4==0)) % SAR+MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','off');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','on');
                set(handles.SMAlags,'Enable','off');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off');                
               
                Model=10;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                  
                
            elseif ((ch1==1)&&(ch2==1)&&(ch3==1)&&(ch4==0)) % SAR+AR+MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','on');
                set(handles.SMAlags,'Enable','off');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off');                
               
                Model=11;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);  
                
            elseif ((ch1==1)&&(ch2==0)&&(ch3==0)&&(ch4==1)) % SMA+AR
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','off');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','off');
                set(handles.SMAlags,'Enable','on');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off'); 
                
                Model=12;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);
                
            elseif ((ch1==0)&&(ch2==1)&&(ch3==0)&&(ch4==1)) % SMA+MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','off');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','off');
                set(handles.SMAlags,'Enable','on');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off'); 
                
                Model=13;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
             elseif ((ch1==1)&&(ch2==1)&&(ch3==0)&&(ch4==1)) % SMA+AR+MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','off');
                set(handles.SMAlags,'Enable','on');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off');   
                
                Model=14;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
             elseif ((ch1==1)&&(ch2==0)&&(ch3==1)&&(ch4==1)) % SAR+SMA+AR
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','off');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','on');
                set(handles.SMAlags,'Enable','on');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off'); 
                
                Model=15;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
             elseif ((ch1==0)&&(ch2==1)&&(ch3==1)&&(ch4==1)) % SAR+SMA+MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','off');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','on');
                set(handles.SMAlags,'Enable','on');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off'); 
                
                Model=16;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
             elseif ((ch1==1)&&(ch2==1)&&(ch3==1)&&(ch4==1)) % SAR+SMA+AR+MA
                
                set(handles.P,'Enable','off');
                set(handles.D,'Enable','on');
                set(handles.Q,'Enable','off');

                set(handles.ARlags,'Enable','on');
                set(handles.MAlags,'Enable','on');

                set(handles.Season,'Enable','on');
                set(handles.SARlags,'Enable','on');
                set(handles.SMAlags,'Enable','on');

                set(handles.ARCoeff,'Enable','off');
                set(handles.MACoeff,'Enable','off');

                set(handles.Const,'Enable','on');
                set(handles.Var,'Enable','off');  
                
                Model=17;
                setappdata(ARIMA_ModelCreation_GUI,'Model',Model);                
                
                
            end            
            
        end
        
    end
    
end

% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Model Simulation App
    
ARIMA_ModelSimulation_GUI;    
    


% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the Global Variables

global NextModel;
global ARIMAModelCell;

NextModel=0;

ARIMAModelCell=cell(1,1); 

% Resetting the GUI

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);

set(handles.r3,'Value',0);
set(handles.r4,'Value',1);

set(handles.r5,'Value',1);
set(handles.r6,'Value',0);


set(handles.ch1,'Value',0);
set(handles.ch2,'Value',0);

set(handles.ch3,'Value',0);
set(handles.ch4,'Value',0);


set(handles.r1,'Enable','on');
set(handles.r2,'Enable','on');

set(handles.r3,'Enable','off');
set(handles.r4,'Enable','off');

set(handles.r5,'Enable','off');
set(handles.r6,'Enable','off');


set(handles.ch1,'Enable','on');
set(handles.ch2,'Enable','on');

set(handles.ch3,'Enable','off');
set(handles.ch4,'Enable','off');


set(handles.ModelNum,'String','');
set(handles.ARIMAmodelDisplay,'String','');


set(handles.P,'String','');
set(handles.D,'String','');
set(handles.Q,'String','');

set(handles.ARlags,'String','');
set(handles.MAlags,'String','');

set(handles.Season,'String','');
set(handles.SARlags,'String','');
set(handles.SMAlags,'String','');

set(handles.ARCoeff,'String','');
set(handles.MACoeff,'String','');

set(handles.Const,'String','');
set(handles.Var,'String','');


set(handles.P,'Enable','off');
set(handles.D,'Enable','off');
set(handles.Q,'Enable','off');

set(handles.ARlags,'Enable','off');
set(handles.MAlags,'Enable','off');

set(handles.Season,'Enable','off');
set(handles.SARlags,'Enable','off');
set(handles.SMAlags,'Enable','off');

set(handles.ARCoeff,'Enable','off');
set(handles.MACoeff,'Enable','off');

set(handles.Const,'Enable','off');
set(handles.Var,'Enable','off');



% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the GUI
close;

% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ARIMA_ModelCreation_GUI=getappdata(0,'ARIMA_ModelCreation_GUI');

% Getting he ARIMA Model Cell Structure Global variable

global ARIMAModelCell;

% Getting Number of ARIMA Models

ModelNum=get(handles.ModelNum,'String');
ModelNum=str2double(ModelNum);

% Setting-Up above two variables in Current GUI WorkSpace

setappdata(ARIMA_ModelCreation_GUI,'ARIMAModelCell1',ARIMAModelCell);

setappdata(ARIMA_ModelCreation_GUI,'ModelNum',ModelNum);

function ARIMAmodelDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to ARIMAmodelDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARIMAmodelDisplay as text
%        str2double(get(hObject,'String')) returns contents of ARIMAmodelDisplay as a double


% --- Executes during object creation, after setting all properties.
function ARIMAmodelDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARIMAmodelDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ModelNum_Callback(hObject, eventdata, handles)
% hObject    handle to ModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ModelNum as text
%        str2double(get(hObject,'String')) returns contents of ModelNum as a double


% --- Executes during object creation, after setting all properties.
function ModelNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel4 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Get Radio Button Values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');

r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');

% Programming GUI Element Behaviour
if (r1==1)
    
    set(handles.r3,'Enable','off');
    set(handles.r4,'Enable','off');

    set(handles.r5,'Enable','off');
    set(handles.r6,'Enable','off');


     set(handles.ch1,'Enable','on');
     set(handles.ch2,'Enable','on');

    set(handles.ch3,'Enable','off');
    set(handles.ch4,'Enable','off');
        
    set(handles.ch3,'Value',0);
    set(handles.ch4,'Value',0);     
    
elseif (r2==1)
    
    set(handles.r3,'Enable','on');
    set(handles.r4,'Enable','on');
    
    if (r3==1)
        
        set(handles.ch1,'Enable','off');
        set(handles.ch2,'Enable','off');

        set(handles.ch3,'Enable','off');
        set(handles.ch4,'Enable','off'); 
        
        set(handles.r5,'Enable','off');
        set(handles.r6,'Enable','off');   
        
        set(handles.ch1,'Value',0);
        set(handles.ch2,'Value',0);    

        set(handles.ch3,'Value',0);
        set(handles.ch4,'Value',0);         
        
    elseif (r4==1)
        
        set(handles.ch1,'Enable','on');
        set(handles.ch2,'Enable','on');
        
        set(handles.r5,'Enable','on');
        set(handles.r6,'Enable','on');          

        if (r5==1)
            
            set(handles.ch3,'Enable','off');
            set(handles.ch4,'Enable','off'); 
            
            set(handles.ch3,'Value',0);
            set(handles.ch4,'Value',0);             
            
        elseif (r6==1)
            
            set(handles.ch3,'Enable','on');
            set(handles.ch4,'Enable','on');             
            
        end
         
        
    end




    
    
end


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Get Radio Button Values
r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');

r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');

% Programming GUI Element Behaviour
if (r3==1)
    
    set(handles.r5,'Enable','off');
    set(handles.r6,'Enable','off');

    set(handles.ch1,'Enable','off');
    set(handles.ch2,'Enable','off');

    set(handles.ch3,'Enable','off');
    set(handles.ch4,'Enable','off'); 
    
    set(handles.ch1,'Value',0);
    set(handles.ch2,'Value',0);    
    
    set(handles.ch3,'Value',0);
    set(handles.ch4,'Value',0);        
    
elseif (r4==1)
    
    set(handles.r5,'Enable','on');
    set(handles.r6,'Enable','on');

    set(handles.ch1,'Enable','on');
    set(handles.ch2,'Enable','on');

    if (r5==1)

        set(handles.ch3,'Enable','off');
        set(handles.ch4,'Enable','off');
        
        set(handles.ch3,'Value',0);
        set(handles.ch4,'Value',0);         

    elseif (r6==1)

        set(handles.ch3,'Enable','on');
        set(handles.ch4,'Enable','on');             

    end    
    
end


% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Get Radio Button Values
r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');

% Programming GUI Element Behaviour
if (r5==1)
    
    set(handles.ch3,'Enable','off');
    set(handles.ch4,'Enable','off');   
    
    set(handles.ch3,'Value',0);
    set(handles.ch4,'Value',0);     
    
elseif (r6==1)
    
    set(handles.ch3,'Enable','on');
    set(handles.ch4,'Enable','on');     
    
end


% --- Executes on button press in b9.
function b9_Callback(hObject, eventdata, handles)
% hObject    handle to b9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Model Estimation App
    
ARIMA_ModelEstimation_GUI;
