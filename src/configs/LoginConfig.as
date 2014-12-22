package configs 
{
	/**
	 * ...
	 * @author ... dcl
	 */
	public class LoginConfig 
	{
		//记录服务器
		public static var arenaServers:Array;
		
		public static var lastArenaId:int;
		
		//是否加载过角色资源
		public static var isLoadRoleHead:Boolean;
		
		//是否登录退出过
		public static var isLoginOut:Boolean = false;
		
		public function LoginConfig() 
		{
			
		}
		
	}

}