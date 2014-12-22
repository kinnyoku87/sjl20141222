package models.events
{
	import models.battle.CharacterVo;
	import org.agony2d.events.AEvent;
	
	public class NullSelectedUiEvent extends AEvent
	{
		public function NullSelectedUiEvent(type:String, selectedVo:CharacterVo)
		{
			super(type);
			
			this.selectedVo = selectedVo;
		}
		
		
		public static const NULL_SELECTED:String = "nullSelected";
		
		
		public var selectedVo:CharacterVo;
	}
}