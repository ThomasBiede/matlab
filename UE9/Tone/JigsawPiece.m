classdef JigsawPiece
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        mI
        vX
        vY
        mSubImage
        xCenter
        yCenter
    end
    
    properties (Dependent)
       mMask
    end
    
    methods
        function this = JigsawPiece(mI)
            vPadSize = mod(size(mI)+1, 2);
            mI = padarray(mI, vPadSize, 'post');
            this.mI = mI;
            aXY = bwboundaries(this.mMask, 'noholes');
            vXYc = ceil(size(mI)/2);
            this.vY = aXY{1}(:, 1) - vXYc(1);
            this.vX = aXY{1}(:, 2) - vXYc(2);
        end
        
        function mMask = get.mMask(this)
            mMask = this.mI > 0;
            [vXY, mask] = bwboundaries(mMask, 'noholes');
        end
        
        function this = drawBoundaries(this, xC, yC)
            this.xCenter = xC;
            this.yCenter = yC;
            plot((this.vX + this.xCenter), (this.vY + this.yCenter));
        end
        
        function this = set.mSubImage(this, mS)
            this.mSubImage = mS;
        end
        
        function this = get.mSubImage(this)
            this.mSubImage;
        end
    end
end

