classdef Whale < handle
    %WHALE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name = '';
        imagefile = [];
    end
    
    methods
        function this = Whale(name)
            this.name = name;
        end
        
        function addFile(this, filename)
            this.imagefile = [this.imagefile; filename];
        end
        
    end
    
end

