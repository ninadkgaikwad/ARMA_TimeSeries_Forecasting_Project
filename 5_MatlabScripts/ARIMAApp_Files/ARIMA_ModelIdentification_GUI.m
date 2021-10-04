function varargout = ARIMA_ModelIdentification_GUI(varargin)
% ARIMA_MODELIDENTIFICATION_GUI MATLAB code for ARIMA_ModelIdentification_GUI.fig
%      ARIMA_MODELIDENTIFICATION_GUI, by itself, creates a new ARIMA_MODELIDENTIFICATION_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_MODELIDENTIFICATION_GUI returns the handle to a new ARIMA_MODELIDENTIFICATION_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_MODELIDENTIFICATION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_MODELIDENTIFICATION_GUI.M with the given input arguments.
%
%      ARIMA_MODELIDENTIFICATION_GUI('Property','Value',...) creates a new ARIMA_MODELIDENTIFICATION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_ModelIdentification_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_ModelIdentification_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_ModelIdentification_GUI

% Last Modified by GUIDE v2.5 03-Aug-2016 00:13:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_ModelIdentification_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_ModelIdentification_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_ModelIdentification_GUI is made visible.
function ARIMA_ModelIdentification_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_ModelIdentification_GUI (see VARARGIN)

% Initializing the GUI

set(handles.chSingleLag,'Value',1);
set(handles.chSeasonalLag,'Value',0);


set(handles.SingleLagNum,'String','');
set(handles.SeasonalLagNum,'String','');

set(handles.ACFLagNum,'String','');
set(handles.PACFLagNum,'String','');

set(handles.LBacfLagNum,'String','');
set(handles.LBpacfLagNum,'String','');


set(handles.SingleLagNum,'Enable','on');
set(handles.SeasonalLagNum,'Enable','off');

set(handles.ACFLagNum,'Enable','on');
set(handles.PACFLagNum,'Enable','on');

set(handles.LBacfLagNum,'Enable','on');
set(handles.LBacfResult,'Enable','off');
set(handles.LBpacfLagNum,'Enable','on');
set(handles.LBpacfResult,'Enable','off');

set(handles.DTOResult,'Enable','off');
set(handles.DTLResult,'Enable','off');


axes(handles.G1);
cla reset;
axes(handles.G2);
cla reset;
axes(handles.G3);
cla reset;
axes(handles.G4);
cla reset;

% Choose default command line output for ARIMA_ModelIdentification_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ARIMA_ModelIdentification_GUI',gcf);

% UIWAIT makes ARIMA_ModelIdentification_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_ModelIdentification_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function SingleLagNum_Callback(hObject, eventdata, handles)
% hObject    handle to SingleLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SingleLagNum as text
%        str2double(get(hObject,'String')) returns contents of SingleLagNum as a double


% --- Executes during object creation, after setting all properties.
function SingleLagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SingleLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SeasonalLagNum_Callback(hObject, eventdata, handles)
% hObject    handle to SeasonalLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SeasonalLagNum as text
%        str2double(get(hObject,'String')) returns contents of SeasonalLagNum as a double


% --- Executes during object creation, after setting all properties.
function SeasonalLagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SeasonalLagNum (see GCBO)
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

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting OriginalSeries from Previous GUI

OriginalSeries=getappdata(ARIMA_DataAcquisition_GUI,'OriginalSeries');

OriginalSeriesCurve=OriginalSeries';

OrigLen=length(OriginalSeries);

OrigSeriesLenVector=1:OrigLen;

% Ploting OriginalSeries Curve:

  axes(handles.G1);
  grid on
  hold on 
  title('Original Data Series');
  xlabel('Observation Numbers');
  ylabel('Observation Values');
%   xlim([0 inf]);
%   ylim([0 inf]); 
  %Plot Curve
  plot(OrigSeriesLenVector,OriginalSeriesCurve,'LineWidth',2);  
hold off
  
% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting OriginalSeries from Previous GUI

OriginalSeries=getappdata(ARIMA_DataAcquisition_GUI,'OriginalSeries');

% Getting Lag Operation Options

chSingleLag=get(handles.chSingleLag,'Value');

chSeasonalLag=get(handles.chSeasonalLag,'Value');

% Performing Lag Operations on the Original Series based on Check Box Values

