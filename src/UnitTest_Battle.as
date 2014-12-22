package  
{
	import com.greensock.plugins.MotionBlurPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.loading.LoadManager;
	import views.UU.battle.GuessCard_StateUU;
	
	import configs.battle.BattleConfigurator;
	import configs.cards.CardConfigurator;
	import configs.skills.SkillConfigurator;
	
	import models.GameModel;
	import models.battle.BattleModel;
	
	import org.agony2d.Agony;
	import org.agony2d.base.Adapter;
	import org.agony2d.base.DebugLogger;
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.display.animation.AnimationManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.Stats;
	
	import views.UU.battle.Battle_active_StateUU;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.battle.Battle_active_pre_StateUU;
	import views.UU.battle.Battle_bg_7_7_StateUU;
	import views.UU.battle.Battle_ready_StateUU;
	import views.UU.battle.Battle_ui_7_7_StateUU;
	import views.UU.comps.CardUU;
	import views.UU.comps.cardStates.CharacterCard_StateUU;
	import views.UU.tips.Alpha_TipEffectStateUU;
	import views.UU.hall.Hall_A_StateUU;
	import views.UU.login.Login_Bg_StateUU;
	import views.UU.login.Login_Creation_StateUU;
	import views.UU.login.Login_Servers_StateUU;
	import views.UU.login.Login_UserInput_StateUU;
	import views.UU.room.Room_StateUU;
	
	[SWF(width="1160", height="720", frameRate="60",backgroundColor = "0x0")]
	public class UnitTest_Battle extends Sprite
	{
		
		public function UnitTest_Battle() 
		{
			//Agony.startup(stage, new DebugLogger, null, onInit);
			Agony.startup(stage, new DebugLogger("(A)"), new Adapter(1280, 960, true), onInit);
		}
		
		// login
//		public var assetsList:Array = ["login.zip","servers.zip"]
		
		// hall
		//public var assetsList:Array = ["hall.zip"]
			
		// create role
//		public var assetsList:Array = ["login.zip","creation.zip"]
		
		// room
		//public var assetsList:Array = ["room.zip", "camp.zip"]
		public var assetsList2:Array = ["atlas/camps.atlas"]
		
		// battle
		public var assetsList:Array = ["login.zip", "card.zip", "battle.zip"];
		
		
		
		public var csvList:Array = ["data/card_character.csv", "data/card_equipment.csv","data/card_magic.csv", "data/skill.csv", "data/buff.csv"]
			
					
		//private static var _isBattleState:Boolean //= true;
		private static var _isBattleState:Boolean = true;
		
		private function onInit():void{
			var data:Vector.<Array>;
			
			LoadManager.maxLoading = 6;
			
			TouchManager.registerListenTarget();
			AnimationManager.defaultFrameRate = 12;
			TResourceManager.initialize();
			UUFacade.registerRoot();
//			UUToolTip.setDefaultEffect(Alpha_TipEffectStateUU);
			TweenPlugin.activate([MotionBlurPlugin]);
			
			
			// Stats.
			stage.addChild(new Stats(0, 60));
			
			var txt:TextField = new TextField;
			stage.addChild(txt);
			txt.y = 170;
			txt.textColor = 0xFFFFFF;
			txt.autoSize = TextFieldAutoSize.LEFT;
			var css:TextFormat = new TextFormat("Courier New", 12);
			txt.defaultTextFormat = css;
			txt.text = '[ 1 ]: client\n[ 2 ]: server\n[ m ] : 音乐\n[ s ] : 音效'
			
			
			
			// 屏蔽右鍵.
//			stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, function(e:MouseEvent):void{}); 
			TResourceManager.loadAssets("common.zip").addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				UUFacade.registerSkin("common_A", ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER_INVALID, 
					TResourceManager.getAsset("common/btn/A_release.png").data,
					TResourceManager.getAsset("common/btn/A_hover.png").data,
					TResourceManager.getAsset("common/btn/A_press.png").data,
					TResourceManager.getAsset("common/btn/A_intouchable.png").data);
			});
			TResourceManager.loadAssets2("temp/bg/bg.jpg");
			
			var i:int;
			while(i<assetsList.length){
				TResourceManager.loadAssets(assetsList[i++]);
			}
			
			i = 0;
			while(i<assetsList2.length){
				TResourceManager.loadAssets2(assetsList2[i++]);
			}
			
			TResourceManager.loadAssets2("animation/common.xml").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
				AnimationManager.addFrameClips(TResourceManager.getAsset("animation/common.xml").data);
			})
				
			
			if(_isBattleState){
				
//				Agony.getAdapter().pixelRatio = 1;
				
				var img:BitmapLoaderUU;
				
				var l:int;
				var assetURLs:Array = [];
				i = 0;
				//l = 28;
				//while(++i<=l){
					//assetURLs.push("temp/battle/bg/" + i + ".png");
				//}
				//i = 0;
				//l = 25;
				//while(++i <= l){
					//assetURLs.push("temp/battle/grid_5_5/creation/" + i + ".png");
				//}
				//TResourceManager.loadAssets2.apply(null, assetURLs);
				
				
				TResourceManager.loadAssets2("temp/bg/battleBg.png");
				
				TResourceManager.loadAssets2("data/5-5_grid.csv").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
					data = CsvUtil.parse(TResourceManager.getAsset("data/5-5_grid.csv").data);
					BattleConfigurator.initGrids(data);
				})
				
				TResourceManager.loadAssets2(
											"atlas/scene/fire2.atlas", 
											"atlas/common/roundOk.atlas").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
					//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/shang/shield.atlas").data);
					//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/zhouwang.atlas").data);
					
					UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/fire2.atlas").data);
					UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/common/roundOk.atlas").data);
				});
				
				
				
			}
			
			TResourceManager.loadAssets2.apply(null, csvList);
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetsLoaded);
		}

		
		
		/////////////////////////////////////////////////
		/////////////////////////////////////////////////
		/////////////////////////////////////////////////
		
		private function onAssetsLoaded(e:AEvent):void{
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetsLoaded);
			
