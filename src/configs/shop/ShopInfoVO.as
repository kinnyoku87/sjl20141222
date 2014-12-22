package configs.shop 
{
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ShopInfoVO 
	{

		public var shopId:int;    //商品id			
		public var itemId:int;    //物品id
		public var price:int;     //商品价值 
		public var cardId:int;    //卡牌id
		public var name:String;      //卡牌名称
		public var type:int;      //商品出售价格类型
		public var bHad:Boolean;      //是否拥有
		
		public function ShopInfoVO() 
		{
			
		}
		
	}

}