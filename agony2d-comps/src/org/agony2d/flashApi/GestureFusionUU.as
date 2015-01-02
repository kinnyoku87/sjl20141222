package org.agony2d.flashApi {
	import flash.geom.Point;
	
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
	
public class GestureFusionUU extends PivotFusionUU {
	
    public static const MOVEMENT : int  =  0x01;
	public static const SCALE : int     =  0x02;
	public static const ROTATE : int    =  0x04;
	
	/** 手勢類型. */
	public function get gestureType() : int {
		return m_gesType 
	}
	
	public function set gestureType( v:int ) : void {
		var touch:Touch;
		var boo_A:Boolean;
		var boo_B:Boolean;
		
		if (m_gesType != v) {
			boo_A  =  (m_gesType & MOVEMENT) || (m_gesType & SCALE) || (m_gesType & ROTATE);
			boo_B  =  (v & MOVEMENT) || (v & SCALE) || (v & ROTATE);
			// none - has.
			if (!boo_A && boo_B) {
				this.addEventListener(ATouchEvent.PRESS, ____onPress, UU_DRAG);
			}
			// has - none.
			else if(boo_A && !boo_B) {
				this.removeEventListener(ATouchEvent.PRESS, ____onPress);
				this.doClearAllTouches();
			}
			m_gesType = v;
		}
	}
	
	/** 被按下時，是否自動將其顯示層級提高到最高層. */
	public function get autoUpdateLayer() : Boolean {
		return m_autoUpdateLayer;
	}
	
	public function set autoUpdateLayer( b:Boolean ) : void {
		m_autoUpdateLayer = b;
	}
	
	/** 手動加入觸摸.
	 * @param	touch
	 */
	public function addTouch( touch:Touch ) : void {
		if(!touch){
			LogMachine.g_instance.error(this,"addTouch","Null touch !!!")
		}
		if ((m_gesType & MOVEMENT) || (m_gesType & SCALE) || (m_gesType & ROTATE)) {
//			if (m_numTouchs == 0) {
//				this.addEventListener(ATouchEvent.OVERLAY_PRESS, ____onOverlayPress, UUTouchPriority.DISPLAY_DRAG_PRIORITY);
//			}
			this.doInsertTouch(touch);
		}
	}
	
	/** 移除全部觸摸.
	 */
	public function removeAllTouches() : void {
		this.doClearAllTouches();
	}
	
	
	
	/** @private */
    agony_internal var m_gesType:int;
	/** @private */
	agony_internal var m_touchList:Array = [];
	/** @private */
	agony_internal var m_numTouchs:int;
	/** @private */
	agony_internal var m_cachedDist:Number;
	/** @private */
	agony_internal var m_cachedScale:Number;
	/** @private */
	agony_internal var m_isGesHappened:Boolean;
	/** @private */
	agony_internal var m_cachedPoint_A:Point;
	/** @private */
	agony_internal var m_cachedPoint_B:Point;
	/** @private */
	agony_internal var m_autoUpdateLayer:Boolean;
	///** @private */
	//agony_internal var m_autoBreakNodeEvent:Boolean;
	
	
	
	/** @private */
	final agony_internal function doClearAllTouches() : void {
		var touch:Touch;
		
		if (m_numTouchs > 0) {
//			this.removeEventListener(ATouchEvent.OVERLAY_PRESS, ____onOverlayPress);
			for each(touch in m_touchList) {
				touch.removeEventListener(AEvent.CHANGE,   ____onTouchChange);
				touch.removeEventListener(AEvent.COMPLETE, ____onTouchComplete);
			}
			m_touchList.length = m_numTouchs = 0;
		}
	}
	
	/** @private */
	final agony_internal function ____onPress( e:ATouchEvent ) : void {
		if (m_autoUpdateLayer) {
			this.parent.setNodeIndex(this, this.parent.numNodes - 1);
		}
//		this.touchable = false;
//		this.addEventListener(ATouchEvent.OVERLAY_PRESS, ____onOverlayPress, UUTouchPriority.DISPLAY_DRAG_PRIORITY);
		this.doInsertTouch(e.touch);
//		trace("first press");
	}
	
	/** @private */
//	final agony_internal function ____onOverlayPress( e:ATouchEvent ) : void {
//		if (m_autoUpdateLayer) {
//			this.parent.setNodeIndex(this, this.parent.numNodes - 1);
//		}
//		this.doInsertTouch(e.touch);
//		trace("overlay press");
//	}
	
	/** @private */
	final agony_internal function doInsertTouch( touch:Touch ) : void {
		//touch.unbinding(false);
		m_touchList[m_numTouchs++] = touch;
		touch.addEventListener(AEvent.CHANGE,   ____onTouchChange,   UU_DRAG);
		touch.addEventListener(AEvent.COMPLETE, ____onTouchComplete, UU_DRAG);
		this.doUpdateTouches();
	}
	
	/** @private */
	final agony_internal function ____onTouchChange( e:AEvent ) : void {
		var touch_A:Touch;
		var touch_B:Touch;
		var distA:Number;
		var currentAngle:Number;
		var previousAngle:Number;
		
		//if (m_autoBreakNodeEvent) {
			//e.breakExecution();
		//}
		if (m_numTouchs <= 1) {
			if(m_gesType & MOVEMENT) {
				touch_A  =  e.target as Touch;
				this.x  +=  touch_A.rootX - touch_A.prevRootX;
				this.y  +=  touch_A.rootY - touch_A.prevRootY;
				g_touchEvt.m_touch = touch_A;
				if (!m_isGesHappened) {
					m_isGesHappened  =  true;
					g_touchEvt.m_type   =  ATouchEvent.START_DRAG;
					this.dispatchEvent(g_touchEvt);
				}
				g_touchEvt.m_type = ATouchEvent.DRAGGING;
				this.dispatchEvent(g_touchEvt);
				
				trace(this.x, this.y);
			}
		}
		else {
			touch_A  =  m_touchList[m_numTouchs - 2];
			touch_B  =  m_touchList[m_numTouchs - 1];
			if (e.m_target != touch_A && e.m_target != touch_B) {
				return;
			}
			g_touchEvt.m_touch = e.m_target as Touch;
			if (!m_isGesHappened) {
				m_isGesHappened  =  true;
				g_touchEvt.m_type   =  ATouchEvent.START_DRAG;
				this.dispatchEvent(g_touchEvt);
			}
			g_touchEvt.m_type = ATouchEvent.DRAGGING;
			this.dispatchEvent(g_touchEvt);
			if (m_gesType & MOVEMENT) {
				this.doSetGlobalCoord((touch_A.rootX + touch_B.rootX) * .5, (touch_A.rootY + touch_B.rootY) * .5);
//				trace("MOVEMENT");
			}
			if (m_gesType & ROTATE) {
				if(!m_cachedPoint_A){
					m_cachedPoint_A  =  new Point;
					m_cachedPoint_B  =  new Point;
				}
				m_cachedPoint_A  =  this.globalToLocal(touch_A.m_stageX, touch_A.m_stageY, m_cachedPoint_A);
				m_cachedPoint_B  =  this.globalToLocal(touch_B.m_stageX, touch_B.m_stageY, m_cachedPoint_B);
				m_cachedPoint_A  =  m_cachedPoint_A.subtract(m_cachedPoint_B);	
				currentAngle     =  Math.atan2(m_cachedPoint_A.y, m_cachedPoint_A.x);
				
				m_cachedPoint_A  =  this.globalToLocal(touch_A.m_prevStageX, touch_A.m_prevStageY, m_cachedPoint_A);
				m_cachedPoint_B  =  this.globalToLocal(touch_B.m_prevStageX, touch_B.m_prevStageY, m_cachedPoint_B);
				m_cachedPoint_A  =  m_cachedPoint_A.subtract(m_cachedPoint_B);
                previousAngle    =  Math.atan2(m_cachedPoint_A.y, m_cachedPoint_A.x);
				
				this.rotation += (currentAngle - previousAngle) * 180 / Math.PI;
//				trace("ROTATE");
			}
			if (m_gesType & SCALE) {
				distA = Math.sqrt((touch_A.m_stageX - touch_B.m_stageX) * (touch_A.m_stageX - touch_B.m_stageX) + (touch_A.m_stageY - touch_B.m_stageY) * (touch_A.m_stageY - touch_B.m_stageY));
				this.scaleX = this.scaleY = m_cachedScale * distA / m_cachedDist;
//				trace("SCALE");
			}
		}
	}
	
	/** @private */
	final agony_internal function ____onTouchComplete( e:AEvent ) : void {
		var index:int;
		
		//if (m_autoBreakNodeEvent) {
			//e.breakExecution();
		//}
		index               =  m_touchList.indexOf(e.target);
		m_touchList[index]  =  m_touchList[--m_numTouchs];
		m_touchList.pop();
		if (m_numTouchs == 0) {
//			this.removeEventListener(ATouchEvent.OVERLAY_PRESS, ____onOverlayPress);
			m_isGesHappened   =  false;
//			this.touchable  =  true;
			g_touchEvt.m_touch   =  e.m_target as Touch;
			g_touchEvt.m_type    =  ATouchEvent.STOP_DRAG;
			this.dispatchEvent(g_touchEvt);
		}
		else {
			this.doUpdateTouches();
		}
	}
	
	/** @private */
	final agony_internal function doUpdateTouches() : void {
		var touch_A:Touch;
		var touch_B:Touch;
		
//		trace(m_numTouchs)
		if (m_numTouchs >= 2) {
			touch_A        =  m_touchList[m_numTouchs - 2];
			touch_B        =  m_touchList[m_numTouchs - 1];
			m_cachedScale  =  this.scaleX;
			m_cachedDist   =  Math.sqrt((touch_A.m_stageX - touch_B.m_stageX) * (touch_A.m_stageX - touch_B.m_stageX) + (touch_A.m_stageY - touch_B.m_stageY) * (touch_A.m_stageY - touch_B.m_stageY));
			if(m_gesType & MOVEMENT) {
				this.____doSetPivotWithKeepingCoord((touch_A.rootX + touch_B.rootX) * .5, (touch_A.rootY + touch_B.rootY) * .5, true);
			}
			else{
				this.____doSetPivotWithKeepingCoord(this.width * .5, this.height * .5, false);
			}
		}
		else {
			touch_A = m_touchList[0];
			this.____doSetPivotWithKeepingCoord(touch_A.rootX, touch_A.rootY, true);
		}
	}
	
	/**
	 * @private
	 * 改變pivot屬性時，座標也會隨之變化，使其"全局效果"不產生變化.
	 */
	agony_internal function ____doSetPivotWithKeepingCoord( pivX:Number, pivY:Number, global:Boolean ) : void {
		var point:Point
		
		g_cachedPoint.setTo(pivX * g_pixelRatio, pivY * g_pixelRatio);
		if (global) {
			point      =  m_pivotFusionFlashView.m_child.globalToLocal(g_cachedPoint);
			m_pivotX   =  point.x / g_pixelRatio;
			m_pivotY   =  point.y / g_pixelRatio;
			m_pivotFusionFlashView.m_child.x  =  -point.x;
			m_pivotFusionFlashView.m_child.y  =  -point.y;
		}
		else {
			g_cachedPoint  =  m_pivotFusionFlashView.m_child.localToGlobal(g_cachedPoint);
			m_pivotX       =  pivX;
			m_pivotY       =  pivY;
			m_pivotFusionFlashView.m_child.x  =  -pivX * g_pixelRatio;
			m_pivotFusionFlashView.m_child.y  =  -pivY * g_pixelRatio;
		}
		point   =  m_pivotFusionFlashView.parent ? m_pivotFusionFlashView.parent.globalToLocal(g_cachedPoint) : g_cachedPoint;
		m_pivotFusionFlashView.x  =  point.x 
		m_pivotFusionFlashView.y  =  point.y
	}
}
}