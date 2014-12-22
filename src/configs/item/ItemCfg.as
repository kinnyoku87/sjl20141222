package configs.item 
{
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ItemCfg 
	{
		public var id:int;
		public var name:String;    
		public var stacking:int;  //物品堆叠
		public var levelNeed:int;  //使用时需要人物等级
		public var useType:int;    //使用方式
		public var timeLimit:int;   //物品购买后的时限
		public var des:String;         //描述
		public var type:int;        //物品类型  0：无  1：卡牌  2：常规物品
		public var value:int;       //type类型下的值    如果是卡牌则有id值
		public var icon:String;        //物品图标
		public var post:int;        //商品是否可邮寄  0：不可  1：可以
		
		public function ItemCfg() 
		{
			
		}
		
	}

}