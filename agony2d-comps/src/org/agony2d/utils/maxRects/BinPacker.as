package org.agony2d.utils.maxRects
{
	public class BinPacker extends BinPackerBase
	{
		public function BinPacker(width:int, height:int)
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
			
			//pack
			mPacks.push(new Rect(mBinWidth, mBinHeight));
			fill(0, allowRotation);
			
			if(mNumPacked < mRects.length)
			{
				throw new Error("Bin size is too small to fit all rectangles.");
			}
			
			var result:Vector.<BinnedArea> = new Vector.<BinnedArea>(rects.length);
			for(i = 0; i < mPacks.length; i++)
			{
				if(mPacks[i].order < 0) continue;
				result[mPacks[i].order] = new BinnedArea(mPacks[i].x, mPacks[i].y, mPacks[i].w, mPacks[i].h, 0, mPacks[i].rotated);
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
	}
}