package models.events 
{
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class BattleEvent extends AEvent
	{
		
		public function BattleEvent( type:String ) 
		{
			super(type);
		}
		
		// 战斗结束
		public static const BATTLE_OVER:String = "battleOver";
		
		// 从战斗场景退出
		public static const BATTLE_EXITING:String = "battleExit";
	}

}