package models.battle.actions
{
	import com.netease.protobuf.UInt64;
	
	import models.battle.BattleRoleModel;
	
	import org.agony2d.utils.formatString;

	public class NewCardAction extends BattleAction
	{
		public function NewCardAction( roleId:UInt64 )
		{
			super(roleId);
		}
		
		
		public var cardId:int;
		
		
		public function toString() : String {
			return formatString("[ {0} 得到新卡牌 ]: {1}", [BattleRoleModel.getBattleRoleVo(roleId).roleVo.name, cardId]);
		}
	}
}