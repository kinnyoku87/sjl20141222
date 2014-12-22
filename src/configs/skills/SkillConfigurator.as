package configs.skills
{
	import models.GameModel;
	
	import org.agony2d.collections.CsvUtil;

	public class SkillConfigurator
	{
		
		public static function initSkill( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var skill:SkillCfg
			
			const SKILL_FIELDS:Array = ["id", "name", "type", "sort", "usage", "howRun", "desc","costResType", "costCondition", "costCount", "shape", "radius", "rangeMin", "rangeMax", "selectType", null, "isCrossCenter",  "effectType1","target1","effectValue1","effectType2","target2", "effectValue2","buff1",null,"buff2",null,null,"effectURL","soundURL","word"]
			l = v.length;
			while(i<l){
				skill = new SkillCfg;
				CsvUtil.setValues(skill, v[i++], SKILL_FIELDS);
				_skillList[skill.id] = skill;
				//if (skill.id == 0) {
					//trace("!!");
				//}
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Skill ].");
		}
		
		public static function initBuff( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var buff:BuffCfg
			
			//const BUFF_FIELDS:Array = ["id", "name", "type", "value", "untilWho", "keepRounds", "desc","imageURL"]
			const BUFF_FIELDS:Array = ["id", "name", "type", "value", "untilWho", "keepRounds", null, null, null, null, null, null, null, "desc","imageURL"]
			l = v.length;
			while(i<l){
				buff = new BuffCfg;
				CsvUtil.setValues(buff, v[i++], BUFF_FIELDS);
				_skillList[buff.id] = buff;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Buff ].");
		}
		
		/**
		 * 通過id獲取Skill.
		 * 
		 * @param id
		 */
		public static function getSkillById( id:int ) : SkillCfg {
			return _skillList[id] as SkillCfg;
		}
		
		/**
		 * 通過id獲取buff.
		 * 
		 * @param id
		 */
		public static function getBuffById( id:int ) : BuffCfg {
			return _skillList[id] as BuffCfg;
		}
		
		
		private static var _skillList:Object = {};
	}
}