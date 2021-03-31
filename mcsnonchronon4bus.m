close all; clear all;

%% Assumptions Made

lambda=[1   1   1   4   4   4   4   4   1]
%[     G1   G2  G4  L12 L13 L14 L23 L34  C1] Failures
%per year

r=[99   99  99  1095   1095   1095   1095   1095   1095]
%repairs per year
D=0;
count=0;
for N=1:9000 %No. of years
    TTF=-(1./lambda).*log(rand(1,9))*365*24 %Time to failure in hours
    TTR=-(1./r).*log(rand(1,9))*365*24 %Time to repair in hours
    fail=find(min(TTF)==TTF)
    if min(TTF)<8760
        if fail~=9
            val=opfohmygod(fail)
            if isempty(val)==1
                load_2=0
                load_3=0
            else
                load_2=val(2)+val(5)-val(6)
                load_3=val(6)+val(7)+val(8)
            end
            if (load_2+load_3)<2.1787
                D=D+1

            end
        else
            D=D+1
            count=count+1
        end
    end    
    LOLP(N)=D/N
    LOLE(N)=LOLP(N)*365
end
    
