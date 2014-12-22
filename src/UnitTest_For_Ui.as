package
{
	import configs.skinname.SkinNameConfig;
	import configs.task.TaskConfiguration;
	import configs.unlock.UnlockConfiguration;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import views.UU.battle.gameOver.Game_Over_StateUU;
	import views.UU.cardSet.CardSet_StateUU;
	import views.UU.room.Room2_StateUU;
	import views.UU.shop.Shop_StateUU;
	import views.UU.task.Task_StateUU;
	
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
	import views.UU.battle.Battle_bg_StateUU;
	import views.UU.battle.Battle_ready_StateUU;
	import views.UU.battle.Battle_ui_StateUU;
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
	//[SWF(width="1280", height="960", frameRate="60",backgroundColor = "0x0")]
	public class UnitTest_For_Ui extends Sprite
	{
		public function UnitTest_For_Ui()
		{
//			Agony.startup(stage, new DebugLogger, null, onInit);
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
			
			
			TouchManager.registerListenTarget();
			AnimationManager.defaultFrameRate = 12;
			TResourceManager.initialize();
			UUFacade.registerRoot();
//			UUToolTip.setDefaultEffect(Alpha_TipEffectStateUU);
			
			
			
			
			stage.addChild(new Stats(0, 40));
			
			// 屏蔽右鍵.
//			stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, function(e:MouseEvent):void{}); 
			TResourceManager.loadAssets("common.zip").addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				UUFacade.registerSkin("common_A", ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER_INVALID, 
					TResourceManager.getAsset("common/btn/A_release.png").data,
					TResourceManager.getAsset("common/btn/A_hover.png").data,
					TResourceManager.getAsset("common/btn/A_press.png").data,
					TResourceManager.getAsset("common/btn/A_intouchable.png").data);
				UUFacade.registerSkin("common_close_B", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/close_release_B.png").data,
					TResourceManager.getAsset("common/btn/close_hover_B.png").data,
					TResourceManager.getAsset("common/btn/close_press_B.png").data);
				UUFacade.registerSkin("common_close_C", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/close_release_C.png").data,
					TResourceManager.getAsset("common/btn/close_hover_C.png").data,
					TResourceManager.getAsset("common/btn/close_press_C.png").data);
			});
			TResourceManager.loadAssets2("temp/bg/bg.jpg");
			
			var i:int;
			while(i<assetsList.length){
				TResourceManager.loadAssets(assetsList[i++]);
			}
			
			TResourceManager.loadAssets2("data/tasktable.csv");
			//
			//i = 0;
			//while(i<assetsList2.length){
				//TResourceManager.loadAssets2(assetsList2[i++]);
			//}
			//
			//TResourceManager.loadAssets2("animation/common.xml").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
				//AnimationManager.addFrameClips(TResourceManager.getAsset("animation/common.xml").data);
			//})
				
			
			//if(_isBattleState){
				//
//				Agony.getAdapter().pixelRatio = 1;
				//
				//var img:BitmapLoaderUU;
				//
				//var l:int;
				//var assetURLs:Array = [];
				//i = 0;
				//l = 28;
				//while(++i<=l){
					//assetURLs.push("temp/battle/bg/" + i + ".png");
				//}
				//i = 0;
				//l = 25;
				//while(++i <= l){
					//assetURLs.push("temp/battle/grid_5_5/creation/" + i + ".png");
					//assetURLs.push("temp/battle/grid_5_5/movement/" + i + ".png");
					//assetURLs.push("temp/battle/grid_5_5/selection/" + i + ".png");
					//assetURLs.push("temp/battle/grid_5_5/target/" + i + ".png");
				//}
				//TResourceManager.loadAssets2.apply(null, assetURLs);
				//
				//TResourceManager.loadAssets2("data/5-5_grid.csv").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
					//data = CsvUtil.parse(TResourceManager.getAsset("data/5-5_grid.csv").data);
					//BattleConfigurator.initGrids(data);
				//})
				//
				//TResourceManager.loadAssets2("atlas/shang/shield.atlas", "atlas/zhouwang.atlas", "atlas/tianyuan.atlas", "atlas/roundOk.atlas").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
					//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/shang/shield.atlas").data);
					//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/zhouwang.atlas").data);
					//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/tianyuan.atlas").data);
					//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/roundOk.atlas").data);
				//});
				
				
				
			//}
			
				// 動畫數據.
			TResourceManager.loadAssets2("animation/common.xml").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
				AnimationManager.addFrameClips(TResourceManager.getAsset("animation/common.xml").data);
			})
			TResourceManager.loadAssets2.apply(null, csvList);
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetsLoaded);
			//TResourceManager.loadAssets("cardset.zip");
			TResourceManager.loadAssets("shop.zip");
			TResourceManager.loadAssets("task.zip");
			TResourceManager.loadAssets("gameover.zip");
			TResourceManager.loadAssets2("data/card_unlock.csv");
			TResourceManager.loadAssets2("atlas/gameover/duan.atlas","atlas/gameover/lose.atlas","atlas/gameover/win.atlas","atlas/gameover/unlock.atlas");
		}

		
		
		/////////////////////////////////////////////////
		/////////////////////////////////////////////////
		/////////////////////////////////////////////////
		
		private function onAssetsLoaded(e:AEvent):void{
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetsLoaded);
			
			//this.doTestLoginInputModule();
