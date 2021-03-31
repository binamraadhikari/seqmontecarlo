% Monte Carlo Simulation with Non-Chronological Load

%For System given in Section 2.3.2; Calculation of energy indices
%Follow up on 12.6.5
close all; clear all;
%% Initialization
H=0; %Hours of trouble
N=0; %Hours simulated
E=0; %Energy not supplied
for i=1:8760
    P(i)=i/8760 %Dividing the DPLDC to get cum. prob for each duration see section 12.6.2(b)
end

%% MCS
for j=1:342000
    for i=1:5 %No. of generating units
        r1=rand
        if r1<0.01
            flag(i)=0
        else
            flag(i)=40
        end
        C=sum(flag)
        r2=rand
        %check=repmat(r2,1,365)-P
        %pos=find(check<=0)
        %L=(pos(1)/365)*100 %Please check this
        L=64+(160-64)*r2
        if C<L
            H=H+1
            E=E+(L-C)
        end
        N=N+1
        LOLP(j)=H/N
        LOLE(j)=LOLP(j)*8760
        LOEE(j)=E*8760/N
    end
    
end
avg_LOLP=mean(LOLP)
avg_LOLE=mean(LOLE)
avg_LOEE=mean(LOEE)
