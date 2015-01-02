package org.agony2d.flashApi {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.inside.event_internal;
	import org.agony2d.inputs.Touch;
	import org.agony2d.inputs.events.ATouchEvent;
    
	use namespace agony_internal;
	use namespace event_internal;
	
	/** 開始拖動時觸發. */
	[Event(name = "startDrag", type = "org.agony2d.inputs.events.ATouchEvent")]
	
	/** 拖動中觸發. */
	[Event(name = "dragging",  type = "org.agony2d.inputs.events.ATouchEvent")]
	
	/** 結束拖動時觸發. */
	[Event(name = "stopDrag",  type = "org.agony2d.inputs.events.ATouchEvent")]
	
public class DragFusionUU extends FusionUU {
    
	/**
	 * 開始拖動.
	 * 
	 * @param touch
	 * @param	bounds	相對於父節點.
	 * @param	offsetX
	 * @param	offsetY
	 * @param	isLockTouchCenter
	 */
	public function startDrag( touch:Touch, bounds:Rectangle = null, offsetX:Number = 0, offsetY:Number = 0, isLockTouchCenter:Boolean = false) : void {
		var global:Point;
		var rootX:Number;
		var rootY:Number;
		
		this.doReadyToDrag(touch, bounds);
		rootX  =  touch.rootX;
		rootY  =  touch.rootY;
		if (isLockTouchCenter) {
			this.doSetGlobalCoord(rootX + offsetX - this.spaceWidth / 2, rootY + offsetY - this.spaceHeight / 2);
			m_draggingOffsetX  =  this.spaceWidth  / 2 - offsetX;
			m_draggingOffsetY  =  this.spaceHeight / 2 - offsetY;
		}
		else {
			global = this.localToGlobal(0, 0);
			if (offsetX != 0 || offsetY != 0) {
				this.doSetGlobalCoord(global.x + offsetX, global.y + offsetY);
				m_draggingOffsetX  =  rootX - global.x - offsetX;
				m_draggingOffsetY  =  rootY - global.y - offsetY;
			}
			else {
				m_draggingOffsetX  =  rootX - global.x;
				m_draggingOffsetY  =  rootY - global.y;
			}
		}
	}
	
	/** 停止拖動.
	 * @param	fireEvent
	 */
	public function stopDrag( fireEvent:Boolean = false ) : void {
		if (m_touch) {
			m_touch.removeEventListener(AEvent.CHANGE,   ____onDragging);
			m_touch.removeEventListener(AEvent.COMPLETE, ____onDragComplete);
			m_isDragHappened = false;
			if (fireEvent) {
				g_touchEvt.m_touch  =  m_touch;
				g_touchEvt.m_type   =  ATouchEvent.STOP_DRAG;
				this.dispatchEvent(g_touchEvt);
			}
			m_touch = null;
		}
	}
	
	
	
	
	/** @private */
	agony_internal var m_touch:Touch;
	/** @private */
	agony_internal var m_boundsX:Number;
	/** @private */
	agony_internal var m_boundsY:Number;
	/** @private */
	agony_internal var m_boundsWidth:Number;
	/** @private */
	agony_internal var m_boundsHeight:Number;
	/** @private */
	agony_internal var m_draggingOffsetX:Number;
	/** @private */
	agony_internal var m_draggingOffsetY:Number;
	/** @private */
	agony_internal var m_isDragHappened:Boolean;
	/** @private */
	agony_internal var m_oldTouchable:Boolean;
	
	
	
	/** @private */
	override agony_internal function doDispose() : void {
		this.stopDrag();
		super.doDispose();
	}
	
	/** @private */
	final agony_internal function doReadyToDrag( touch:Touch, bounds:Rectangle ) : void {
		if (m_touch) {
			LogMachine.g_instance.error(this, "doReadyToDrag", "Node has been started to drag !!!")
		}
		if (!touch || touch.m_isReleaseState) {
			LogMachine.g_instance.error(this, "doReadyToDrag", "Error touch !!!")
		}
		m_oldTouchable  =  this.touchable;
		this.touchable  =  false;
		m_touch           =  touch;
		if (bounds) {
			m_boundsX       =  bounds.x;
			m_boundsY       =  bounds.y;
			m_boundsWidth   =  bounds.width;
			m_boundsHeight  =  bounds.height;
		}
		else {
			m_boundsX       =  -Infinity;
			m_boundsY       =  -Infinity;
			m_boundsWidth   =   Infinity;
			m_boundsHeight  =   Infinity;
		}
		m_touch.addEventListener(AEvent.CHANGE,   ____onDragging,     UU_DRAG);
		m_touch.addEventListener(AEvent.COMPLETE, ____onDragComplete, UU_DRAG);
	}
	
	/** @private */
	final agony_internal function ____onDragging( e:AEvent ) : void {
		var touchX:Number;
		var touchY:Number;
		var coordX:Number;
		var coordY:Number;
		var isInBounds:Boolean;
		
		touchX      =  m_touch.rootX;
		touchY      =  m_touch.rootY;
		g_cachedPoint = this.parent.globalToLocal(touchX, touchY, g_cachedPoint);
		coordX = g_cachedPoint.x;
		coordY = g_cachedPoint.y;
		isInBounds  =  !(coordX < m_boundsX + m_draggingOffsetX || coordX > m_boundsX + m_boundsWidth + m_draggingOffsetX || coordY < m_boundsY + m_draggingOffsetY || coordY > m_boundsY + m_boundsHeight + m_draggingOffsetY);
		if (isInBounds) {
			//this.doSetGlobalCoord(touchX - m_draggingOffsetX, touchY - m_draggingOffsetY);
			this.x = coordX - m_draggingOffsetX;
			this.y = coordY - m_draggingOffsetY;
		}
		else {
			if (coordX < m_boundsX + m_draggingOffsetX) {
				coordX = m_boundsX + m_draggingOffsetX;
			}
			else if (coordX > m_boundsX + m_boundsWidth + m_draggingOffsetX) {
				coordX = m_boundsX + m_boundsWidth + m_draggingOffsetX;
			}
			if (coordY < m_boundsY + m_draggingOffsetY) {
				coordY = m_boundsY + m_draggingOffsetY;
			}
			else if (coordY > m_boundsY + m_boundsHeight + m_draggingOffsetY) {
				coordY = m_boundsY + m_boundsHeight + m_draggingOffsetY;
			}
			//this.doSetGlobalCoord(touchX - m_draggingOffsetX, touchY - m_draggingOffsetY)
			this.x = coordX - m_draggingOffsetX;
			this.y = coordY - m_draggingOffsetY;
		}
		g_touchEvt.m_touch = e.m_target as Touch;
		if (!m_isDragHappened) {
			m_isDragHappened   =  true;
			g_touchEvt.m_type  =  ATouchEvent.START_DRAG;
			this.dispatchEvent(g_touchEvt);
		}
		g_touchEvt.m_type = ATouchEvent.DRAGGING;
		this.dispatchEvent(g_touchEvt);
	}
	
	/** @private */
	final agony_internal function ____onDragComplete( e:AEvent ) : void {
		m_isDragHappened  =  false;
		m_touch           =  null;
		g_touchEvt.m_touch   =  e.m_target as Touch;
		g_touchEvt.m_type    =  ATouchEvent.STOP_DRAG;
		this.dispatchEvent(g_touchEvt);
		if (m_oldTouchable) {
			this.touchable = true
		}
	}
}
}