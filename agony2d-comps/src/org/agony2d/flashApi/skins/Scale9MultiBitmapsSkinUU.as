package org.agony2d.flashApi.skins {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.core.AbstractUU;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	
public class Scale9MultiBitmapsSkinUU extends SkinUU {
	
	/**
	 * 初期化.
	 * 
	 * @param	skinArgs	[ source:* ]
	 */
	override agony_internal function initialize( skinArgs:Array ) : void {
		var BA:BitmapData;
		var BP:Bitmap;
		var rect:Rectangle;
		var point:Point;
		var source:*;
		
		source = skinArgs[0];
		if (source is BitmapData) {
			BA = source as BitmapData;
		}
		else if (source is Class) {
			try {
				BP = new (source as Class)
			}
			catch (err:Error) {
				LogMachine.g_instance.error("Scale9MultiBitmapsSkin", "constructor", "Instance of source class happens error: [ {0} ] !!!", new (source as Class));
			}
			BA = BP.bitmapData;
		}
		else {
			LogMachine.g_instance.error("Scale9MultiBitmapsSkin", "constructor", "Source type happens error: [ {0} ] !!!", source);
		}
		
		BA = AbstractUU.toSuitableRatioBitmap(BA);
		
		if (BA.width < g_centerLength + SCALE_9_MIN_MARGIN || BA.height < g_centerLength + SCALE_9_MIN_MARGIN) {
			LogMachine.g_instance.error("Scale9MultiBitmapsSkin", "constructor", "Bitmap size error [ {0} | {1} ]!!!", BA.width, BA.height);
		}
		rect   =  new Rectangle;
		point  =  new Point;
		
		// gap
		paddingX  =  paddingX  =  Math.ceil((BA.width  - g_centerLength) * .5);
		paddingY  =  paddingY  =  Math.ceil((BA.height - g_centerLength) * .5);
		centerX   =  centerX   =  BA.width  - paddingX * 2;
		centerY   =  centerY   =  BA.height - paddingY * 2;
		
		// top
		rect.height   =  paddingY;
		
		sevenBA  =  new BitmapData(paddingX, paddingY, true, 0x0);
		rect.width    =  paddingX;
		sevenBA.copyPixels(BA, rect, point);
		
		eightBA  =  new BitmapData(centerX, paddingY, true, 0x0);
		rect.x        =  paddingX;
		rect.width    =  centerX;
		eightBA.copyPixels(BA, rect, point);
		
		nineBA   =  new BitmapData(paddingX, paddingY, true, 0x0);
		rect.x        =  centerX + paddingX;
		rect.width    =  paddingX;
		nineBA.copyPixels(BA, rect, point);
		
		// middle
		rect.y        =  paddingY;
		rect.height   =  centerY;
		
		fourBA   =  new BitmapData(paddingX, centerY, true, 0x0);
		rect.x        =  0;
		fourBA.copyPixels(BA, rect, point);
		
		fiveBA   =  new BitmapData(centerX, centerY, true, 0x0);
		rect.x        =  paddingX;
		rect.width    =  centerX;
		fiveBA.copyPixels(BA, rect, point);
		
		sixBA    =  new BitmapData(paddingX, centerY, true, 0x0);
		rect.x        =  centerX + paddingX;
		rect.width    =  paddingX;
		sixBA.copyPixels(BA, rect, point);
		
		// bottom
		rect.y        =  centerY + paddingY;
		rect.height   =  paddingY;
		
		oneBA    =  new BitmapData(paddingX, paddingY, true, 0x0);
		rect.x        =  0;
		rect.width    =  paddingX;
		oneBA.copyPixels(BA, rect, point);
		
		twoBA    =  new BitmapData(centerX, paddingY, true, 0x0);
		rect.x        =  paddingX;
		rect.width    =  centerX;
		twoBA.copyPixels(BA, rect, point);
		
		threeBA  =  new BitmapData(paddingX, paddingY, true, 0x0);
		rect.x        =  centerX + paddingX;
		rect.width    =  paddingX;
		threeBA.copyPixels(BA, rect, point);
		
		
		//var bmp:Bitmap;
		//
		//bmp = new Bitmap(sevenBA);
		//Agony.getStage().addChild(bmp)
		//
		//bmp = new Bitmap(eightBA);
		//Agony.getStage().addChild(bmp)
		//bmp.x = sevenBA.width;
		//
		//bmp = new Bitmap(nineBA);
		//Agony.getStage().addChild(bmp)
		//bmp.x = eightBA.width + sevenBA.width;
		//
		//bmp = new Bitmap(fourBA);
		//Agony.getStage().addChild(bmp)
		//bmp.y = sevenBA.height;
		//
		//bmp = new Bitmap(fiveBA);
		//Agony.getStage().addChild(bmp)
		//bmp.x = fourBA.width;
		//bmp.y = sevenBA.height;
		//
		//bmp = new Bitmap(sixBA);
		//Agony.getStage().addChild(bmp)
		//bmp.x = fourBA.width + fiveBA.width;
		//bmp.y = sevenBA.height;
		//
		//bmp = new Bitmap(oneBA);
		//Agony.getStage().addChild(bmp)
		//bmp.y = sevenBA.height + fourBA.height;
		//
		//bmp = new Bitmap(twoBA);
		//Agony.getStage().addChild(bmp)
		//bmp.x = oneBA.width;
		//bmp.y = sevenBA.height + fourBA.height;
		//
		//bmp = new Bitmap(threeBA);
		//Agony.getStage().addChild(bmp)
		//bmp.x = oneBA.width + twoBA.width;
		//bmp.y = sevenBA.height + fourBA.height;
	}
	
	
	
	agony_internal static const g_centerLength:int = 3;
	agony_internal static const SCALE_9_MIN_MARGIN:int = 3; // 最小邊距.
	
	agony_internal var sevenBA:BitmapData;
	agony_internal var eightBA:BitmapData;
	agony_internal var nineBA:BitmapData;
	agony_internal var fourBA:BitmapData;
	agony_internal var fiveBA:BitmapData;
	agony_internal var sixBA:BitmapData;
	agony_internal var oneBA:BitmapData;
	agony_internal var twoBA:BitmapData;
	agony_internal var threeBA:BitmapData;
	agony_internal var paddingX:int;
	agony_internal var paddingY:int;
	agony_internal var centerX:int;
	agony_internal var centerY:int;
}
}