package org.agony2d.utils {
	import org.agony2d.base.LogMachine;
	import org.agony2d.base.inside.agony_internal;
	import org.agony2d.base.LogMachine;
	
	use namespace agony_internal;
	
public class DateUtil {
	
	/** full year，like 2014. */
	public static const FULL_YEAR:int  =  0x01;
	/** year，0 - 99 etc. */
	public static const YEAR:int       =  0x02;
	/** month，1 - 12. */
	public static const MONTH:int      =  0x04;
	/** week，1 - 7. */
	public static const WEEK:int       =  0x08;
	/** day，1 - 31. */
	public static const DAY:int        =  0x10;
	/** hour，1 - 24. */
	public static const HOUR:int       =  0x20;
	/** minute，1 - 59. */
	public static const MINUTE:int     =  0x40;
	/** second，1 - 59. */
	public static const SECOND:int     =  0x80;
	
	
	/**
	 * 獲取時間戳.
	 * 
	 * @param	types
	 * @param	sep
	 * @return
	 */
	public static function getTimestamp( types:Array, sep:String = "_" ) : String {
		var result:String;
		var i:int;
		var l:int;
		var type:int;
		var N_A:Number;
		var date:Date;
		
		date    =  new Date;
		result  =  "";
		l       =  types.length;
		if (l == 0) {
			LogMachine.g_instance.error("DateUtil", "getTimestamp", "Types(Array) length can't be zero !!!");
		}
		while (i < l) {
			type = types[i++];
			// full year.
			if (type == FULL_YEAR) {
				N_A = date.fullYear;
			}
			// year.
			if (type == YEAR) {
				N_A = date.fullYear % 100;
			}
			// month.
			else if (type == MONTH) {
				N_A = date.month + 1;
			}
			// week.
			else if (type == WEEK) {
				N_A = date.day;
			}
			// day.
			else if (type == DAY) {
				N_A = date.date;
			}
			// hour.
			else if (type == HOUR) {
				N_A = date.hours;
			}
			// minute.
			else if (type == MINUTE) {
				N_A = date.minutes;
			}
			// second.
			else if (type == SECOND) {
				N_A = date.seconds;
			}
			result += (i >= l) ? N_A : (N_A + sep) ;
		}
		return result;
	}
}
}