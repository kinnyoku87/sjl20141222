package models.fangchenmi 
{
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author dcl
	 */
	public class FangChenMiEvent extends AEvent
	{
		public static var Update_FanChenMi_Info:String = "Update_FanChenMi_Info";
		
		public var data:Object;
		
	
		public function FangChenMiEvent(type:String,data:Object) 
		{
			super(type);			
		}
		
	}

}