package models.events
{
	import org.agony2d.events.AEvent;
	
	public class SelectedUiHoverCardEvent extends AEvent
	{
		public function SelectedUiHoverCardEvent( type:String, gridIdList:Array )
		{
			super(type);
			
			this.girdIdList = gridIdList;
		}
		
		
		public static const HOVER_CARD:String  = "hoverCard";
		
		
		
		public var girdIdList:Array;
	}
}