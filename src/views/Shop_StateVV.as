package views 
{
	import configs.ConfigRes;
	import configs.item.ItemConfiguration;
	import configs.shop.ShopConfiguration;
	import configs.skinname.SkinNameConfig;
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.project.StateVV;
	import org.agony2d.resources.TResourceManager;
	import views.UU.loading.Loading_StateUU;
	import views.UU.shop.Shop_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_StateVV extends StateVV
	{
		public static var _isAssetsLoaded:Boolean;
		
		public function Shop_StateVV() 
		{
			
		}
		
		override public function onEnter () : void {
			if (_isAssetsLoaded) {
				UUFacade.getWindow(Loading_StateUU).activate([true, ____doInitHall]);
				return;
			}
			
			UUFacade.getWindow(Loading_StateUU).activate([false, ____doInitHall]);
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetLoaded);
			TResourceManager.loadAssets2("data/items.csv", "data/storetable.csv","data/sale_price_quality.csv");
			TResourceManager.loadAssets("shop.zip");
			TResourceManager.loadAssets2("atlas/shop/xuanjibaohe.atlas");
		}
		
		private function onAssetLoaded(e:AEvent):void{
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			_isAssetsLoaded = true;
			
				
			var data:Vector.<Array>;
			
			data = CsvUtil.parse(TResourceManager.getAsset("data/items.csv").data);
			ItemConfiguration.initItem(data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/storetable.csv").data);
			ShopConfiguration.initShop(data);
			data = CsvUtil.parse(TResourceManager.getAsset("data/sale_price_quality.csv").data);
			ShopConfiguration.initSellPrice(data);

			
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
			
			UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/shop/xuanjibaohe.atlas").data);
			
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
			UUFacade.getWindow(Shop_StateUU).activate();
		}
		
	}

}