package utils 
{
	/**
	 * ...
	 * @author dcl
	 */
	public class CommonUtil 
	{
		
		public function CommonUtil() 
		{
			
		}
	
		//number转换成百分比的字符串
		public static function numToStr(_num:Number,_fix:int = 0):String {
			var num:Number = _num * 100;
			var str:String = num.toFixed(_fix) + "%";
			return str;
		}
	}

}