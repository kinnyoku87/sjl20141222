package models.events
{
	import models.battle.actions.BattleAction;
	
	import org.agony2d.events.AEvent;
	
	public class ActionEvent extends AEvent
	{
		public function ActionEvent(type:String, action:BattleAction)
		{
			super(type);
			
			this.action = action;
		}
		
		public static const NEXT_ACTION:String = "nextAction";
		
		public var action:BattleAction;
	}
}