if ((chSingleLag==1)&&(chSeasonalLag==0))
    
    % Getting Lag Operator Parameters
    
    SingleLagNum=get(handles.SingleLagNum,'String');
    SingleLagNum=str2double(SingleLagNum);
    
    % Intializing Lag Operator
    
    D1 = LagOp({1,-1},'Lags',[0,1]);
    
    D=1;
    
    if (SingleLagNum==0)
        
        FilteredSeries=OriginalSeries;
        
    elseif (SingleLagNum>=1)
    
        for i=1:SingleLagNum

          D = D * D1 ; 

        end
    
        % Computing Filtered Series

        FilteredSeries=filter(D,OriginalSeries);
        
    end
    
    
elseif ((chSingleLag==0)&&(chSeasonalLag==1))

    % Getting Lag Operator Parameters    
    
    SeasonalLagNum=get(handles.SeasonalLagNum,'String');
    SeasonalLagNum=str2double(SeasonalLagNum);   
    
    if (SeasonalLagNum==0)
        
        FilteredSeries=OriginalSeries;
        
    elseif (SeasonalLagNum>=1)
    
        % Computing Seasonal Lag Operator

        D2= LagOp({1,-1},'Lags',[0,SeasonalLagNum]);

        % Computing Lag Operator

        D=D2;

        % Computing Filtered Series

        FilteredSeries=filter(D,OriginalSeries);    
        
    end
    
elseif ((chSingleLag==1)&&(chSeasonalLag==1))
    
    % Getting Lag Operator Parameters    
    
    SingleLagNum=get(handles.SingleLagNum,'String');
    SingleLagNum=str2double(SingleLagNum);

    SeasonalLagNum=get(handles.SeasonalLagNum,'String');
    SeasonalLagNum=str2double(SeasonalLagNum); 
    
    % Intializing Lag Operator

    D1 = LagOp({1,-1},'Lags',[0,1]);

    D=1;    
  
    if ((SingleLagNum==0)&&(SeasonalLagNum==0))
        
        FilteredSeries=OriginalSeries;
        
    elseif ((SingleLagNum>=1)&&(SeasonalLagNum==0))
        
        for i=1:SingleLagNum

          D = D * D1 ; 

        end
    
        % Computing Filtered Series

        FilteredSeries=filter(D,OriginalSeries);        
        
    elseif ((SingleLagNum==0)&&(SeasonalLagNum>=1))
        
        % Computing Seasonal Lag Operator

        D2= LagOp({1,-1},'Lags',[0,SeasonalLagNum]);

        % Computing Lag Operator

        D=D2;

        % Computing Filtered Series

        FilteredSeries=filter(D,OriginalSeries);        
        
    elseif ((SingleLagNum>=1)&&(SeasonalLagNum>=1))
        
        for i=1:SingleLagNum

          D = D * D1 ; 

        end

        % Computing Seasonal Lag Operator

        D2= LagOp({1,-1},'Lags',[0,SeasonalLagNum]);

        % Computing Lag Operator

        D= D * D2;   

        % Computing Filtered Series

        FilteredSeries=filter(D,OriginalSeries);        
        
    end  
   
elseif ((chSingleLag==0)&&(chSeasonalLag==0))
    
    FilteredSeries=OriginalSeries;
    
end

% Set up the FilteredSeries in the Current GUI WorkSpace

setappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries',FilteredSeries);

FilSeriesLen=length(FilteredSeries);

FilSeriesLenVector=1:FilSeriesLen;

FilteredSeriesCurve=FilteredSeries';

% Ploting OriginalSeries Curve:

  axes(handles.G2);
  grid on
  hold on 
  title('Lag Operated Data Series');
  xlabel('Observation Numbers');
  ylabel('Observation Values');
%   xlim([0 inf]);
%   ylim([0 inf]); 
  %Plot Curve
  plot(FilSeriesLenVector,FilteredSeriesCurve,'LineWidth',2);  
hold 0ff

% --- Executes on button press in b12.
function b12_Callback(hObject, eventdata, handles)
% hObject    handle to b12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening Next GUI
ARIMA_ModelCreation_GUI;

% --- Executes on button press in b6.
function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the GUI

set(handles.chSingleLag,'Value',1);
set(handles.chSeasonalLag,'Value',0);


set(handles.SingleLagNum,'String','');
set(handles.SeasonalLagNum,'String','');

set(handles.ACFLagNum,'String','');
set(handles.PACFLagNum,'String','');

set(handles.LBacfLagNum,'String','');
set(handles.LBpacfLagNum,'String','');


set(handles.LBacfResult,'String','');
set(handles.LBpacfResult,'String','');

set(handles.DTOResult,'String','');
set(handles.DTLResult,'String','');


set(handles.SingleLagNum,'Enable','on');
set(handles.SeasonalLagNum,'Enable','off');

set(handles.ACFLagNum,'Enable','on');
set(handles.PACFLagNum,'Enable','on');

