clc; clear; close all;
%% Longitudinal
CD=csvread('ALLCDalpha.csv',1,0);
CL=csvread('ALLCLalpha.csv',1,0);
Cm=csvread('ALLCmalpha.csv',1,0);
alpha=CL(1:47,1);
delev=[-10 -5 0 5 10];
CLdatum=CL(1:47,2);
CDdatum=CD(1:47,2);
Cmdatum=Cm(1:47,2);
dCLn10=CL(1:47,5)-CLdatum;
dCLn5=CL(1:47,8)-CLdatum;
dCL0=CL(1:47,2)-CLdatum;
dCLp5=CL(1:47,11)-CLdatum;
dCLp10=CL(1:47,14)-CLdatum;
dCDn10=CD(1:47,5)-CDdatum;
dCDn5=CD(1:47,8)-CDdatum;
dCD0=CD(1:47,2)-CDdatum;
dCDp5=CD(1:47,11)-CDdatum;
dCDp10=CD(1:47,14)-CDdatum;
dCmn10=Cm(1:47,5)-Cmdatum;
dCmn5=Cm(1:47,8)-Cmdatum;
dCm0=Cm(1:47,2)-Cmdatum;
dCmp5=Cm(1:47,11)-Cmdatum;
dCmp10=Cm(1:47,14)-Cmdatum;
dCLelev=[dCLn10 dCLn5 dCL0 dCLp5 dCLp10];
dCDelev=[dCDn10 dCDn5 dCD0 dCDp5 dCDp10];
dCmelev=[dCmn10 dCmn5 dCm0 dCmp5 dCmp10];
%% Lateral - Directional
CY=csvread('CY_datum.csv',1,0);
Croll=csvread('Cl_datum.csv',1,0);
Cn=csvread('Cn_datum.csv',1,0);
CYaileronfirst=csvread('CY_aileron.csv',1,0);
Crollaileronfirst=csvread('Cl_aileron.csv',1,0);
Cnaileronfirst=csvread('Cn_aileron.csv',1,0);
CYrudderfirst=csvread('CY_rudder.csv',1,0);
Crollrudderfirst=csvread('Cl_rudder.csv',1,0);
Cnrudderfirst=csvread('Cn_rudder.csv',1,0);
CYrudder=csvread('CY_rudder.csv',1,0);
Crollrudder=csvread('Cl_rudder.csv',1,0);
Cnrudder=csvread('Cn_rudder.csv',1,0);
beta=[-5 -4.5 -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5];
% adjusting the data coefficientes
alphalatrud=CY(:,1); % It is going to be the same for the rudder.
j=0;
for i=-3.5:0.5:9.5;
    j=j+1;
    alphaaileron(j,1)=i;
end
j=0;
for i=29:-3:2;
    j=j+1;
    CY_datum(:,j)=CY(:,i);
    Croll_datum(:,j)=Croll(:,i);
    Cn_datum(:,j)=Cn(:,i);
end
for i=32:3:62;
    j=j+1;
    CY_datum(:,j)=CY(:,i);
    Croll_datum(:,j)=Croll(:,i);
    Cn_datum(:,j)=Cn(:,i);
end
j=0;
for i=2:3:14;
    j=j+1;
    CYaileron(:,j)=CYaileronfirst(:,i);
    Crollaileron(:,j)=Crollaileronfirst(:,i);
    Cnaileron(:,j)=Cnaileronfirst(:,i);
    CY_rudder(:,j)=CYrudderfirst(:,i);
    Croll_rudder(:,j)=Crollrudderfirst(:,i);
    Cn_rudder(:,j)=Cnrudderfirst(:,i);
end
% Adjusting for the right alpha aileron
CY_aileron(:,1)=CYaileron(1:27,1);
CY_aileron(:,2)=CYaileron(4:30,2);
CY_aileron(:,3)=CYaileron(6:32,3);
CY_aileron(:,4)=CYaileron(4:30,4);
CY_aileron(:,5)=CYaileron(1:27,5);
Croll_aileron(:,1)=Crollaileron(1:27,1);
Croll_aileron(:,2)=Crollaileron(4:30,2);
Croll_aileron(:,3)=Crollaileron(6:32,3);
Croll_aileron(:,4)=Crollaileron(4:30,4);
Croll_aileron(:,5)=Crollaileron(1:27,5);
Cn_aileron(:,1)=Cnaileron(1:27,1);
Cn_aileron(:,2)=Cnaileron(4:30,2);
Cn_aileron(:,3)=Cnaileron(6:32,3);
Cn_aileron(:,4)=Cnaileron(4:30,4);
Cn_aileron(:,5)=Cnaileron(1:27,5);
% Now we are going to separate in increments.
for j=1:5;
    dCY_aileron(:,j)=CY_aileron(:,j)-CY_datum(6:32,11);
    dCroll_aileron(:,j)=Croll_aileron(:,j)-Croll_datum(6:32,11);
    dCn_aileron(:,j)=Cn_aileron(:,j)-Cn_datum(6:32,11);
    dCY_rudder(:,j)=CY_rudder(:,j)-CY_datum(:,11);
    dCroll_rudder(:,j)=Croll_rudder(:,j)-Croll_datum(:,11);
    dCn_rudder(:,j)=Cn_rudder(:,j)-Cn_datum(:,11);
end
aileron=[-10 -5 0 5 10];
rudder=[-10 -5 0 5 10];