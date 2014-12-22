package views.UU.shop.states 
{
	import configs.shop.ShopConfig;
	import configs.shop.ShopInfoVO;
	import configs.skinname.SkinNameConfig;
	import models.shop.ShopEvent;
	import models.shop.ShopModule;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.SliderUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.ViewportFusion;
	import org.agony2d.resources.TResourceManager;
	import views.UU.shop.items.Shop_Card_UU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_CampCard_StateUU extends StateUU
	{
		//private var cardWidth:Number;
		//private var cardHeight:Number;
		private var viewportFusion:ViewportFusion;
		private var listFusion:FusionUU;
		private var listFusionWidth:Number;
		private var listFusionHeight:Number;
		private var viewportHeight:Number;
		private var slider_A:SliderUU;
		public function Shop_CampCard_StateUU() 
		{
			
		}
		
		override public function onEnter () : void {
			
			updateData();
			ShopModule.addEventListener(ShopEvent.Update_ShopCards,onUpdateShopCards);
		}
		
		private function initViews():void {
			var btn:ButtonUU;
			
			slider_A = new SliderUU(false);
			this.fusion.addNode(slider_A);
			slider_A.x = 990 - 3;
			
			btn = new ButtonUU;
			btn.skinName = SkinNameConfig.scroll_bar;
			btn.image.height = 50;
			slider_A.getThumb().addNode(btn);
			slider_A.dragOffsetValue = viewportHeight - btn.image.height - 20;
			slider_A.model.addEventListener("change", function(e:AEvent):void {
				viewportFusion.vertiRatio = slider_A.model.ratio;
			});
			
			
			
			viewportFusion = new ViewportFusion(listFusionWidth, viewportHeight * 0.75);
			this.fusion.addNode(viewportFusion);
			viewportFusion.contentWidth = listFusionWidth;
			viewportFusion.contentHeight = listFusionHeight;
			
			//var rawSprite:RawSpriteUU = new RawSpriteUU;
			//rawSprite.graphics.beginFill(0xff0000, 1.0);
			//rawSprite.graphics.drawRect(0, 0, listFusionWidth, viewportHeight);
			//viewportFusion.content.addNode(rawSprite);
			
			
			//stateFusion.spaceWidth = 700;
			//stateFusion.spaceHeight = 500;
			viewportFusion.content.addNode(listFusion);
		}

		
		private function updateData():void {
			listFusion = new FusionUU;
			var storeTable:Array = ShopModule.getStoreTable(ShopConfig.campId,ShopConfig.searchName);
			var len:int = storeTable.length;
			var shopCard:Shop_Card_UU;
			var pointX:Number;
			var pointY:Number;

			var i:int;
			var cutCout:int;
			for (i = 0; i < len; i++ ) {
				shopCard = new Shop_Card_UU();
				shopCard.setData(storeTable[i] as ShopInfoVO);
				listFusion.addNode(shopCard);
				//if (i == 0 ) {
					//cardWidth = ShopConfig.sho
					//cardHeight = shopCard.height;
				//
				//}
				
				shopCard.locatingTypeForHoriz = LocatingType.F_A____F;
				shopCard.locatingTypeForVerti = LocatingType.F_A____F;
				pointX = (ShopConfig.Shop_Card_Width ) * (i % ShopConfig.CutLine_Num);
				pointY = (ShopConfig.Shop_Card_Height ) * int(i / ShopConfig.CutLine_Num) + cutCout * 10;	
				shopCard.locatingOffsetX = pointX;
				shopCard.locatingOffsetY = pointY;
				if ((i+1) % ShopConfig.CutLine_Num == 0 || i == len - 1 ) {
					var image:ImageLoaderUU = new ImageLoaderUU;
					image.source = TResourceManager.getAsset("shop/img/horizon_line_scale9.png");
					image.width = ShopConfig.Shop_Card_Width * 4;
					listFusion.addNode(image);
					image.locatingTypeForHoriz = LocatingType.F___A___F;
					image.locatingTypeForVerti = LocatingType.L____L_A;
					image.locatingOffsetY = 10;
					cutCout++;
				}
			}
			
			Agony.getFrame().addEventListener(AEvent.COMPLETE, addListComplete);
        }
		
		private function addListComplete(e:AEvent):void {
				trace("=======================" + listFusion.spaceWidth + "," + listFusion.spaceHeight);
				//viewportFusion.contentWidth = stateFusion.width;
				//viewportFusion.contentHeight = stateFusion.height;
				listFusionWidth = listFusion.spaceWidth;
				listFusionHeight = listFusion.spaceHeight;
				viewportHeight = Math.min(listFusionHeight, (ShopConfig.Shop_Card_Height + 10) * 2 );
				Agony.getFrame().removeEventListener(AEvent.COMPLETE, addListComplete);
				initViews();
		}

		private function onUpdateShopCards(evt:ShopEvent):void {
			
			listFusion.kill()
			listFusion = null;
			viewportFusion.kill();
			viewportFusion = null;
			slider_A.kill();
			slider_A = null;
			
			//for (var i:int = this.fusion.numNodes - 1; i >= 0 ;i-- ) {
				//if (this.fusion.getNodeAt(i)) {
					//this.fusion.getNodeAt(i).kill();
					//this.fusion.getNodeAt(i) = null;
				//}
			//}
			updateData();
			
		}
		
		override public function onExit () : void {
			ShopModule.removeEventListener(ShopEvent.Update_ShopCards,onUpdateShopCards);
		}
	}

}