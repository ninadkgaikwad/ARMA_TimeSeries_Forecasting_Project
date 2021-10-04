function [ Day, Month, Year, Hour, Min, Sec, AMPM, AMPM_Indicator ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, DateTimeString_Cell )

% Getting the Indices and Indicators from the DateTimeString_Processor1_OutputCell

Day_Index = DateTimeString_Processor1_OutputCell{1,1};

Month_Index = DateTimeString_Processor1_OutputCell{1,2};

Year_Index = DateTimeString_Processor1_OutputCell{1,3};

Hours_Index = DateTimeString_Processor1_OutputCell{1,4};

Minutes_Index = DateTimeString_Processor1_OutputCell{1,5};

Seconds_Index = DateTimeString_Processor1_OutputCell{1,6};

AMPM_Index = DateTimeString_Processor1_OutputCell{1,7};

AMPM_Indicator = DateTimeString_Processor1_OutputCell{1,8};

% Getting Actual Date-Time String

Actual_DateTime_String=DateTimeString_Cell{1,1};

% Geting the Date-Time Actual values from the DateTimeString_Cell

Day = Actual_DateTime_String(Day_Index);
Day = str2num(Day);

Month = Actual_DateTime_String(Month_Index);
Month = str2num(Month);

Year = Actual_DateTime_String(Year_Index);
Year = str2num(Year);

Hour = Actual_DateTime_String(Hours_Index);
Hour = str2num(Hour);

Min = Actual_DateTime_String(Minutes_Index);
Min = str2num(Min);

Sec = Actual_DateTime_String(Seconds_Index);
Sec = str2num(Sec);

AMPM = Actual_DateTime_String(AMPM_Index);

end

