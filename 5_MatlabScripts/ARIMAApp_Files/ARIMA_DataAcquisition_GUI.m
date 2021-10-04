function varargout = ARIMA_DataAcquisition_GUI(varargin)
% ARIMA_DATAACQUISITION_GUI MATLAB code for ARIMA_DataAcquisition_GUI.fig
%      ARIMA_DATAACQUISITION_GUI, by itself, creates a new ARIMA_DATAACQUISITION_GUI or raises the existing
%      singleton*.
%
%      H = ARIMA_DATAACQUISITION_GUI returns the handle to a new ARIMA_DATAACQUISITION_GUI or the handle to
%      the existing singleton*.
%
%      ARIMA_DATAACQUISITION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARIMA_DATAACQUISITION_GUI.M with the given input arguments.
%
%      ARIMA_DATAACQUISITION_GUI('Property','Value',...) creates a new ARIMA_DATAACQUISITION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ARIMA_DataAcquisition_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ARIMA_DataAcquisition_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ARIMA_DataAcquisition_GUI

% Last Modified by GUIDE v2.5 02-Aug-2016 20:39:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ARIMA_DataAcquisition_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ARIMA_DataAcquisition_GUI_OutputFcn, ...
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


% --- Executes just before ARIMA_DataAcquisition_GUI is made visible.
function ARIMA_DataAcquisition_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ARIMA_DataAcquisition_GUI (see VARARGIN)

% Initializing the GUI

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);

set(handles.Rows,'String','');
set(handles.Columns,'String','');

set(handles.SeriesNum2,'String','');
set(handles.StartIndex,'String','');
set(handles.EndIndex,'String','');
set(handles.SeriesNum3,'String','');
set(handles.Res,'String','');
set(handles.StartYear,'String','');
set(handles.EndYear,'String','');
set(handles.StartTime,'String','');
set(handles.EndTime,'String','');

set(handles.StartMonth,'Value',1);
set(handles.EndMonth,'Value',12);
set(handles.StartDay,'Value',1);
set(handles.EndDay,'Value',31);


set(handles.Rows,'Enable','off');
set(handles.Columns,'Enable','off');

set(handles.SeriesNum2,'Enable','off');
set(handles.StartIndex,'Enable','off');
set(handles.EndIndex,'Enable','off');
set(handles.SeriesNum3,'Enable','off');
set(handles.Res,'Enable','off');
set(handles.StartYear,'Enable','off');
set(handles.EndYear,'Enable','off');
set(handles.StartTime,'Enable','off');
set(handles.EndTime,'Enable','off');

set(handles.StartMonth,'Enable','off');
set(handles.EndMonth,'Enable','off');
set(handles.StartDay,'Enable','off');
set(handles.EndDay,'Enable','off');


% Choose default command line output for ARIMA_DataAcquisition_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'ARIMA_DataAcquisition_GUI',gcf);

% UIWAIT makes ARIMA_DataAcquisition_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ARIMA_DataAcquisition_GUI_OutputFcn(hObject, eventdata, handles) 
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

% Resetting the GUI

set(handles.r1,'Value',1);
set(handles.r2,'Value',0);
set(handles.r3,'Value',0);

set(handles.Rows,'String','');
set(handles.Columns,'String','');

set(handles.SeriesNum2,'String','');
set(handles.StartIndex,'String','');
set(handles.EndIndex,'String','');
set(handles.SeriesNum3,'String','');
set(handles.Res,'String','');
set(handles.StartYear,'String','');
set(handles.EndYear,'String','');
set(handles.StartTime,'String','');
set(handles.EndTime,'String','');

set(handles.StartMonth,'Value',1);
set(handles.EndMonth,'Value',12);
set(handles.StartDay,'Value',1);
set(handles.EndDay,'Value',31);


set(handles.Rows,'Enable','off');
set(handles.Columns,'Enable','off');

set(handles.SeriesNum2,'Enable','off');
set(handles.StartIndex,'Enable','off');
set(handles.EndIndex,'Enable','off');
set(handles.SeriesNum3,'Enable','off');
set(handles.Res,'Enable','off');
set(handles.StartYear,'Enable','off');
set(handles.EndYear,'Enable','off');
set(handles.StartTime,'Enable','off');
set(handles.EndTime,'Enable','off');

set(handles.StartMonth,'Enable','off');
set(handles.EndMonth,'Enable','off');
set(handles.StartDay,'Enable','off');
set(handles.EndDay,'Enable','off');

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Closing the GUI
close;

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current GUI WorkSpace

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

% Selecting and Slicing Desired Data Series from The loaded Data Series Table According to the Radio Button Values

% Getting Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');

% Acting According to Radio Button Values

if (r1==1) % No data series
    
    % Opening Next App
    
    ARIMA_ModelCreation_GUI;
    
elseif (r2==1) % Data Series without DataTime
    
    % Getting Original Data From Current GUI WorkSpace

    OriginalDataSeries=getappdata(ARIMA_DataAcquisition_GUI,'OriginalDataSeries');
    
    % Getting Information on Desired Part of Data Series    
    
    SeriesNum2=get(handles.SeriesNum2,'String');
    SeriesNum2=str2double(SeriesNum2);
    
    StartIndex=get(handles.StartIndex,'String');
    StartIndex=str2double(StartIndex);
    
    EndIndex=get(handles.EndIndex,'String');
    EndIndex=str2double(EndIndex);    
    
    % Slicing the Desired Data Series
    
    OriginalSeries=OriginalDataSeries(StartIndex:EndIndex,SeriesNum2);
    
    % Setting Up OriginalSeries in Current GUI WorkSpace
    
    setappdata(ARIMA_DataAcquisition_GUI,'OriginalSeries',OriginalSeries);
    
