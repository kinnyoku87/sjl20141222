package org.agony2d.flashApi.core 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import org.agony2d.Agony;
	import org.agony2d.base.events.TickEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.inside.AnimatorProp;
	import org.agony2d.resources.data.AtlasData;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
	public class AtlasParser 
	{
		
		public function AtlasParser( cache:CacheManager, atlas:AtlasData, countPerFrame:int ) 
		{
			m_cache = cache;
			this.atlas = atlas;
			this.cells = [];
			m_countPerFrame = countPerFrame;
			
			Agony.getFrame().addEventListener(TickEvent.TICK, onTick);
			
			
		}
		
		
		public var m_cache:CacheManager;
		public var atlas:AtlasData;
		public var cells:Array;
		public var m_countPerFrame:int;
		public var m_currCount:int;
		
		
		private function onTick(e:AEvent):void {
			m_currCount = 0;
			this.____doIterateNext();
		}
		
		
		// 返回true，完成.
		private function ____doIterateNext():void {
			if (++m_currCount > m_countPerFrame) {
				return;
			}
			if (this.cells.length <= 0) {
				Agony.getFrame().removeEventListener(TickEvent.TICK, onTick);
				
				(m_cache.m_atlasMap ||= { } )[atlas.m_path] = true;
				
				Agony.getLog().message(this, "偽異步解析Atlas完成: [ {0} ]", atlas.m_path);
				
				this.m_cache.dispatchDirectEvent(atlas.m_path);
				return;
			}
			else {
				this.____doHandlerCell(this.cells.pop());
			}
			
		}
		
		private function ____doHandlerCell( cell:AtlasCell ) : void {
			var name:String;
			var BA:BitmapData;
			var BA_A:BitmapData;
			var rect:Rectangle;
			var index:int;
			var prop:AnimatorProp;
			
			name = cell.name;
			if (AbstractUU.g_pixelRatio == 1.0) {
				rect = new Rectangle
				AbstractUU.g_cachedPoint.setTo(0, 0);
				BA = atlas.m_bitmapData;
				rect.setTo(cell.x, cell.y, cell.width, cell.height);
				BA_A = new BitmapData(cell.width, cell.height, true, 0x0);
				BA_A.copyPixels(BA, rect, AbstractUU.g_cachedPoint, null, null, true);
				if(int(name) > 0){
					name = atlas.m_path + int(name);
				}
				else {
					index = name.lastIndexOf("/");
					if(int(name.substring(index + 1)) > 0){
						name = atlas.m_path + "/" + name.substring(0, index) + int(name.substring(index + 1));
					}
					else {
						name = atlas.m_path + "/" + name;
					}
				}
				prop                =  AbstractUU.g_bitmapDataMap[name] = new AnimatorProp(AbstractUU.toSuitableRatioBitmap(BA_A));
				prop.m_frameX       =  -cell.frameX;
				prop.m_frameY       =  -cell.frameY;
				prop.m_frameWidth   =  cell.frameWidth;
				prop.m_frameHeight  =  cell.frameHeight;
				if (prop.m_frameWidth == 0) {
					prop.m_frameWidth   =  cell.width;
					prop.m_frameHeight  =  cell.height;
				}
			}
			else {
				rect = new Rectangle;
				BA = atlas.m_bitmapData;
				
				BA_A = new BitmapData(cell.frameX + cell.width, cell.frameY + cell.height, true, 0x0);
				rect.setTo(cell.x, cell.y, cell.width, cell.height);
				AbstractUU.g_cachedPoint.setTo(cell.frameX, cell.frameY);
				BA_A.copyPixels(BA, rect, AbstractUU.g_cachedPoint, null, null, true);
				
				name = cell.name;
				if(int(name) > 0){
					name = atlas.m_path + int(name);
				}
				else {
					index = name.lastIndexOf("/");
					if(int(name.substring(index + 1)) > 0){
						name = atlas.m_path + "/" + name.substring(0, index) + int(name.substring(index + 1));
					}
					else {
						name = atlas.m_path + "/" + name;
					}
				}
				
				prop = AbstractUU.g_bitmapDataMap[name] = new AnimatorProp(AbstractUU.toSuitableRatioBitmap(BA_A));
				//prop.m_frameWidth   =  frameWidth;
				//prop.m_frameHeight  =  frameHeight;
				prop.m_frameWidth   =  cell.frameWidth;
				prop.m_frameHeight  =  cell.frameHeight;
				if (prop.m_frameWidth == 0) {
					prop.m_frameWidth   =  cell.width;
					prop.m_frameHeight  =  cell.height;
				}
			}
			
			//Agony.getLog().message(this, "[ Atlas Cell ]: {0}...{1}", BA_A.rect, this.cells.length);
			
			this.____doIterateNext();
		}
		
	}

}