package configs 
{
	import org.agony2d.events.AEvent;
	
	/**
	 * ...
	 * @author ... dcl
	 */
	public class EventConfig extends AEvent
	{
		public static const Get_Room_Item_List:String = "Get_Room_Item_List"; //获取房间列表
		public static const Join_Room_Into:String = "Join_Room_Into"; //加入房间
		public static const Quit_Room_Out:String = "Quit_Room_Out";   //退出房间
		public static const Update_Room_Role:String = "Update_Room_Role";   //更新房间成员信息
		public static const Start_Room_State:String = "Start_Room_State";   //房间开始状态更新
		
		public static const Get_Simple_Role_Info:String = "Get_Simple_Role_Info";  //获取角色信息
		public static const Camp_Change:String = "Camp_Change";  //套牌改变
		
		public function EventConfig(str:String)
		{
			super(str);
		}
		
	
		
	}

}