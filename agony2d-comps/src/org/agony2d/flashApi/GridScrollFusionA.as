package org.agony2d.flashApi {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.agony2d.core.INextUpdater;
	import org.agony2d.core.NextUpdaterManager;
	import org.agony2d.core.agony_internal;
	import org.agony2d.debug.Logger;
	import org.agony2d.input.ATouchEvent;
	import org.agony2d.input.Touch;
	import org.agony2d.input.TouchManager;
	import org.agony2d.notify.AEvent;
	import org.agony2d.timer.DelayManager;
	import org.agony2d.utils.MathUtil;
	import org.agony2d.view.core.UIManager;
	import org.agony2d.view.puppet.NineScalePuppet;
	
	use namespace agony_internal;
	
	[Event(name = "beginning", type = "org.agony2d.notify.AEvent")] // 开始滚动派发
	
	[Event(name = "unsuccess", type = "org.agony2d.notify.AEvent")] // 预滚动时结束派发
	
	[Event(name = "break", type = "org.agony2d.notify.AEvent")] // 延迟失效派发
	
	[Event(name = "complete", type = "org.agony2d.notify.AEvent")] // 完成派发
	
	/** [ GridScrollFusion ]
	 *  [◆]
	 * 		1.  limitLeft × limitRight × limitTop × limitBottom
	 * 		2.  content
	 *  	3.  scaleRatio
	 * 		4.  locked
	 * 		5.  contentWidth × contentHeight
	 * 		6.  correctionX × correctionY
	 * 		7.  horizRatio × vertiRatio
	 *  [◆◆]
	 * 		1.  stopScroll
	 *  	2.  updateAllThumbs
	 *  [★]
	 *  	a.  [ interactive ]恒定为true...发生滚屏后自动false...
	 */
	public class GridScrollFusionA extends PivotFusion {
		
		public function GridScrollFusionA( maskWidth:Number, maskHeight:Number, gridWidth:int, gridHeight:int, locked:Boolean = false, 
										  horizDisableOffset:int = 6, vertiDisableOffset:int = 6, scaleRatioLow:Number = 1, scaleRatioHigh:Number = 1 ) {
			m_content = new GridFusion(0, 0, maskWidth, maskHeight, gridWidth, gridHeight)
			//m_content = new PivotFusion
			this.addElementAt(m_content)-
			m_shell.scrollRect = new Rectangle(0, 0, maskWidth * m_pixelRatio, maskHeight * m_pixelRatio)
			m_spaceWidth = m_maskWidth  = m_contentWidth  = maskWidth
			m_spaceHeight = m_maskHeight = m_contentHeight = maskHeight
			m_horizDisableOffset = horizDisableOffset
			m_vertiDisableOffset = vertiDisableOffset
			if (scaleRatioLow > 1 || scaleRatioHigh < 1) {
				Logger.reportError(this, "constructor", "low or high scale ratio param occurs an error...")
			}
			m_scaleRatioLow = scaleRatioLow
			m_scaleRatioHigh = scaleRatioHigh
			m_locked = true
			this.locked = locked
			
			m_content.addEventListener(AEvent.X_Y_CHANGE, doResetViewport)
		}
		
		/** 滚屏界限限制，四方向 */
		public var reachLeft:Boolean
		public var reachRight:Boolean
		public var reachTop:Boolean
		public var reachBottom:Boolean
		
		public var horizReboundFactor:Number = 0.5
		public var vertiReboundFactor:Number = 0.5
		
		
		
		public function get content() : PivotFusion { 
			return m_content
		}
		
		public function get scaleRatio() : Number {
			return m_scaleRatio
		}
		
		public function set scaleRatio( v:Number ) : void {
			m_scaleRatio = m_content.scaleX = m_content.scaleY = v
		}
		
		public function get locked() : Boolean { 
			return m_locked 
		}
		
		public function set locked( b:Boolean ) : void {
			var touch:Touch
			
			if (m_locked != b) {
				m_locked = b
				if (b) {
					//AgonyUI.fusion.removeEventListener(AEvent.PRESS, ____onStart)
					TouchManager.getInstance().removeEventListener(ATouchEvent.NEW_TOUCH, ____onNewTouch)
					this.stopScroll()
				}
				else {
					TouchManager.getInstance().addEventListener(ATouchEvent.NEW_TOUCH, ____onNewTouch, SCROLL_PRIORITY)
					//AgonyUI.fusion.addEventListener(AEvent.PRESS, ____onStart, SCROLL_PRIORITY)
				}
			}
		}
		
		public function get singleTouchForMovement() : Boolean {
			return m_singleTouchForMovement
		}
		
		public function set singleTouchForMovement( b:Boolean ) : void {
			m_singleTouchForMovement = b
		}
		
		public function get multiTouchEnabled() : Boolean {
			return m_multiTouchEnabled
		}
		
		public function set multiTouchEnabled( b:Boolean ) : void {
			m_multiTouchEnabled = b
		}
		
		public function get delayTimeForDisable() : Number {
			return m_delayTimeForDisable
		}
		
		public function set delayTimeForDisable( v:Number ) : void {
			m_delayTimeForDisable = v
		}
		
		public function get contentWidth() : Number {
			return m_contentWidth
		}
		
		public function set contentWidth( v:Number ) : void { 
			m_contentWidth = (v < m_maskWidth ? m_maskWidth : v)
			if (m_horizPuppet) {
				m_horizPuppet.width = m_maskWidth * m_maskWidth / m_contentWidth / m_scaleRatio
			}
		}
		
		public function get contentHeight() : Number { 
			return m_contentHeight 
		}
		
		public function set contentHeight( v:Number ) : void { 
			m_contentHeight = (v < m_maskHeight ? m_maskHeight : v)
			if(m_vertiPuppet) {
				m_vertiPuppet.height = m_maskHeight * m_maskHeight / m_contentHeight / m_scaleRatio
			}
		}
		
		/** when scaleRatio equal 1，fixed by edge ]... */
		final public function get correctionX() : Number {
			var value:Number
			
			value = m_content.x
			if (value > 0) {
				return m_content.pivotX * m_scaleRatio - value
			}
			else if(value < this.lengthX) {
				return m_content.pivotX * m_scaleRatio + this.lengthX - value
			}
			return 0
		}
		
		/** when scaleRatio equal 1，fixed by edge ]... */
		final public function get correctionY() : Number {
			var value:Number
			
			value = m_content.y
			if (value > 0) {
				return m_content.pivotY * m_scaleRatio - value
			}
			else if(value < this.lengthY) {
				return m_content.pivotY * m_scaleRatio + this.lengthY - value
			}
			return 0
		}
		
		public function get horizRatio() : Number { 
			return MathUtil.getRatioBetween(this.orginX, 0, this.lengthX) 
		}
		
		public function set horizRatio( v:Number ) : void {
			m_content.x = v * this.lengthX
			this.doResetViewport()
			if (m_horizThumb) {
				m_horizPuppet.x =  v * (m_maskWidth - m_horizPuppet.width) * m_scaleRatio
			}
		}
		
		public function get vertiRatio() : Number { 
			return MathUtil.getRatioBetween(this.orginY, 0, this.lengthY)
		}
		
		public function set vertiRatio( v:Number ) : void {
			m_content.y = v * this.lengthY
			this.doResetViewport()
			if (m_vertiThumb) {
				m_vertiPuppet.y = v * (m_maskHeight - m_vertiPuppet.height) * m_scaleRatio
			}
		}
		
		override public function set rotation ( v:Number ) : void { 
			Logger.reportError(this, "rotation", "不可使用...!!") 
		}
		
		override public function set scaleX ( v:Number ) : void { 
			Logger.reportError(this, "scaleX", "不可使用...!!")
		}
		
		override public function set scaleY ( v:Number ) : void {
			Logger.reportError(this, "scaleY", "不可使用...!!") 
		}
		
		override public function set interactive ( b:Boolean ) : void {
			Logger.reportError(this, "interactive", "不可使用...!!") 
		}
		
		/** 滑块为九宫格傀儡 [ 垂直方向 ]... */
		public function getHorizThumb( dataName:String, length:Number, width:Number = -1 ) : Fusion {
			if (!m_horizThumb) {
				m_horizThumb = new Fusion
				m_horizThumb.interactive = false
				m_horizThumb.spaceWidth = length
				m_horizThumb.spaceHeight = width
				m_horizPuppet = new NineScalePuppet(dataName, length * m_maskWidth / m_contentWidth / m_scaleRatio, width)
				m_horizThumb.addElementAt(m_horizPuppet)
			}
			return m_horizThumb
		}
		
		/** 滑块为九宫格傀儡 [ 水平方向 ]... */
		public function getVertiThumb( dataName:String, length:Number, width:Number = -1 ) : Fusion {
			if (!m_vertiThumb) {
				m_vertiThumb = new Fusion
				m_vertiThumb.interactive = false
				m_vertiThumb.spaceWidth = width
				m_vertiThumb.spaceHeight = length
				m_vertiPuppet = new NineScalePuppet(dataName, width, length * m_maskHeight / m_contentHeight / m_scaleRatio)
				m_vertiThumb.addElementAt(m_vertiPuppet)
			}
			return m_vertiThumb
		}
		
		public function stopScroll() : void {
			var touch:Touch
			
			if (m_firstTouch) {
				m_firstTouch.removeEventListener(AEvent.RELEASE, ____onBreak)
				m_firstTouch.removeEventListener(AEvent.MOVE,    ____onPreMove)
				m_firstTouch = null
			}
			else if (m_numTouchs > 0) {
				for each(touch in m_touchList) {
					touch.removeEventListener(AEvent.MOVE,    ____onMove)
					touch.removeEventListener(AEvent.RELEASE, ____onRelease)
				}
				m_touchList.length = m_numTouchs = 0
			}
			if(m_allStopped){
				m_allStopped = false
				if(TouchManager.getInstance().hasEventListener(AEvent.CLEAR))
				{
					TouchManager.getInstance().removeEventListener(AEvent.CLEAR, onTouchClear)
				}
			}
			if (m_delayID >= 0) {
				DelayManager.getInstance().removeDelayedCall(m_delayID)
				m_delayID = -1
			}
			view.interactive = true
		}
		
		public function updateAllThumbs() : void {
			if (m_horizThumb) {
				m_horizPuppet.x = this.horizRatio * (m_maskWidth - m_horizPuppet.width)
				m_horizPuppet.width = m_maskWidth * m_maskWidth / m_contentWidth / m_scaleRatio
			}
			if (m_vertiThumb) {
				m_vertiPuppet.y = this.vertiRatio * (m_maskHeight - m_vertiPuppet.height)
				m_vertiPuppet.height = m_maskHeight * m_maskHeight / m_contentHeight / m_scaleRatio
			}
		}
		
		override public function drag( touch:Touch = null, bounds:Rectangle = null ) : void {
			Logger.reportError(this, "drag", "不可使用...!!")
		}
		
		override public function dragLockCenter( touch:Touch = null, bounds:Rectangle = null, offsetX:Number = 0, offsetY:Number = 0 ) : void {
			Logger.reportError(this, "dragLockCenter", "不可使用...!!")
		}
		
		override agony_internal function dispose() : void {
			this.locked = true
			m_shell.scrollRect = null;
			super.dispose()
		}
		
		
		agony_internal var m_content:GridFusion
		agony_internal var m_horizThumb:Fusion, m_vertiThumb:Fusion
		agony_internal var m_horizPuppet:NineScalePuppet, m_vertiPuppet:NineScalePuppet
		agony_internal var m_maskWidth:Number, m_maskHeight:Number, m_contentWidth:Number, m_contentHeight:Number, m_startX:Number, m_startY:Number, cachedScale:Number, cachedDist:Number, m_scaleRatioLow:Number, m_scaleRatioHigh:Number, m_scaleRatio:Number = 1
		agony_internal var m_horizDisableOffset:int, m_vertiDisableOffset:int
		agony_internal var m_locked:Boolean, m_allStopped:Boolean, m_singleTouchForMovement:Boolean = true
		agony_internal var m_multiTouchEnabled:Boolean = false
		
		
		private var m_firstTouch:Touch
		private var m_touchList:Array = []
		private var m_numTouchs:int
		private var m_delayTimeForDisable:Number = -1
		private var m_delayID:int = -1
		private const SCROLL_PRIORITY:int = 22000
		
		
		protected function ____onNewTouch( e:ATouchEvent ) : void {
			var global:Point
			var globalX:Number, globalY:Number
			
			// [ none ]...[ ready ]...[ scrolling ]...
			global = this.transformCoord(0, 0, false)
			globalX = global.x
			globalY = global.y
			m_startX = e.touch.stageX / m_pixelRatio
			m_startY = e.touch.stageY / m_pixelRatio
			if (m_startX < globalX || m_startX > globalX + m_maskWidth || m_startY < globalY || m_startY > globalY + m_maskHeight || m_allStopped) {
				return
			}
			
			// premove...
			if (m_numTouchs == 0 && !m_firstTouch) {
				m_firstTouch = e.touch
				m_firstTouch.addEventListener(AEvent.RELEASE, ____onBreak,   SCROLL_PRIORITY)
				m_firstTouch.addEventListener(AEvent.MOVE,    ____onPreMove, SCROLL_PRIORITY)
				//trace("first touch...")
				if (m_delayTimeForDisable > 0) {
					m_delayID = DelayManager.getInstance().delayedCall(m_delayTimeForDisable, doDelayForDisable)
				}
				this.m_view.m_notifier.dispatchDirectEvent(AEvent.BEGINNING)
			}
				// scrolling...
			else {
				if(m_multiTouchEnabled){
					if (m_firstTouch) {
						this.disableFirstTouch()
					}
					this.insertTouch(e.touch)
				}
				
				//trace("insert touch...")
				e.stopImmediatePropagation()
			}
		}
		
		protected function ____onBreak( e:AEvent ) : void {
			var touch:Touch
			
			m_firstTouch.removeEventListener(AEvent.RELEASE, ____onBreak)
			m_firstTouch.removeEventListener(AEvent.MOVE,    ____onPreMove)
			
			if (m_delayID >= 0) {
				DelayManager.getInstance().removeDelayedCall(m_delayID)
				m_delayID = -1
			}
			touch = UIManager.m_currTouch
			UIManager.m_currTouch = m_firstTouch
			this.view.m_notifier.dispatchDirectEvent(AEvent.UNSUCCESS)
			UIManager.m_currTouch = touch
			m_firstTouch = null
		}
		
		protected function ____onPreMove( e:AEvent ) : void {
			var touchX:Number, touchY:Number
			
			if(!m_singleTouchForMovement){
				return
				//trace("not singleTouchForMovement")
			}
			touchX = m_firstTouch.stageX / m_pixelRatio
			touchY = m_firstTouch.stageY / m_pixelRatio
			// 当发生触摸位移差达到一定条件时，start to scroll...
			if (Math.abs(touchX - m_startX) > m_horizDisableOffset || Math.abs(touchY - m_startY) > m_vertiDisableOffset) {
				this.disableFirstTouch()
			}
		}
		
		protected function ____onMove( e:AEvent ) : void {
			var touchA:Touch, touchB:Touch
			var distA:Number, orgin:Number, length:Number, ratio:Number
			var offsetX:Number, offsetY:Number
			
			touchA = e.target as Touch
			offsetX = (touchA.stageX - touchA.prevStageX) / m_pixelRatio
			offsetY = (touchA.stageY - touchA.prevStageY) / m_pixelRatio
			
//			trace("scroll..." + offsetX + " | " + offsetY)
			if (m_numTouchs == 1) {
				//			if(!m_singleTouchForMovement && m_firstTouch){
				//				return
				//			}
//				touchA = e.target as Touch
				m_content.x += offsetX
				m_content.y += offsetY
				this.view.m_notifier.dispatchDirectEvent(AEvent.DRAGGING)
//				trace(touchA)
			}
			else {
				touchA = m_touchList[m_numTouchs - 2]
				touchB = m_touchList[m_numTouchs - 1]
				m_content.setGlobalCoord((touchA.stageX + touchB.stageX) * .5 / m_pixelRatio, (touchA.stageY + touchB.stageY) * .5 / m_pixelRatio)
				if (m_scaleRatioLow != 1 || m_scaleRatioHigh != 1) {
					distA = MathUtil.getDistance(touchA.stageX, touchA.stageY, touchB.stageX, touchB.stageY)
					ratio = MathUtil.bound(cachedScale * distA / cachedDist, m_scaleRatioLow, m_scaleRatioHigh)
					if (ratio != m_scaleRatio) {
						m_scaleRatio = m_content.scaleX = m_content.scaleY = ratio
					}
					else {
						cachedScale = m_scaleRatio
						cachedDist = MathUtil.getDistance(touchA.stageX, touchA.stageY, touchB.stageX, touchB.stageY)
					}
				}
				this.view.m_notifier.dispatchDirectEvent(AEvent.DRAGGING)
			}
			orgin   =  this.orginX
			length  =  this.lengthX
			if(!reachLeft && orgin > 0){
				m_content.x = m_content.pivotX * m_scaleRatio
				reachLeft = true
//				trace("[ reachLeft ]... true")
				
			}
			else if(!reachRight && orgin < length){
				m_content.x = length + m_content.pivotX * m_scaleRatio
				reachRight = true
//				trace("[ reachRight ]... true")
			
			}
			else{
				if(orgin > 0 || orgin < length){
					m_content.x -= offsetX * horizReboundFactor
				}
				else{
					reachLeft = reachRight = false
//					trace("[ horzi ]... false")
				}
			}
//			if (orgin > 0 && (limitLeft || m_scaleRatio != 1)) {
//				m_content.x = m_content.pivotX * m_scaleRatio
//			}
//			else if(orgin < length && (limitRight || m_scaleRatio != 1)) {
//				m_content.x = length + m_content.pivotX * m_scaleRatio
//				this.m_view.m_notifier.dispatchDirectEvent(AEvent.RIGHT)
//			}
			orgin   =  this.orginY
			length  =  this.lengthY
			if(!reachTop && orgin > 0){
				m_content.y = m_content.pivotY * m_scaleRatio
				reachTop = true
//				trace("[ reachTop ]... true")
				
			}
			else if(!reachBottom && orgin < length){
				m_content.y = length + m_content.pivotY * m_scaleRatio
				reachBottom = true
//				trace("[ reachBottom ]... true")
				
			}
			else{
				if(orgin > 0 || orgin < length){
					m_content.y -= offsetY * vertiReboundFactor
				}
				else{
					reachTop = reachBottom = false
//					trace("[ verti ]... false")
				}
			}
//			if (orgin > 0 && (limitTop || m_scaleRatio != 1)) {
//				m_content.y = m_content.pivotY * m_scaleRatio
//				this.m_view.m_notifier.dispatchDirectEvent(AEvent.TOP)
//			}
//			else if (orgin < length && (limitBottom || m_scaleRatio != 1)) {
//				m_content.y = length + m_content.pivotY * m_scaleRatio
//				this.m_view.m_notifier.dispatchDirectEvent(AEvent.BOTTOM)
//				//trace("bottom...")
//			}
			//this.updateAllThumbs()
			e.stopImmediatePropagation()
			//this.doResetViewport()
			//Logger.reportMessage(this, this.horizRatio + " | " + this.vertiRatio)
		}
		
		
		protected function ____onRelease( e:AEvent ) : void {
			var index:int
			
			index = m_touchList.indexOf(e.target)
			m_touchList[index] = m_touchList[--m_numTouchs]
			//		m_touchList.pop()
			if (m_numTouchs == 0) {
				view.interactive = true
				UIManager.m_currTouch = m_touchList.pop()
				this.view.m_notifier.dispatchDirectEvent(AEvent.COMPLETE)
				UIManager.m_currTouch = null
			}
			else {
				m_touchList.pop()
				this.resetTouchs()
			}
			e.stopImmediatePropagation()
		}
		
		protected function insertTouch( touch:Touch ) : void {
			m_touchList[m_numTouchs++] = touch
			touch.addEventListener(AEvent.MOVE,    ____onMove,    SCROLL_PRIORITY)
			touch.addEventListener(AEvent.RELEASE, ____onRelease, SCROLL_PRIORITY)
			this.resetTouchs()
			//Logger.reportMessage(this, "numTouchs: " + m_numTouchs)
		}
		
		protected function resetTouchs() : void {
			var touchA:Touch, touchB:Touch
			
			if (m_numTouchs >= 2) {
				touchA = m_touchList[m_numTouchs - 2]
				touchB = m_touchList[m_numTouchs - 1]
				cachedScale = m_scaleRatio
				cachedDist = MathUtil.getDistance(touchA.stageX, touchA.stageY, touchB.stageX, touchB.stageY)
				m_content.setPivot((touchA.stageX + touchB.stageX) / m_pixelRatio * .5, (touchA.stageY + touchB.stageY) / m_pixelRatio * .5, true)
				//			Logger.reportMessage(this, m_content.x + " | " + m_content.y + "__" + m_content.pivotX + " | " + m_content.pivotY)
			}
		}
		
		protected function doResetViewport(e:AEvent = null) : void {
			var point:Point
			
			point = this.transformCoord(0, 0, false)
			point = m_content.transformCoord(point.x, point.y)
			m_content.setViewport(point.x, point.y)
		}
		
		protected function disableFirstTouch() : void {
			UIManager.removeAllTouchs()
			m_firstTouch.removeEventListener(AEvent.RELEASE, ____onBreak)
			m_firstTouch.removeEventListener(AEvent.MOVE,    ____onPreMove)
			m_firstTouch.dispatchDirectEvent(AEvent.RELEASE)
			m_firstTouch.removeAllListeners()
			this.insertTouch(m_firstTouch)
			m_firstTouch = null
			view.interactive = false
			if (m_delayID >= 0) {
				DelayManager.getInstance().removeDelayedCall(m_delayID)
				m_delayID = -1
			}
			this.m_view.m_notifier.dispatchDirectEvent(AEvent.START_DRAG)
		}
		
		protected function doDelayForDisable() : void {
			m_delayID = -1
			m_firstTouch.removeEventListener(AEvent.RELEASE, ____onBreak)
			m_firstTouch.removeEventListener(AEvent.MOVE,    ____onPreMove)
			m_firstTouch = null
			m_allStopped = true
			TouchManager.getInstance().addEventListener(AEvent.CLEAR, onTouchClear)
			this.view.m_notifier.dispatchDirectEvent(AEvent.BREAK)
		}
		
		private function onTouchClear( e:AEvent ) : void {
			m_allStopped = false
			if(TouchManager.getInstance().hasEventListener(AEvent.CLEAR))
			{
				TouchManager.getInstance().removeEventListener(AEvent.CLEAR, onTouchClear)
			}
		}
		
		private function get orginX() : Number {
			return m_content.x - m_content.pivotX * m_scaleRatio
		}
		
		private function get orginY() : Number {
			return m_content.y - m_content.pivotY * m_scaleRatio
		}
		
		/** horiz scrollable length [ minus ]... */
		private function get lengthX() : Number {
			return m_maskWidth - m_contentWidth * m_scaleRatio
		}
		
		/** verti scrollable length [ minus ]... */
		private function get lengthY() : Number {
			return m_maskHeight - m_contentHeight * m_scaleRatio
		}
	}
}
