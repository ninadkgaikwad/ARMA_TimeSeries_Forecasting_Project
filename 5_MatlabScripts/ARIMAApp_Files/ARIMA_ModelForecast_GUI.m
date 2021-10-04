function varargout = ARIMA_ModelForecast_GUI(varargin)
% ARIMA_MODELFORECAST_GUI MATLAB code for ARIMA_ModelForecast_GUI.fig
%      ARIMA_MODELFORECAST_GUI, by itself, creates a new ARIMA_MODELFORECAST_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_MODELFORECAST_GUI returns the handle to a new ARIMA_MODELFORECAST_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_MODELFORECAST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_MODELFORECAST_GUI.M with the given input arguments.
%
%      ARIMA_MODELFORECAST_GUI('Property','Value',...) creates a new ARIMA_MODELFORECAST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_ModelForecast_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_ModelForecast_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_ModelForecast_GUI

% Last Modified by GUIDE v2.5 03-Aug-2016 04:08:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_ModelForecast_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_ModelForecast_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_ModelForecast_GUI is made visible.
function ARIMA_ModelForecast_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_ModelForecast_GUI (see VARARGIN)

% Initializing the GUI

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);

set(handles.ForecastObsNum1,'String','');

set(handles.Res,'String','');
set(handles.StartYear,'String','');
set(handles.EndYear,'String','');
set(handles.StartTime,'String','');
set(handles.EndTime,'String','');

set(handles.StartMonth,'Value',1);
set(handles.EndMonth,'Value',12);
set(handles.StartDay,'Value',1);
set(handles.EndDay,'Value',31);

set(handles.ForecastObsNum1,'Enable','on');

set(handles.Res,'Enable','off');
set(handles.StartYear,'Enable','off');
set(handles.EndYear,'Enable','off');
set(handles.StartTime,'Enable','off');
set(handles.EndTime,'Enable','off');

set(handles.StartMonth,'Enable','off');
set(handles.EndMonth,'Enable','off');
set(handles.StartDay,'Enable','off');
set(handles.EndDay,'Enable','off');

axes(handles.G1);
cla reset;

% Choose default command line output for ARIMA_ModelForecast_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ARIMA_ModelForecast_GUI',gcf);