set(handles.LBacfLagNum,'Enable','on');
set(handles.LBacfResult,'Enable','off');
set(handles.LBpacfLagNum,'Enable','on');
set(handles.LBpacfResult,'Enable','off');

set(handles.DTOResult,'Enable','off');
set(handles.DTLResult,'Enable','off');




axes(handles.G1);
cla reset;
axes(handles.G2);
cla reset;
axes(handles.G3);
cla reset;
axes(handles.G4);
cla reset;

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

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Setting Data Series in Current GUI WorkSpace

OriginalSeries=getappdata(ARIMA_DataAcquisition_GUI,'OriginalSeries');
setappdata(ARIMA_ModelIdentification_GUI,'OriginalSeries',OriginalSeries);

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');
setappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries',FilteredSeries);

function ACFLagNum_Callback(hObject, eventdata, handles)
% hObject    handle to ACFLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ACFLagNum as text
%        str2double(get(hObject,'String')) returns contents of ACFLagNum as a double


% --- Executes during object creation, after setting all properties.
function ACFLagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ACFLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PACFLagNum_Callback(hObject, eventdata, handles)
% hObject    handle to PACFLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PACFLagNum as text
%        str2double(get(hObject,'String')) returns contents of PACFLagNum as a double


% --- Executes during object creation, after setting all properties.
function PACFLagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PACFLagNum (see GCBO)
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

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting FilteredSeries from Previous GUI

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Getting PACFLagNum

PACFLagNum=get(handles.PACFLagNum,'String');
PACFLagNum=str2double(PACFLagNum);

% Ploting OriginalSeries Curve:

  axes(handles.G4);
  grid on
 parcorr(FilteredSeries,PACFLagNum); 

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting FilteredSeries from Previous GUI

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Getting ACFLagNum

ACFLagNum=get(handles.ACFLagNum,'String');
ACFLagNum=str2double(ACFLagNum);

% Ploting OriginalSeries Curve:

  axes(handles.G3);
  grid on
 autocorr(FilteredSeries,ACFLagNum); 


% --- Executes on button press in b8.
function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting OriginalSeries from Previous GUI

OriginalSeries=getappdata(ARIMA_DataAcquisition_GUI,'OriginalSeries');

% Dickey-Fuller Test for Stationarity

DTOResult=adftest(OriginalSeries);

% Displaying Reult of Dicke-Fuller Stationarity Test

DTOResult=num2str(DTOResult);

set(handles.DTOResult,'String',DTOResult);

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LBpacfResult_Callback(hObject, eventdata, handles)
% hObject    handle to LBpacfResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LBpacfResult as text
%        str2double(get(hObject,'String')) returns contents of LBpacfResult as a double


% --- Executes during object creation, after setting all properties.
function LBpacfResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LBpacfResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LBpacfLagNum_Callback(hObject, eventdata, handles)
% hObject    handle to LBpacfLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LBpacfLagNum as text
%        str2double(get(hObject,'String')) returns contents of LBpacfLagNum as a double


% --- Executes during object creation, after setting all properties.
function LBpacfLagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LBpacfLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LBacfResult_Callback(hObject, eventdata, handles)
% hObject    handle to LBacfResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LBacfResult as text
%        str2double(get(hObject,'String')) returns contents of LBacfResult as a double


% --- Executes during object creation, after setting all properties.
function LBacfResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LBacfResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LBacfLagNum_Callback(hObject, eventdata, handles)
% hObject    handle to LBacfLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LBacfLagNum as text
%        str2double(get(hObject,'String')) returns contents of LBacfLagNum as a double


% --- Executes during object creation, after setting all properties.
function LBacfLagNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LBacfLagNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DTLResult_Callback(hObject, eventdata, handles)
% hObject    handle to DTLResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DTLResult as text
%        str2double(get(hObject,'String')) returns contents of DTLResult as a double


% --- Executes during object creation, after setting all properties.
function DTLResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DTLResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DTOResult_Callback(hObject, eventdata, handles)
% hObject    handle to DTOResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DTOResult as text
%        str2double(get(hObject,'String')) returns contents of DTOResult as a double


% --- Executes during object creation, after setting all properties.
function DTOResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DTOResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b9.
function b9_Callback(hObject, eventdata, handles)
% hObject    handle to b9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting OriginalSeries from Previous GUI

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Dickey-Fuller Test for Stationarity

DTLResult=adftest(FilteredSeries);

% Displaying Reult of Dicke-Fuller Stationarity Test

DTLResult=num2str(DTLResult);

