package models.battle.actions 
{
	import com.netease.protobuf.UInt64;
	
	import configs.cards.CardConfigurator;
	
	import models.battle.BattleRoleModel;
	
	import org.agony2d.utils.formatString;
	
	import proto.cs.BoutBeginNtf;
	
	public class NextRoundAction extends BattleAction
	{
		
		public function NextRoundAction( roleId:UInt64 ) 
		{
			super(roleId);
			
		}
		
		public var cardCount:int;
		
		public function toString() : String {
			return formatString("[ 新的回合 ]: {0}", [BattleRoleModel.getBattleRoleVo(roleId).roleVo.name]);
		}
		
//		public var boutBeginNtf:BoutBeginNtf;
	}

}