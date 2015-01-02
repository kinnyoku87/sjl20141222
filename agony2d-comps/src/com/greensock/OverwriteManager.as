package com.greensock {
	import com.greensock.core.*;
	
	import flash.errors.*;
	import flash.utils.*;
	
	public class OverwriteManager {
		/** @private **/
		public static const version:Number = 6.02;
		/** Won't overwrite any other tweens **/
		public static const NONE:int 			= 0;
		/** Overwrites all existing tweens of the same target immediately when the tween is created **/
		public static const ALL_IMMEDIATE:int 	= 1;
		/** Only overwrites individual overlapping tweening properties in other tweens of the same target. TweenMax, TimelineLite, and TimelineMax automatically init() OverwriteManager in this mode if you haven't already called OverwriteManager.init(). **/
		public static const AUTO:int 			= 2;
		/** Overwrites tweens of the same target that are active when the tween renders for the first time. **/ 
		public static const CONCURRENT:int 		= 3;
		/** Overwrites all tweens of the same target (regardless of overlapping properties or timing) when the tween renders for the first time as opposed to ALL_IMMEDIATE which performs overwriting immediately when the tween is created. **/
		public static const ALL_ONSTART:int 	= 4;
		/** Overwrites tweens of the same target that existed before this tween regardless of their start/end time or active state or overlapping properties. **/
		public static const PREEXISTING:int 	= 5;
		/** The default overwrite mode for all TweenLite and TweenMax instances **/
		public static var mode:int;
		/** @private **/
		public static var enabled:Boolean;
		
		public static function init(defaultMode:int=2):int {
			if (TweenLite.version < 11.1) {
				throw new Error("Warning: Your TweenLite class needs to be updated to work with OverwriteManager (or you may need to clear your ASO files). Please download and install the latest version from http://www.tweenlite.com.");
			}
			TweenLite.overwriteManager = OverwriteManager;
			mode = defaultMode;
			enabled = true;
			return mode;
		}
		
		/** 
		 * @private 
		 * @return Boolean value indicating whether or not properties may have changed on the target when overwriting occurred. For example, when a motionBlur (plugin) is disabled, it swaps out a BitmapData for the target and may alter the alpha. We need to know this in order to determine whether or not the new tween should be re-initted() with the changed properties. 
		 **/
		public static function manageOverwrites(tween:TweenLite, props:Object, targetTweens:Array, mode:uint):Boolean {
			var i:int, changed:Boolean, curTween:TweenLite;
			if (mode >= 4) {
				var l:uint = targetTweens.length;
				for (i = 0; i < l; i++) {
					curTween = targetTweens[i];
					if (curTween != tween) {
						if (curTween.setEnabled(false, false)) {
							changed = true;
						}
					} else if (mode == 5) {
						break;
					}
				}
				return changed;
			}
			//NOTE: Add 0.0000000001 to overcome floating point errors that can cause the startTime to be VERY slightly off (when a tween's currentTime property is set for example)
			var startTime:Number = tween.cachedStartTime + 0.0000000001, overlaps:Array = [], cousins:Array = [], cCount:uint = 0, oCount:uint = 0;
			i = targetTweens.length;
			while (--i > -1) {
				curTween = targetTweens[i];
				if (curTween == tween || curTween.gc) {
					//ignore
				} else if (curTween.timeline != tween.timeline) {
					if (!getGlobalPaused(curTween)) {
						cousins[cCount++] = curTween;
					}
				} else if (curTween.cachedStartTime <= startTime && curTween.cachedStartTime + curTween.totalDuration + 0.0000000001 > startTime && !getGlobalPaused(curTween)) {
					overlaps[oCount++] = curTween;
				}
			}
			
			if (cCount != 0) { //tweens that are nested in other timelines may have various offsets and timeScales so we need to translate them to a global/root one to see how they compare.
				var combinedTimeScale:Number = tween.cachedTimeScale, combinedStartTime:Number = startTime, cousin:TweenCore, cousinStartTime:Number, timeline:SimpleTimeline;
				timeline = tween.timeline;
				while (timeline) {
					combinedTimeScale *= timeline.cachedTimeScale;
					combinedStartTime += timeline.cachedStartTime;
					timeline = timeline.timeline;
				}
				startTime = combinedTimeScale * combinedStartTime;
				i = cCount;
				while (--i > -1) {
					cousin = cousins[i];
					combinedTimeScale = cousin.cachedTimeScale;
					combinedStartTime = cousin.cachedStartTime;
					timeline = cousin.timeline;
					while (timeline) {
						combinedTimeScale *= timeline.cachedTimeScale;
						combinedStartTime += timeline.cachedStartTime;
						timeline = timeline.timeline;
					}
					cousinStartTime = combinedTimeScale * combinedStartTime;
					if (cousinStartTime <= startTime && (cousinStartTime + (cousin.totalDuration * combinedTimeScale) + 0.0000000001 > startTime || cousin.cachedDuration == 0)) {
						overlaps[oCount++] = cousin;
					}
				}
			}
			
			if (oCount == 0) {
				return changed;
			}
			
			i = oCount;
			if (mode == 2) {
				while (--i > -1) {
					curTween = overlaps[i];
					if (curTween.killVars(props)) {
						changed = true;
					}
					if (curTween.cachedPT1 == null && curTween.initted) {
						curTween.setEnabled(false, false); //if all property tweens have been overwritten, kill the tween.
					}
				}
			
			} else {
				while (--i > -1) {
					if (TweenLite(overlaps[i]).setEnabled(false, false)) { //flags for garbage collection
						changed = true;
					}
				}
			}
			return changed;
		}
		
		/** @private **/
		public static function getGlobalPaused(tween:TweenCore):Boolean {
			while (tween) {
				if (tween.cachedPaused) {
					return true;
				}
				tween = tween.timeline;
			}
			return false;
		}
		
	}
}