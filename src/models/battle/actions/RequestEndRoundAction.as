package models.battle.actions 
{
	import com.netease.protobuf.UInt64;
	
	public class RequestEndRoundAction extends BattleAction
	{
		
		public function RequestEndRoundAction( roleId:UInt64 ) 
		{
			super(roleId);
		}
		
	}

}