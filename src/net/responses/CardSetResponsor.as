package net.responses 
{
	import models.cardSet.CardSetModule;
	import proto.cs.BattleBody;
	import proto.cs.CmdCodeBattle;
	import proto.cs.GetBattleParamRes;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CardSetResponsor implements IResponsor
	{
		
		public function CardSetResponsor() 
		{
			
		}
		
		
		public function onHandle( cmd_B:int, subMsg:Object ) : void {
			var subMsg_A:BattleBody;
			
			subMsg_A = subMsg as BattleBody;
			
			switch(cmd_B){
				case CmdCodeBattle.CC_BATTLE_GET_PARAM_RES:
					this.onBattleGetRes(subMsg_A.getBattleParamRes as GetBattleParamRes);
					break;
				
				case CmdCodeBattle.CC_BATTLE_SET_PARAM_RES:
					this.onCheckCodeNTF(subMsg_A.checkCodeNtf as CheckCodeNtf);
					break;
				
				default:
					break;
			}
		}
		
		private function onBattleGetRes(v:GetBattleParamRes):void {
			CardSetModule.onCardSetInfo(v);
		}

	}

}