package configs.skills
{
	public class SkillCfg
	{
		
		
		public var id:int;
		
		public var name:String;
		
		public var type:int;
		
		public var sort:int;
		
		//		无效	0
		//		上场后主动操作	1
		//		上场当时自动使用一次	2
		//		上场后一直存在	3
		//		受到攻击或控制时	4
		//		受到伤害后	5
		//		受到相邻攻击时	6
		//		死亡时	7
		//		攻击时	8
		//		回合开始时使用	9
		//		所有回合	10
		//		上场后主动使用一次	11
		//		攻击或反击时	12
		//		回合结束时	13
		//		敌方人物使用装备牌时	14
		public var usage:int;

		// 1  主動
		// 2  自動
		public var howRun:int;
		
		public var desc:String;
		
		
		public var costResType:int
		
		public var costCondition:int;
		
		public var costCount:int; // 消耗數目.
		
//		生效形状
//		0=无
//		1=点
//		2=直向射线
//		3=斜向射线
//		4=圆形
//		5=自定义
//		6=同列全部
//		7=同行全部
//		8=正前方
//		9=同行前方
		public var shape:int;
		
		
		public var radius:int;
		
		public var rangeMin:int;
		
		public var rangeMax:int;
		
//		不需要选择 =0
//		选择自己= 1
//		选择敌人= 2
//		选择任意格子= 3
//		玩家头像=4
		public var selectType:int;

		public var isCrossCenter:int;
		
//		无	0
//		普通攻击	1
//		反击	2
//		技能法术伤害	3
//		加血	4
//		抽牌	5
//		转移装备	6
//		伤害转移	7
//		强制移动	8
//		卸载装备	9
//		撒豆成兵	10
//		猜法力	11
//		猜名字	12
//		复活手牌	13
//		回复法力	14
//		招妖幡	15
//		法咒尽散	16
//		王者宿命	17
//		附身	18
//		挪移大法	19
//		打神鞭	20
//		消灭手牌	21
//		冲撞	22
//		巨口吞食	23
//		吸血	24
//		离间	25
//		千里眼	26
//		顺风耳	27
//		入土转生	28
//		偷天换日	29
//		复活王	30
//		遁龙柱	31
		public var effectType1:int;
		
		public var target1:int;
		
		public var effectValue1:int;
		
		public var effectType2:int;
		
		public var target2:int;
		
		public var effectValue2:int;
		
//		无施放目标=0
//		己方全部人物=1
//		敌方全部人物=2
//		我方王=3
//		敌方王=4
//		用户头像=5
//		选择任意格子=6
//		场上所有人物=7
//		技能作用区域内所有人物=8
//		己方人物(非王)=9
//		敌方全部(非王)=10
//		选择手牌=11
//		敌方神或仙=12
//		受过伤的人=13
//		男性=14
//		自己=15
//		某方场上全部人物=16
//		己方和友方全部人物=17
//		场上全部王者=18
//		场上所有人物(非王)=19
		public var buff1:int;
		
		public var buff2:int;
		
		public var effectURL:String;
		
		public var soundURL:String;
		
		public var word:String;
	}
}