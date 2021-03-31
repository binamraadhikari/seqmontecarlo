% Monte Carlo Simulation with Non-Chronological Load

%For System given in Section 2.3.2

%% Initialization
D=0;
N=0;
for i=1:8760
    P(i)=i/8760 %Dividing the DPLDC to get cum. prob for each duration see section 12.6.2(b)
end

lambda=[1   1   1   2]
%[     G1   G2  G4  C1] Failures
%per year

r=[99   99  99   1095]
%repairs per year
%% MCS
for j=1:342000
    for i=1:5 %No. of generating units
        r1=rand
        if r1<0.01
            flag(i)=0
        else
            flag(i)=40
        end
    end
    C=sum(flag)
    r2=rand
    
    L=64+(160-64)*r2
    if C<L
        D=D+1
    end
    N=N+1
    LOLP(j)=D/N
    LOLE(j)=LOLP(j)*365
end
    
end
avg_LOLP=mean(LOLP)
avg_LOLE=mean(LOLE)
