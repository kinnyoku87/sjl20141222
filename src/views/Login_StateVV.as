package views
{
	import configs.error.ErrorConfiguration;
	import configs.skinname.SkinNameConfig;
	import configs.task.TaskConfiguration;
	import flash.display.BitmapData;
	import flash.ui.Mouse;
	import flash.ui.MouseCursorData;
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.display.animation.AnimationManager;
	import org.agony2d.flashApi.ScrollProgressBarUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.project.StateVV;
	
	import models.GameModel;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TAssetBundle;
	import org.agony2d.resources.TResourceManager;
	
	import views.UU.login.Login_Bg_StateUU;
	import views.UU.login.Login_UserInput_StateUU;
	
	public class Login_StateVV extends StateVV {
		
		override public function onEnter():void{
			TResourceManager.loadAssets2("temp/bg/bg.png");
			TResourceManager.loadAssets2("temp/logo/logo2.png");
			TResourceManager.loadAssets2("temp/loading/01.png","temp/loading/02.png","temp/loading/03.png").addEventListener(AEvent.COMPLETE, ____onProgressBar);
			
			// 動畫數據.
			TResourceManager.loadAssets2("animation/common.xml").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
				AnimationManager.addFrameClips(TResourceManager.getAsset("animation/common.xml").data);
			})
			
			//错误码
			TResourceManager.loadAssets2("data/cs_com_error.csv").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{	
				var data:Vector.<Array>;
				data = CsvUtil.parse(TResourceManager.getAsset("data/cs_com_error.csv").data);
				ErrorConfiguration.initError(data);
			})
			
			//任务
			TResourceManager.loadAssets2("data/tasktable.csv").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{	
				var data:Vector.<Array>;
				data = CsvUtil.parse(TResourceManager.getAsset("data/tasktable.csv").data);
				TaskConfiguration.initTask(data);
			})
			
			
			TResourceManager.loadAssets("common.zip").addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				UUFacade.registerSkin(SkinNameConfig.common_A, ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER_INVALID, 
					TResourceManager.getAsset("common/btn/A_release.png").data,
					TResourceManager.getAsset("common/btn/A_hover.png").data,
					TResourceManager.getAsset("common/btn/A_press.png").data,
					TResourceManager.getAsset("common/btn/A_intouchable.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.common_B, ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER, 
					TResourceManager.getAsset("common/btn/B_release.png").data,
					TResourceManager.getAsset("common/btn/B_hover.png").data,
					TResourceManager.getAsset("common/btn/B_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.common_C, ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER, 
					TResourceManager.getAsset("common/btn/C_release.png").data,
					TResourceManager.getAsset("common/btn/C_hover.png").data,
					TResourceManager.getAsset("common/btn/C_press.png").data);
				
				UUFacade.registerSkin(SkinNameConfig.common_D, ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER, 
					TResourceManager.getAsset("common/btn/D_release.png").data,
					TResourceManager.getAsset("common/btn/D_hover.png").data,
					TResourceManager.getAsset("common/btn/D_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.common_E, ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER, 
					TResourceManager.getAsset("common/btn/E_release.png").data,
					TResourceManager.getAsset("common/btn/E_hover.png").data,
					TResourceManager.getAsset("common/btn/E_press.png").data);
					
				UUFacade.registerSkin("common_btn", ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER, 
					TResourceManager.getAsset("common/btn/btn_release.png").data,
					TResourceManager.getAsset("common/btn/btn_hover.png").data,
					TResourceManager.getAsset("common/btn/btn_press.png").data);
				
				UUFacade.registerSkin("common_close", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/close_release.png").data,
					TResourceManager.getAsset("common/btn/close_hover.png").data,
					TResourceManager.getAsset("common/btn/close_press.png").data);
					
				
				UUFacade.registerSkin("common_close_B", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/close_release_B.png").data,
					TResourceManager.getAsset("common/btn/close_hover_B.png").data,
					TResourceManager.getAsset("common/btn/close_press_B.png").data);
				
				UUFacade.registerSkin("common_close_C", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/close_release_C.png").data,
					TResourceManager.getAsset("common/btn/close_hover_C.png").data,
					TResourceManager.getAsset("common/btn/close_press_C.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.back_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/back_release.png").data,
					TResourceManager.getAsset("common/btn/back_hover.png").data,
					TResourceManager.getAsset("common/btn/back_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.play_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/play_release.png").data,
					TResourceManager.getAsset("common/btn/play_hover.png").data,
					TResourceManager.getAsset("common/btn/play_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.lPage_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/left_page_release.png").data,
					TResourceManager.getAsset("common/btn/left_page_hover.png").data,
					TResourceManager.getAsset("common/btn/left_page_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.rPage_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/right_page_release.png").data,
					TResourceManager.getAsset("common/btn/right_page_hover.png").data,
					TResourceManager.getAsset("common/btn/right_page_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.scroll_bg, ButtonSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("common/btn/scroll_bg.png").data);
						
				UUFacade.registerSkin(SkinNameConfig.scroll_bar, ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER, 
					TResourceManager.getAsset("common/btn/scroll_bar_release.png").data,
					TResourceManager.getAsset("common/btn/scroll_bar_hover.png").data,
					TResourceManager.getAsset("common/btn/scroll_bar_press.png").data);
						
				UUFacade.registerSkin(SkinNameConfig.scroll_upArrow, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/scroll_up_release.png").data,
					TResourceManager.getAsset("common/btn/scroll_up_hover.png").data,
					TResourceManager.getAsset("common/btn/scroll_up_press.png").data);
						
				UUFacade.registerSkin(SkinNameConfig.scroll_downArrow, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("common/btn/scroll_down_release.png").data,
					TResourceManager.getAsset("common/btn/scroll_down_hover.png").data,
					TResourceManager.getAsset("common/btn/scroll_down_press.png").data);
					
				UUFacade.registerSkin(SkinNameConfig.backgournd_scale9, Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("common/img/background_scale9.png").data);
			});
			
			
			TResourceManager.loadAssets("login.zip");
			
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetsLoaded);
		}
		
		private function ____onProgressBar(e:AEvent):void {
			ScrollProgressBarUU.addScrollProgressBarSkin("scrollProgressBar_A", 1, (e.target as TAssetBundle).assetList);
			
			
		}
		
		
		private function onAssetsLoaded(e:AEvent):void{
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetsLoaded);
			
			UUFacade.registerSkin("login_login", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("login/btn/login_release.png").data,
					TResourceManager.getAsset("login/btn/login_hover.png").data,
					TResourceManager.getAsset("login/btn/login_press.png").data);
			UUFacade.registerSkin("login_checkBox", ToggleSkinUU, ButtonSkinType.NONE, 
					TResourceManager.getAsset("login/btn/checkBox_normal.png").data,
					TResourceManager.getAsset("login/btn/checkBox_down.png").data);
			
			//=============================================================
			UUFacade.getWindow(Login_Bg_StateUU).activate();
			UUFacade.getWindow(Login_UserInput_StateUU).activate();
			//=============================================================
			
			// 加載[ 登陸 - (選擇服務器) ]資源.
//			setTimeout(function():void{
				var bundle:TAssetBundle = TResourceManager.loadAssets("servers.zip");
				bundle.addEventListener(AEvent.COMPLETE, onLoginServersAssetsLoaded);
//			}, 1000)
				
		}
		
		private function onLoginServersAssetsLoaded(e:AEvent):void{
			UUFacade.registerSkin("server_server", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
					TResourceManager.getAsset("servers/btn/server_release.png").data,
					TResourceManager.getAsset("servers/btn/server_hover.png").data,
					TResourceManager.getAsset("servers/btn/server_press.png").data);
			
			GameModel.isReadyForLoginServers = true;
		}
		
		override public function onExit() : void {
			UUFacade.closeAllWindows();
		}
	}
}