package org.agony2d.flashApi.inside.flashViews {
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.NodeUU;
	
	use namespace agony_internal;
	
	/** @private */
public class FlashRawSprite extends FlashNode implements IFlashPixels {
	
	override agony_internal function recycle() : void {
		m_proxy = null;
		g_cachedRawSpriteList[g_cachedRawSpriteLength++] = this;
	}
	
	override agony_internal function revert() : void {
		super.revert();
		this.graphics.clear();
		this.removeChildren();
	}
	
	agony_internal static function toRawSprite( proxy:NodeUU ) : FlashRawSprite {
		var renderer:FlashRawSprite;
		
		renderer = (g_cachedRawSpriteLength > 0 ? g_cachedRawSpriteLength-- : 0) ? g_cachedRawSpriteList.pop() : new FlashRawSprite;
		renderer.m_proxy = proxy;
		return renderer;
	}
	
	
	agony_internal static var g_cachedRawSpriteList:Array = [];
	agony_internal static var g_cachedRawSpriteLength:int;
	
	agony_internal var m_proxy:NodeUU;
}
}