set(handles.DTLResult,'String',DTLResult);


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b10.
function b10_Callback(hObject, eventdata, handles)
% hObject    handle to b10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting FilteredSeries from Previous GUI

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Getting ACFLagNum and Lags

ACFLagNum=get(handles.ACFLagNum,'String');
ACFLagNum=str2double(ACFLagNum);

LBacfLagNum=get(handles.LBacfLagNum,'String');
LBacfLagNum=strread(LBacfLagNum,'%f','delimiter',',');
LBacfLagNum=LBacfLagNum';

% Computing ACF
acf = autocorr(FilteredSeries,ACFLagNum);


% Applying Ljung-Box Q-Test for detecting Auto-Correlation

[h,p,Qstat,crit] = lbqtest(acf,'Lags',LBacfLagNum);

% Displaying Ljun-Box Q-Test Result

Hlen=length(h);

% Initializing Hresult String

Hresult='';

for i=1:Hlen
    
   H=num2str(h(1,i));
   
   if (i==1)
   
       Hresult=strcat(Hresult,H);
       
   elseif (i>1)
       
       Hresult=strcat(Hresult,', ',H);
       
   end
       
end

set(handles.LBacfResult,'String',Hresult);


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on button press in b11.
function b11_Callback(hObject, eventdata, handles)
% hObject    handle to b11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getiing Previous and Current GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelIdentification_GUI=getappdata(0,'ARIMA_ModelIdentification_GUI');

% Getting FilteredSeries from Previous GUI

FilteredSeries=getappdata(ARIMA_ModelIdentification_GUI,'FilteredSeries');

% Getting PACFLagNum and Lags

PACFLagNum=get(handles.PACFLagNum,'String');
PACFLagNum=str2double(PACFLagNum);

LBpacfLagNum=get(handles.LBpacfLagNum,'String');
LBpacfLagNum=strread(LBpacfLagNum,'%f','delimiter',',');
LBpacfLagNum=LBpacfLagNum';

% Computing PACF
pacf = parcorr(FilteredSeries,PACFLagNum);

% Applying Ljung-Box Q-Test for detecting Auto-Correlation

[h,p,Qstat,crit] = lbqtest(pacf,'Lags',LBpacfLagNum);

% Displaying Ljun-Box Q-Test Result

Hlen=length(h);

% Initializing Hresult String

Hresult='';

for i=1:Hlen
    
   H=num2str(h(1,i));
   
   if (i==1)
   
       Hresult=strcat(Hresult,H);
       
   elseif (i>1)
       
       Hresult=strcat(Hresult,', ',H);
       
   end
       
end

set(handles.LBpacfResult,'String',Hresult);

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


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% % Programming GUI Element Behaviour based on the Rado Button Valuew
% 
% % Getting Radio Button Values
% r1=get(handles.chSingleLag,'Value');
% r2=get(handles.chSeasonalLag,'Value');
% 
% % Programming GUI Element Behaviour
% if ((r1==1) && (r2==0))
%     
%     set(handles.SingleLagNum,'Enable','on');
%     set(handles.SeasonalLagNum,'Enable','off');    
%     
% elseif ((r1==0) && (r2==1))
%     
%     set(handles.SingleLagNum,'Enable','off');
%     set(handles.SeasonalLagNum,'Enable','on');    
%     
%     
% elseif ((r1==1) && (r2==1))
%     
%     set(handles.SingleLagNum,'Enable','on');
%     set(handles.SeasonalLagNum,'Enable','on');   
%     
% elseif ((r1==0) && (r2==0))
%     
%     set(handles.SingleLagNum,'Enable','off');
%     set(handles.SeasonalLagNum,'Enable','off'); 
%     
%     
% end


% --- Executes on button press in chSingleLag.
function chSingleLag_Callback(hObject, eventdata, handles)
% hObject    handle to chSingleLag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSingleLag

% Get Checkbox Value
r1=get(handles.chSingleLag,'Value');

% Chang Behaviour of GUI Element
if (r1==1)
    
   set(handles.SingleLagNum,'Enable','on'); 
    
elseif (r1==0)
    
   set(handles.SingleLagNum,'Enable','off');    
    
end


% --- Executes on button press in chSeasonalLag.
function chSeasonalLag_Callback(hObject, eventdata, handles)
% hObject    handle to chSeasonalLag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chSeasonalLag

% Get Checkbox Value
r1=get(handles.chSeasonalLag,'Value');

% Chang Behaviour of GUI Element
if (r1==1)
    
   set(handles.SeasonalLagNum,'Enable','on'); 
    
elseif (r1==0)
    
   set(handles.SeasonalLagNum,'Enable','off');    
    
end
