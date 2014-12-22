package configs.shop 
{
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ShopInfoCfg 
	{
		public var shopId:int;             //商品id
		public var classStr:String;        //商品的一级类型
		public var subClassStr:String;     //商品的二级类型 
		public var goodId:int;             //物品id
		public var count:int;              //一次出售的数量
		public var sellType:int;           //货币购买的类型  1：元宝  2：金币  3：新货币
		public var price:int;              //价格
		
		public function ShopInfoCfg() 
		{
			
		}
		
	}

}