clear all

data=readtable('Time_Conversion.xlsx');

%%
five_min_data=table2array(data(2:end,1));
fifteen_min_data=table2array(data(2:end,2));
one_hour_data=table2array(data(2:end,3));
two_hour_data=table2array(data(2:end,4));
three_hour_data=table2array(data(2:end,5));

%%
for i=128:(128+360)
    plot_five(i)=five_min_data(i);
    
    if mod(i,3)==0
        plot_fifteen(i)=fifteen_min_data(i/3);
    else
        plot_fifteen(i)=0;
    end
    
    if mod(i,12)==0
        plot_hour(i)=one_hour_data(i/12);
    else
        plot_hour(i)=0;
    end
    
    if mod(i,24)==0
        plot_two_hour(i)=two_hour_data(i/24);
    else
        plot_two_hour(i)=0;
    end
    
    if mod(i,36)==0
        plot_three_hour(i)=three_hour_data(i/36);
    else
        plot_three_hour(i)=0;
    end
    
end

%%
figure(1);
plot(plot_five)
hold on
plot(plot_fifteen,'ro')
plot(plot_hour,'g*')
plot(plot_two_hour,'b.')
plot(plot_three_hour,'k+')
hold off