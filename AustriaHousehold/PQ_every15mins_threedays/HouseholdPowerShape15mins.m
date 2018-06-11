clear all;
load('F:\Kevin硕士科研\2.代码\openDSS\IEEE 13 nodes Harmonics\LVTestCase\AustriaHousehold\ADRES_Daten_120208.mat');
npts=3600*24*3;  % three days
len = 3600*24;  % length of movement
Interval=60*15;  %60 seconds
%  Power is in W or Var
for i=1:5
    for j=1:size(Data.PQ,2)/6
        PQmin_threedays=[];
        for k=1:6
            temp=reshape(Data.PQ(len*(i-1)+[1:npts],6*(j-1)+k),Interval,npts/Interval);
            PQmin_threedays(:,k) = mean(temp)';
        end
        Varname = ['Household_',num2str((i-1)*30+j),'_PQ15mins'];
        com_var = [Varname,'=PQmin_threedays;'];
        eval(com_var);
        filename=strcat('Household_',num2str((i-1)*30+j),'_PQ15mins.mat');
        save(filename,Varname);
    end
end

for i=8:12
    for j=1:size(Data.PQ,2)/6
        PQmin_threedays=[];
        for k=1:6
            temp=reshape(Data.PQ(len*(i-1)+[1:npts],6*(j-1)+k),Interval,npts/Interval);
            PQmin_threedays(:,k) = mean(temp)';
        end
        Varname = ['Household_',num2str((i-3)*30+j),'_PQ15mins'];
        com_var = [Varname,'=PQmin_threedays;'];
        eval(com_var);
        filename=strcat('Household_',num2str((i-3)*30+j),'_PQ15mins.mat');
        save(filename,Varname);
    end
end

% % in winter 
% for j=1:30
%     figure()
%     plot([1:604800]/(3600*24),sum(Data.PQ(1:604800,(j-1)*6+[1 3 5]),2))
%     title(strcat('Household',num2str(j),'Active power'));
%     figure()
%     plot([1:604800]/(3600*24),sum(Data.PQ(1:604800,(j-1)*6+[2 4 6]),2))
%     title(strcat('Household',num2str(j),'Reactive power'));
% end
% % in summer
% for j=1:10
%     figure()
%     plot([1:604800]/(3600*24),sum(Data.PQ(604801:end,(j-1)*6+[1 3 5]),2))
%     title(strcat('Household',num2str(j),'Active power'));
%     figure()
%     plot([1:604800]/(3600*24),sum(Data.PQ(604801:end,(j-1)*6+[2 4 6]),2))
%     title(strcat('Household',num2str(j),'Reactive power'));
% end