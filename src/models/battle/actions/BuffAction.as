package models.battle.actions
{
	import com.netease.protobuf.UInt64;
	import configs.skills.BuffCfg;
	import models.battle.BattleModel;
	
	import configs.skills.SkillConfigurator;
	
	import models.battle.CharacterVo;
	
	import proto.cs.BattleBuff;
	
	public class BuffAction extends BattleAction
	{
		public function BuffAction(roleId:UInt64)
		{
			super(roleId);
		}
		
		
		
		public var buff:BattleBuff;
		
		public function get targetVo():CharacterVo {
			return BattleModel.getVoByGuid(buff.objectUid);
		}
		
		override public function get roleId():UInt64 {
			var tmpVo:CharacterVo;
			
			tmpVo = BattleModel.getVoByGuid(buff.objectUid);
			return tmpVo ? tmpVo.role_id : null;
		}
		
		
		
		public function toString() : String {
			var buffCfg:BuffCfg;
			
			buffCfg = SkillConfigurator.getBuffById(buff.buffId);
			return "[ Buff( " + (buffCfg ? buffCfg.name : "???") + " ) ]: " + (targetVo ? targetVo : "NULL 人物(尚未登场)");
		}
	}
}