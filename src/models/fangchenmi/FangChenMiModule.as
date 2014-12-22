package models.fangchenmi 
{
	import com.netease.protobuf.Int64;
	import models.PromptManager;
	import org.agony2d.events.Notifier;
	import proto.cs.LoginRes;
	import ui.AlertInfo;
	import utils.TimeUtil;
	/**
	 * ...
	 * @author dcl
	 */
	public class FangChenMiModule 
	{
		public static var isVarificate:Boolean ;
		public static var onlineTime:Number ;
		public static var curHour:int;   
		
		
		private static var _notifier:Notifier = new Notifier();
		public function FangChenMiModule() 
		{
			
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
			_notifier.dispatchEvent(new FangChenMiEvent(str, data));
		}
		
		public static function getLoginRes(v:LoginRes):void {
			isVarificate = v.isVarificate != 0 ? true : false;			
			onlineTime = v.onlineTimeAccumulate.toNumber();	
			
			
		}
		
		public static function varificateStatus(ret:int):void {
			var alert:AlertInfo = new AlertInfo;
			alert.title = "提示";
			alert.skin = AlertInfo.skin_2;
			alert.type = AlertInfo.type_2;
			alert.sizeWidth = 500;
			alert.sizeHeight = 250;
			alert.buttonSkin = AlertInfo.buttonSkin_E;
			alert.btnLocatingY = -50; 
			alert.msgLocatingY = -20; 
			alert.titleLocatingY = 5; 
			alert.cancelLabel = "确定"; 
			if (ret < 0) {
				alert.msg = "【您未通过实名认证，请及时填写！】";
			}else {
				alert.msg = "【您已通过实名认证！】";
				isVarificate = true;
				dispatchEvent(FangChenMiEvent.Update_FanChenMi_Info);
			}
			PromptManager.instanse.showAlert(alert);
			
		}
		
		public static function updateFangChenmi():Boolean {
			var bShow:Boolean = false;
			curHour = Math.floor((TimeUtil.ins.onLineSeconds / 1000 + onlineTime) / 3600);
			var  minutes:int = Math.ceil((TimeUtil.ins.onLineSeconds / 1000 + onlineTime) / 60);
			//在3小时前 每隔45分钟提示
            if (curHour < 3)
            {
                if (minutes != 0 && minutes % 45 == 0)
                {
                    bShow = true;
      
                }
            }
            else if(curHour >= 3 && curHour < 5)    //3小时至5小时  30分钟提示一次
            {
                if (minutes % 30 == 0)
                {
                    bShow = true;
                }
            }
            else if(curHour >= 5)                   //5小时后   15分钟提示一次
            {
                if (  minutes % 15 == 0)
                {
                    bShow = true;
                }
            }
			return bShow;
		}
		
		public static function get FangchenmiStr():String {
			curHour = Math.floor((TimeUtil.ins.onLineSeconds / 1000 + onlineTime) / 3600);
			var str:String = "";
			if (curHour < 1) {
				str = "防沉迷提示：您已被纳入防沉迷系统，请及时填写实名认证信息。";
			}else if(curHour >= 5){
				str = "防沉迷提示：您已进入不健康游戏时间，您的收益已降为零，直到您的累计下线时间满5小时后，才能恢复正常。请及时填写实名认证信息。";
			}else if(curHour >= 3 && curHour < 5){
				str = "防沉迷提示：您已经进入疲劳游戏时间，您的游戏收益将为正常值的50%。请及时填写实名认证信息。";
			}else {
				str = "防沉迷提示：您已累积在线" + curHour + "小时，请及时填写实名认证信息。"
			}
			return str;
		}
	}

}