% UIWAIT makes ARIMA_ModelForecast_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_ModelForecast_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b1.
function b1_Callback(~, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting the Current and Previous GUIs WorkSpace Names

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

ARIMA_ModelEstimation_GUI=getappdata(0,'ARIMA_ModelEstimation_GUI');

ARIMA_ModelForecast_GUI=getappdata(0,'ARIMA_ModelForecast_GUI');

% Getting Original Data Series

OriginalSeries=getappdata(ARIMA_DataAcquisition_GUI,'OriginalSeries');

LenOriginalSeries=length(OriginalSeries);
% Get the Best Estimated ARIMA Model

BestModelEstimate=getappdata(ARIMA_ModelEstimation_GUI,'BestModelEstimate');

% Get the Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

% Forecsting in accordance with the Radio Button Values

if (r1==1) % Data Without Date-Time
    
    %% Getting Number of Forecast Observations
    
    ForecastObsNum1=get(handles.ForecastObsNum1,'String');
    ForecastObsNum1=str2double(ForecastObsNum1);
    
    ForecastPoints=ForecastObsNum1;
    
    %% Forecasting Time Series ARIMA

    [ForecastSeries,yMSE] = forecast(BestModelEstimate,ForecastPoints,'Y0',OriginalSeries);
    upper = ForecastSeries + 1.96*sqrt(yMSE);
    lower = ForecastSeries - 1.96*sqrt(yMSE);
    
    %% Plotting Forecasted Series

    axes(G1);
    plot(OriginalSeries,'Color',[.75,.75,.75]);
    hold on
    h1 = plot(LenOriginalSeries+1:LenOriginalSeries+60,ForecastSeries,'r','LineWidth',2);
    h2 = plot(LenOriginalSeries+1:LenOriginalSeries+60,upper,'k--','LineWidth',1.5);
    plot(T+1:T+60,lower,'k--','LineWidth',1.5)
    xlim([0,T+60])
    title('Forecast and 95% Forecast Interval')
    legend([h1,h2],'Forecast','95% Interval','Location','NorthWest')
    hold off 
    
    ForecastFile=ForecastSeries;

elseif (r2==1) % Data With Date-Time
    
    %% Getting Number of Forecast Observations
    
    % Getting Forecast Period Information
    
    Res=get(handles.Res,'String');
    Res=str2double(Res);
    
    StartYear=get(handles.StartYear,'String');
    StartYear=str2double(StartYear);
    
    EndYear=get(handles.EndYear,'String');
    EndYear=str2double(EndYear);
    
    StartMonth=get(handles.StartMonth,'Value');
    
    EndMonth=get(handles.EndMonth,'Value');
    
    StartDay=get(handles.StartDay,'Value');
    
    EndDay=get(handles.EndDay,'Value');    
    
    StartTime=get(handles.StartTime,'String');
    StartTime=str2double(StartTime);
    
    EndTime=get(handles.EndTime,'String');
    EndTime=str2double(EndTime);    
    
    
    % Computing Rows And Columns for the Processed Data File using Pre-defined Function

    [ Rows,Cols,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,1,4 );

    % Initializing Processed Data File to zeros

    ProcessedData=zeros(Rows,Cols);

    %% Putting Data into CORRECT ROWS & COLUMNS from Raw Data File to the Pre-Initialized Processed Data file

    % Creating Date Time (Decimal Solar Time) Matrix for the given number of Days using Pre-Defined Function

    [ DateTimeMatrix,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,1 );

    ProcessedData(:,1:4)=DateTimeMatrix(:,1:4);
    
    [ OriginalSeries1,StartIndex,EndIndex ] = DateTimeSeriesSlicer(ProcessedData,1,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);
    
    ForecastVector=StartIndex:EndIndex;
    
    ForecastObsNum2=length(ForecastVector);
    
    ForecastPoints=ForecastObsNum2;
    
    %% Forecasting Time Series ARIMA

    [ForecastSeries,yMSE] = forecast(BestModelEstimate,ForecastPoints,'Y0',OriginalSeries);
    upper = ForecastSeries + 1.96*sqrt(yMSE);
    lower = ForecastSeries - 1.96*sqrt(yMSE);
    
    lenForecastSeries=length(ForecastSeries);
    
    %% Plotting Forecasted Series

    axes(handles.G1);
    plot(OriginalSeries,'Color',[.75,.75,.75]);
    hold on
    h1 = plot(LenOriginalSeries+1:LenOriginalSeries+lenForecastSeries,ForecastSeries,'r','LineWidth',2);
   % h2 = plot(LenOriginalSeries+1:LenOriginalSeries+lenForecastSeries,upper,'k--','LineWidth',1.5);
   % plot(LenOriginalSeries+1:LenOriginalSeries+lenForecastSeries,lower,'k--','LineWidth',1.5)
    xlim([0,LenOriginalSeries+lenForecastSeries])
    title('Forecast and 95% Forecast Interval')
%     legend([h1,h2],'Forecast','95% Interval','Location','NorthWest')
    hold off     
    
    ProcessedData(StartIndex:EndIndex,5)=ForecastSeries;
    
    ForecastFile=ProcessedData;
    
end

% Setting-Up Forecasted Series in the Current GUI WorkSpace

setappdata(ARIMA_ModelForecast_GUI,'ForecastFile',ForecastFile);

function ForecastObsNum1_Callback(hObject, eventdata, handles)
% hObject    handle to Foreca1stObsNum1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ForecastObsNum1 as text
%        str2double(get(hObject,'String')) returns contents of ForecastObsNum1 as a double


% --- Executes during object creation, after setting all properties.
function ForecastObsNum1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ForecastObsNum1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Res_Callback(hObject, eventdata, handles)
% hObject    handle to Res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Res as text
%        str2double(get(hObject,'String')) returns contents of Res as a double


% --- Executes during object creation, after setting all properties.
function Res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndYear_Callback(hObject, eventdata, handles)
% hObject    handle to EndYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndYear as text
%        str2double(get(hObject,'String')) returns contents of EndYear as a double


% --- Executes during object creation, after setting all properties.
function EndYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StartYear_Callback(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartYear as text
%        str2double(get(hObject,'String')) returns contents of StartYear as a double


% --- Executes during object creation, after setting all properties.
function StartYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in StartMonth.
function StartMonth_Callback(hObject, eventdata, handles)
% hObject    handle to StartMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns StartMonth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from StartMonth


% --- Executes during object creation, after setting all properties.
function StartMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EndMonth.
function EndMonth_Callback(hObject, eventdata, handles)
% hObject    handle to EndMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EndMonth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EndMonth


% --- Executes during object creation, after setting all properties.
function EndMonth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndMonth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in StartDay.
function StartDay_Callback(hObject, eventdata, handles)
% hObject    handle to StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns StartDay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from StartDay


% --- Executes during object creation, after setting all properties.
function StartDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EndDay.
function EndDay_Callback(hObject, eventdata, handles)
% hObject    handle to EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EndDay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EndDay


% --- Executes during object creation, after setting all properties.
function EndDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndTime_Callback(hObject, eventdata, handles)
% hObject    handle to EndTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndTime as text
%        str2double(get(hObject,'String')) returns contents of EndTime as a double


% --- Executes during object creation, after setting all properties.
function EndTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StartTime_Callback(hObject, eventdata, handles)
% hObject    handle to StartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartTime as text
%        str2double(get(hObject,'String')) returns contents of StartTime as a double


% --- Executes during object creation, after setting all properties.
function StartTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace Name

ARIMA_ModelForecast_GUI=getappdata(0,'ARIMA_ModelForecast_GUI');

% Getting Forecast File from the Current GUI WorkSpace

ForecastFile=getappdata(ARIMA_ModelForecast_GUI,'ForecastFile');

% Getting Radio button values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');


% Creating Excel Files of the Forecasted Values

if (r1==1)
    
    HorizontalExcelIntraDay={'Forecasted Series'};
    
elseif (r2==1)
    
    HorizontalExcelIntraDay={'Day','Month','Year','Time','Forecasted Series'};
    
end

filename = 'ARIMA_Forecasted_Series.xlsx';

sheet = 1;

xlRange = 'A1';

xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange); 

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ForecastFile,sheet,xlRange); 

% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Resetting the GUI

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);

set(handles.ForecastObsNum1,'String','');

set(handles.Res,'String','');
set(handles.StartYear,'String','');
set(handles.EndYear,'String','');
set(handles.StartTime,'String','');
set(handles.EndTime,'String','');

set(handles.StartMonth,'Value',1);
set(handles.EndMonth,'Value',12);
set(handles.StartDay,'Value',1);
set(handles.EndDay,'Value',31);

set(handles.ForecastObsNum1,'Enable','on');

set(handles.Res,'Enable','off');
set(handles.StartYear,'Enable','off');
set(handles.EndYear,'Enable','off');
set(handles.StartTime,'Enable','off');
set(handles.EndTime,'Enable','off');

set(handles.StartMonth,'Enable','off');
set(handles.EndMonth,'Enable','off');
set(handles.StartDay,'Enable','off');
set(handles.EndDay,'Enable','off');

axes(handles.G1);
cla reset;

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the GUI
close;

% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Opening the next GUI
ARIMA_DataAcquisition_GUI;


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');

% Programming Behaviour of GUI Elements
if (r1==1)
    
    set(handles.ForecastObsNum1,'Enable','on');

    set(handles.Res,'Enable','off');
    set(handles.StartYear,'Enable','off');
    set(handles.EndYear,'Enable','off');
    set(handles.StartTime,'Enable','off');
    set(handles.EndTime,'Enable','off');

    set(handles.StartMonth,'Enable','off');
    set(handles.EndMonth,'Enable','off');
    set(handles.StartDay,'Enable','off');
    set(handles.EndDay,'Enable','off');    
    
elseif (r2==1)
    
    set(handles.ForecastObsNum1,'Enable','off');

    set(handles.Res,'Enable','on');
    set(handles.StartYear,'Enable','on');
    set(handles.EndYear,'Enable','on');
    set(handles.StartTime,'Enable','on');
    set(handles.EndTime,'Enable','on');

    set(handles.StartMonth,'Enable','on');
    set(handles.EndMonth,'Enable','on');
    set(handles.StartDay,'Enable','on');
    set(handles.EndDay,'Enable','on');    
    
    
end
