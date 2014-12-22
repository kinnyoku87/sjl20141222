package models.events 
{
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author dcl
	 */
	public class TimeEvent extends AEvent
	{
		
		public static const Timer_Handler_Event:String = "Timer_Handler_Event"; //心脏跳动事件  每秒执行一次
		
		public var data:Object;
		
		public function TimeEvent(type:String,data:Object) 
		{
			super(type);
			this.data = data;
		}
		
	}

}