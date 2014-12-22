package models.battle.actions 
{
	import com.netease.protobuf.UInt64;
	import configs.cards.CardConfigurator;
	import models.battle.BattleRoleModel;
	import models.battle.BattleRoleVo;
	import proto.cs.BattleEffect;
	
	public class KillCardAction extends BattleAction
	{
		
		// roleId为空代表自己.
		public function KillCardAction(roleId:UInt64)
		{
			super(roleId);
			
		}
		
		public var battleEffect:BattleEffect;
		
		public function getBattleRole() : BattleRoleVo {
			return BattleRoleModel.getBattleRoleVo(this._roleId);
		}
		
		
		public function toString() : String {
			return "[ KillCard ]: " + this.getBattleRole().roleVo.name + " - " + CardConfigurator.getCardById(battleEffect.effectValue).name + "(" + battleEffect.effectValue % 100000 + ")";
		}
	}

}