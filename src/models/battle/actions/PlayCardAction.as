package models.battle.actions
{
	import com.netease.protobuf.UInt64;
	import proto.cs.SkillUseReq;
	
	import configs.cards.CardConfigurator;
	
	import models.battle.BattleRoleModel;
	
	import org.agony2d.utils.formatString;
	
	import proto.cs.ChessPos;

	
	
	// 出牌动作.
	public class PlayCardAction extends BattleAction
	{
		
		// roleId为空代表自己.
		public function PlayCardAction(roleId:UInt64)
		{
			super(roleId);
			
		}

		
		
		public function toString() : String {
			return formatString("[ {0} 出牌 ]: {1} ({2})", [BattleRoleModel.getBattleRoleVo(roleId).roleVo.name, CardConfigurator.getCardById(cardGuid).name, cardGuid]);
		}
		
		//public var ret:int;
		
		public var cardGuid:int;
		public var pos:ChessPos;
		public var remainMp:int;
	}
}