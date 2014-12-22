package configs.skills
{
	public class BuffCfg
	{
		
		
		public var id:String;
		
		public var name:String;
		
//		101	加原地攻击和反击伤害
//		102	加反击伤害
//		103	每次抵消伤害
//		104	移动距离加伤害
//		105	减体力上限
//		106	嘲讽
//		107	高速移动
//		108	降低移动力
//		109	定身
//		110	免疫魂系法术
//		111	永久免疫反击伤害
//		112	持续定身，但不能被攻击和控制。    
//		113	降低攻击力
//		114	增加攻击力
//		115	伤害结果增加
//		116	多次行动
//		117	丢弃已经装配的装备
		public var type:int;
		
		public var value:int;
		
//		1=目标玩家
//		2=发起者玩家
//		3=下一个玩家
//		4=待扩展
//		999=永久
		public var untilWho:int;
		
		// 持續回合
		// 0  一回合
		// 1  永久
		public var keepRounds:int;
		
		public var desc:String;
		
		
		public var imageURL:String
		
		
	}
}