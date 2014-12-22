package models.events
{
	import org.agony2d.events.AEvent;
	
	public class ControlEvent extends AEvent
	{
		public function ControlEvent(type:String, isControlable:Boolean )
		{
			super(type);
			
			this.isControlable = isControlable;
		}
		
		
		public static const CONTROL_CHANGE:String = "controlChange";
		
		
		public var isControlable:Boolean;
		
	}
}