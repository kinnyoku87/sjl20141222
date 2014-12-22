package models.battle.actions
{
	import com.netease.protobuf.UInt64;
	
	import models.battle.CharacterVo;
	
	import org.agony2d.utils.formatString;
	
	import proto.cs.ChessPos;
	
	// 登場動作.
	public class DebutAction extends BattleAction
	{
		
		public function DebutAction(roleId:UInt64)
		{
			super(roleId);
		}
		
		public var vo:CharacterVo;
		
		public var pos:ChessPos;
		
		
		public function toString() : String {
			return formatString("[ 登場 ]: {0} ({1}) => {2}.", [vo.name, vo.card_guid, pos]);
		}
	}
}