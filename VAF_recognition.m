function [VAF,i]=VAF_recognition(data,W,S,E)
i=0;
VAF_global=vaf1(E,data,2);
VAF_local=vaf1(E,data,1);
min_VAF_local=min(VAF_local);
r2_local=vaf1(E,data,3);
min_r2_local=min(r2_local);
if VAF_global>0.95 && (min_VAF_local>0.85 || min_r2_local>0.6)
   VAF = size(W,2);
   i=1;
else 
    VAF=NaN;
end