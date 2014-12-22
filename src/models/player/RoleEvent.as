package models.player 
{
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class RoleEvent extends AEvent
	{
		
		public static const Update_Role_Info:String = "Update_Role_Info";   //更新了玩家信息
		
		public static const Update_Score_Change:String = "Update_Score_Change";  //玩家阵营积分改变
		
		public static const Update_Role_Money:String = "Update_Role_Money";  //更新了玩家金钱
		
		public static const Update_Role_Level_Up:String = "Update_Role_Level_Up";  //玩家等级提升
		
		public static const Update_Camp_Level_Up:String = "Update_Camp_Level_Up";  //玩家阵营提升
		
		
		
		
		
		
		public var data:Object;
		
		public function RoleEvent(type:String,data:Object) 
		{
			super(type);
			this.data = data;
		}
		
		
	}

}