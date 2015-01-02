package org.agony2d.utils.others {
	
public class MathUtil2 {
	
	public static function getRadian( dx:Number, dy:Number ) : Number {
		return Math.atan2(dy, dx);
	}
	
	public static function getDegree( dx:Number, dy:Number ) : Number {
		var N:Number;
		
		N = Math.atan2(dy, dx) * 180 / Math.PI + 90;
		N = unwrapDegrees(N);
		return N;
	}
	
	/**
	 * 换算角度到 [0~360] 之间
	 */
	public static function unwrapDegrees( degree:Number ) : Number
	{
		degree = degree % 360;
		return (degree < 0) ? degree + 360 : degree
	}
	
	/**
	 * 换算弧度在 [-PI~PI] 之间
	 */
	public static function unwrapRadian( radian:Number ) : Number 
	{ 
		const twoPI:Number = 2.0 * Math.PI
		
		radian = radian % twoPI
		if (radian > Math.PI) 
			radian -= twoPI
		if (radian < -Math.PI) 
			radian += twoPI
		return radian
	} 
	
	//public static function abs( v:Number ) : Number
	//{
	//return (v > 0) ? v : -v
	//}
	
	//public static function floor( v:Number ) : Number
	//{
	//var N:Number = int(v);
	//return (v > 0)?N:(N != v?N - 1:N)
	//}
	
	//public static function ceil( v:Number ) : Number
	//{
	//var N:Number = int(v);
	//return (v > 0) ? ((N != v) ? N + 1 : N) : N
	//}
	
	//public static function round( v:Number ) : Number
	//{
	//return (v < 0) ? (v - 0.5) >> 0 : (v + 0.5) >> 0;
	//}
}
}