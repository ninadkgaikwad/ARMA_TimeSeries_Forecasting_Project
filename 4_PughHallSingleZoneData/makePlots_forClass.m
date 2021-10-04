%Austin Coffman
%example script to plot the mat file data:

%clear interface:
    clear
    close all
    clc
    
%load in data:
    dayStart = '2013-08-26';
    %dayStart = '2013-01-14';
    numDays = '14';    
    dataLoadName = ['pughDataForClass_',dayStart,'_days',numDays,'.mat'];
    dataLoad = load(dataLoadName);
    
%make plots:
    T_s = 1/12; %5 minutes sampling time converted to hours.
    tHour = [0:length(dataLoad.s_out.qHvac)-1]*T_s; %time vector in hours.
    
    %q_{hvac} (hvac system cooling/heating)
    figure;
    plot(tHour,dataLoad.s_out.qHvac,'b');
    xlabel('Time (hours)');
    ylabel('q_{hvac} (kW)');
    xlim([0 tHour(end)]);
    set(gca,'FontSize',12,'FontWeight','Bold');
    
    %\eta_{solar} (solar irradiance)
    figure; 
    plot(tHour,dataLoad.s_out.etaSolar,'b');
    xlabel('Time (hours)');
    ylabel('\eta_{solar} (kW/m^2)');
    xlim([0 tHour(end)]);
    set(gca,'FontSize',12,'FontWeight','Bold');
    
    %Ta (ambient temperature)
    figure;
    plot(tHour,dataLoad.s_out.Ta,'b');
    xlabel('Time (hours)');
    ylabel('Ta (Kelvin)');
    xlim([0 tHour(end)]);
    set(gca,'FontSize',12,'FontWeight','Bold');
    
    %Tz (zone temperature)
    figure; 
    plot(tHour,dataLoad.s_out.Tz,'b');
    xlabel('Time (hours)');
    ylabel('Tz (Kelvin)');
    xlim([0 tHour(end)]);
    set(gca,'FontSize',12,'FontWeight','Bold');
    
    %carbon dioxide:
    figure;
    plot(tHour,dataLoad.s_out.carbonDox,'b');
    xlabel('Time (hours)');
    ylabel('CO_2 (ppm)');
    xlim([0 tHour(end)]);
    set(gca,'FontSize',12,'FontWeight','Bold');
    
    
    
    
    