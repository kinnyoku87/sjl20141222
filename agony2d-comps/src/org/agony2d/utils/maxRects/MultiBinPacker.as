package org.agony2d.utils.maxRects
{
	public class MultiBinPacker extends BinPackerBase
	{
		private var mBins:Vector.<uint>;
		
		public function MultiBinPacker(width:int, height:int)
		{
			super(width, height);
		}
		
		public function pack(rects:Vector.<Rect>, allowRotation:Boolean):Vector.<BinnedArea>
		{
			clear();
			
			var i:int;
			for(i = 0; i < rects.length; i++)
			{
				if(rects[i].w > mBinWidth || rects[i].h > mBinHeight)
				{
					throw new Error("Bin size is too small to fit all rectangles.");
				}
				mRects.push(new Rect(rects[i].w, rects[i].h, i));
			}
			
			mRects.sort(sortOnArea);
			
			while(mNumPacked < mRects.length)
			{
				i = mPacks.length;
				mPacks.push(new Rect(mBinWidth, mBinHeight));
				mBins.push(i);
				fill(i, allowRotation);
			}
			
			if(mNumPacked < mRects.length)
			{
				throw new Error("Bin size is too small to fit all rectangles.");
			}
			
			var result:Vector.<BinnedArea> = new Vector.<BinnedArea>(rects.length);
			
			for(var j:int = 0; j < mBins.length; j++)
			{
				var lower:int = mBins[j];
				var upper:int = mBins.length > j + 1? mBins[j + 1] : mPacks.length;
				
				for(i = lower; i < upper; i++)
				{
					if(mPacks[i].order < 0) continue;
					result[mPacks[i].order] = new BinnedArea(mPacks[i].x, mPacks[i].y, mPacks[i].w, mPacks[i].h, j, mPacks[i].rotated);
				}
			}
			
			return result;
		}
		
		private function sortOnArea(rect0:Rect, rect1:Rect):int
		{
			if(rect0.area > rect1.area)
			{
				return 1;
			}
			else if(rect0.area == rect1.area)
			{
				return 0;
			}
			else
			{
				return -1;
			}
		}
		
		override public function clear():void
		{
			super.clear();
			mBins = new Vector.<uint>();
		}
	}
}