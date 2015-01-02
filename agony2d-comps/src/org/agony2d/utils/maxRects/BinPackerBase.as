package org.agony2d.utils.maxRects
{
	public class BinPackerBase
	{
		protected var mBinWidth:int;
		protected var mBinHeight:int;
		
		protected var mNumPacked:int;
		protected var mRects:Vector.<Rect>;
		protected var mPacks:Vector.<Rect>;
		
		
		public function BinPackerBase(width:int, height:int)
		{
			mBinWidth = width;
			mBinHeight = height;
		}
		
		
		public function setSize(width:int, height:int):void
		{
			mBinWidth = width;
			mBinHeight = height;
		}
		
		public function get size():int
		{
			return mBinWidth * mBinHeight;
		}
		
		public function get width():int
		{
			return mBinWidth;
		}
	
		public function get height():int
		{
			return mBinHeight;
		}
		
		//--------------------------------------------------------
		protected function fits(rect1:Rect, rect2:Rect, allowRotation:Boolean):Boolean
		{
			if(rect1.w <= rect2.w && rect1.h <= rect2.h)
			{
				return true;
			}
			else if(allowRotation && rect1.w <= rect2.h && rect1.h <= rect2.w)
			{
				rect1.rotate();
				return true;
			}
			else
			{
				return false;
			}
		}
		
		protected function fill(pack:int, allowRotation:Boolean):void
		{
			if(!packIsValid(pack)) return;
			
			var i:int = pack;
			
			for(var j:int = 0; j < mRects.length; j++)
			{
				if(!mRects[j].packed)
				{
					if(fits(mRects[j], mPacks[i], allowRotation))
					{
						mNumPacked++;
						split(i, j);
						fill(mPacks[i].children[0], allowRotation);
						fill(mPacks[i].children[1], allowRotation);
						return;
					}
				}
			}
		}

		protected function split(pack:int, rect:int):void
		{
			if(!packIsValid(pack)) return;
			if(!rectIsValid(rect)) return;
			
			var i:int = pack;
			var j:int = rect;
			
			var left:Rect = mPacks[i].clone();
			var right:Rect = mPacks[i].clone();
			var bottom:Rect = mPacks[i].clone();
			var top:Rect = mPacks[i].clone();
			
			left.y += mRects[j].h;
			left.w = mRects[j].w;
			left.h -= mRects[j].h;
			right.x += mRects[j].w;
			right.w -= mRects[j].w;
			
			bottom.x += mRects[j].w;
			bottom.h = mRects[j].h;
			bottom.w -= mRects[j].w;
			top.y += mRects[j].h;
			top.h -= mRects[j].h;
			
			var maxLeftRightArea:int = Math.max(left.area, right.area);
			var maxBottomTopArea:int = Math.max(bottom.area, top.area);
			
			if(maxLeftRightArea > maxBottomTopArea)
			{
				if(left.area < right.area)
				{
					mPacks.push(left);
					mPacks.push(right);
				}
				else
				{
					mPacks.push(right);
					mPacks.push(left);
				}
			}
			else
			{
				if(bottom.area < top.area)
				{
					mPacks.push(bottom);
					mPacks.push(top);
				}
				else
				{
					mPacks.push(top);
					mPacks.push(bottom);
				}
			}
			
			mPacks[i].w = mRects[j].w;
			mPacks[i].h = mRects[j].h;
			mPacks[i].order = mRects[j].order;
			mPacks[i].rotated = mRects[j].rotated;
			mPacks[i].children[0] = mPacks.length - 2;
			mPacks[i].children[1] = mPacks.length - 1;
			
			mRects[j].packed = true;
		}
		
		private function rectIsValid(i:int):Boolean
		{
			return i >= 0 && i < mRects.length;
		}
		
		private function packIsValid(i:int):Boolean
		{
			return i >= 0 && i < mPacks.length;
		}
		
		public function clear():void
		{
			mNumPacked = 0;
			mRects = new Vector.<Rect>();
			mPacks = new Vector.<Rect>();
		}
		
	}
}