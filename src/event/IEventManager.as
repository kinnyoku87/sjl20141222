package event 
{
	
	/**
	 * ...
	 * @author ... dcl
	 */
	public interface IEventManager 
	{
		//侦听事件
		function addEvtListener(event:String, callBack:Function):void
			
		//移除事件
		function removeEvtListener(event:String, callBack:Function):void
			
		//抛事件
		function sendEvent(event:String, data:Object = null):void
	}
	
}