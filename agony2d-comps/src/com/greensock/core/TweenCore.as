package com.greensock.core {
	import com.greensock.*;
	
public class TweenCore {
	
	public function TweenCore(duration:Number=0, vars:Object=null) {
		this.vars = (vars != null) ? vars : { };
		// duration
		this.cachedDuration = this.cachedTotalDuration = duration;
		// delay
		_delay = (this.vars.delay) ? Number(this.vars.delay) : 0;
		this.cachedTimeScale = (this.vars.timeScale) ? Number(this.vars.timeScale) : 1;
		
		this.active = Boolean(duration == 0 && _delay == 0 && this.vars.immediateRender != false);
		this.cachedTotalTime = this.cachedTime = 0;
		this.data = this.vars.data;
		
		// TweenLite初期化
		if (!_classInitted) {
			if (isNaN(TweenLite.rootFrame)) {
				TweenLite.initClass();
				_classInitted = true;
			} else {
				return;
			}
		}
		
		// add to time line
		var tl:SimpleTimeline = (this.vars.timeline is SimpleTimeline) ? this.vars.timeline : (this.vars.useFrames) ? TweenLite.rootFramesTimeline : TweenLite.rootTimeline;
		this.cachedStartTime = tl.cachedTotalTime + _delay;
		tl.addChild(this);
		
		// reverse
		if (this.vars.reversed) {
			this.cachedReversed = true;
		}
		// pause
		if (this.vars.paused) {
			this.paused = true;
		}
	}
	
	public function renderTime(time:Number, suppressEvents:Boolean=false, force:Boolean=false):void {
		
	}
	
	public function complete(skipRender:Boolean=false, suppressEvents:Boolean=false):void {
		// 跳過渲染
		if (!skipRender) {
			renderTime(this.totalDuration, suppressEvents, false); //just to force the final render
			return; //renderTime() will call complete() again, so just return here.
		}
		// 完成后被自動削除
		if (this.timeline.autoRemoveChildren) {
			this.setEnabled(false, false);
		} 
		else {
			this.active = false;
		}
		// 觸發事件
		if (!suppressEvents) {
			if (this.vars.onComplete && this.cachedTotalTime == this.cachedTotalDuration && !this.cachedReversed) { //note: remember that tweens can have a duration of zero in which case their cachedTime and cachedDuration would always match.
				this.vars.onComplete.apply(null, this.vars.onCompleteParams);
			} else if (this.cachedReversed && this.cachedTotalTime == 0 && this.vars.onReverseComplete) {
				this.vars.onReverseComplete.apply(null, this.vars.onReverseCompleteParams);
			}
		}
	}
	
	public function setEnabled(enabled:Boolean, ignoreTimeline:Boolean=false):Boolean {
		this.gc = !enabled;
		if (enabled) {
			this.active = Boolean(!this.cachedPaused && this.cachedTotalTime > 0 && this.cachedTotalTime < this.cachedTotalDuration);
			if (!ignoreTimeline && this.cachedOrphan) {
				this.timeline.addChild(this);
			}
		} else {
			this.active = false;
			if (!ignoreTimeline && !this.cachedOrphan) {
				this.timeline.remove(this, true);
			}
		}
		return false;
	}
	
	/**
	 * @private
	 * Sets the cacheIsDirty property of all anscestor timelines (and optionally this tween/timeline too). Setting
	 * the cacheIsDirty property to true forces any necessary recalculation of its cachedDuration and cachedTotalDuration 
	 * properties and sorts the affected timelines' children TweenCores so that they're in the proper order 
	 * next time the duration or totalDuration is requested. We don't just recalculate them immediately because 
	 * it can be much faster to do it this way.
	 * 
	 * @param includeSelf indicates whether or not this tween's cacheIsDirty property should be affected.
	 */
	// 
	protected function setDirtyCache(includeSelf:Boolean=true):void {
		var tween:TweenCore = (includeSelf) ? this : this.timeline;
		while (tween) {
			tween.cacheIsDirty = true;
			tween = tween.timeline;
		}
	}
	
	/**
	 * @private
	 * Sort of like placing the local "playhead" at a particular totalTime and then aligning it with
	 * the parent timeline's "playhead" so that rendering continues from that point smoothly. This 
	 * changes the cachedStartTime.
	 * 
	 * @param time Time that should be rendered (includes any repeats and repeatDelays for TimelineMax)
	 * @param suppressEvents If true, no events or callbacks will be triggered for this render (like onComplete, onUpdate, onReverseComplete, etc.)
	 **/
	protected function setTotalTime(time:Number, suppressEvents:Boolean=false):void {
		if (this.timeline) {
			var tlTime:Number = (_pauseTime || _pauseTime == 0) ? _pauseTime : this.timeline.cachedTotalTime;
			if (this.cachedReversed) {
				var dur:Number = (this.cacheIsDirty) ? this.totalDuration : this.cachedTotalDuration;
				this.cachedStartTime = tlTime - ((dur - time) / this.cachedTimeScale);
			} else {
				this.cachedStartTime = tlTime - (time / this.cachedTimeScale);
			}
			if (!this.timeline.cacheIsDirty) { //for performance improvement. If the parent's cache is already dirty, it already took care of marking the anscestors as dirty too, so skip the function call here.
				setDirtyCache(false);
			}
			if (this.cachedTotalTime != time) {
				renderTime(time, suppressEvents, false);
			}
		}
	}
	
	/** Indicates the reversed state of the tween/timeline. This value is not affected by <code>yoyo</code> repeats and it does not take into account the reversed state of anscestor timelines. So for example, a tween that is not reversed might appear reversed if its parent timeline (or any ancenstor timeline) is reversed. **/
	public function get reversed():Boolean {return this.cachedReversed;}
	public function set reversed(b:Boolean):void {
		if (b != this.cachedReversed) {
			this.cachedReversed = b;
			setTotalTime(this.cachedTotalTime, true);
		}
	}
	
	/** Indicates the paused state of the tween/timeline. This does not take into account anscestor timelines. So for example, a tween that is not paused might appear paused if its parent timeline (or any ancenstor timeline) is paused. **/
	public function get paused():Boolean {return this.cachedPaused;}
	public function set paused(b:Boolean):void {
		if (b != this.cachedPaused && this.timeline) {
			if (b) {
				_pauseTime = this.timeline.rawTime;
			} else {
				this.cachedStartTime += this.timeline.rawTime - _pauseTime;
				_pauseTime = NaN;
				setDirtyCache(false);
			}
			this.cachedPaused = b;
			this.active = Boolean(!this.cachedPaused && this.cachedTotalTime > 0 && this.cachedTotalTime < this.cachedTotalDuration);
		}
		if (!b && this.gc) {
			this.setTotalTime(this.cachedTotalTime, false);
			this.setEnabled(true, false);
		}
	}
	
	
	
	public static const version:Number = 1.382;
	
	protected static var _classInitted:Boolean;
	
	protected var _delay:Number; // 緩動開始前的延遲時間
	protected var _hasUpdate:Boolean; // 是否存在update回調
	protected var _rawPrevTime:Number = -1;
	protected var _pauseTime:Number;
	
	public var vars:Object; 
	public var active:Boolean; // 是否緩動進行中
	public var gc:Boolean; // 是否被殺死
	public var initted:Boolean; // 是否初期化
	public var timeline:SimpleTimeline;
	
	public var cachedStartTime:Number; // 緩動開始時間
	
	public var cachedTime:Number; // 緩動當前進行時間
	public var cachedTotalTime:Number; // 
	
	public var cachedDuration:Number; // 緩動持續時間
	public var cachedTotalDuration:Number; 
	
	public var cachedTimeScale:Number; // 時間縮放比
	public var cachedReversed:Boolean; // 是否反向播放
	
	public var nextNode:TweenCore; 
	public var prevNode:TweenCore; 
	public var cachedOrphan:Boolean; // 是否加入了時間線
	
	public var cacheIsDirty:Boolean; 
	public var cachedPaused:Boolean; 
	public var data:*; 
	
	
	
	//================================================================
	//================================================================
	//================================================================
	//================================================================
	//================================================================
	
	public function get duration():Number {return this.cachedDuration;}
	public function set duration(n:Number):void {
		this.cachedDuration = this.cachedTotalDuration = n;
		setDirtyCache(false);
	}
	
	public function get totalDuration():Number {return this.cachedTotalDuration;}
	public function set totalDuration(n:Number):void {
		this.duration = n;
	}
	
	public function get currentTime():Number {return this.cachedTime;}
	public function set currentTime(n:Number):void {
		setTotalTime(n, false);
	}
	
	public function get totalTime():Number {return this.cachedTotalTime;}
	public function set totalTime(n:Number):void {
		setTotalTime(n, false);
	}
	
	public function play():void {
		this.reversed = false;
		this.paused = false;
	}
	
	public function pause():void {
		this.paused = true;
	}
	
	public function resume():void {
		this.paused = false;
	}
	
	public function kill():void {
		setEnabled(false, false);
	}
	
	/**
	 * Reverses smoothly, adjusting the startTime to avoid any skipping. After being reversed,
	 * it will play backwards, exactly opposite from its forward orientation, meaning that, for example, a
	 * tween's easing equation will appear reversed as well. If a tween/timeline plays for 2 seconds and gets
	 * reversed, it will play for another 2 seconds to return to the beginning.
	 * 
	 * @param forceResume If true, it will resume() immediately upon reversing. Otherwise its paused state will remain unchanged.
	 */
	public function reverse(forceResume:Boolean=true):void {
		this.reversed = true;
		if (forceResume) {
			this.paused = false;
		} else if (this.gc) {
			this.setEnabled(true, false);
		}
	}
	
	//public function get delay():Number {return _delay;}
	//public function set delay(n:Number):void {
		//this.startTime += (n - _delay);
		//_delay = n;
	//}
	
	//public function get startTime():Number {return this.cachedStartTime;}
	//public function set startTime(n:Number):void {
		//var adjust:Boolean = Boolean(this.timeline != null && (n != this.cachedStartTime || this.gc));
		//this.cachedStartTime = n;
		//if (adjust) {
			//this.timeline.addChild(this); //ensures that any necessary re-sequencing of TweenCores in the timeline occurs to make sure the rendering order is correct.
		//}
	//}
	
	//public function restart(includeDelay:Boolean=false, suppressEvents:Boolean=true):void {
		//this.reversed = false;
		//this.paused = false;
		//this.setTotalTime((includeDelay) ? -_delay : 0, suppressEvents);
	//}
	
	//public function invalidate():void {
		//
	//}
	
}
}