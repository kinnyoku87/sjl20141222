package org.agony2d.utils {
	
public class ArrayUtil {
	
	/** 
	 * 移除數組內指定元素 (會影響內部順序).
	 * 
	 * @param	item
	 * @param	AY
	 */
	public static function removeFrom( item:*, AY:Array ) : void {
		var index:int;
		
		index = AY.indexOf(item);
		if(index > -1){
			AY[index] = AY[AY.length - 1];
			AY.pop();
		}
	}
	
	/**
	 * 隨機打亂數組內部元素.
	 * 
	 * @param	AY
	 * @return	洗牌后产生的新数组.
	 */
	public static function shuffle( AY:Array ) : Array {
		var index:int;
		var i:int;
		var l:int;
		var result:Array;
		var tAY:Array;
		var item:*;
		
		result  =  [];
		tAY     =  AY.concat();
		l       =  tAY.length;
		while (--l > -1) {
			index        =  (l + 1) * Math.random();
			result[i++]  =  tAY[index];
			tAY[index]   =  tAY[l];
		}
		return result;
	}
	
	/**
	 * 隨機提取一個數組元素.
	 * 
	 * @param	AY
	 * @param	discard		是否丟棄 (影響內部順序).
	 * @param	startIndex	起始位置 (包含其自身).
	 * @param	length
	 * @return
	 */
	public static function extractRandom( AY:Array, discard:Boolean = true, startIndex:int = 0, length:int = -1 ) : * {
		var index:int;
		var l:int;
		var item:*;
		
		l      =  AY.length;
		index  =  startIndex + Math.random() * ((startIndex + length > l || length <= 0) ? l - startIndex : length);
		item   =  AY[index];
		if (item && discard) {
			if (index + 1 < l) {
				AY[index] = AY.pop();
			}
			else {
				AY.pop();
			}
		}
		return item;
	}
}
}