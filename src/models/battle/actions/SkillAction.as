package models.battle.actions
{
	import com.netease.protobuf.UInt64;
	import configs.skills.SkillCfg;
	import models.battle.BattleModel;
	import proto.cs.ChessPos;
	import proto.cs.SkillUseRes;
	
	import configs.skills.SkillConfigurator;
	
	import models.battle.CharacterVo;
	
	
	// 技能動作.
	public class SkillAction extends BattleAction
	{
		//public function SkillAction(roleId:UInt64)
		public function SkillAction()
		{
			super(null);
		}
		
		public var fromGuid:UInt64;
		public var endGuid:UInt64;
		
		public var endPos:ChessPos;
		
		
		public var ret:int
		
		public function get fromVo():CharacterVo {
			return BattleModel.getVoByGuid(fromGuid);
		}
		
		public function get targetVo():CharacterVo {
			return BattleModel.getVoByGuid(endGuid);
		}
		
		public function get cfg() : SkillCfg {
			return SkillConfigurator.getSkillById(skillId);
		}
		
		public var skillId:int;
		
		public var effects:Array;
		
		//public var buffs:Array;
		
		public var costCardIdList:Array;
		
		public var costDeadCardIdList:Array;
		
		public var costMp:int;
		
		
		override public function get roleId():UInt64 {
			var tmpVo:CharacterVo;
			
			tmpVo = BattleModel.getVoByGuid(fromGuid);
			return tmpVo ? tmpVo.role_id : null;
		}
		
		
		public function toString() : String {
			return "[ 技能( " + ((skillId > 0) ? SkillConfigurator.getSkillById(skillId).name : "None") + " ) ]: " + fromVo + " => " + targetVo;
		}
	}
}