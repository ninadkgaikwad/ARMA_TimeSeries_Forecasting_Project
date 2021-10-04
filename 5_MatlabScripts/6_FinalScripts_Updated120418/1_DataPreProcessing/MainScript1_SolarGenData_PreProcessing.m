%% Pre-Processing 1

%% Reading the Diamond Solar Excel

[~ ,~,DataFile]=xlsread('Diamond_Solar_data.xlsx',1);

[R,C]=size(DataFile); % Getting Size of CsvData_Cell

%% Reformatting the Date-Time

for i=1:R
    
   DateTime= DataFile{i,2};
   
%    DateTime.Year=DateTime.Year+2000; % For getting year as 2016-2018
   
   DateTime_New=datetime(DateTime,'Format','MM-dd-yyyy'' ''HH:mm:ss');
    
   DataFile{i,2}=datestr(DateTime_New,'mm/dd/yyyy HH:MM:ss');
   
   i  %% Debugger
   
end

%% Rearranging the Data 

% Initializing
DiamondSolar_300=cell(1,3);
DiamondSolar_304=cell(1,3);
DiamondSolar_306=cell(1,3);

% Rearranging Data

D1=0;
D2=0;
D3=0;

for i=1:R % All the Rows of the Data
    
    if (strcmp(DataFile{i,1},'Diamond300')) % Data belongs to Diamond300
        
        D1=D1+1; % Incrementing Counter
        
        DiamondSolar_300(D1,1:3)=DataFile(i,1:3);
        
    elseif (strcmp(DataFile{i,1},'Diamond304')) % Data belongs to Diamond304
        
        D2=D2+1; % Incrementing Counter
        
        DiamondSolar_304(D2,1:3)=DataFile(i,1:3);
        
    elseif strcmp(DataFile{i,1},'Diamond306') % Data belongs to Diamond306
        
        D3=D3+1; % Incrementing Counter
        
        DiamondSolar_306(D3,1:3)=DataFile(i,1:3);
        
    end
    
end

%% Saving Rearranged Data as Excel Files

 xlswrite('DiamondSolar_300.xlsx',DiamondSolar_300);
 xlswrite('DiamondSolar_304.xlsx',DiamondSolar_304);
 xlswrite('DiamondSolar_306.xlsx',DiamondSolar_306);

%% Cleaning the Solar Generation Data 
% The First and Last Input can be changed to get other files cleaned

[ ProcessedData,FileName1 ] = SolarDataCleaner( DiamondSolar_300,0,5,-1,74,82.32,2,'MM/DD/YYYY hh:mm:ss',[0],0,'DiamondSolar_300');

%% Data Resolution Conversion

% Converting Data to 15 Min

[ ProcessedData1 ] = minToMINDataCoverter( FileName1, 1,5,15,[0],1 );

% Converting Data to 60 Min - Hourly

[ ProcessedData2 ] = minToMINDataCoverter( FileName1, 1,5,60,[0],1 );

% Converting Data to 120 Min - 2 Hourly

[ ProcessedData3 ] = minToMINDataCoverter( FileName1, 1,5,120,[0],1 );

% Converting Data to 180 Min - 3 Hourly

[ ProcessedData4 ] = minToMINDataCoverter( FileName1, 1,5,180,[0],1 );

% Converting Data to Daily Resolution

[ ProcessedData5,FileName2 ] = MINToDayDataCoverter( FileName1,1,5,[0],1 );

% Converting Data to Monthly Resolution

[ ProcessedData6 ] = DayToMonthDataCoverter( FileName2,1,[0],1 );

%% Plotting Data at Different Resolutions

% Sub-Hourly Resolution

OneDay_5min=ProcessedData(1:288,4:5);
OneDay_15min=ProcessedData1(1:96,4:5);

figure(1);
hold on
grid on

plot(OneDay_5min(:,1),OneDay_5min(:,2),'LineWidth',1.5);
plot(OneDay_15min(:,1),OneDay_15min(:,2),'r*:','LineWidth',1.5);

title('Data at Different Sub-Hourly Resolution');
xlabel('Time (Hours)');
ylabel('Power (W)');
legend('5 Min Data','15 Min Data');

hold off

% Hourly Resolution

OneDay_1Hour=ProcessedData2(1:24,4:5);
OneDay_2Hour=ProcessedData3(1:12,4:5);
OneDay_3Hour=ProcessedData4(1:8,4:5);

figure(2);
hold on
grid on

plot(OneDay_1Hour(:,1),OneDay_1Hour(:,2),'LineWidth',1.5);
plot(OneDay_2Hour(:,1),OneDay_2Hour(:,2),'r*:','LineWidth',1.5);
plot(OneDay_3Hour(:,1),OneDay_3Hour(:,2),'go--','LineWidth',1.5);

title('Data at Different Hourly Resolution');
xlabel('Time (Hours)');
ylabel('Power (W)');
legend('1 Hour Data','2 Hour Data','3 Hour Data');

hold off

% Daily Resolution

[R,C]=size(ProcessedData5);

DailyData=ProcessedData5(:,4);
DayIndex=1:R;

figure(3);
hold on
grid on

plot(DayIndex,DailyData(:,1),'LineWidth',1.5);

title('Data at Daily Resolution');
xlabel('Days');
ylabel('Power (W)');

hold off

% Monthly Resolution

[R,C]=size(ProcessedData6);

MonthlyData=ProcessedData6(1:end-1,4);
MonthIndex=1:R-1;

figure(4);
hold on
grid on

plot(MonthIndex,MonthlyData(:,1),'bo--','LineWidth',1.5);

title('Data at Monthly Resolution');
xlabel('Months');
ylabel('Power (W)');

hold off
