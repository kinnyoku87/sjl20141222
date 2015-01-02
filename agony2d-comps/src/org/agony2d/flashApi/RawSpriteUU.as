package org.agony2d.flashApi {
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import org.agony2d.flashApi.inside.flashViews.FlashRawSprite;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.inputs.Touch;
	import org.agony2d.flashApi.core.NodeUU;
	
	use namespace agony_internal;
	
public class RawSpriteUU extends NodeUU {
	
	/** 圖形繪製接口. */
	public function get graphics() : Graphics {
		//return m_rawSpriteRenderer.m_graphics;
		return m_rawSpriteRenderer.graphics;
	}
	
	public function get numChildren() : int {
		return m_rawSpriteRenderer.numChildren;
	}
	
	public function addChild( child:DisplayObject ) : DisplayObject {
		return m_rawSpriteRenderer.addChild(child);
	}
	
	public function removeChild( child:DisplayObject ) : DisplayObject {
		return m_rawSpriteRenderer.removeChild(child)
	}
	
	public function addChildAt ( child:DisplayObject, index:int) : DisplayObject {
		return m_rawSpriteRenderer.addChildAt(child, index)
	}
	
	public function contains( child:DisplayObject ) : Boolean {
		return m_rawSpriteRenderer.contains(child)
	}
	
	public function removeChildAt ( index:int) : DisplayObject {
		return m_rawSpriteRenderer.removeChildAt(index)
	}
	
	public function getChildAt ( index:int) : DisplayObject {
		return m_rawSpriteRenderer.getChildAt(index)
	}
	
	public function getChildByName( name:String ) : DisplayObject {
		return m_rawSpriteRenderer.getChildByName(name)
	}
	
	public function getChildIndex( child:DisplayObject ) : int {
		return m_rawSpriteRenderer.getChildIndex(child)
	}
	
	public function setChildIndex( child:DisplayObject, index:int ) : void {
		m_rawSpriteRenderer.setChildIndex(child, index)
	}
	
	override public function get scaleX () : Number { 
		//return m_rawSpriteComp.m_scaleX / g_pixelRatio
		return m_rawSpriteRenderer.scaleX / g_pixelRatio
	}
	
	override public function set scaleX ( v:Number ) : void {
		m_rawSpriteRenderer.scaleX = v * g_pixelRatio 
	}
	
	override public function get scaleY () : Number { 
		//return m_view.m_scaleY / g_pixelRatio
		return m_rawSpriteRenderer.scaleY / g_pixelRatio
	}
	
	override public function set scaleY ( v:Number ) : void { 
		m_rawSpriteRenderer.scaleY = v * g_pixelRatio 
	}
	
	
	
	/** @private */
	agony_internal var m_rawSpriteRenderer:FlashRawSprite;
	
	
	
	/** @private */
	override agony_internal function ____doRegisterRenderer() : void {
		m_flashView         =  m_rawSpriteRenderer  =  FlashRawSprite.toRawSprite(this);
		m_flashView.scaleX  =  m_flashView.scaleY   =  g_pixelRatio;
	}
}
}