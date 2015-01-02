package org.agony2d.flashApi {
	import flash.geom.Rectangle;
	import org.agony2d.Agony;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	import org.agony2d.events.AEvent;
	import org.agony2d.utils.MathUtil;
	
	use namespace agony_internal;
	
	// 本身不帶任何model，由其他附屬組件實現model.
public class ViewportFusion extends PivotFusionUU {
	
	public function ViewportFusion( viewportWidth:Number, viewportHeight:Number ) {
		m_viewportWidth = m_contentWidth = viewportWidth;
		m_viewportHeight = m_contentHeight = viewportHeight;
		this.displayObject.scrollRect = new Rectangle(0, 0, viewportWidth, viewportHeight);
		
		m_content = new PivotFusionUU;
		this.addNode(m_content);
	}
	
	
	/** 視域寬度. */
	public function get viewportWidth() : Number {
		return m_viewportWidth;
	}
	
	/** 視域高度. */
	public function get viewportHeight() : Number {
		return m_viewportHeight;
	}
	
	/** 坐標修正值 X. */
	public function get correctionX() : Number {
		var tValue:Number;
		
		tValue = m_content.x;
		if (tValue > 0) {
			return m_content.pivotX - tValue;
		}
		else if (tValue < this.lengthX) {
			return m_content.pivotX + this.lengthX - tValue;
		}
		return 0;
	}
	
	/** 坐標修正值 Y. */
	public function get correctionY() : Number {
		var tValue:Number
		
		tValue = m_content.y;
		if (tValue > 0) {
			return m_content.pivotY - tValue;
		}
		else if(tValue < this.lengthY) {
			return m_content.pivotY + this.lengthY - tValue;
		}
		return 0;
	}
	
	/** 視域容器. */
	public function get content() : PivotFusionUU {
		return m_content;
	}
	
	/** 視域坐標 X. */
	public function get viewportX() : Number {
		return -m_content.x;
	}
	
	public function set viewportX( v:Number ) : void {
		m_content.x = isNaN(v) ? 0 : -v;
		this.____doAdjust();
	}
	
	/** 視域坐標 Y. */
	public function get viewportY() : Number {
		return -m_content.y;
	}
	
	public function set viewportY( v:Number ) : void {
		m_content.y = isNaN(v) ? 0 : -v;
		this.____doAdjust();
	}
	
	/** 視域內部最大寬度 */
	public function get contentWidth() : Number {
		return m_contentWidth;
	}
	
	public function set contentWidth( v:Number ) : void {
		m_contentWidth = (isNaN(v) || v < m_viewportWidth) ? m_viewportWidth : v;
	}
	
	/** 視域內部最大高度 */
	public function get contentHeight() : Number {
		return m_contentHeight;
	}
	
	public function set contentHeight( v:Number ) : void {
		m_contentHeight = (isNaN(v) || v < m_viewportHeight) ? m_viewportHeight : v;
	}
	
	/** 水平滾動比率. */
	public function get horizRatio() : Number { 
		return MathUtil.getRatioBetween(this.orginX, 0, this.lengthX);
	}
	
	public function set horizRatio( v:Number ) : void {
		m_content.x = v * this.lengthX;
	}
	
	/** 垂直滾動比率. */
	public function get vertiRatio() : Number { 
		trace("========="+MathUtil.getRatioBetween(this.orginY, 0, this.lengthY));
		return MathUtil.getRatioBetween(this.orginY, 0, this.lengthY)
	}
	
	public function set vertiRatio( v:Number ) : void {
		m_content.y = v * this.lengthY ;
		//if(v > 0.8) m_content.y = v * this.lengthY + viewportHeight * (1 - Agony.getAdapter().pixelRatio);
		trace("mcontentY:"+m_content.y +"==v:"+v+"==lengY:"+this.lengthY);
	}
	
	override public function set rotation ( v:Number ) : void { 
		LogMachine.g_instance.error(this, "set rotation", "該類不實現此方法.") 
	}
	
	override public function set scaleX ( v:Number ) : void { 
		LogMachine.g_instance.error(this, "set scaleX", "該類不實現此方法.")
	}
	
	override public function set scaleY ( v:Number ) : void {
		LogMachine.g_instance.error(this, "set scaleY", "該類不實現此方法.") 
	}
	
	public function toString() : String {
		return "[ viewportFusin ]: " + this.viewportX + "/" + this.viewportY + " - " + (m_contentWidth - m_viewportWidth) + "/" + (m_contentHeight - m_viewportHeight) + " - " + m_contentWidth + "/" + m_contentHeight;
	}
	
	
	
	agony_internal var m_content:PivotFusionUU;
	agony_internal var m_viewportWidth:Number;
	agony_internal var m_viewportHeight:Number;
	agony_internal var m_contentWidth:Number;
	agony_internal var m_contentHeight:Number;
	
	
	
	override agony_internal function doDispose() : void {
		this.displayObject.scrollRect = null;
		super.doDispose();
	}
	
	agony_internal function get orginX() : Number {
		return m_content.x - m_content.pivotX;
	}
	
	agony_internal function get orginY() : Number {
		return m_content.y - m_content.pivotY;
	}
	
	agony_internal function get lengthX() : Number {
		return m_viewportWidth - m_contentWidth;
	}
	
	agony_internal function get lengthY() : Number {
		return m_viewportHeight / Agony.getAdapter().pixelRatio - m_contentHeight;
	}
	
	agony_internal function ____doAdjust() : void {
		
	}
}
}