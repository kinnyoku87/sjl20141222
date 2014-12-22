package models.cardSet 
{
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class CardSetEvent extends AEvent
	{
		
		public static const Set_Bag_Status:String = "Set_Bag_Status"; //是否在设置卡包
		
		public static const Add_Reduce_Card_Num:String = "Add_Reduce_Card_Num";  //添加，删除卡牌操作
		
		public static const Add_Card_Num:String = "Add_Card_Num";  //添加卡牌操作
		public static const Delete_Card_Num:String = "Delete_Card_Num";  //删除卡牌操作
		public static const Change_Card_Num:String = "Change_Card_Num";  //改变卡牌数量操作
		
		public static const Add_Card_Bag:String = "Add_Card_Bag";  //添加一个卡包
		public static const Remove_Card_Bag:String = "Remove_Card_Bag";  //删除一个卡包
		
		
		
		public var data:Object;
		
		public function CardSetEvent(type:String,data:Object) 
		{
			super(type);
			this.data = data;
		}
		
	}

}