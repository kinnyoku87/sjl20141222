package org.agony2d.utils {
    
public class MathUtil {
    
	/** 
	 * 轉換數字為前綴加零的字符串.
	 * 
	 * @param	v
	 * @param	maxDigits
	 * @return
	 */
	public static function prefix( v:int, maxDigits:int ) : String {
		var l:int;
		var result:String;
		
		result = "";
		l = String(v).length;
		while (++l <= maxDigits) {
			result += "0";
		}
		result += String(v);
		return result;
	}
	
	/**
	 * 計算一個值在範圍內的最近值.
	 * 
	 * @param	v
	 * @param	low
	 * @param	high
	 * @return
	 */
	public static function bound( v:Number, low:Number, high:Number ) : Number {
		return (v > high) ? high : (v < low ? low : v);
	}
	
	/** 
	 * 是否為整數.
	 * 
	 * @param	N
	 * @return
	 */
	public static function isInt( N:Number ) : Boolean {
		return int(N) == N;
	}
	
	/**
	 * 是否異號，不包含零.
	 * 
	 * @param	N_A
	 * @param	N_B
	 * @return
	 */
	public static function adverse( N_A:Number, N_B:Number ) : Boolean {
		var N_AA:Number; 
		var N_BB:Number;
			
		N_AA  =  Math.abs(N_A);
		N_BB  =  Math.abs(N_B);
		return (((N_AA != N_A) && (N_BB == N_B)) || ((N_AA == N_A) && (N_BB != N_B))) && (N_A * N_B);
	}
	
	/**
	 * 計算兩點間距離.
	 * 
	 * @param	XA
	 * @param	YA
	 * @param	XB
	 * @param	YB
	 * @return
	 */
	public static function getDistance( XA:Number, YA:Number, XB:Number, YB:Number ) : Number {
		return Math.sqrt((XA - XB) * (XA - XB) + (YA - YB) * (YA - YB));
	}
	
	/**
	 * 獲取範圍內的隨機值.
	 * 
	 * @param	min
	 * @param	max
	 */
	public static function getRandom( min:Number, max:Number ) : Number {
		return (max - min) * Math.random() + min;
	}
	
	/**
	 * 計算一個值在範圍內的位置比率.
	 * 
	 * @param	v	當前值
	 * @param	A	下限值
	 * @param	B	上限值
	 */
	public static function getRatioBetween( v:Number, A:Number, B:Number ) : Number {
		if ((A > B && v >= A) || (A < B && v <= A)) {
			return 0;
		}
		else if ((A > B && v <= B) || (A < B && v >= B)) {
			return 1;
		}
		else if (A != B) {
			return (v - A) / (B - A);
		}
		return 0;
	}
	
	/**
	 * 計算某值在範圍內的最近分界點.
	 * 
	 * @param	v  必须在A和B之间...
	 * @param	A
	 * @param	B
	 * @param	numRegions
	 */
	public static function getNeareatValue( v:Number, A:Number, B:Number, numRegions:int = 2 ) : Number {
		var interval:Number, surplus:Number
		
		if (numRegions < 2) {
			numRegions = 2
		}
		interval = (B - A) / (numRegions - 1)
		surplus = (v - A) % interval
		if (surplus < interval / 2) {
			return v - ((v - A) % interval)
		}
		return v - ((v - A) % interval) + interval
	}
	
	/**
	 * 計算四捨五入數值.
	 * 
	 * @param	v
	 * @param	fractionDigits	約進到小數后第幾位.
	 * @return
	 */
	public static function round( v:Number, fractionDigits:uint = 2 ) : Number {
		var n:uint;
		
		n = Math.pow(10, fractionDigits);
		return Math.round(v * n) / n;
	}
}
}