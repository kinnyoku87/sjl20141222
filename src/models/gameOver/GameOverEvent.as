package models.gameOver 
{
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author dcl
	 */
	public class GameOverEvent extends AEvent
	{
		
		public static const Game_Over_End_Event:String = "Game_Over_End_Event"; //比赛结束(完全结束，已完成结束的步骤)
		public static const Game_Over_State_Event:String = "Game_Over_State_Event"; //结束后信息状态
		
		public var data:Object;
		
		public function GameOverEvent(type:String,data:Object) 
		{
			super(type);
			this.data = data;
		}
		
	}

}