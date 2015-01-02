package com.greensock.core {
	
	public class PropTween {
		public var target:Object;
		public var property:String;
		public var start:Number;
		public var change:Number;
		public var name:String;
		public var priority:int;
		public var isPlugin:Boolean;
		public var nextNode:PropTween;
		public var prevNode:PropTween;
		
		/**
		 * Constructor
		 * 
		 * @param target Target object
		 * @param property Name of the property that is being tweened
		 * @param start Starting value
		 * @param change Amount to change (basically, the difference between the starting value and ending value)
		 * @param name Alias to associate with the PropTween which is typically the same as the property, but can be different, particularly for plugins.
		 * @param isPlugin If the target of the PropTween is a TweenPlugin, isPlugin should be true.
		 * @param nextNode Next PropTween in the linked list
		 * @param priority Priority in the rendering queue. The lower the value the later it will be tweened. Typically all PropTweens get a priority of 0, but some plugins must be rendered later (or earlier)
		 */
		public function PropTween(target:Object, property:String, start:Number, change:Number, name:String, isPlugin:Boolean, nextNode:PropTween=null, priority:int=0) {
			this.target = target;
			this.property = property;
			this.start = start;
			this.change = change;
			this.name = name;
			this.isPlugin = isPlugin;
			if (nextNode) {
				nextNode.prevNode = this;
				this.nextNode = nextNode;
			}
			this.priority = priority;
		}
	}
}