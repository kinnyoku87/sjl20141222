package models.shop 
{
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ShopEvent extends AEvent
	{
		
		public static const Update_Box_Open_Status:String = "Update_Box_Open_Status"; //玄机宝盒状态更新
		
		public static const Update_ShopCards:String = "Update_ShopCards"; //更新商店商品操作
	
		public var data:Object;
		
		public function ShopEvent(type:String,data:Object) 
		{
			super(type);
			this.data = data;
		}
		
	}

}