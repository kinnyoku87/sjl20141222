package utils 
{
	import flash.net.SharedObject;
	import org.agony2d.utils.ACookie;
	/**
	 * ...
	 * @author dcl
	 */
	public class CoockieUtil 
	{
		private static var _ins:CoockieUtil;		
		public static var gameCookie:ACookie;
		private static var cookieName:String = "main_cookie";
		
		public static var login_data:String = "login_data";
		public function CoockieUtil() 
		{
			
		}
		
		static public function get ins():CoockieUtil 
		{
			if (_ins == null) {
				_ins = new CoockieUtil();
				gameCookie = new ACookie(cookieName);

			}
			return _ins;
		}
		
		public static function readData(dataName:String):Object {
			
			return gameCookie.userData[dataName];
		}
		
		public static function writeData(dataName:String,data:Object):void {
			gameCookie.userData[dataName] = data;
			gameCookie.flush();
		}
		
	}

}