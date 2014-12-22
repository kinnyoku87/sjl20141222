package views
{
	import com.greensock.plugins.MotionBlurPlugin;
	import com.greensock.plugins.TweenPlugin;
	import configs.player.PlayerConfiguration;
	import configs.unlock.UnlockConfiguration;
	import org.agony2d.sounds.MusicManager;
	
	import configs.cards.CardConfigurator;
	import configs.ConfigRes;
	import configs.skills.SkillConfigurator;
	import flash.utils.setTimeout;
	import models.GameModel;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.project.StateVV;
	
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.resources.TResourceManager;
	
	import views.UU.loading.Loading_StateUU;
	import views.UU.hall.Hall_A_StateUU;
	import views.UU.login.Login_Bg_StateUU;
	
	public class Hall_StateVV extends StateVV
	{
		
	
		
		public static var _isAssetsLoaded:Boolean;
		
		
		override public function onEnter():void{
			
			if (_isAssetsLoaded) {
				UUFacade.getWindow(Loading_StateUU).activate([true, ____doInitHall]);
				return;
			}
			
			UUFacade.getWindow(Loading_StateUU).activate([false, ____doInitHall]);
			
			
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			
			TResourceManager.loadAssets2("data/card_character.csv", "data/card_equipment.csv","data/card_magic.csv", "data/skill.csv", "data/buff.csv");
			TResourceManager.loadAssets("hall.zip");
			TResourceManager.loadAssets2("temp/bg/hall_bg.jpg");
			TResourceManager.loadAssets2("temp/scale9/battleSkill.png");
			TResourceManager.loadAssets("card.zip");
			TResourceManager.loadAssets2("data/card_unlock.csv");
			TResourceManager.loadAssets2("data/experience.csv");
		}
		
		private function onAssetLoaded(e:AEvent):void{
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			_isAssetsLoaded = true;
			
			var data:Vector.<Array>;
			
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
			data = CsvUtil.parse(TResourceManager.getAsset("data/card_unlock.csv").data);
			UnlockConfiguration.initUnlock(data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/experience.csv").data);
			PlayerConfiguration.initExp(data);
			
			
			UUFacade.registerSkin("hall_radio", ToggleSkinUU, ButtonSkinType.PRESS_OVER_INVALID, 
					TResourceManager.getAsset("hall/btn/mode_release.png").data,
					TResourceManager.getAsset("hall/btn/mode_hover.png").data,
					TResourceManager.getAsset("hall/btn/mode_press.png").data,
					TResourceManager.getAsset("hall/btn/mode_invalid.png").data,
					TResourceManager.getAsset("hall/btn/mode_selected_release.png").data,
					TResourceManager.getAsset("hall/btn/mode_selected_hover.png").data,
					TResourceManager.getAsset("hall/btn/mode_selected_press.png").data,
					TResourceManager.getAsset("hall/btn/mode_invalid.png").data);
			UUFacade.registerSkin("hall_A", ButtonSkinUU, ButtonSkinType.PRESS_OVER_INVALID, 
				TResourceManager.getAsset("hall/btn/hall_A_release.png").data,
				TResourceManager.getAsset("hall/btn/hall_A_hover.png").data,
				TResourceManager.getAsset("hall/btn/hall_A_press.png").data,
				TResourceManager.getAsset("hall/btn/hall_A_invalid.png").data);
			
			UUFacade.registerSkin("battleSkill", Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("temp/scale9/battleSkill.png").data);
			
			
			TweenPlugin.activate([MotionBlurPlugin]);
			
			// 停頓一會.
			GameModel.getDelay().delayedCall(ConfigRes.WAITING_TIME_FOR_LOADING, function():void{
				____doInitHall();
			});
		}
		
		
		
		
		override public function onExit() : void {
			UUFacade.closeAllWindows();
		}
		
		
		
		
		private function ____doInitHall() : void {
			
			
			UUFacade.getWindow(Loading_StateUU).close();
			UUFacade.getWindow(Hall_A_StateUU).activate();
			
		}
		
		
	}
}