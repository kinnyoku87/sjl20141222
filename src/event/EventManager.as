package event
{
		
	/**
	 * ...事件管理类
	 * @author ... dcl
	 */
	import flash.utils.Dictionary;
	import models.GameModel;
	
	public class EventManager implements IEventManager
	{
		private static var _ins:EventManager;
		private var dictionary:Dictionary;
		
		public function EventManager()
		{
			if(dictionary == null)
			{
				dictionary = new Dictionary();
			}
		}
		
		//抛事件
		public function sendEvent(event:String, data:Object = null):void
		{
			var callBacks:Array = dictionary[event];
			if (callBacks) {
				var callBack:Function;
				var len:int = callBacks.length;
				for (var i:int = 0; i < len;i++ ) {
					callBack = callBacks[i]  as Function;
					if (callBack != null) {
						callBack.call(null, event, data);
					}
				}
			}
			else
			{
				GameModel.getLog().simplify("[错误事件]: {0}", event);
			}
		}
		
		//监听事件
		public function addEvtListener(event:String, callBack:Function):void {
			var callBacks:Array = dictionary[event]; 
			if (callBacks)
			{
				var len:int = callBacks.length;
				for (var i:int = 0; i < len;i++ ) 
				{
					if (callBacks[i] === callBack) 
					{
						return;
					}
					callBacks.push(callBack);
				}
			}else 
			{
				var arr:Array = [];
				arr.push(callBack);
				dictionary[event] = arr;
			}
		}
		
		//移除事件
		public function removeEvtListener(event:String, callBack:Function):void {
			var callBacks:Array = dictionary[event]; 
			if (callBacks)
			{
				var len:int = callBacks.length;
				for (var i:int = 0; i < len;i++ ) 
				{
					if (callBacks[i] === callBack) 
					{
						callBacks[i] == null;
					}
				}
			}
		}
		
		static public function get ins():EventManager 
		{
			if (_ins == null) {
				_ins = new EventManager();
			}
			return _ins;
		}
		
		
	}
}