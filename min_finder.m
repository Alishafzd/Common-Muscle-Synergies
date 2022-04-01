function out=min_finder(data_cell)
for i=1:length(data_cell)
   l(i)=size(data_cell{1,i},2);
end
out=min(l);
    

