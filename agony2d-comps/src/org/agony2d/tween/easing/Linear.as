package org.agony2d.tween.easing {
	
public class Linear {
	
	public static function easeNone( t:Number, b:Number, c:Number, d:Number ) : Number {
		return c * t / d + b;
	}
}
}