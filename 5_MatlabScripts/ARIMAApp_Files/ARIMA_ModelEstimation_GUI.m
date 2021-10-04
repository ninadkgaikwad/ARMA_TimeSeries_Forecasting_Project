function varargout = ARIMA_ModelEstimation_GUI(varargin)
% ARIMA_MODELESTIMATION_GUI MATLAB code for ARIMA_ModelEstimation_GUI.fig
%      ARIMA_MODELESTIMATION_GUI, by itself, creates a new ARIMA_MODELESTIMATION_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_MODELESTIMATION_GUI returns the handle to a new ARIMA_MODELESTIMATION_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_MODELESTIMATION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_MODELESTIMATION_GUI.M with the given input arguments.
%
%      ARIMA_MODELESTIMATION_GUI('Property','Value',...) creates a new ARIMA_MODELESTIMATION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_ModelEstimation_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_ModelEstimation_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_ModelEstimation_GUI

% Last Modified by GUIDE v2.5 31-Aug-2016 18:28:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_ModelEstimation_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_ModelEstimation_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_ModelEstimation_GUI is made visible.
function ARIMA_ModelEstimation_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_ModelEstimation_GUI (see VARARGIN)

% Initializing a Global Variable

global NextModel1;
NextModel1=0;

% Intializing the GUI

set(handles.ARIMAModelNum,'String','');
set(handles.ACFlagNum,'String','');
set(handles.PACFlagNum,'String','');
set(handles.BestModelNum,'String','');

set(handles.AIC,'String','');
set(handles.BIC,'String','');

set(handles.CurrentModelNum,'String','');

set(handles.AIC,'Enable','off');
set(handles.BIC,'Enable','off');

set(handles.CurrentModelNum,'Enable','off');

axes(handles.G1);
cla reset;
axes(handles.G2);
cla reset;
axes(handles.G3);
cla reset;
axes(handles.G4);
cla reset;
axes(handles.G5);
cla reset;

% Choose default command line output for ARIMA_ModelEstimation_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ARIMA_ModelEstimation_GUI',gcf);

% UIWAIT makes ARIMA_ModelEstimation_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_ModelEstimation_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ARIMAModelNum_Callback(hObject, eventdata, handles)
% hObject    handle to ARIMAModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARIMAModelNum as text
%        str2double(get(hObject,'String')) returns contents of ARIMAModelNum as a double


% --- Executes during object creation, after setting all properties.
function ARIMAModelNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARIMAModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ACFlagNum_Callback(hObject, eventdata, handles)
% hObject    handle to ACFlagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ACFlagNum as text
%        str2double(get(hObject,'String')) returns contents of ACFlagNum as a double


% --- Executes during object creation, after setting all properties.
function ACFlagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ACFlagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PACFlagNum_Callback(hObject, eventdata, handles)
% hObject    handle to PACFlagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PACFlagNum as text
%        str2double(get(hObject,'String')) returns contents of PACFlagNum as a double


% --- Executes during object creation, after setting all properties.
function PACFlagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PACFlagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AIC_Callback(hObject, eventdata, handles)
% hObject    handle to AIC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AIC as text
%        str2double(get(hObject,'String')) returns contents of AIC as a double


% --- Executes during object creation, after setting all properties.
function AIC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AIC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BIC_Callback(hObject, eventdata, handles)
% hObject    handle to BIC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BIC as text
%        str2double(get(hObject,'String')) returns contents of BIC as a double


% --- Executes during object creation, after setting all properties.
function BIC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BIC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting WorkSpace Names of Current and Previous GUIs

ARIMA_ModelEstimation_GUI=getappdata(0,'ARIMA_ModelEstimation_GUI');

% Getting Estimated ARIMA Mosels

ARIMAmodelEstimate=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstimate');

% Getting Best Model Number

BestModelNum=get(handles.BestModelNum,'String');
BestModelNum=str2double(BestModelNum);

% Selecting the Best Estimated Model and Setting-up in Current GUI Workspace

BestModelEstimate=ARIMAmodelEstimate{1,BestModelNum};

setappdata(ARIMA_ModelEstimation_GUI,'BestModelEstimate',BestModelEstimate);

% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting Global Variable

global NextModel1;
NextModel1=0;

% Resetting the GUI

set(handles.ARIMAModelNum,'String','');
set(handles.ACFlagNum,'String','');
set(handles.PACFlagNum,'String','');
set(handles.BestModelNum,'String','');

set(handles.AIC,'String','');
set(handles.BIC,'String','');

set(handles.CurrentModelNum,'String','');

set(handles.AIC,'Enable','off');
set(handles.BIC,'Enable','off');

set(handles.CurrentModelNum,'Enable','off');

axes(handles.G1);
cla reset;
axes(handles.G2);
cla reset;
axes(handles.G3);
cla reset;
axes(handles.G4);
cla reset;
axes(handles.G5);
cla reset;

% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the GUI
close;

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting WorkSpace Names of Current and Previous GUIs

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

