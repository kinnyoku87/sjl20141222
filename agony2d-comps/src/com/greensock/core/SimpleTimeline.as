package com.greensock.core {
	
	public class SimpleTimeline extends TweenCore {
		protected var _firstChild:TweenCore;
		protected var _lastChild:TweenCore;
		public var autoRemoveChildren:Boolean; 
		
		public function SimpleTimeline(vars:Object=null) {
			super(0, vars);
		}
		
		/** @private **/
		public function addChild(tween:TweenCore):void {
			if (!tween.cachedOrphan && tween.timeline) {
				tween.timeline.remove(tween, true); //removes from existing timeline so that it can be properly added to this one.
			}
			tween.timeline = this;
			if (tween.gc) {
				tween.setEnabled(true, true);
			}
			if (_firstChild) {
				_firstChild.prevNode = tween;	
			} 
			tween.nextNode = _firstChild;
			_firstChild = tween;
			tween.prevNode = null;
			tween.cachedOrphan = false;
		}
		
		/** @private **/
		public function remove(tween:TweenCore, skipDisable:Boolean=false):void {
			if (tween.cachedOrphan) {
				return; //already removed!
			} else if (!skipDisable) {
				tween.setEnabled(false, true);
			}
			
			if (tween.nextNode) {
				tween.nextNode.prevNode = tween.prevNode;
			} else if (_lastChild == tween) {
				_lastChild = tween.prevNode;
			}
			if (tween.prevNode) {
				tween.prevNode.nextNode = tween.nextNode;
			} else if (_firstChild == tween) {
				_firstChild = tween.nextNode;
			}
			tween.cachedOrphan = true;
			//don't null nextNode and prevNode, otherwise the chain could break in rendering loops.
		}
		
		/** @private **/
		override public function renderTime(time:Number, suppressEvents:Boolean=false, force:Boolean=false):void {
			var tween:TweenCore = _firstChild, dur:Number, next:TweenCore;
			//trace(time)
			this.cachedTotalTime = time;
			this.cachedTime = time;
			
			while (tween) {
				next = tween.nextNode; //record it here because the value could change after rendering...
				if (tween.active || (time >= tween.cachedStartTime && !tween.cachedPaused && !tween.gc)) {
					if (!tween.cachedReversed) {
						tween.renderTime((time - tween.cachedStartTime) * tween.cachedTimeScale, suppressEvents, false);
					} 
					else {
						dur = (tween.cacheIsDirty) ? tween.totalDuration : tween.cachedTotalDuration;
						tween.renderTime(dur - ((time - tween.cachedStartTime) * tween.cachedTimeScale), suppressEvents, false);
					}
				}
				tween = next;
			}
			
		}
		
		public function get rawTime():Number {
			return this.cachedTotalTime;			
		}
		
	}
}