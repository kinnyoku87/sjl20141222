package org.agony2d.flashApi.inside.flashViews {
	import flash.text.TextField;
	
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.NodeUU;
	
	use namespace agony_internal;
	
	/** @private */
public class FlashTextField extends TextField implements IFlashPixels {
	
	agony_internal static function toTextField( proxy:NodeUU ) : FlashTextField {
		var renderer:FlashTextField;
		
		renderer = (g_cachedTextLength > 0 ? g_cachedTextLength-- : 0) ? g_cachedTextList.pop() : new FlashTextField;
		renderer.m_proxy = proxy;
		return renderer;
	}
	
	
	agony_internal static var g_cachedTextList:Array = [];
	agony_internal static var g_cachedTextLength:int;
	
	agony_internal var m_proxy:NodeUU;
	
	
	agony_internal function recycle() : void {
		m_proxy = null;
		g_cachedTextList[g_cachedTextLength++] = this;
	}
	
	agony_internal function revert() : void {
		this.htmlText = "";
//		this.autoSize = "left";
		this.background = this.border = this.embedFonts = this.wordWrap = false;
//		trace("@#@!#@!##@#@!#!@#@!#!$#%$text.............")
	}
}
}