package views
{
	import configs.ConfigRes;
	import configs.skinname.SkinNameConfig;
	import configs.task.TaskConfiguration;
	import flash.utils.setTimeout;
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.display.animation.AnimationManager;
	import org.agony2d.flashApi.ScrollProgressBarUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.project.StateVV;
	import org.agony2d.resources.TAssetBundle;
	import views.UU.room.Room2_StateUU;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.resources.TResourceManager;
	
	import views.UU.loading.Loading_StateUU;
	import views.UU.login.Login_Bg_StateUU;
	import views.UU.room.Room_StateUU;
	
	public class Room_StateVV extends StateVV
	{
		private static var _isAssetsLoaded:Boolean;
		
		private static var _isBackFromBattle:Boolean = false;
		
		override public function onEnter():void {
			
			if (_isAssetsLoaded) {
				UUFacade.getWindow(Loading_StateUU).activate([true, ____doInitRoom]);
				return;
			}
			
			UUFacade.getWindow(Loading_StateUU).activate([false, ____doInitRoom]);
			
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			TResourceManager.loadAssets("room.zip");
			TResourceManager.loadAssets("camp.zip");
			TResourceManager.loadAssets2("atlas/camps.atlas");
			TResourceManager.loadAssets("task.zip");
			TResourceManager.loadAssets("friend.zip");
			TResourceManager.loadAssets("set.zip");
			TResourceManager.loadAssets2("temp/set/slider_barScale.png","temp/set/slider_bar.png").addEventListener(AEvent.COMPLETE, ____onProgressBar);
		}
		
		private function ____onProgressBar(e:AEvent):void {
			ScrollProgressBarUU.addScrollProgressBarSkin("slider_A", 0, (e.target as TAssetBundle).assetList);
			
			
		}
		
		private function onAssetLoaded(e:AEvent):void {
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			_isAssetsLoaded = true;
			
			UUFacade.registerSkin(SkinNameConfig.camp_shang_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_shang_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data);
			UUFacade.registerSkin(SkinNameConfig.camp_zhou_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_zhou_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data);
			UUFacade.registerSkin(SkinNameConfig.camp_yao_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_yao_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data);
			UUFacade.registerSkin(SkinNameConfig.camp_wu_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_wu_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_wu_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_wu_hover.png").data);
				
			
			UUFacade.registerSkin(SkinNameConfig.room_camp_shang, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_shang_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_shang_hover.png").data);
			UUFacade.registerSkin(SkinNameConfig.room_camp_zhou, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_zhou_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_zhou_hover.png").data);
			UUFacade.registerSkin(SkinNameConfig.room_camp_yao, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_yao_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_yao_hover.png").data);
			UUFacade.registerSkin(SkinNameConfig.room_camp_wu, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("camp/btn/camp_wu_release.png").data,
				TResourceManager.getAsset("camp/btn/camp_wu_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_wu_hover.png").data,
				TResourceManager.getAsset("camp/btn/camp_wu_hover.png").data,
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

			UUFacade.registerSkin(SkinNameConfig.normal_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/common_A_release.png").data,
					TResourceManager.getAsset("room/btn/common_A_hover.png").data,
					TResourceManager.getAsset("room/btn/common_A_press.png").data);
				//创建
				UUFacade.registerSkin(SkinNameConfig.create_room_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/create_room_release.png").data,
					TResourceManager.getAsset("room/btn/create_room_hover.png").data,
					TResourceManager.getAsset("room/btn/create_room_press.png").data);
				
				UUFacade.registerSkin(SkinNameConfig.into_room_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/into_release.png").data,
					TResourceManager.getAsset("room/btn/into_hover.png").data,
					TResourceManager.getAsset("room/btn/into_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.start_end_btn, ButtonSkinUU, ButtonSkinType.PRESS_INVALID, 
					TResourceManager.getAsset("room/btn/start_end_release.png").data,
					TResourceManager.getAsset("room/btn/start_end_press.png").data,
					TResourceManager.getAsset("room/btn/start_end_invalid.png").data);
				
				UUFacade.registerSkin(SkinNameConfig.lPage_room_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/lPage_release.png").data,
					TResourceManager.getAsset("room/btn/lPage_hover.png").data,
					TResourceManager.getAsset("room/btn/lPage_press.png").data);
				
				UUFacade.registerSkin(SkinNameConfig.rPage_room_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/rPage_release.png").data,
					TResourceManager.getAsset("room/btn/rPage_hover.png").data,
					TResourceManager.getAsset("room/btn/rPage_press.png").data);
				
				UUFacade.registerSkin(SkinNameConfig.search_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/search_release.png").data,
					TResourceManager.getAsset("room/btn/search_hover.png").data,
					TResourceManager.getAsset("room/btn/search_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.show_allroom_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/show_allroom_release.png").data,
					TResourceManager.getAsset("room/btn/show_allroom_hover.png").data,
					TResourceManager.getAsset("room/btn/show_allroom_press.png").data);
						
			
				UUFacade.registerSkin(SkinNameConfig.tab_vertical_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/tab_vertical_release.png").data,
					TResourceManager.getAsset("room/btn/tab_vertical_press.png").data,
					TResourceManager.getAsset("room/btn/tab_vertical_select.png").data,
					TResourceManager.getAsset("room/btn/tab_vertical_select.png").data,
					TResourceManager.getAsset("room/btn/tab_vertical_select.png").data,
					TResourceManager.getAsset("room/btn/tab_vertical_select.png").data);
				UUFacade.registerSkin(SkinNameConfig.tab_horizon_btn, ToggleSkinUU, ButtonSkinType.SCALE9_PRESS_OVER, 
					TResourceManager.getAsset("room/btn/common_A_release.png").data,
					TResourceManager.getAsset("room/btn/common_A_hover.png").data,
					TResourceManager.getAsset("room/btn/common_A_press.png").data,
					TResourceManager.getAsset("room/btn/common_A_hover.png").data,
					TResourceManager.getAsset("room/btn/common_A_hover.png").data,
					TResourceManager.getAsset("room/btn/common_A_hover.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.room_checkbox_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("room/btn/checkbox_normal_release.png").data,
					TResourceManager.getAsset("room/btn/checkbox_normal_hover.png").data,
					TResourceManager.getAsset("room/btn/checkbox_normal_release.png").data,
					TResourceManager.getAsset("room/btn/checkbox_select_release.png").data,
					TResourceManager.getAsset("room/btn/checkbox_select_hover.png").data,
					TResourceManager.getAsset("room/btn/checkbox_select_release.png").data);
					
					
				UUFacade.registerSkin(SkinNameConfig.set_checkbox_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("set/btn/checkbox_normal_release.png").data,
					TResourceManager.getAsset("set/btn/checkbox_normal_hover.png").data,
					TResourceManager.getAsset("set/btn/checkbox_normal_release.png").data,
					TResourceManager.getAsset("set/btn/checkbox_select_release.png").data,
					TResourceManager.getAsset("set/btn/checkbox_select_hover.png").data,
					TResourceManager.getAsset("set/btn/checkbox_select_release.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.icon_task, ButtonSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("room/btn/icon_task.png").data);
				UUFacade.registerSkin(SkinNameConfig.icon_card, ButtonSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("room/btn/icon_card.png").data);
				UUFacade.registerSkin(SkinNameConfig.icon_email, ButtonSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("room/btn/icon_email.png").data);
				UUFacade.registerSkin(SkinNameConfig.icon_gift, ButtonSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("room/btn/icon_gift.png").data);
				UUFacade.registerSkin(SkinNameConfig.icon_package, ButtonSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("room/btn/icon_package.png").data);
				UUFacade.registerSkin(SkinNameConfig.icon_shop, ButtonSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("room/btn/icon_shop.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.room_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/room_scale9.png").data);
				UUFacade.registerSkin(SkinNameConfig.rolehead_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/role_head_scale9.png").data);
				UUFacade.registerSkin(SkinNameConfig.search_bg_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/search_bg_scale9.png").data);
				
				UUFacade.registerSkin(SkinNameConfig.handle_bg_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/handle_bg_scale9.png").data);
				UUFacade.registerSkin(SkinNameConfig.room_member_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/role_head.png").data);
				UUFacade.registerSkin(SkinNameConfig.room_timeprompt_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/time_prompt_scale9.png").data);
				
				UUFacade.registerSkin(SkinNameConfig.friend_bg_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("room/img/friend_bg_scale9.png").data);
			
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/camps.atlas").data);
			
			
			
			UUFacade.registerSkin(SkinNameConfig.task_tab_btn, ToggleSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("task/btn/tab_release.png").data,
				TResourceManager.getAsset("task/btn/tab_hover.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data,
				TResourceManager.getAsset("task/btn/tab_select.png").data);
			
			// 停頓1s.
			GameModel.getDelay().delayedCall(ConfigRes.WAITING_TIME_FOR_LOADING, function():void {
				
				____doInitRoom();
			});
		}
		
		
		override public function onExit():void{
			UUFacade.closeAllWindows();
		}
		
		
		private function ____doInitRoom() : void{
			UUFacade.getWindow(Loading_StateUU).close();
			
			UUFacade.getWindow(Room2_StateUU).activate();
		}
		
	}
}