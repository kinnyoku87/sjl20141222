package org.agony2d.flashApi {
	import flash.geom.Rectangle;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.core.AbstractRangeUU;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.inputs.Touch;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.models.ARange;
	
	use namespace agony_internal;
	
	// Range組件的相關偵聽:
	
	// Issue 1:
	//   輔助按鈕以何種方式加入?
	
	// 1. addRangeMinusListeners
	// 2. addRangeStraightMinusListeners
	// 3. addRangePlusListeners
	// 4. addRangeStraightPlusListeners
	// 5. removeRangeListeners
	
	// Issue 2:
	//   滑動條以何種方式加入?
	//     1. 滑動條的最原始狀態，就是一個可拖動的thumb.
	//     2. thumb的原始坐標即為最小值.
public class SliderUU extends AbstractRangeUU {
	
	private var sliderHeight:Number;
	public function SliderUU( isHorzi:Boolean , _height:Number = 100) {
		super();
		m_dragBounds = new Rectangle;
		m_isHorzi = isHorzi;
		
		m_thumb = new DragFusionUU;
		this.addNode(m_thumb);
		m_thumb.addEventListener(ATouchEvent.PRESS, ____onPressThumb);
		sliderHeight = _height;
		
		this.____onModelChanged(null);
	}
	
	public function get thumbHeight():Number {
		return m_thumbHeight;
	}
	
	public function set thumbHeight( v:Number ):void {
		m_thumbHeight = v > sliderHeight ? sliderHeight : v;	
		dragOffsetValue = sliderHeight - m_thumbHeight;
		m_thumb.visible  = m_thumbHeight < sliderHeight ? true : false;
		
	}
	
	/** 滑動偏移量. */
	public function get dragOffsetValue() : Number {
		return m_isHorzi ? m_dragBounds.width : m_dragBounds.height;
	}
	
	public function set dragOffsetValue( v:Number ) : void {
		if (m_isHorzi) {
			if (v < 0) {
				m_dragBounds.x = v;
				m_dragBounds.width = -v;
			}
			else {
				m_dragBounds.width = v;
			}
		}
		else {
			if (v < 0) {
				m_dragBounds.y = v;
				m_dragBounds.height = -v;
			}
			else {
				m_dragBounds.height = v;
			}
		}
	}
	
	/** 可拖動的滑塊. */
	public function getThumb() : DragFusionUU {
		return m_thumb;
	}
	
	
	/**
	 * 加入按下減小偵聽.
	 * 
	 * @param	target
	 */
	public function addRangeMinusListeners( target:NodeUU, isClick:Boolean = false ) : void {
		
	}
	
	/**
	 * 加入按住連續減小偵聽.
	 * 
	 * @param	target
	 */
	public function addRangeStraightMinusListeners( target:NodeUU ) : void {
		
	}
	
	/**
	 * 加入按下增大偵聽.
	 * 
	 * @param	target
	 */
	public function addRangePlusListeners( target:NodeUU, isClick:Boolean = false ) : void {
		
	}
	
	/**
	 * 加入按住連續增大偵聽.
	 * 
	 * @param	target
	 */
	public function addRangeStraightPlusListeners( target:NodeUU ) : void {
		
	}
	
	/**
	 * 移除一個目標全部相關偵聽.
	 * 
	 * @param	target
	 */
	public function removeRangeListeners( target:NodeUU ) : void {
		
	}
	
	
	
	agony_internal var m_thumb:DragFusionUU;
	agony_internal var m_dragBounds:Rectangle;
	agony_internal var m_isHorzi:Boolean;
	agony_internal var m_thumbHeight:Number;
	
	
	override agony_internal function doDispose():void {
		m_thumb = null;
		super.doDispose();
	}
	
	/** @private */
	override agony_internal function ____onModelChanged( e:AEvent ) : void {
		if (m_isHorzi) {
			if (m_dragBounds.x < 0) {
				m_thumb.x = m_dragBounds.x + m_dragBounds.width * (1 - m_model.ratio);
			}
			else {
				m_thumb.x = m_dragBounds.width * m_model.ratio;
			}
		}
		else {
			if (m_dragBounds.y < 0) {
				m_thumb.y = m_dragBounds.y + m_dragBounds.height * (1 - m_model.ratio);
			}
			else {
				m_thumb.y = m_dragBounds.height * m_model.ratio;
			}
		}
	}
	
	agony_internal function ____onPressThumb( e:ATouchEvent ) : void {
		var touch:Touch;
		
		touch = e.touch;
		m_thumb.startDrag(touch, m_dragBounds);
		touch.addEventListener(AEvent.CHANGE, ____onDragging);
		touch.addEventListener(AEvent.COMPLETE, ____onStopDrag);
		
	}
	
	agony_internal function ____onDragging( e:AEvent ) : void {
		if (!m_thumb) {
			return;
		}
		if (m_isHorzi) {
			if (m_dragBounds.x < 0) {
				m_model.ratio = 1 - (m_thumb.x - m_dragBounds.x) / m_dragBounds.width;
			}
			else {
				m_model.ratio = m_thumb.x / m_dragBounds.width;
			}
		}
		else {
			if (m_dragBounds.y < 0) {
				m_model.ratio = 1 - (m_thumb.y - m_dragBounds.y) / m_dragBounds.height;
			}
			else {
				m_model.ratio = m_thumb.y / m_dragBounds.height;
			}
		}
		//trace(m_model.ratio);
	}
	
	agony_internal function ____onStopDrag( e:AEvent ) : void {
		if (!m_thumb) {
			return;
		}
		m_thumb.stopDrag();
	}
	
	
}
}