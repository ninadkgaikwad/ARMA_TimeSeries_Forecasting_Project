%% Pre-Processing 1

%% Reading the Diamond Solar Excel

% CsvData_Table = readtable('Diamond_Solar_data.csv');
% 
% CsvData_Cell = table2cell(CsvData_Table);

[~ ,~,DataFile]=xlsread('Diamond_Solar_data.xlsx',1);

[R,C]=size(DataFile); % Getting Size of CsvData_Cell

%% Reformatting the Date-Time

for i=1:R
    
   DateTime= DataFile{i,2};
   
%    DateTime.Year=DateTime.Year+2000; % For getting year as 2016-2018
   
   DateTime_New=datetime(DateTime,'Format','MM-dd-yyyy'' ''HH:mm:ss');
    
   DataFile{i,2}=datestr(DateTime_New,'mm/dd/yyyy HH:MM:ss');
   
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

%% Getting Tables from Arrays

% DiamondSolar_300_T=array2table(DiamondSolar_300);
% DiamondSolar_304_T=array2table(DiamondSolar_304);
% DiamondSolar_306_T=array2table(DiamondSolar_306);

%% Saving Rearranged Data as Excel Files

 xlswrite('DiamondSolar_300.xlsx',DiamondSolar_300);
 xlswrite('DiamondSolar_304.xlsx',DiamondSolar_304);
 xlswrite('DiamondSolar_306.xlsx',DiamondSolar_306);

%  writetable(DiamondSolar_300_T,'DiamondSolar_300.csv','Delimiter',',','QuoteStrings',true);
%  writetable(DiamondSolar_304_T,'DiamondSolar_304.csv','Delimiter',',','QuoteStrings',true);
%  writetable(DiamondSolar_306_T,'DiamondSolar_306.csv','Delimiter',',','QuoteStrings',true);