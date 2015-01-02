package org.agony2d.utils.maxRects
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	[SWF(width = 800, height = 600)]
	public class TexturePacker extends Sprite
	{
		public var rects:Vector.<Rect>;
		
		public function TexturePacker()
		{
			rects = new Vector.<Rect>();
			for(var i:int = 0; i < 40; i++)
			{
				var rect:Rect = new Rect(50 + int(Math.random() * 50), 50 + int(Math.random() * 50));
				rect.x = Math.random() * (1200 - rect.w);
				rect.y = Math.random() * (800 - rect.h);
				rects.push(rect);
			}
			
			for(i = 0; i< rects.length; i++)
			{
				this.graphics.beginFill(0xFF0000, 0.5);
				this.graphics.drawRect(rects[i].x, rects[i].y, rects[i].w, rects[i].h);
				this.graphics.endFill();
				this.graphics.lineStyle(1, 0xFF);
				this.graphics.drawRect(rects[i].x, rects[i].y, rects[i].w, rects[i].h);
			}
			
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.CLICK, onClick);
			this.graphics.clear();
			var packer:BinPacker = new BinPacker(800, 600);
			var result:Vector.<BinnedArea> = packer.pack(rects, true);
			
			for(var i:int = 0; i< result.length; i++)
			{
				this.graphics.beginFill(0xFF0000, 0.5);
				this.graphics.drawRect(result[i].x, result[i].y, result[i].w, result[i].h);
				this.graphics.endFill();
				this.graphics.lineStyle(1, 0xFF);
				this.graphics.drawRect(result[i].x, result[i].y, result[i].w, result[i].h);
			}
		}
	}
}