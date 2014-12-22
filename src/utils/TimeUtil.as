package utils 
{
	import flash.utils.setInterval;
	import models.events.TimeEvent;
	import models.player.PlayerModel;
	import models.player.RoleEvent;
	import net.NetManager;
	import org.agony2d.events.Notifier;
	import proto.cs.CmdCodeSign;
	import proto.cs.CmdType;
	/**
	 * ...
	 * @author dcl
	 */
	public class TimeUtil 
	{
		private static var _ins:TimeUtil;
		private static var _notifier:Notifier = new Notifier();
		private var heartBeat:int = 0;                //心脏跳动
		private var _milliseconds:Number = 0;         //服务器时间 
		private var _onLineSeconds:Number = 0;       //每次上线清0，方便于部分模块计算时间(毫秒)
		
		public function TimeUtil() 
		{
			
		}
		
		public static function get ins():TimeUtil
		{
			if (_ins == null)
			{
				_ins = new TimeUtil();
			}
			return _ins;
		}
		
		public function init():void
		{
			setInterval(onSendTimer, 1000);
		}
		
		
		/**
		 * 偵聽事件.
		 * 
		 * @param type
		 * @param listener
		 */		
		public static function addEventListener( type:String, listener:Function ) : void {
			_notifier.addEventListener(type, listener);
		}
			
		/**
		* 移除偵聽.
		* 
		* @param type
		* @param listener
		*/		
		public static function removeEventListener( type:String, listener:Function ) : void {
			_notifier.removeEventListener(type, listener);
		}
			
		public static function dispatchEvent( str:String, data:Object = null ) : void {
			_notifier.dispatchEvent(new TimeEvent(str, data));
		}
		
		public function set serverTime(milliseconds:Number):void 
		{
			_milliseconds = milliseconds;
			onLineSeconds = 0;
		}
		
		public function get serverTime():Number 
		{
			return _milliseconds;
		}
		
		public function get onLineSeconds():Number 
		{
			return _onLineSeconds;
		}
		
		public function set onLineSeconds(value:Number):void 
		{
			_onLineSeconds = value;
		}
		
		private function onSendTimer():void
		{
			_milliseconds = _milliseconds + 1000;
			onLineSeconds = onLineSeconds + 1000;
			dispatchEvent(TimeEvent.Timer_Handler_Event,_milliseconds);
			heartBeat += 1;
			if (heartBeat == 5)
			{
				NetManager.sendRequest(CmdType.CT_AUTH,CmdCodeSign.CC_AUTH_HELLO,null,false);
				heartBeat = 0;
			}
		}
		
	}

}