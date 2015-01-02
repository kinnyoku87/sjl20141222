package org.agony2d.utils.maxRects
{
	public class BinnedArea extends Rect
	{
		private var mBin:int;
		
		public function BinnedArea(x:int, y:int, w:int, h:int, mBin:int, rotated:Boolean)
		{
			super(w, h);
			this.x = x;
			this.y = y;
			this.mBin = mBin;
			this.rotated = rotated;
		}
	}
}