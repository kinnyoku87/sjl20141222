package views 
{
	import configs.ConfigRes;
	import configs.skinname.SkinNameConfig;
	import models.GameModel;
	import net.NetManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.project.StateVV;
	import org.agony2d.resources.TResourceManager;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import views.UU.cardSet.CardSet_StateUU;
	import views.UU.loading.Loading_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CardSet_StateVV extends StateVV
	{
		private static var _isAssetsLoaded:Boolean;
		
		public function CardSet_StateVV() 
		{
			
		}
		
		override public function onEnter () : void {
			NetManager.sendRequest(CmdType.CT_BATTLE,CmdCodeBattle.CC_BATTLE_GET_PARAM_REQ,null);
			if (_isAssetsLoaded) {
				UUFacade.getWindow(Loading_StateUU).activate([true, ____doInitHall]);
				return;
			}
			
			UUFacade.getWindow(Loading_StateUU).activate([false, ____doInitHall]);
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetLoaded);
			TResourceManager.loadAssets("cardset.zip");
			TResourceManager.loadAssets2("atlas/cardset/effects1.atlas","atlas/cardset/effects2.atlas","atlas/cardset/effects3.atlas");
			
		}
		
		private function onAssetLoaded(e:AEvent):void{
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			_isAssetsLoaded = true;
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
			
			UUFacade.registerSkin(SkinNameConfig.cardset_close_bag, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("cardset/btn/close_bag_release.png").data,
				TResourceManager.getAsset("cardset/btn/close_bag_hover.png").data,
				TResourceManager.getAsset("cardset/btn/close_bag_press.png").data);
				
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/cardset/effects1.atlas").data);
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/cardset/effects2.atlas").data);
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/cardset/effects3.atlas").data);
				// 停頓1s.
			GameModel.getDelay().delayedCall(ConfigRes.WAITING_TIME_FOR_LOADING, function():void {
				
				____doInitHall();
			});
		}

		override public function onExit () : void {
			UUFacade.closeAllWindows();
		}
		
		private function ____doInitHall() : void {
			UUFacade.getWindow(Loading_StateUU).close();
			UUFacade.getWindow(CardSet_StateUU).activate();
		}
		
	}

}