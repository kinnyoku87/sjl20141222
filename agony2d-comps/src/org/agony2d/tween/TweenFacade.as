package org.agony2d.tween {
	
public class TweenFacade {
	
	public static function createTweenGroup( repeatCount:int = 1 ) : ATweenGroup {
		var tweenGroup:ATweenGroup;
		
		
		return tweenGroup;
	}
	
	public static function from( target:Object, duration:Number, startVars:Object, isOverwrite:Boolean = true ) : ATween {
		var tween:ATween;
		
		tween = new ATween;
//		tween.m_autoRemoved = true;
		
		return tween;
	}
	
	public static function to( target:Object, duration:Number, endVars:Object, isOverwrite:Boolean = true ) : ATween {
		var tween:ATween;
		
		return tween;
	}
	
	public static function fromTo( target:Object, duration:Number, startVars:Object, endVars:Object, isOverwrite:Boolean = true ) : ATween {
		var tween:ATween;
		
		return tween;
	}
}
}