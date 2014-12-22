package configs
{
	import com.netease.protobuf.UInt64;
	
	import proto.com.RoomBaseInfo;
	import proto.cs.ArenaInfo;

	public class ConfigNet
	{
		
//		public static var ip:String = "192.168.21.237";
		
		public static var ip:String = "192.168.4.195";
		
		
		public static var port:int = 8101;
		
		public static var uid:UInt64;
		
		public static var currArena:ArenaInfo;
		
		public static var checkCode:String; // 開始匹配的校檢碼.
		
		public static var isNew:Boolean =false;  //是否为刚创建的新手   现暂为标示cg启动，后由新手指引启动
		
//		public static var members:Array;
		
//		public static var roomBaseInfo:RoomBaseInfo;
		
	}
}