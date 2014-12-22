package net
{
	public class NetUtil
	{
		
		/**
		 * 獲取ip與port信息.
		 * 
		 * @param v	相關信息192.168.4.195:57101
		 * @return 
		 */		
		public static function getIpAndPort( v:String ) : Array{
			var index:int;
			var ip:String;
			var port:int;
			
			index = v.indexOf(":");
			return [v.substring(0, index), int(v.substring(index + 1))];
		}
	}
}