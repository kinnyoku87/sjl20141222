package org.agony2d.utils.maxRects
{
	public class Rect
	{
		public var x:int;
		
		public var y:int;
		
		public var w:int;
		
		public var h:int;
		
		public var order:int;
		
		public var children:Array = [];
		
		public var rotated:Boolean;
		
		public var packed:Boolean;
		
		public function Rect(w:int, h:int, order:int = -1)
		{
			this.w = w;
			this.h = h;
			this.order = order;
			children[0] = -1;
			children[1] = -1;
		}
		
		public function get area():int
		{
			return w * h;
		}
	
		public function rotate():void
		{
			var temp:int = w;
			w = h;
			h = temp;
			rotated = !rotated;
		}
		
		public function clone():Rect
		{
			var r:Rect = new Rect(w, h);
			r.x = x;
			r.y = y;
			r.order = order;
			r.children = children.concat();
			r.rotated = rotated;
			r.packed = packed;
			return r;
		}
	}
}