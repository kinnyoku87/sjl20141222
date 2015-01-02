package org.agony2d.flashApi.inside.flashViews {
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.base.inside.agony_internal;
	
	use namespace agony_internal;
	
	/** @private */
public class FlashScale9MultiBitmaps extends FlashNode {
	
	public function FlashScale9MultiBitmaps() {
		m_oneBP    =  new FlashAutoSmoothBitmap;
		m_twoBP    =  new FlashAutoSmoothBitmap;
		m_threeBP  =  new FlashAutoSmoothBitmap;
		m_fourBP   =  new FlashAutoSmoothBitmap;
		m_fiveBP   =  new FlashAutoSmoothBitmap;
		m_sixBP    =  new FlashAutoSmoothBitmap;
		m_sevenBP  =  new FlashAutoSmoothBitmap;
		m_eightBP  =  new FlashAutoSmoothBitmap;
		m_nineBP   =  new FlashAutoSmoothBitmap;
		this.addChild(m_oneBP);
		this.addChild(m_twoBP);
		this.addChild(m_threeBP);
		this.addChild(m_fourBP);
		this.addChild(m_fiveBP);
		this.addChild(m_sixBP);
		this.addChild(m_sevenBP);
		this.addChild(m_eightBP);
		this.addChild(m_nineBP);
	}
	
	final agony_internal function get minWidth() : Number { 
		return m_paddingX * 2 + 1;
	}
	
	final agony_internal function get minHeight() : Number { 
		return m_paddingY * 2 + 1;
	}
	
	final agony_internal function setScale9MultiBitmapsSkin( skin:Scale9MultiBitmapsSkinUU ) : void {
		m_paddingX  =  m_eightBP.x  =  m_fiveBP.x  =  m_twoBP.x  =  skin.paddingX;
		m_paddingY  =  m_fourBP.y   =  m_fiveBP.y  =  m_sixBP.y  =  skin.paddingY;
		m_oneBP.bitmapData    =  skin.oneBA;
		m_twoBP.bitmapData    =  skin.twoBA;
		m_threeBP.bitmapData  =  skin.threeBA;
		m_fourBP.bitmapData   =  skin.fourBA;
		m_fiveBP.bitmapData   =  skin.fiveBA;
		m_sixBP.bitmapData    =  skin.sixBA;
		m_sevenBP.bitmapData  =  skin.sevenBA;
		m_eightBP.bitmapData  =  skin.eightBA;
		m_nineBP.bitmapData   =  skin.nineBA;
	}
	
	
	
	agony_internal static var g_cachedNgList:Array = [];
	agony_internal static var g_cachedNgLength:int;
	
	agony_internal var m_skinName:String;
	agony_internal var m_sevenBP:FlashAutoSmoothBitmap;
	agony_internal var m_eightBP:FlashAutoSmoothBitmap;
	agony_internal var m_nineBP:FlashAutoSmoothBitmap;
	agony_internal var m_fourBP:FlashAutoSmoothBitmap;
	agony_internal var m_fiveBP:FlashAutoSmoothBitmap;
	agony_internal var m_sixBP:FlashAutoSmoothBitmap;
	agony_internal var m_oneBP:FlashAutoSmoothBitmap;
	agony_internal var m_twoBP:FlashAutoSmoothBitmap;
	agony_internal var m_threeBP:FlashAutoSmoothBitmap;
	agony_internal var m_currWidth:Number;
	agony_internal var m_currHeight:Number;
	agony_internal var m_paddingX:int;
	agony_internal var m_paddingY:int;
	
	
	
	agony_internal static function toScale9MultiBitmaps( proxy:NodeUU ) : FlashScale9MultiBitmaps {
		var ng:FlashScale9MultiBitmaps;
		
		ng = (g_cachedNgLength > 0 ? g_cachedNgLength-- : 0) ? g_cachedNgList.pop() : new FlashScale9MultiBitmaps;
		ng.m_oneBP.m_proxy = ng.m_twoBP.m_proxy = ng.m_threeBP.m_proxy = ng.m_fourBP.m_proxy = ng.m_fiveBP.m_proxy = ng.m_sixBP.m_proxy = ng.m_sevenBP.m_proxy = ng.m_eightBP.m_proxy = ng.m_nineBP.m_proxy = proxy;
		return ng;
	}
	
	agony_internal function doModify() : void {
		if(isNaN(m_currWidth) || m_currWidth < this.minWidth) {
			m_currWidth = this.minWidth;
		}
		if(isNaN(m_currHeight) || m_currHeight < this.minHeight) {
			m_currHeight = this.minHeight;
		}
		m_eightBP.scaleX  =  m_fiveBP.scaleX   =  m_twoBP.scaleX   =  (m_currWidth  - m_paddingX * 2) / m_eightBP.bitmapData.width   ; // 852
		m_nineBP.x       =  m_sixBP.x        =  m_threeBP.x     =  m_currWidth  - m_paddingX;     // 963
		m_fourBP.scaleY  =  m_fiveBP.scaleY  =  m_sixBP.scaleY  =  (m_currHeight - m_paddingY * 2) / m_fourBP.bitmapData.height; // 456
		m_oneBP.y        =  m_twoBP.y        =  m_threeBP.y     =  m_currHeight - m_paddingY;     // 123
		
		//trace(m_currWidth, m_currHeight, paddingX, paddingY);
	}
	
	override agony_internal function recycle() : void {
		g_cachedNgList[g_cachedNgLength++] = this;
	}
	
	override agony_internal function revert() : void {
		m_oneBP.bitmapData = m_twoBP.bitmapData = m_threeBP.bitmapData = m_fourBP.bitmapData = m_fiveBP.bitmapData = m_sixBP.bitmapData = m_sevenBP.bitmapData = m_eightBP.bitmapData = m_nineBP.bitmapData = null;
		m_skinName = null;
		
		m_eightBP.x  =  m_fiveBP.x  =  m_twoBP.x  =  0;
		m_fourBP.y   =  m_fiveBP.y  =  m_sixBP.y  =  0;
		m_eightBP.scaleX  =  m_fiveBP.scaleX   =  m_twoBP.scaleX   =  1; // 852
		m_nineBP.x       =  m_sixBP.x        =  m_threeBP.x     =  0;     // 963
		m_fourBP.scaleY  =  m_fiveBP.scaleY  =  m_sixBP.scaleY  =  1; // 456
		m_oneBP.y        =  m_twoBP.y        =  m_threeBP.y     =  0;     // 123
	}
	
	final agony_internal function doSetSmoothing( b:Boolean ) : void {
		m_oneBP.smoothing = m_twoBP.smoothing = m_threeBP.smoothing = m_fourBP.smoothing = m_fiveBP.smoothing = m_sixBP.smoothing = m_sevenBP.smoothing = m_eightBP.smoothing = m_nineBP.smoothing = b;
	}
}
}