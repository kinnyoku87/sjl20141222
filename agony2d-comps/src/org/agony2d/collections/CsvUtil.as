package org.agony2d.collections {
	
public class CsvUtil {
	
	/**
	 * 解析csv
	 * 
	 * @param	csv
	 * @return	解析後的Array類型數組.
	 */
	public static function parse( csv:String ) : Vector.<Array> {
		var result:Vector.<Array>;
		var itemAY:Array;
		var chars:String;
		var i:int;
		var numItems:int;
		
		result    =  new <Array>[];
		itemAY    =  csv.split("\r\n");
		numItems  =  itemAY.length;
		while (++i < numItems) {
			chars = itemAY[i];
			if (chars.length > 0) {
				result[i - 1] = chars.split(",");
			}
		}
		return result;
	}
	
	/**
	 * 解析csv
	 * 
	 * @param	csv
	 * @return	解析後的Object類型數組.
	 */
	public static function parse2( csv:String ) : Vector.<Object> {
		var result:Vector.<Object>;
		var itemAY:Array;
		var fieldAY:Array;
		var AY:Array;
		var item:Object;
		var i:int;
		var k:int;
		var numItems:int;
		var numFields:int;
		
		result     =  new <Object>[];
		itemAY     =  csv.split("\r\n");
		numItems   =  itemAY.length;
		fieldAY    =  String(itemAY[0]).split(",");
		numFields  =  fieldAY.length;
		i          =  1;
		while (i < numItems) {
			k = 0;
			item = result[i - 1] = {};
			AY = String(itemAY[i]).split(",");
			while (k < numFields) {
				item[fieldAY[k]] = AY[k];
				k++;
			}
			i++;
		}
		return result;
	}
	
	/**
	 * 通過解析出的csv數據為對象賦值.
	 *  
	 * @param vo
	 * @param values
	 * @param fields1
	 * 
	 */	
	public static function setValues( vo:*, values:Array, fields:Array ) : void {
		var i:int;
		var l:int;
		var field:String;
		
		l = values.length;
		while (i < l) {
			if((field = fields[i]) != null){
				vo[field] = values[i];
			}
			i++;
		}
	}	
}
}