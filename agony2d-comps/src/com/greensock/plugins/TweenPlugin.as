package com.greensock.plugins {
	import com.greensock.*;
	import com.greensock.core.*;
	
	public class TweenPlugin {
		public static const VERSION:Number = 1.31;
		public static const API:Number = 1.0; 
		
		public var propName:String;
		
		/**
		 * @private 
		 * Array containing the names of the properties that should be overwritten in OverwriteManager's 
		 * AUTO mode. Typically the only value in this Array is the propName, but there are cases when it may 
		 * be different. For example, a bezier tween's propName is "bezier" but it can manage many different properties 
		 * like x, y, etc. depending on what's passed in to the tween.
		 */
		public var overwriteProps:Array;
		
		/** @private If the values should be rounded to the nearest integer, set this to true. **/
		public var round:Boolean;
		public var priority:int = 0;
		/** @private if the plugin actively changes properties of the target when it gets disabled (like the MotionBlurPlugin swaps out a temporary BitmapData for the target), activeDisplay should be true. Otherwise it should be false (it is much more common for it to be false). This is important because if it gets overwritten by another tween, that tween may init() with stale values - if activeDisable is true, it will force the new tween to re-init() when this plugin is overwritten (if ever). **/
		public var activeDisable:Boolean;
		public var onComplete:Function;
		public var onEnable:Function;
		
		/** @private Called either when the plugin gets overwritten or when its parent tween gets killed/disabled. **/
		public var onDisable:Function;
		
		/** @private **/
		protected var _tweens:Array = [];
		/** @private **/
		protected var _changeFactor:Number = 0;
		
		public function onInitTween(target:Object, value:*, tween:TweenLite):Boolean {
			addTween(target, this.propName, target[this.propName], value, this.propName);
			return true;
		}
		
		/**
		 * @private 
		 * Offers a simple way to add tweening values to the plugin. You don't need to use this,
		 * but it is convenient because the tweens get updated in the updateTweens() method which also 
		 * handles rounding. killProps() nicely integrates with most tweens added via addTween() as well,
		 * but if you prefer to handle this manually in your plugin, you're welcome to.
		 *  
		 * @param object target object whose property you'd like to tween. (i.e. myClip)
		 * @param propName the property name that should be tweened. (i.e. "x")
		 * @param start starting value
		 * @param end end value (can be either numeric or a string value. If it's a string, it will be interpreted as relative to the starting value)
		 * @param overwriteProp name of the property that should be associated with the tween for overwriting purposes. Normally, it's the same as propName, but not always. For example, you may tween the "changeFactor" property of a VisiblePlugin, but the property that it's actually controling in the end is "visible", so if a new overlapping tween of the target object is created that affects its "visible" property, this allows the plugin to kill the appropriate tween(s) when killProps() is called. 
		 */
		protected function addTween(object:Object, propName:String, start:Number, end:*, overwriteProp:String=null):void {
			if (end != null) {
				var change:Number = (typeof(end) == "number") ? Number(end) - start : Number(end);
				if (change != 0) { //don't tween values that aren't changing! It's a waste of CPU cycles
					_tweens[_tweens.length] = new PropTween(object, propName, start, change, overwriteProp || propName, false);
				}
			}
		}
		
		/**
		 * @private 
		 * Updates all the tweens in the _tweens Array. 
		 *  
		 * @param changeFactor Multiplier describing the amount of change that should be applied. It will be zero at the beginning of the tween and 1 at the end, but inbetween it could be any value based on the ease applied (for example, an Elastic tween would cause the value to shoot past 1 and back again before the end of the tween) 
		 */
		protected function updateTweens(changeFactor:Number):void {
			var i:int = _tweens.length, pt:PropTween;
			if (this.round) {
				var val:Number;
				while (i--) {
					pt = _tweens[i];
					val = pt.start + (pt.change * changeFactor);
					pt.target[pt.property] = (val > 0) ? int(val + 0.5) : int(val - 0.5); //4 times as fast as Math.round()
				}
				
			} else {
				while (i--) {
					pt = _tweens[i];
					pt.target[pt.property] = pt.start + (pt.change * changeFactor);
				}
			}
		}
		
		/**
		 * @private 
		 * In most cases, your custom updating code should go here. The changeFactor value describes the amount 
		 * of change based on how far along the tween is and the ease applied. It will be zero at the beginning
		 * of the tween and 1 at the end, but inbetween it could be any value based on the ease applied (for example, 
		 * an Elastic tween would cause the value to shoot past 1 and back again before the end of the tween) 
		 * This value gets updated on every frame during the course of the tween.
		 * 
		 * @param n Multiplier describing the amount of change that should be applied. It will be zero at the beginning of the tween and 1 at the end, but inbetween it could be any value based on the ease applied (for example, an Elastic tween would cause the value to shoot past 1 and back again before the end of the tween) 
		 */
		public function set changeFactor(n:Number):void {
			updateTweens(n);
			_changeFactor = n;
		}
		
		public function get changeFactor():Number {
			return _changeFactor;
		}
		
		/**
		 * @private 
		 * Gets called on plugins that have multiple overwritable properties by OverwriteManager when 
		 * in AUTO mode. Basically, it instructs the plugin to overwrite certain properties. For example,
		 * if a bezier tween is affecting x, y, and width, and then a new tween is created while the 
		 * bezier tween is in progress, and the new tween affects the "x" property, we need a way
		 * to kill just the "x" part of the bezier tween. 
		 * 
		 * @param lookup An object containing properties that should be overwritten. We don't pass in an Array because looking up properties on the object is usually faster because it gives us random access. So to overwrite the "x" and "y" properties, a {x:true, y:true} object would be passed in. 
		 */
		public function killProps(lookup:Object):void {
			var i:int = this.overwriteProps.length;
			while (i--) {
				if (this.overwriteProps[i] in lookup) {
					this.overwriteProps.splice(i, 1);
				}
			}
			i = _tweens.length;
			while (i--) {
				if (PropTween(_tweens[i]).name in lookup) {
					_tweens.splice(i, 1);
				}
			}
		}
		
		/**
		 * @private
		 * This method is called inside TweenLite after significant events occur, like when a tween
		 * has finished initializing, when it has completed, and when its "enabled" property changes.
		 * For example, the MotionBlurPlugin must run after normal x/y/alpha PropTweens are rendered,
		 * so the "init" event reorders the PropTweens linked list in order of priority. Some plugins
		 * need to do things when a tween completes or when it gets disabled. Again, this 
		 * method is only for internal use inside TweenLite. It is separated into
		 * this static method in order to minimize file size inside TweenLite.
		 * 
		 * @param type The type of event "onInit", "onComplete", "onEnable", or "onDisable"
		 * @param tween The TweenLite/Max instance to which the event pertains
		 * @return A Boolean value indicating whether or not properties of the tween's target may have changed as a result of the event
		 */
		private static function onTweenEvent(type:String, tween:TweenLite):Boolean {
			var pt:PropTween = tween.cachedPT1, changed:Boolean;
			if (type == "onInit") {
				//sorts the PropTween linked list in order of priority because some plugins need to render earlier/later than others, like MotionBlurPlugin applies its effects after all x/y/alpha tweens have rendered on each frame.
				var tweens:Array = [];
				while (pt) {
					tweens[tweens.length] = pt;
					pt = pt.nextNode;
				}
				tweens.sortOn("priority", Array.NUMERIC | Array.DESCENDING);
				var i:int = tweens.length;
				while (i--) {
					PropTween(tweens[i]).nextNode = tweens[i + 1];
					PropTween(tweens[i]).prevNode = tweens[i - 1];
				}
				tween.cachedPT1 = tweens[0];
				
			} else {
				while (pt) {
					if (pt.isPlugin && pt.target[type]) {
						if (pt.target.activeDisable) {
							changed = true;
						}
						pt.target[type]();
					}
					pt = pt.nextNode;
				}
			}
			return changed;
		}
		
		public static function activate(plugins:Array):Boolean {
			TweenLite.onPluginEvent = TweenPlugin.onTweenEvent;
			var i:int = plugins.length, instance:Object;
			while (i--) {
				if (plugins[i].hasOwnProperty("API")) {
					instance = new (plugins[i] as Class)();
					TweenLite.plugins[instance.propName] = plugins[i];
				}
			}
			return true;
		}
	}
}