//			this.doTestLoginServersModule();
			//this.doTestHallModule();
//			this.doTestCreateRoleModule();
			//this.doTestRoomModule();
			
			this.doTestBattleState();
			//loadRoom();
			//this.doTestRoom( );
			//doTestTask();
			//doTestCardSet();
			doTestShop();
		}
		
		
		
		
		// 登入輸入
		private function doTestLoginInputModule():void{
			UUFacade.registerSkin("login_btn", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("login/btn/login_release.png").data,
					TResourceManager.getAsset("login/btn/login_hover.png").data,
					TResourceManager.getAsset("login/btn/login_press.png").data);
			UUFacade.registerSkin("login_checkBox", ToggleSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("login/btn/checkBox_normal.png").data,
					TResourceManager.getAsset("login/btn/checkBox_down.png").data);
			
			UUFacade.getWindow(Login_Bg_StateUU).activate();
			UUFacade.getWindow(Login_UserInput_StateUU).activate();
		}
		
		// 登入選服務器
		private function doTestLoginServersModule():void{
			UUFacade.registerSkin("login_login", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("login/btn/login_release.png").data,
					TResourceManager.getAsset("login/btn/login_hover.png").data,
					TResourceManager.getAsset("login/btn/login_press.png").data);
			UUFacade.registerSkin("login_checkBox", ToggleSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("login/btn/checkBox_normal.png").data,
					TResourceManager.getAsset("login/btn/checkBox_down.png").data);
			UUFacade.registerSkin("server_server", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("servers/btn/server_release.png").data,
					TResourceManager.getAsset("servers/btn/server_hover.png").data,
					TResourceManager.getAsset("servers/btn/server_press.png").data);
			
			UUFacade.getWindow(Login_Bg_StateUU).activate();
			UUFacade.getWindow(Login_Servers_StateUU).activate();
		}
		
		// 大廳 (選擇模式)
		private function doTestHallModule():void{
			UUFacade.registerSkin("hall_radio", ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("hall/btn/mode_release.png").data,
					TResourceManager.getAsset("hall/btn/mode_hover.png").data,
					TResourceManager.getAsset("hall/btn/mode_press.png").data,
					TResourceManager.getAsset("hall/btn/mode_selected_press.png").data,
					TResourceManager.getAsset("hall/btn/mode_selected_press.png").data,
					TResourceManager.getAsset("hall/btn/mode_selected_press.png").data);
			UUFacade.registerSkin("hall_A", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("hall/btn/hall_A_release.png").data,
				TResourceManager.getAsset("hall/btn/hall_A_hover.png").data,
				TResourceManager.getAsset("hall/btn/hall_A_press.png").data);
			
			
			
			//UUFacade.getRoot().getWindow(Login_Bg_StateUU).activate();
			UUFacade.getWindow(Hall_A_StateUU).activate();
		}
		
		
		// 創建角色.
		private function doTestCreateRoleModule():void{
			UUFacade.registerSkin("login_login", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("login/btn/login_release.png").data,
				TResourceManager.getAsset("login/btn/login_hover.png").data,
				TResourceManager.getAsset("login/btn/login_press.png").data);
			
			UUFacade.registerSkin("creation_dice", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("creation/btn/dice_release.png").data,
				TResourceManager.getAsset("creation/btn/dice_hover.png").data,
				TResourceManager.getAsset("creation/btn/dice_press.png").data);
			
			UUFacade.registerSkin("creation_page", ButtonSkinUU, ButtonSkinType.PRESS_OVER_INVALID, 
				TResourceManager.getAsset("creation/btn/page_release.png").data,
				TResourceManager.getAsset("creation/btn/page_hover.png").data,
				TResourceManager.getAsset("creation/btn/page_press.png").data,
				TResourceManager.getAsset("creation/btn/page_press.png").data);
			
			UUFacade.registerSkin("creation_sex", ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("creation/btn/sex_unselected.png").data,
				TResourceManager.getAsset("creation/btn/sex_hover.png").data,
				TResourceManager.getAsset("creation/btn/sex_hover.png").data,
				TResourceManager.getAsset("creation/btn/sex_selected.png").data,
				TResourceManager.getAsset("creation/btn/sex_selected.png").data,
				TResourceManager.getAsset("creation/btn/sex_selected.png").data);
			
			UUFacade.getWindow(Login_Bg_StateUU).activate();
			UUFacade.getWindow(Login_Creation_StateUU).activate();
		}
		
		private function doTestRoomModule() : void {
			UUFacade.registerSkin("camp_shang", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_shang_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data);
			UUFacade.registerSkin("camp_zhou", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_zhou_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data);
			UUFacade.registerSkin("camp_yao", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_yao_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data);
			UUFacade.registerSkin("camp_wu", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_wu_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_wu_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_wu_hover.png").data);
				
				
			UUFacade.registerSkin("room_common_A", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("room/btn/common_A_release.png").data,
				TResourceManager.getAsset("room/btn/common_A_hover.png").data,
				TResourceManager.getAsset("room/btn/common_A_press.png").data);
			UUFacade.registerSkin("room_common_B", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("room/btn/common_B_release.png").data,
				TResourceManager.getAsset("room/btn/common_B_hover.png").data,
				TResourceManager.getAsset("room/btn/common_B_press.png").data);
			UUFacade.registerSkin("room_common_C", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("room/btn/common_C_release.png").data,
				TResourceManager.getAsset("room/btn/common_C_hover.png").data,
				TResourceManager.getAsset("room/btn/common_C_press.png").data);
			UUFacade.registerSkin("room_mycard", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("room/btn/mycard_release.png").data,
				TResourceManager.getAsset("room/btn/mycard_hover.png").data,
				TResourceManager.getAsset("room/btn/mycard_press.png").data);
			UUFacade.registerSkin("room_page", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("room/btn/page_release.png").data,
				TResourceManager.getAsset("room/btn/page_hover.png").data,
				TResourceManager.getAsset("room/btn/page_press.png").data);
			UUFacade.registerSkin("room_start", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("room/btn/start_release.png").data,
				TResourceManager.getAsset("room/btn/start_hover.png").data,
				TResourceManager.getAsset("room/btn/start_press.png").data);
			UUFacade.registerSkin("room_tab", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("room/btn/tab_room_release.png").data,
				TResourceManager.getAsset("room/btn/tab_room_hover.png").data,
				TResourceManager.getAsset("room/btn/tab_room_press.png").data);
			
			UUFacade.registerSkin("room_scale9", Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/scale9_A.png").data);
				
			
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/camps.atlas").data);
			
			//UUFacade.getRoot().getWindow(Login_Bg_StateUU).activate();
			UUFacade.getWindow(Room_StateUU).activate();
		}
		
		
		
		private function doTestBattleState() : void {
			var data:Vector.<Array>;
			
			BattleModel.initialize(5);
			
			UUFacade.registerSkin("login_login", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("login/btn/login_release.png").data,
				TResourceManager.getAsset("login/btn/login_hover.png").data,
				TResourceManager.getAsset("login/btn/login_press.png").data);
			
			UUFacade.registerSkin("battle_roundOk", ButtonSkinUU, ButtonSkinType.PRESS, 
				TResourceManager.getAsset("battle/btn/roundOk_release.png").data,
				TResourceManager.getAsset("battle/btn/roundOk_press.png").data);
			
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
			BattleModel.initialize(5);
			
			
			//UUFacade.getWindow(Battle_bg_StateUU).activate();
			//UUFacade.getWindow(Battle_active_pre_StateUU).activate();
			//UUFacade.getWindow(Battle_active_StateUU).activate();
			//UUFacade.getWindow(Battle_active_post_StateUU).activate();
			//UUFacade.getWindow(Battle_ui_StateUU).activate();
			
			//UUFacade.getRoot().getWindow(Battle_ready_StateUU).activate();
		}
		
		private function loadRoom():void {
			
			
			TResourceManager.loadAssets("room.zip").addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				
				
				UUFacade.getWindow(Room2_StateUU).activate();
			});
			
		}
		
		private function doTestTask():void {
			var data:Vector.<Array>;
			//data = CsvUtil.parse(TResourceManager.getAsset("data/tasktable.csv").data);
			//TaskConfiguration.initTask(data);
			
			
			TResourceManager.loadAssets("task.zip").addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				
				UUFacade.registerSkin(SkinNameConfig.task_tab_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("task/btn/tab_release.png").data,
				TResourceManager.getAsset("task/btn/tab_hover.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data);
				UUFacade.getWindow(Task_StateUU).activate();	
			});	
			
		}
		public static const cardset_all_btn:String = "cardset_all_btn";  //所有按钮
		public static const cardset_blue_btn:String = "cardset_blue_btn";  //蓝色小圆圈按钮
		public static const cardset_back_btn:String = "cardset_back_btn";  //返回 完成按钮
		public static const cardset_camp_tab:String = "cardset_camp_tab";  //阵营选择标签
		public static const cardset_neutral_tab:String = "cardset_neutral_tab";  //中立标签
		public static const cardset_card_bag:String = "cardset_card_bag";  //卡包按钮
		public static const cardset_increase_bag:String = "cardset_increase_bag";  //新增卡包
		public static const cardset_card_info:String = "cardset_card_info";  //卡牌图鉴按钮
		public static const cardset_pinzhi_btn:String = "cardset_pinzhi_btn";  //卡牌品质按钮
	
		public static const cardset_lPage_btn:String = "cardset_lPage_btn";  //左翻页按钮
		public static const cardset_rPage_btn:String = "cardset_rPage_btn";  //右翻页按钮
		
		private function doTestCardSet():void {
			UUFacade.registerSkin(SkinNameConfig.cardset_all_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/all_btn_release.png").data,
				TResourceManager.getAsset("cardset/btn/all_btn_hover.png").data,
				TResourceManager.getAsset("cardset/btn/all_btn_press.png").data,
				TResourceManager.getAsset("cardset/btn/all_btn_press.png").data,
				TResourceManager.getAsset("cardset/btn/all_btn_press.png").data,
				TResourceManager.getAsset("cardset/btn/all_btn_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.cardset_blue_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/blue_btn_release.png").data,
				TResourceManager.getAsset("cardset/btn/blue_btn_hover.png").data,
				TResourceManager.getAsset("cardset/btn/blue_btn_press.png").data,
				TResourceManager.getAsset("cardset/btn/blue_btn_press.png").data,
				TResourceManager.getAsset("cardset/btn/blue_btn_press.png").data,
				TResourceManager.getAsset("cardset/btn/blue_btn_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.cardset_back_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/btn_release.png").data,
				TResourceManager.getAsset("cardset/btn/btn_hover.png").data,
				TResourceManager.getAsset("cardset/btn/btn_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.cardset_camp_tab, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/camp_tab_release.png").data,
				TResourceManager.getAsset("cardset/btn/camp_tab_hover.png").data,
				TResourceManager.getAsset("cardset/btn/camp_tab_select.png").data,
				TResourceManager.getAsset("cardset/btn/camp_tab_select.png").data,
				TResourceManager.getAsset("cardset/btn/camp_tab_select.png").data,
				TResourceManager.getAsset("cardset/btn/camp_tab_select.png").data);
				
			UUFacade.registerSkin(SkinNameConfig.cardset_neutral_tab, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/neutral_tab_release.png").data,
				TResourceManager.getAsset("cardset/btn/neutral_tab_hover.png").data,
				TResourceManager.getAsset("cardset/btn/neutral_tab_select.png").data,
				TResourceManager.getAsset("cardset/btn/neutral_tab_select.png").data,
				TResourceManager.getAsset("cardset/btn/neutral_tab_select.png").data,
				TResourceManager.getAsset("cardset/btn/neutral_tab_select.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.cardset_card_bag, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/card_bag_release.png").data,
				TResourceManager.getAsset("cardset/btn/card_bag_hover.png").data,
				TResourceManager.getAsset("cardset/btn/card_bag_press.png").data);
				
			UUFacade.registerSkin(SkinNameConfig.cardset_increase_bag, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/increase_release.png").data,
				TResourceManager.getAsset("cardset/btn/increase_hover.png").data,
				TResourceManager.getAsset("cardset/btn/increase_press.png").data);
				
			
				
			UUFacade.registerSkin(SkinNameConfig.cardset_card_info, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/card_info_release.png").data,
				TResourceManager.getAsset("cardset/btn/card_info_hover.png").data,
				TResourceManager.getAsset("cardset/btn/card_info_press.png").data,
				TResourceManager.getAsset("cardset/btn/card_info_select.png").data,
				TResourceManager.getAsset("cardset/btn/card_info_select.png").data,
				TResourceManager.getAsset("cardset/btn/card_info_press.png").data);
				
			UUFacade.registerSkin(SkinNameConfig.cardset_pinzhi_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/pinzhi_release.png").data,
				TResourceManager.getAsset("cardset/btn/pinzhi_hover.png").data,
				TResourceManager.getAsset("cardset/btn/pinzhi_press.png").data);	
			
			UUFacade.registerSkin(SkinNameConfig.cardset_lPage_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/lPage_release.png").data,
				TResourceManager.getAsset("cardset/btn/lPage_hover.png").data,
				TResourceManager.getAsset("cardset/btn/lPage_press.png").data);
				
			UUFacade.registerSkin(SkinNameConfig.cardset_rPage_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/rPage_release.png").data,
				TResourceManager.getAsset("cardset/btn/rPage_hover.png").data,
				TResourceManager.getAsset("cardset/btn/rPage_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.cardset_search_btn, ToggleSkinUU, ButtonSkinType.NONE, 
				TResourceManager.getAsset("cardset/img/search_normal.png").data,
				TResourceManager.getAsset("cardset/img/search_select.png").data);
				
			UUFacade.getWindow(CardSet_StateUU).activate();
		}
		
		public static const shop_recharge_btn:String = "shop_recharge_btn";  //充值按钮
		public static const shop_lianzi_btn:String = "shop_lianzi_btn";  //炼制按钮
		public static const shop_cardset_btn:String = "shop_cardset_btn";  //我的卡牌按钮
		public static const shop_tab_btn:String = "shop_tab_btn";      //标签按钮
		public static const shop_tab_status:String = "shop_tab_status";  //标签状态
		
		private function doTestShop():void {
			
			var data:Vector.<Array> = CsvUtil.parse(TResourceManager.getAsset("data/card_unlock.csv").data);
			UnlockConfiguration.initUnlock(data);
			
			UUFacade.registerSkin(SkinNameConfig.shop_recharge_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("shop/btn/recharge_release.png").data,
				TResourceManager.getAsset("shop/btn/recharge_hover.png").data,
				TResourceManager.getAsset("shop/btn/recharge_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.shop_lianzi_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("shop/btn/lianzi_release.png").data,
				TResourceManager.getAsset("shop/btn/lianzi_hover.png").data,
				TResourceManager.getAsset("shop/btn/lianzi_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.shop_cardset_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("shop/btn/cardset_release.png").data,
				TResourceManager.getAsset("shop/btn/cardset_hover.png").data,
				TResourceManager.getAsset("shop/btn/cardset_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.shop_tab_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("shop/btn/tab_release.png").data,
				TResourceManager.getAsset("shop/btn/tab_hover.png").data,
				TResourceManager.getAsset("shop/btn/tab_select.png").data,
				TResourceManager.getAsset("shop/btn/tab_select.png").data,
				TResourceManager.getAsset("shop/btn/tab_select.png").data,
				TResourceManager.getAsset("shop/btn/tab_select.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.shop_tab_status, ToggleSkinUU, ButtonSkinType.NONE, 
				TResourceManager.getAsset("shop/btn/tab_open.png").data,
				TResourceManager.getAsset("shop/btn/tab_close.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.shop_search_btn, ToggleSkinUU, ButtonSkinType.NONE, 
				TResourceManager.getAsset("shop/img/search_normal.png").data,
				TResourceManager.getAsset("shop/img/search_select.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.unlock_mount_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/mount_release.png").data,
				TResourceManager.getAsset("gameover/btn/mount_hover.png").data,
				TResourceManager.getAsset("gameover/btn/mount_press.png").data);
				
			UUFacade.registerSkin(SkinNameConfig.unlock_close_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/next_release.png").data,
				TResourceManager.getAsset("gameover/btn/next_hover.png").data,
				TResourceManager.getAsset("gameover/btn/next_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.unlock_left_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/left_release.png").data,
				TResourceManager.getAsset("gameover/btn/left_hover.png").data,
				TResourceManager.getAsset("gameover/btn/left_hover.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.unlock_right_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/right_release.png").data,
				TResourceManager.getAsset("gameover/btn/right_hover.png").data,
				TResourceManager.getAsset("gameover/btn/right_hover.png").data);
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/duan.atlas").data);
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/win.atlas").data);
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/lose.atlas").data);	
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/unlock.atlas").data);	
			
			//UUFacade.getWindow(Shop_StateUU).activate();	
			UUFacade.getWindow(Game_Over_StateUU).activate();
		}
	}
}