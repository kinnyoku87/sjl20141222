package org.agony2d.flashApi {
	import flash.geom.Rectangle;
	import org.agony2d.base.inside.agony_internal;
	
		use namespace agony_internal;
	
public class ScrollPaneUU extends PivotFusionUU {
	
	public function ScrollPaneUU( viewportWidth:Number, viewportHeight:Number ) {
		m_content = new PivotFusionUU;
		this.addNode(m_content);
		m_viewportWidth = viewportWidth;
		m_viewportHeight = viewportHeight;
		this.displayObject.scrollRect = new Rectangle(0, 0, viewportWidth, viewportHeight);
		
		
		
	}
	
	
	agony_internal var m_content:PivotFusionUU;
	agony_internal var m_viewportX:Number;
	agony_internal var m_viewportY:Number;
	
	agony_internal var m_viewportWidth:Number;
	agony_internal var m_viewportHeight:Number;
	
	agony_internal var m_contentWidth:Number;
	agony_internal var m_contentHeight:Number;
	
	
	public function get content() : PivotFusionUU {
		return m_content;
	}
	
	public function get contentWidth() : Number {
		return m_contentWidth
	}
	
	public function set contentWidth( v:Number ) : void { 
		//m_contentWidth = (v < m_maskWidth ? m_maskWidth : v)
		//if (m_horizPuppet) {
			//m_horizPuppet.width = m_maskWidth * m_maskWidth / m_contentWidth / m_scaleRatio
		//}
	}
	
	public function get contentHeight() : Number { 
		return m_contentHeight 
	}
	
	public function set contentHeight( v:Number ) : void { 
		//m_contentHeight = (v < m_maskHeight ? m_maskHeight : v)
		//if(m_vertiPuppet) {
			//m_vertiPuppet.height = m_maskHeight * m_maskHeight / m_contentHeight / m_scaleRatio
		//}
	}
	
	public function get viewportX() : Number {
		return m_viewportX;
	}
	
	public function set viewportX( v:Number ) : void {
		m_viewportX = v;
	}
	
	public function get viewportY() : Number {
		return m_viewportY;
	}
	
	public function set viewportY( v:Number ) : void {
		m_viewportY = v;
	}
	
	//public function getHSlider() : 
	
	
	
	
	override agony_internal function doDispose() : void {
		this.displayObject.scrollRect = null
		super.doDispose()
	}
}
}