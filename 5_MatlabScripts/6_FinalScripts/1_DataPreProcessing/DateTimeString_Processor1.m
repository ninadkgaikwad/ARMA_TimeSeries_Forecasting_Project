function [ DateTimeString_Processor1_OutputCell ] = DateTimeString_Processor1( DateTimeString_Static )

%% Note:

% DD == Day
% MM == Month
% YYYY == Year

% hh == Hours
% mm == Minutes
% ss == Seconds

% AM/am/PM/pm == AM/PM

%% Finding Date-Time Indices

% Computing Day Index

Day1 = strfind(DateTimeString_Static,'DD');

if (length(Day1)==0)
    
    error('Please enter proper Date-Time String');
    
end

Day2 = Day1+1;

Day_Index = [Day1:Day2];

% Computing Month Index

Month1 = strfind(DateTimeString_Static,'MM');

if (length(Month1)==0)
    
    error('Please enter proper Date-Time String');
    
end

Month2 = Month1+1;

Month_Index = [Month1:Month2];

% Computing Year Index

Year1 = strfind(DateTimeString_Static,'YYYY');

if (length(Year1)==0)
    
    error('Please enter proper Date-Time String');
    
end

Year2 = Year1+3;

Year_Index = [Year1:Year2];

% Computing Hours Index

Hours1 = strfind(DateTimeString_Static,'hh');

if (length(Hours1)==0)
    
    error('Please enter proper Date-Time String');
    
end

Hours2 = Hours1+1;

Hours_Index = [Hours1:Hours2];

% Computing Minutes Index

Minutes1 = strfind(DateTimeString_Static,'mm');

if (length(Minutes1)==0)
    
    error('Please enter proper Date-Time String');
    
end

Minutes2 = Minutes1+1;

Minutes_Index = [Minutes1:Minutes2];

% Computing Seconds Index

Seconds1 = strfind(DateTimeString_Static,'ss');

if (length(Seconds1)==0)
    
    error('Please enter proper Date-Time String');
    
end

Seconds2 = Seconds1+1;

Seconds_Index = [Seconds1:Seconds2];

% Computing AM/PM Index

AMPM1 = strfind(DateTimeString_Static,'AM');

if (length(AMPM1)==0)
    
    AMPM_Indicator = 0; 
    
    AMPM_Index = [];
    
else
    
    AMPM_Indicator = 1; 
    
    AMPM2 = AMPM1+1;

    AMPM_Index = [AMPM1:AMPM2];
    
    
end

%% Combining the Outputs into a Single Cell

DateTimeString_Processor1_OutputCell={Day_Index, Month_Index, Year_Index, Hours_Index, Minutes_Index, Seconds_Index, AMPM_Index, AMPM_Indicator};


end

