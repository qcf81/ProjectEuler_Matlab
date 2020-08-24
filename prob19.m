clc, clear, close
days = 0;
% September,April, June, November with 30days
% January, March, May, July, August, October, December with 31 days
% February with 28 days instead of leap year
for year = 1901:2000
    if (mod(year,4)==0 && mod(year,100)~=0) || mod(year,400)==0
        %Judge leap year
        days = days+30*4+31*7+29;
    else
        days = days+30*4+31*7+28;
    end
end

date = zeros(days,3);
for i = 1:days  %compute the week
    switch mod(i,7)
        case 1
            date(i,2)=2;
        case 2
            date(i,2)=3;
        case 3
            date(i,2)=4;
        case 4
            date(i,2)=5;
        case 5
            date(i,2)=6;
        case 6
            date(i,2)=7;
        case 0
            date(i,2)=1;
    end
end
count = 0;
for year = 1901:2000 %compute the month
    if (mod(year,4)==0 && mod(year,100)~=0) || mod(year,400)==0
        dpm = [31;29;31;30;31;30;31;31;30;31;30;31];
        cumdpm = cumsum(dpm);
        %Judge leap year
        dpy = cumdpm(12);
        for j = count+1:count+dpy
            dayth = j-count;
            if dayth <= cumdpm(1)
                date(j,1) = 1;
                date(j,3) = dayth;
            elseif dayth <= cumdpm(2);
                date(j,1) = 2;
                date(j,3) = dayth-cumdpm(1);
            elseif dayth <= cumdpm(3);
                date(j,1) = 3;
                date(j,3) = dayth-cumdpm(2);
            elseif dayth<= cumdpm(4);
                date(j,1)=4;
                date(j,3)=dayth-cumdpm(3);
            elseif dayth<=cumdpm(5);
                date(j,1)=5;
                date(j,3)=dayth-cumdpm(4);
            elseif dayth<=cumdpm(6);
                date(j,1)=6;
                date(j,3)=dayth-cumdpm(5);
            elseif dayth<=cumdpm(7);
                date(j,1)=7;
                date(j,3)=dayth-cumdpm(6);
            elseif dayth<=cumdpm(8);
                date(j,1)=8;
                date(j,3)=dayth-cumdpm(7);
            elseif dayth<=cumdpm(9);
                date(j,1)=9;
                date(j,3)=dayth-cumdpm(8);
            elseif dayth<=cumdpm(10);
                date(j,1)=10;
                date(j,3)=dayth-cumdpm(9);
            elseif dayth<=cumdpm(11);
                date(j,1)=11;
                date(j,3)=dayth-cumdpm(10);
            elseif dayth<=cumdpm(12);
                date(j,1)=12;
                date(j,3)=dayth-cumdpm(11);
            end
        end
        count = count+dpy;
    else
        dpm = [31;28;31;30;31;30;31;31;30;31;30;31];
        cumdpm = cumsum(dpm);
        %Judge leap year
        dpy = cumdpm(12);
        for j = count+1:count+dpy
            dayth = j-count;
            if dayth <= cumdpm(1)
                date(j,1) = 1;
                date(j,3) = dayth;
            elseif dayth <= cumdpm(2);
                date(j,1) = 2;
                date(j,3) = dayth-cumdpm(1);
            elseif dayth <= cumdpm(3);
                date(j,1) = 3;
                date(j,3) = dayth-cumdpm(2);
            elseif dayth<= cumdpm(4);
                date(j,1)=4;
                date(j,3)=dayth-cumdpm(3);
            elseif dayth<=cumdpm(5);
                date(j,1)=5;
                date(j,3)=dayth-cumdpm(4);
            elseif dayth<=cumdpm(6);
                date(j,1)=6;
                date(j,3)=dayth-cumdpm(5);
            elseif dayth<=cumdpm(7);
                date(j,1)=7;
                date(j,3)=dayth-cumdpm(6);
            elseif dayth<=cumdpm(8);
                date(j,1)=8;
                date(j,3)=dayth-cumdpm(7);
            elseif dayth<=cumdpm(9);
                date(j,1)=9;
                date(j,3)=dayth-cumdpm(8);
            elseif dayth<=cumdpm(10);
                date(j,1)=10;
                date(j,3)=dayth-cumdpm(9);
            elseif dayth<=cumdpm(11);
                date(j,1)=11;
                date(j,3)=dayth-cumdpm(10);
            elseif dayth<=cumdpm(12);
                date(j,1)=12;
                date(j,3)=dayth-cumdpm(11);
            end
        end
        count = count+dpy;
    end
    %     fprintf('year %d contain %d days\n',year,dpy)
end

count2 = 0;
for i = 1:days
    if date(i,3)==1 && date(i,2)==7
        count2 = count2+1;
    end
end
fprintf('There are %d sundays during the twentieth century\n',count2)

     
     
