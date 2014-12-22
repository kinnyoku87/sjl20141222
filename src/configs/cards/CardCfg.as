package configs.cards {
	import configs.skills.SkillCfg;
	import configs.skills.SkillConfigurator;
	
	
	
public class CardCfg {
	
	public var id:int;
	
	public var name:String;
	
//	1=商国
//	2=周国
//	3=妖族
//	4=巫族
//	9=中立（可属于任意）
	public var camp:int;
	
	// type
	//	1=人物
	//	2=法术
	//	3=装备
	//	0=无效
	public var type:int;
	
	
	//	1=白
	//	2=绿
	//	3=蓝
	//	4=紫
	//	5=橙
	//	6=红
	public var quality:int;
	
	public var mana:int; // 魔耗
	
	public var carryMax:int;
	
	public function getSkill1() : SkillCfg {
		return SkillConfigurator.getSkillById(skill1);
	}
	
	public var skill1:int;
	
	public function getSkill2() : SkillCfg {
		return SkillConfigurator.getSkillById(skill2);
	}
	
	public var skill2:int;
	
	
	public var imageURL:String; // 圖像.
	
	
	public var effectURL:String;
	
	public var soundURL:String;
	
	public var desc:String;
	
	public var guide:String;
	
}
}