//			this.doTestLoginInputModule();
//			this.doTestLoginServersModule();
			//this.doTestHallModule();
//			this.doTestCreateRoleModule();
			//this.doTestRoomModule();
			
			this.doTestBattleState();
		}
		
		
		private function doTestBattleState() : void {
			var data:Vector.<Array>;
			
			UUFacade.registerSkin("login_login", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("login/btn/login_release.png").data,
				TResourceManager.getAsset("login/btn/login_hover.png").data,
				TResourceManager.getAsset("login/btn/login_press.png").data);
			
			UUFacade.registerSkin("battle_roundOk", ButtonSkinUU, ButtonSkinType.PRESS, 
				TResourceManager.getAsset("battle/btn/roundOk_release.png").data,
				TResourceManager.getAsset("battle/btn/roundOk_press.png").data);
			UUFacade.registerSkin("battle_back", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("battle/btn2/back_release.png").data,
				TResourceManager.getAsset("battle/btn2/back_hover.png").data,
				TResourceManager.getAsset("battle/btn2/back_press.png").data);
				
			UUFacade.registerSkin("battle_setting", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("battle/btn2/setting_release.png").data,
				TResourceManager.getAsset("battle/btn2/setting_hover.png").data,
				TResourceManager.getAsset("battle/btn2/setting_press.png").data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/card_character.csv").data);
			CardConfigurator.initCharacterCards(data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/card_equipment.csv").data);
			CardConfigurator.initEquipmentCards(data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/card_magic.csv").data);
			CardConfigurator.initMagicCards(data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/skill.csv").data);
			SkillConfigurator.initSkill(data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/buff.csv").data);
			SkillConfigurator.initBuff(data);
			
			
			BattleModel.initCards = [10008,10025,20012,20014,20015];
//			BattleModel.initCards = [10008,10025,20012,20014,20015,20012,   20014,20015,20012,20014,20015,20014];
			
			
			// 戰鬥管理器初期化.
			BattleModel.initialize(7);
			
			
			UUFacade.getWindow(Battle_bg_7_7_StateUU).activate();
			//UUFacade.getWindow(Battle_active_pre_StateUU).activate([true]);
			UUFacade.getWindow(Battle_active_StateUU).activate();
			//UUFacade.getWindow(Battle_active_post_StateUU).activate();
			//UUFacade.getWindow(Battle_ui_7_7_StateUU).activate();
			
			//TweenLite.delayedCall(1.0, function():void {
				//UUFacade.getWindow(GuessCard_StateUU).activate([[10024, 10025]]);
			//});
			
			UUFacade.getWindow(Battle_active_StateUU).activate();
			(UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU).showBattleWarning("使用失败，没有手牌!");
		}
	}

}