function [lst] = readList( fn )
fid = fopen(fn);
i = 1;
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    
    idx  = find(tline==' ');
    if(isempty(idx))
        lst{i} = tline;
    else
        lst{2*i-1} = tline(1:idx-1);
        lst{2*i}   = tline(idx+1:end);
    end
 
    i = i+1;
end

fclose(fid);
