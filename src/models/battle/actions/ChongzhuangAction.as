package models.battle.actions 
{
	import com.netease.protobuf.UInt64;
	import flash.geom.Point;
	
	import models.battle.CharacterVo;
	
	import org.agony2d.utils.formatString;
	
	import proto.cs.ChessPos;
	
	public class ChongzhuangAction extends BattleAction
	{
		
		public function ChongzhuangAction( roleId:UInt64 )
		{
			super(roleId);
		}
		
		public var fromVo:CharacterVo;
		public var targetVo:CharacterVo;
		
		public var pos:Point;
		
		
		public function toString() : String {
			return formatString("[ 冲撞 ]: {0} ({1}) => {2}.", [targetVo.name, targetVo.card_guid, pos]);
		}
	}

}