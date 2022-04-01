function Out=MinaSize(In,FinalSize)

if isempty(In)
    Out = [];
else
n=size(In,1);
for j=1:FinalSize    
    x= (j-1)*(n-1)/(FinalSize-1)+1;
    intX=floor(x);
    if (x-intX) <= 0.00001
        Out(j,:)= In(intX,:);
    else
    Out(j,:)= In(intX,:) + (x-intX)*(In(intX+1,:)-In(intX,:));
    end
    
end
end

end
    

