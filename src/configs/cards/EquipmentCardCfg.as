package configs.cards
{
	public class EquipmentCardCfg extends CardCfg
	{
		//		0=无
		//		1=金
		//		2=木
		//		3=水
		//		4=火
		//		5=土
		//		6=气
		//		7=魂
		public var sort:int;
		
//		1=主动使用
//		2=待扩展
		public var usage:int;
		
//		0=无效
//		1=自己手牌
//		2=手牌装备
//		3=手牌法术
//		4=手牌人物
//		5=自己墓地牌
//		6=场上将领
//		7=法力值
		public var costResType:int;
		
//		0=无效
//		1=等于
//		2=大于
//		3=小于
		public var costCondition:int;
		
		public var costCount:int; // 消耗數目.
		
		//public var carryMax:int;
	
		public var buffIconURL:String; // buff圖標

	}
}