package org.agony2d.flashApi.core
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.getQualifiedClassName;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.inside.AnimatorProp;
	import org.agony2d.flashApi.inside.BitmapProp;
	import org.agony2d.flashApi.inside.Scale9BitmapProp;
	import org.agony2d.resources.TAssetData;
	import org.agony2d.resources.data.AtlasData;
	
	use namespace agony_internal;

public class CacheManager extends AbstractUU {
	
	agony_internal static var g_instance:CacheManager;
	
	/** @private */
	public function addBitmap( source:*, id:String = null, isScale9Bitmap:Boolean = false ) : void {
		var BA:BitmapData;
		
		if (source is BitmapData) {
			BA = source as BitmapData;
			if (id == null) {
				LogMachine.g_instance.error("UU", "cacheBitmap", "傳入圖像參數時，id不可為Null !!!");
			}
		}
		else if (source is Class) {
			try {
				BA = (new source).bitmapData;
			}
			catch ( err:Error ) {
				LogMachine.g_instance.error("UU", "cacheBitmap", "Data type error: [ {0} ] !!!", new source);
			}
			if (id == null) {
				id = getQualifiedClassName(source);
			}
		}
		else {
			LogMachine.g_instance.error("UU", "cacheBitmap", "BitmapRef arg error: [ {0} ] !!!", source);
		}
		g_bitmapDataMap[id] = isScale9Bitmap ? new Scale9BitmapProp(BA) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(BA));
	}
	
	/** @private */
	//public function addBitmapByAsset( asset:TAssetData, isScale9Bitmap:Boolean = false ) : void {
		//g_bitmapDataMap[asset.id] = isScale9Bitmap ? new Scale9BitmapProp(asset.data as BitmapData) : new BitmapProp(AbstractUU.toSuitableRatioBitmap(asset.data as BitmapData));
	//}
	
	
	agony_internal var m_atlasMap:Object;
	
	public function isAtlasExist( atlasId:String ) : Boolean {
		return m_atlasMap && m_atlasMap[atlasId];
	}
	
	/** @private */
	public function addAtlas( atlas:AtlasData ) : void {
		var sub:XML;
		
		var BA:BitmapData;
		var BA_A:BitmapData;
		var rect:Rectangle;
		var name:String;
		var index:int;
		var prop:AnimatorProp;
		
		var x:int;
		var y:int;
		var width:int;
		var height:int;
		var frameX:int;
		var frameY:int;
		//var frameWidth:int;
		//var frameHeight:int;
			
		if (AbstractUU.g_pixelRatio == 1.0) {
			rect = new Rectangle
			g_cachedPoint.setTo(0, 0);
			BA = atlas.m_bitmapData;
			for each (sub in atlas.m_atlasXML.SubTexture) {
				width   =  parseFloat(sub.attribute("width"));
				height  =  parseFloat(sub.attribute("height"));
				rect.setTo(parseFloat(sub.attribute("x")), parseFloat(sub.attribute("y")), width, height);
				BA_A = new BitmapData(width, height, true, 0x0);
				BA_A.copyPixels(BA, rect, g_cachedPoint, null, null, true);
				name   =  sub.attribute("name");
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
				prop                =  g_bitmapDataMap[name] = new AnimatorProp(AbstractUU.toSuitableRatioBitmap(BA_A));
				prop.m_frameX       =  parseFloat(sub.attribute("frameX"));
				prop.m_frameY       =  parseFloat(sub.attribute("frameY"));
				prop.m_frameWidth   =  parseFloat(sub.attribute("frameWidth"));
				prop.m_frameHeight  =  parseFloat(sub.attribute("frameHeight"));
				if (prop.m_frameWidth == 0) {
					prop.m_frameWidth   =  width;
					prop.m_frameHeight  =  height;
				}
			}
		}
		else {
			rect = new Rectangle;
			BA = atlas.m_bitmapData;
			for each (sub in atlas.m_atlasXML.SubTexture) {
				x = parseFloat(sub.attribute("x"));
				y = parseFloat(sub.attribute("y"));
				width = parseFloat(sub.attribute("width"));
				height = parseFloat(sub.attribute("height"));
				frameX  =  -parseFloat(sub.attribute("frameX"));
				frameY  =  -parseFloat(sub.attribute("frameY"));
				//frameWidth   =  parseFloat(sub.attribute("frameWidth"));
				//frameHeight  =  parseFloat(sub.attribute("frameHeight"));
				
				BA_A = new BitmapData(frameX + width, frameY + height, true, 0x0);
				rect.setTo(x, y, width, height);
				g_cachedPoint.setTo(frameX, frameY);
				BA_A.copyPixels(BA, rect, g_cachedPoint, null, null, true);
				
				name = sub.attribute("name");
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
				
				prop = g_bitmapDataMap[name] = new AnimatorProp(AbstractUU.toSuitableRatioBitmap(BA_A));
				//prop.m_frameWidth   =  frameWidth;
				//prop.m_frameHeight  =  frameHeight;
				prop.m_frameWidth   =  parseFloat(sub.attribute("frameWidth"));
				prop.m_frameHeight  =  parseFloat(sub.attribute("frameHeight"));
				if (prop.m_frameWidth == 0) {
					prop.m_frameWidth   =  width;
					prop.m_frameHeight  =  height;
				}
			}
		}
		
		(m_atlasMap ||= {} )[atlas.m_path] = true;
	}
	
	// 伪异步处理.
	public function addAtlas2( atlas:AtlasData, countPerFrame:int = 2 ) : void {
		var sub:XML;
		
		var BA:BitmapData;
		var BA_A:BitmapData;
		var rect:Rectangle;
		//var name:String;
		var index:int;
		var prop:AnimatorProp;
		
		//var x:int;
		//var y:int;
		//var width:int;
		//var height:int;
		//var frameX:int;
		//var frameY:int;
		//var frameWidth:int;
		//var frameHeight:int;
		var cell:AtlasCell;
		var parser:AtlasParser;
		var i:int;
		
		parser = new AtlasParser(this, atlas, countPerFrame);
		for each (sub in atlas.m_atlasXML.SubTexture) {
			cell = parser.cells[i++] = new AtlasCell;
			cell.name    =  sub.attribute("name");
			cell.x       =  parseFloat(sub.attribute("x"));
			cell.y       =  parseFloat(sub.attribute("y"));
			cell.width   =  parseFloat(sub.attribute("width"));
			cell.height  =  parseFloat(sub.attribute("height"));
			cell.frameX       =  -parseFloat(sub.attribute("frameX"));
			cell.frameY       =  -parseFloat(sub.attribute("frameY"));
			cell.frameWidth   =  parseFloat(sub.attribute("frameWidth"));
			cell.frameHeight  =  parseFloat(sub.attribute("frameHeight"));
		}
	}
	
	// 完整图.
	//public function addAtlas( atlas:AtlasData ) : void {
		//var sub:XML;
		//var BA:BitmapData;
		//var BA_A:BitmapData;
		//var rect:Rectangle;
		//var name:String;
		//var index:int;
		//
		//rect = new Rectangle;
		//BA = atlas.m_bitmapData;
		//for each (sub in atlas.m_atlasXML.SubTexture) {
			//BA_A = new BitmapData(parseFloat(sub.attribute("frameWidth")), parseFloat(sub.attribute("frameHeight")), true, 0x0);
			//rect.setTo(parseFloat(sub.attribute("x")), parseFloat(sub.attribute("y")), parseFloat(sub.attribute("width")), parseFloat(sub.attribute("height")));
			//g_cachedPoint.setTo(-parseFloat(sub.attribute("frameX")), -parseFloat(sub.attribute("frameY")));
			//BA_A.copyPixels(BA, rect, g_cachedPoint, null, null, true);
			//
			//name = sub.attribute("name");
			//if(int(name) > 0){
				//name = atlas.m_path + name;
			//}
			//else {
				//index = name.lastIndexOf("/");
				//if(int(name.substring(index + 1)) > 0){
					//name = atlas.m_path + "/" + name.substring(0, index) + int(name.substring(index + 1));
				//}
				//else {
					//name = atlas.m_path + "/" + name;
				//}
			//}
			//g_bitmapDataMap[name] = new AnimatorProp(AbstractUU.toSuitableRatioBitmap(BA_A));
		//}
	//}
	
	// 部分图.
	//public function addAtlas( atlas:AtlasData ) : void {
		//var sub:XML;
		//var BA:BitmapData;
		//var BA_A:BitmapData;
		//var rect:Rectangle;
		//var name:String;
		//var index:int;
		//var prop:AnimatorProp;
			//
		//var x:int;
		//var y:int;
		//var width:int;
		//var height:int;
		//var frameX:int;
		//var frameY:int;
		//var frameWidth:int;
		//var frameHeight:int;
		//
		//rect = new Rectangle;
		//BA = atlas.m_bitmapData;
		//for each (sub in atlas.m_atlasXML.SubTexture) {
			//x = parseFloat(sub.attribute("x"));
			//y = parseFloat(sub.attribute("y"));
			//width = parseFloat(sub.attribute("width"));
			//height = parseFloat(sub.attribute("height"));
			//frameX  =  -parseFloat(sub.attribute("frameX"));
			//frameY  =  -parseFloat(sub.attribute("frameY"));
			//frameWidth   =  parseFloat(sub.attribute("frameWidth"));
			//frameHeight  =  parseFloat(sub.attribute("frameHeight"));
			//
			//BA_A = new BitmapData(frameX + width, frameY + height, true, 0x0);
			//rect.setTo(x, y, width, height);
			//g_cachedPoint.setTo(frameX, frameY);
			//BA_A.copyPixels(BA, rect, g_cachedPoint, null, null, true);
			//
			//name = sub.attribute("name");
			//if(int(name) > 0){
				//name = atlas.m_path + name;
			//}
			//else {
				//index = name.lastIndexOf("/");
				//if(int(name.substring(index + 1)) > 0){
					//name = atlas.m_path + "/" + name.substring(0, index) + int(name.substring(index + 1));
				//}
				//else {
					//name = atlas.m_path + "/" + name;
				//}
			//}
			//
			//prop = g_bitmapDataMap[name] = new AnimatorProp(AbstractUU.toSuitableRatioBitmap(BA_A));
			//prop.m_frameWidth   =  parseFloat(sub.attribute("frameWidth"));
			//prop.m_frameHeight  =  parseFloat(sub.attribute("frameHeight"));
		//}
	//}
	
	//public function addAtlas( atlas:AtlasData ) : void {
		//var sub:XML;
		//var BA:BitmapData;
		//var BA_A:BitmapData;
		//var rect:Rectangle;
		//var name:String;
		//var index:int;
		//var prop:AnimatorProp;
		//
		//var x:Number;
		//var y:Number;
		//var width:Number;
		//var height:Number;
		//var frameX:Number;
		//var frameY:Number;
		//var frameWidth:Number;
		//var frameHeight:Number;
		//var frameOffsetX:Number;
		//var frameOffsetY:Number;
		//
		//rect = new Rectangle;
		//BA = atlas.m_bitmapData;
		//for each (sub in atlas.m_atlasXML.SubTexture) {
			//x = parseFloat(sub.attribute("x"));
			//y = parseFloat(sub.attribute("y"));
			//width = parseFloat(sub.attribute("width"));
			//height = parseFloat(sub.attribute("height"));
			//frameX  =  -parseFloat(sub.attribute("frameX"));
			//frameY  =  -parseFloat(sub.attribute("frameY"));
			//frameWidth   =  parseFloat(sub.attribute("frameWidth"));
			//frameHeight  =  parseFloat(sub.attribute("frameHeight"));
			//frameOffsetX = frameX * g_pixelRatio - int(frameX * g_pixelRatio);
			//
			//BA_A = new BitmapData(width, height, true, 0x0);
			//rect.setTo(x, y, width, height);
			//g_cachedPoint.setTo(frameX, frameY);
			//BA_A.copyPixels(BA, rect, g_cachedPoint, null, null, true);
			//
			//name = sub.attribute("name");
			//if(int(name) > 0){
				//name = atlas.m_path + name;
			//}
			//else {
				//index = name.lastIndexOf("/");
				//if(int(name.substring(index + 1)) > 0){
					//name = atlas.m_path + "/" + name.substring(0, index) + int(name.substring(index + 1));
				//}
				//else {
					//name = atlas.m_path + "/" + name;
				//}
			//}
			//
			//prop = g_bitmapDataMap[name] = new AnimatorProp(AbstractUU.toSuitableRatioBitmap(BA_A));
			//prop.m_frameX       =  frameX;
			//prop.m_frameY       =  frameY;
			//prop.m_frameWidth   =  frameWidth;
			//prop.m_frameHeight  =  frameHeight;
		//}
	//}
	
	/** @private */
	public function deleteBitmap( value:* ) : void {
		delete g_bitmapDataMap[(value is String) ? value as String : getQualifiedClassName(value)];
	}
}
}