elseif (r3==1) % Data Series with DataTime   
    
    % Getting Original Data From Current GUI WorkSpace

    OriginalDataSeries=getappdata(ARIMA_DataAcquisition_GUI,'OriginalDataSeries');
    
    % Getting Information on Desired Part of Data Series    
    
    SeriesNum3=get(handles.SeriesNum3,'String');
    SeriesNum3=str2double(SeriesNum3);
    
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
    
    % Slicing the Desired Data Series using external Function
    
    OriginalSeries=DateTimeSeriesSlicer(OriginalDataSeries,SeriesNum3,Res,StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay,StartTime,EndTime);
    
    % Setting Up OriginalSeries in Current GUI WorkSpace
    
    setappdata(ARIMA_DataAcquisition_GUI,'OriginalSeries',OriginalSeries);
    
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



function SeriesNum3_Callback(hObject, eventdata, handles)
% hObject    handle to SeriesNum3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SeriesNum3 as text
%        str2double(get(hObject,'String')) returns contents of SeriesNum3 as a double


% --- Executes during object creation, after setting all properties.
function SeriesNum3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SeriesNum3 (see GCBO)
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



function SeriesNum2_Callback(hObject, eventdata, handles)
% hObject    handle to SeriesNum2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SeriesNum2 as text
%        str2double(get(hObject,'String')) returns contents of SeriesNum2 as a double


% --- Executes during object creation, after setting all properties.
function SeriesNum2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SeriesNum2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StartIndex_Callback(hObject, eventdata, handles)
% hObject    handle to StartIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartIndex as text
%        str2double(get(hObject,'String')) returns contents of StartIndex as a double


% --- Executes during object creation, after setting all properties.
function StartIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndIndex_Callback(hObject, eventdata, handles)
% hObject    handle to EndIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndIndex as text
%        str2double(get(hObject,'String')) returns contents of EndIndex as a double


% --- Executes during object creation, after setting all properties.
function EndIndex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndIndex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rows_Callback(hObject, eventdata, handles)
% hObject    handle to Rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rows as text
%        str2double(get(hObject,'String')) returns contents of Rows as a double


% --- Executes during object creation, after setting all properties.
function Rows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Columns_Callback(hObject, eventdata, handles)
% hObject    handle to Columns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Columns as text
%        str2double(get(hObject,'String')) returns contents of Columns as a double


% --- Executes during object creation, after setting all properties.
function Columns_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Columns (see GCBO)
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

ARIMA_DataAcquisition_GUI=getappdata(0,'ARIMA_DataAcquisition_GUI');

% Getting Data from Excel File according to Radio Button Values

% Getting Radio Button Values

r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');

% Getting Data Series Excel Files
if (r2==1)

    [filename,pathname]=uigetfile({'*.*'},'Data Series Without DateTime File Selector');
    fullpathname=strcat(pathname, filename);
    OriginalDataSeries=xlsread(fullpathname);
    setappdata(ARIMA_DataAcquisition_GUI,'OriginalDataSeries',OriginalDataSeries);

elseif (r3==1)
    
    [filename,pathname]=uigetfile({'*.*'},'Data Series With DateTime File Selector');
    fullpathname=strcat(pathname, filename);
    OriginalDataSeries=xlsread(fullpathname);
    setappdata(ARIMA_DataAcquisition_GUI,'OriginalDataSeries',OriginalDataSeries);
    
end

% Displaying Size of the Data Table Loaded from Excel

[r,c]=size(OriginalDataSeries);

r=num2str(r);
c=num2str(c);

set(handles.Rows,'String',r);
set(handles.Columns,'String',c);

% --- Executes on button press in b5.
function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');

% Opening Next GUI

if (r1==1)

    ARIMA_ModelCreation_GUI;
    
elseif ((r2==1)||(r3==1))
    
    ARIMA_ModelIdentification_GUI;    
    
end
    




% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% Programming GUI Element Behaviour based on the Rado Button Valuew

% Getting Radio Button Values
r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');

% Programming GUI Element Behaviour
if (r1==1)
    


    set(handles.SeriesNum2,'Enable','off');
    set(handles.StartIndex,'Enable','off');
    set(handles.EndIndex,'Enable','off');

    set(handles.SeriesNum3,'Enable','off');
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
    
    set(handles.SeriesNum2,'Enable','on');
    set(handles.StartIndex,'Enable','on');
    set(handles.EndIndex,'Enable','on');
    
    set(handles.SeriesNum3,'Enable','off');
    set(handles.Res,'Enable','off');
    set(handles.StartYear,'Enable','off');
    set(handles.EndYear,'Enable','off');
    set(handles.StartTime,'Enable','off');
    set(handles.EndTime,'Enable','off');
    set(handles.StartMonth,'Enable','off');
    set(handles.EndMonth,'Enable','off');
    set(handles.StartDay,'Enable','off');
    set(handles.EndDay,'Enable','off');   
    
elseif (r3==1)
    
    set(handles.SeriesNum2,'Enable','off');
    set(handles.StartIndex,'Enable','off');
    set(handles.EndIndex,'Enable','off');
    
    set(handles.SeriesNum3,'Enable','on');
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
    
