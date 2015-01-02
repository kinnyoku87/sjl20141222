package org.agony2d.tween.easing {
	
public class Bounce {
	
	public static function easeIn( t:Number, b:Number, c:Number, d:Number ) : Number {
		if ((t = (d - t) / d) < (1 / 2.75)) {
			return c - (c * (7.5625 * t * t)) + b;
		}
		else if (t < (2 / 2.75)) {
			return c - (c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75)) + b;
		}
		else if (t < (2.5 / 2.75)) {
			return c - (c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375)) + b;
		}
		else {
			return c - (c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375)) + b;
		}
	}
	
	public static function easeOut( t:Number, b:Number, c:Number, d:Number ) : Number {
		if ((t /= d) < (1 / 2.75)) {
			return c * (7.5625 * t * t) + b;
		}
		else if (t < (2 / 2.75)) {
			return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
		}
		else if (t < (2.5 / 2.75)) {
			return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
		}
		else {
			return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
		}
	}
	
	public static function easeInOut( t:Number, b:Number, c:Number, d:Number ) : Number {
		if (t < d * 0.5) {
			if ((t = (d - t * 2) / d) < (1 / 2.75)) {
				return (c - (c * (7.5625 * t * t))) * .5 + b;
			}
			if (t < (2 / 2.75)) {
				return (c - (c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75))) * .5 + b;
			}
			if (t < (2.5 / 2.75)) {
				return (c - (c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375))) * .5 + b;
			}
			return (c - (c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375))) * .5 + b;
		}
		else {
			if ((t = (t * 2 - d) / d) < (1 / 2.75)) {
				return (c * (7.5625 * t * t)) * .5 + c * .5 + b;
			}
			if (t < (2 / 2.75)) {
				return (c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75)) * .5 + c * .5 + b;
			}
			if (t < (2.5 / 2.75)) {
				return (c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375)) * .5 + c * .5 + b;
			}
			return (c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375)) * .5 + c * .5 + b;
		}
	}
}
}