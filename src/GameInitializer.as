package {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.events.ContextMenuEvent;
	import flash.events.KeyboardEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	import flash.system.Security;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuBuiltInItems;
	import flash.ui.ContextMenuItem;
	import flash.ui.Keyboard;
	import models.set.SetModule;
	import org.agony2d.flashApi.TextFieldLogger;
	import org.agony2d.resources.converters.AtlasAssetConvert;
	import org.agony2d.resources.ResMachine;
	import org.agony2d.sounds.MusicManager;
	import org.agony2d.sounds.SfxManager;
	import utils.CoockieUtil;
	import utils.TimeUtil;
	
	import configs.ConfigNet;
	
	import models.GameModel;
	
	import net.NetManager;
	
	import org.agony2d.Agony;
	import org.agony2d.base.Adapter;
	import org.agony2d.display.animation.AnimationManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.tips.TipReactionType;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.keyboard.TKeyboardManager;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.Stats;
	import org.agony2d.utils.gc;
	
	import views.Login_StateVV;
	import views.UU.tips.Alpha_TipEffectStateUU;
	
	// 鍵盤1: 前端記錄.
	// 鍵盤3: 後端記錄.
	public class GameInitializer {
		
		public static function startup( stage:Stage, root:Sprite ) : void {
			Security.allowDomain("*");
			
			var logger:TextFieldLogger = new TextFieldLogger(stage, true, 200, 380, 500, true);
			
			// Agony2D.
			//Agony.startup(stage, null, new Adapter(1280, 960, true), onInit);
			Agony.startup(stage, logger, new Adapter(1280, 960, true), onInit);
			//Agony.startup(stage, logger, null, onInit);
			
			MusicManager.getInstance().loadAndPlay("assets/sounds/music/hall_bg.mp3", 0, 1);
			
			// 客户端log.
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
				//if (e.keyCode == Keyboard.NUMBER_1) {
					//
					//logger.visible = !logger.visible;
				//}
			//})
			TKeyboardManager.getInstance().getState().press.addEventListener("Q", function(e:AEvent):void {
				logger.visible = !logger.visible;
			});
			//暂时的音乐开关.
			TKeyboardManager.getInstance().getState().press.addEventListener("M", function(e:AEvent):void {
				MusicManager.getInstance().totalVolume = MusicManager.getInstance().totalVolume == 0 ? 1 : 0;
			});
			//暂时的音效开关.
			TKeyboardManager.getInstance().getState().press.addEventListener("S", function(e:AEvent):void {
				SfxManager.getInstance().totalVolume = SfxManager.getInstance().totalVolume == 0 ? 1 : 0;
			})
			
			SetModule.firstVolumes();
			
			TKeyboardManager.getInstance().getState().press.addEventListener("MINUS", function(e:AEvent):void {
				Agony.getFrame().timeScaleFactor -= 0.1;
				GameModel.getDelay().timeScaleFactor -= 0.1;
				
				Agony.getLog().simplify("[ timeScaleFactor-- ]: {0}", Agony.getFrame().timeScaleFactor);
			})
			
			TKeyboardManager.getInstance().getState().press.addEventListener("PLUS", function(e:AEvent):void {
				Agony.getFrame().timeScaleFactor += 0.1;
				GameModel.getDelay().timeScaleFactor += 0.1;
				
				Agony.getLog().simplify("[ timeScaleFactor++ ]: {0}", Agony.getFrame().timeScaleFactor);
			})
			if(Capabilities.isDebugger){
				TKeyboardManager.getInstance().getState().press.addEventListener("G", function(e:AEvent):void{
					gc();
				})
			}
			
			// Stats.
			_stats = new Stats(0, 55);
			stage.addChild(_stats);
			
			_logTxtView = new TextField;
			stage.addChild(_logTxtView);
			_logTxtView.x = 60;
			_logTxtView.y = 55;
			_logTxtView.textColor = 0xFFFFFF;
			_logTxtView.autoSize = TextFieldAutoSize.LEFT;
			var css:TextFormat = new TextFormat("Courier New", 12);
			_logTxtView.defaultTextFormat = css;
			_logTxtView.text = '[ q ]: client\n[ w ]: server\n[ t ]: 隐藏/显示\n[ m ]: 音乐\n[ s ]: 音效\n[ - ]: slow\n[ + ]: fast';
			
			TKeyboardManager.getInstance().getState().press.addEventListener("T", function(e:AEvent):void {
				if (_logTxtView.visible) {
					_stats.visible = _logTxtView.visible = false;
				}
				else {
					_stats.visible = _logTxtView.visible = true;
				}
			});
			
			GameModel.getLog().simplify("[安全沙箱類型]: {0}", Security.sandboxType);
			GameModel.getLog().simplify("[頁面域]: {0}", Security.pageDomain);
			GameModel.getLog().simplify("[SWF URL]: {0}", root.loaderInfo.url);
			
			
			
			// 屏蔽右鍵.
			//stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, function(e:MouseEvent):void{}); 
		}
		
		private static var _stats:Stats;
		private static var _logTxtView:TextField;
		
		private static function onInit():void {
			TouchManager.registerListenTarget();
			
			// 動畫速率.
			AnimationManager.defaultFrameRate = 12;
			AnimationManager.speedScaleFactor = 0.98;
			
			// 資源管.
			TResourceManager.initialize();
			
			ResMachine.baseURL = "assets/";
			ResMachine.activate(AtlasAssetConvert);
			ResMachine.getInstance().weakErrorChecking = true;
			
			//ResMachine.baseURL = "http://192.168.4.195/flash/assets/";
			//TResourceManager.externalField = "http://192.168.4.195/flash/";
			
			
			//...    \\192.168.4.195\public\flash
			//...    E:\shenzhen_B\S1_Code\FlashClient\client\res
			
			
			// Upper UI.
			UUFacade.registerRoot();
			UUToolTip.setReactionTypeForPress(TipReactionType.EXIT_NO_EFFECT);
			UUToolTip.setDefaultEffect(Alpha_TipEffectStateUU);
			
			CoockieUtil.ins;
			TimeUtil.ins.init();
			GameModel.initEvent();
			// ContextMenu
			//var contextMenu:ContextMenu;
			//var item:ContextMenuItem;
			
			//contextMenu = new ContextMenu;
			//contextMenu.hideBuiltInItems();
			//item = new ContextMenuItem("禅道");
			//contextMenu.customItems.push(item);
			//item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, function(e:ContextMenuEvent):void {
				//navigateToURL(new URLRequest("http://192.168.4.12/zentao/user-login-L3plbnRhby9teS5odG1s.html"));
			//})
			//Sprite(UUFacade.getRoot().displayObject).contextMenu = contextMenu;
			
			
			//TResourceManager.loadAssets2("temp/bg/bg.jpg");
			
			Security.loadPolicyFile("xmlsocket://192.168.4.195:8843");
			
			connect();
		}
		
		public static function connect():void{
			NetManager.connect("192.168.4.195", 8843);
			NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected1);
		}
		
		private static function ____onNetConnected1(e:AEvent):void {
			NetManager.removeEventListener(AEvent.COMPLETE, ____onNetConnected1);
			
			// 網路管.
			NetManager.connect(ConfigNet.ip, ConfigNet.port);
			// (連接完畢) -> 偵聽器...
			NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected2);
			
			
			
		}
		
		/**
		 * 登陸遊戲.
		 */
		public static function ____onNetConnected2(e:AEvent):void{
			NetManager.removeEventListener(AEvent.COMPLETE, ____onNetConnected2);
			GameModel.getLog().simplify("客戶端初期登陸.");
			
			ViewFacade.setStateView(Login_StateVV);
		}
		
	}
}