ARIMA_ModelCreation_GUI=getappdata(0,'ARIMA_ModelCreation_GUI');

ARIMA_ModelEstimation_GUI=getappdata(0,'ARIMA_ModelEstimation_GUI');

% Getting Data Series

OriginalSeries=getappdata(ARIMA_ModelIdentification_GUI,'OriginalSeries');

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Getting ARIMA Model Number

ModelNum=getappdata(ARIMA_ModelCreation_GUI,'ModelNum');

% Proramming NEXT Button
global NextModel1;
if NextModel1==ModelNum;
    NextModel1=0;
end 
NextModel1=NextModel1+1;


% Getting the Estimated Models and Allied Values from Current GUI WorkSpace

ARIMAmodelEstimate=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstimate');

ARIMAmodelEstParamCov=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstParamCov');

ARIMAmodellogL=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodellogL');

ARIMAmodelinfo=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelinfo');

ARIMAmodelRes=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelRes');

ARIMAmodelStres=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelStres');

%% Plot: Standardized Residuals Plot

Stres=ARIMAmodelStres{1,NextModel1};

axes(handles.G5);
title('Standardized Residual Plot');
plot(1:length(Stres),Stres);

%% Plot: QQ-Plot

axes(handles.G1);
qqplot(Stres);

%% Plot: Standardized Residual and Standard Normal Plots

x = -max(Stres):.05:max(Stres);
[f,xi] = ksdensity(Stres);
axes(handles.G2);
title('Standardized & Standard Normal Residuals');
plot(xi,f,'k','LineWidth',2);
hold on
plot(x,normpdf(x),'r--','LineWidth',2)
legend('Standardized Residuals','Standard Normal')
hold off

%% Plot: ACF and PACF

axes(handles.G3);
autocorr(Stres);

axes(handles.G4);
parcorr(Stres);

%% Computing and Displaying AIC and BIC Values

logL=ARIMAmodellogL{1,NextModel1};

info=ARIMAmodelinfo{1,NextModel1};

numParam=length(info.X);

numObs=length(OriginalSeries);

[aic,bic] = aicbic(logL,numParam,numObs);

aic=num2str(aic);
bic=num2str(bic);

set(handles.AIC,'String',aic);
set(handles.BIC,'String',bic);

%% Displaying Model Number

CurrentModelNum=num2str(NextModel1);

set(handles.CurrentModelNum,'String',CurrentModelNum);

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting WorkSpace Names of Current and Previous GUIs

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

ARIMA_ModelCreation_GUI=getappdata(0,'ARIMA_ModelCreation_GUI');

ARIMA_ModelEstimation_GUI=getappdata(0,'ARIMA_ModelEstimation_GUI');

% Getting Data Series

OriginalSeries=getappdata(ARIMA_ModelIdentification_GUI,'OriginalSeries');

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Getting ARIMA Model Number

ModelNum=getappdata(ARIMA_ModelCreation_GUI,'ModelNum');

% Programming Previous Button

global NextModel1;
if NextModel1==1
    NextModel1=ModelNum + 1;
end 
NextModel1=NextModel1-1;



% Getting the Estimated Models and Allied Values from Current GUI WorkSpace

ARIMAmodelEstimate=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstimate');

ARIMAmodelEstParamCov=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstParamCov');

ARIMAmodellogL=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodellogL');

ARIMAmodelinfo=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelinfo');

ARIMAmodelRes=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelRes');

ARIMAmodelStres=getappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelStres');

%% Plot: Standardized Residuals Plot

Stres=ARIMAmodelStres{1,NextModel1};

axes(handles.G5);
title('Standardized Residual Plot');
plot(1:length(Stres),Stres);

%% Plot: QQ-Plot

axes(handles.G1);
qqplot(Stres);

%% Plot: Standardized Residual and Standard Normal Plots

x = -max(Stres):.05:max(Stres);
[f,xi] = ksdensity(Stres);
axes(handles.G2);
title('Standardized & Standard Normal Residuals');
plot(xi,f,'k','LineWidth',2);
hold on
plot(x,normpdf(x),'r--','LineWidth',2)
legend('Standardized Residuals','Standard Normal')
hold off

%% Plot: ACF and PACF

axes(handles.G3);
autocorr(Stres);

axes(handles.G4);
parcorr(Stres);

%% Computing and Displaying AIC and BIC Values

logL=ARIMAmodellogL{1,NextModel1};

info=ARIMAmodelinfo{1,NextModel1};

numParam=length(info.X);

numObs=length(OriginalSeries);

[aic,bic] = aicbic(logL,numParam,numObs);

aic=num2str(aic);
bic=num2str(bic);

set(handles.AIC,'String',aic);
set(handles.BIC,'String',bic);

%% Displaying Model Number

CurrentModelNum=num2str(NextModel1);

set(handles.CurrentModelNum,'String',CurrentModelNum);


% --- Executes on button press in b7.
function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening next GUI
ARIMA_ModelForecast_GUI;

% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the WorkSpace Nmaes of Current and Previous GUIs

% ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

ARIMA_ModelCreation_GUI=getappdata(0,'ARIMA_ModelCreation_GUI');

ARIMA_ModelEstimation_GUI=getappdata(0,'ARIMA_ModelEstimation_GUI');

% Getting Data Series

OriginalSeries=getappdata(ARIMA_ModelIdentification_GUI,'OriginalSeries');

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Getting Created ARIMA Models and Total Model Numbers

ARIMAModelCell1=getappdata(ARIMA_ModelCreation_GUI,'ARIMAModelCell1');

ModelNum=getappdata(ARIMA_ModelCreation_GUI,'ModelNum');

% Getting Valus from Current GUI

ARIMAModelNum=get(handles.ARIMAModelNum,'String');
ARIMAModelNum=str2double(ARIMAModelNum);

ARIMAModelNum=ModelNum;

ACFlagNum=get(handles.ACFlagNum,'String');
ACFlagNum=str2double(ACFlagNum);

PACFlagNum=get(handles.PACFlagNum,'String');
PACFlagNum=str2double(PACFlagNum);

% Incrementing a Global Variable

global NextModel1;

NextModel1=0;

NextModel1=NextModel1+1;

% Initializing Cell Structures for Model Estimates and Fitness Check

ARIMAmodelEstimate=cell(1,ARIMAModelNum);

ARIMAmodelEstParamCov=cell(1,ARIMAModelNum);

ARIMAmodellogL=cell(1,ARIMAModelNum);

ARIMAmodelinfo=cell(1,ARIMAModelNum);

ARIMAmodelRes=cell(1,ARIMAModelNum);

ARIMAmodelStres=cell(1,ARIMAModelNum);

% Estimation and Fitness Check of the Created ARIMA Models

for i=1:ARIMAModelNum
    
    % Estimate the ARIMA Models
    
    Model=ARIMAModelCell1{1,i};
    
    [EstModel,EstParamCov,logL,info] = estimate(Model,OriginalSeries);
    
    ARIMAmodelEstimate(1,i)={EstModel};
    
    ARIMAmodelEstParamCov(1,i)={EstParamCov};

    ARIMAmodellogL(1,i)={logL};

    ARIMAmodelinfo(1,i)={info};   
    
    % Computing Residuals
    
    res = infer(EstModel,OriginalSeries);
    
    ARIMAmodelRes(1,i)={res};
    
    % Computing Standardized Residuals
    
    stres = res/sqrt(EstModel.Variance);
    
    ARIMAmodelStres(1,i)={stres};
    
end

% Setting-Up the Estimated Models and Allied Values to Current GUI WorkSpace

setappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstimate',ARIMAmodelEstimate);

setappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelEstParamCov',ARIMAmodelEstParamCov);

setappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodellogL',ARIMAmodellogL);

setappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelinfo',ARIMAmodelinfo);

setappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelRes',ARIMAmodelRes);

setappdata(ARIMA_ModelEstimation_GUI,'ARIMAmodelStres',ARIMAmodelStres);

%% Plot: Standardized Residuals Plot

Stres=ARIMAmodelStres{1,NextModel1};

axes(handles.G5);
title('Standardized Residual Plot');
plot(1:length(Stres),Stres);

%% Plot: QQ-Plot

axes(handles.G1)
qqplot(Stres);

%% Plot: Standardized Residual and Standard Normal Plots

x = -max(Stres):.05:max(Stres);
[f,xi] = ksdensity(Stres);
axes(handles.G2);
title('Standardized & Standard Normal Residuals');
plot(xi,f,'k','LineWidth',2);
hold on
plot(x,normpdf(x),'r--','LineWidth',2)
legend('Standardized Residuals','Standard Normal')
hold off

%% Plot: ACF and PACF

axes(handles.G3);
autocorr(Stres);

axes(handles.G4);
parcorr(Stres);

%% Computing and Displaying AIC and BIC Values

logL=ARIMAmodellogL{1,NextModel1};

info=ARIMAmodelinfo{1,NextModel1};

numParam=length(info.X);

numObs=length(OriginalSeries);

[aic,bic] = aicbic(logL,numParam,numObs);

aic=num2str(aic);
bic=num2str(bic);

set(handles.AIC,'String',aic);
set(handles.BIC,'String',bic);

%% Displaying Model Number

CurrentModelNum=num2str(NextModel1);

set(handles.CurrentModelNum,'String',CurrentModelNum);

%% Open Model Estimate Viewer GUI

ARIMA_ModelEstimateViewer_GUI;


function CurrentModelNum_Callback(hObject, eventdata, handles)
% hObject    handle to CurrentModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CurrentModelNum as text
%        str2double(get(hObject,'String')) returns contents of CurrentModelNum as a double



function BestModelNum_Callback(hObject, eventdata, handles)
% hObject    handle to BestModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BestModelNum as text
%        str2double(get(hObject,'String')) returns contents of BestModelNum as a double


% --- Executes during object creation, after setting all properties.
function BestModelNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BestModelNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
