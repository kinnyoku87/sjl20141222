package configs 
{
	import proto.cs.ERROR_CODE_TYPE;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ErrorConfig 
	{
		 public static var errorData:Object =  {
			 -1 : "失败",
             3 :"功能未开放",
             200 :"角色已经存在",
             203 :"角色不存在",
             206 :"角色名不存在",
             207 :"不存在该玩家",
             208 :"该玩家没有在线",
			
			 
			 14001 : "聊天对象不存在",
			 14002 : "聊天对象不在线",
			 14003 : "频道不合法",
			 14004 : "聊天内容不合法",
			 14005 : "聊天对象在你的黑名单内",
			 14006 : "你在对方黑名单内",
			 14007 : "房间禁止聊天"
		};
			 
		public function ErrorConfig() 
		{
			
		}

		
	}

}