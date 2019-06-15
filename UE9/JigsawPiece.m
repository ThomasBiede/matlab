classdef JigsawPiece
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(GetAccess=public, SetAccess=private)
        mI
    end
    
    properties(Dependent)
        mRed
    end
    
    methods
        function mRed = get.mRed(this)
            mRed = this.mI(:, :, 1);
        end
    end
    
    methods
        function this = JigsawPiece(mI)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            this.mI = mI;
        end
        
        function mG = calcGrayValueImage(this)
            mG = rgb2gray(this.mI);
        end
    end
end

