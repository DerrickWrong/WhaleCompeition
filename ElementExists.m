function [ match ] = ElementExists( whalelist, whalekey )
%ELEMENTEXISTS Summary of this function goes here
%   Detailed explanation goes here

for idx = 1 : length(whalelist)
    if(strcmp(whalelist(idx).name, whalekey) == 1)
        match = idx;
        return;
    end
end

match = 0;

end

