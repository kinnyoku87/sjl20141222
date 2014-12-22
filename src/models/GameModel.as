package models
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import models.events.BattleEvent;
	import models.gameOver.GameOverModule;
	import org.agony2d.Agony;
	import org.agony2d.base.DebugLogger;
	import org.agony2d.base.LogMachine;
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	import org.agony2d.flashApi.TextFieldLogger;
	import org.agony2d.keyboard.TKeyboardManager;
	import org.agony2d.utils.DelayMachine;
	import proto.com.CampBattleCard;

public class GameModel {
	
	public static function initEvent():void {
		getNotifier().addEventListener(BattleEvent.BATTLE_OVER,onBattleOver);
	}
	
	
	public static function getLog() : LogMachine {
		var logger:TextFieldLogger = new TextFieldLogger(Agony.getStage(), false, 200, 760, 500, true);
		
		//return g_log ||= new LogMachine(new DebugLogger("(G)"));
		if (!g_log) {
			g_log = new LogMachine(logger);
			
			//Agony.getStage().addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
				//if (e.keyCode == Keyboard.NUMBER_2) {
					//
					//logger.visible = !logger.visible;
				//}
			//})
			TKeyboardManager.getInstance().getState().press.addEventListener("W", function(e:AEvent):void {
				logger.visible = !logger.visible;
			})
		}
		return g_log;
	}
	
	public static function getNotifier() : Notifier {
		return g_notifier ||= new Notifier;
	}
	
	public static function getDelay() : DelayMachine {
		return g_delay ||= new DelayMachine(Agony.getFrame().target);
	}
	
	public static function netBattleExiting() : void {
		g_notifier.dispatchEvent(new BattleEvent(BattleEvent.BATTLE_EXITING));
	}
	
//
	 //種族id.
	//public static var campIndex:int;
	//
	 //卡包索引.
	//public static var campBagIndex:int;
	
	//玩家当前卡包
	public static var campBag:CampBattleCard;
	
	
	// 遊戲模式
	public static var gameMode:int;
	
	
	public static var isReadyForLoginServers:Boolean;
	
	
	
	//private static var _isBattleAssetLoaded:Boolean;
	//private static var _isBattleNetDone:Boolean;
	private static var _battleFlag:int;
	public static function enterBattleByFlag() : void {
		if (++_battleFlag == 2) {
			g_notifier.dispatchDirectEvent(AEvent.COMPLETE);
		}
	}
	
	public static function exitBattle() : void {
		_battleFlag = 0;
	}
	
	public static function onBattleOver(evt:BattleEvent):void {
		GameOverModule.gameOver();
	}
	
	
	
	
	private static var g_delay:DelayMachine;
	
	private static var g_log:LogMachine;
	
	private static var g_notifier:Notifier;
	
	
}
}