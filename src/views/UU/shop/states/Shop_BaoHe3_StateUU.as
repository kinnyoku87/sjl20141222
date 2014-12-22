package views.UU.shop.states 
{
	import cn.flashk.controls.proxy.CustomListItem;
	import configs.cards.CardConfigurator;
	import configs.shop.ShopConfiguration;
	import configs.shop.ShopSaleCfg;
	import configs.shop.ShopConfig;
	import configs.skinname.SkinNameConfig;
	import models.shop.ShopEvent;
	import models.shop.ShopModule;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.core.AbstractImageLoaderUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_BaoHe3_StateUU extends StateUU
	{
		private var qualityLabel1:LabelUU;
		private var qualityLabel2:LabelUU;
		private var qualityLabel3:LabelUU;
		private var qualityLabel4:LabelUU;
		private var qualityLabel5:LabelUU;
		private var qualityLabel6:LabelUU;
		private var resultLabel:LabelUU;
		public function Shop_BaoHe3_StateUU() 
		{
			
		}
		
		override public function onEnter () : void {
			var bg:Scale9BitmapUU = new Scale9BitmapUU();
			bg.source = TResourceManager.getAsset("common/img/tips_scale9.png");
			bg.width = 500;
			bg.height = 500;
			this.fusion.addNode(bg);
			bg.locatingTypeForHoriz = LocatingType.F___A___F;
			bg.locatingTypeForVerti = LocatingType.F___A___F;
			bg.locatingOffsetY = -30;
			bg.locatingOffsetX = -20;
			
			var titleBg:Scale9BitmapUU = new Scale9BitmapUU;
			titleBg.source = TResourceManager.getAsset("shop/img/select_bg_scale9.png");
			titleBg.width = 500;
			titleBg.height = 50;
			this.fusion.addNode(titleBg);
			titleBg.locatingTypeForHoriz = LocatingType.L_A____L;
			titleBg.locatingTypeForVerti = LocatingType.L_A____L; 
			titleBg.locatingOffsetY = 30;
			
			var titleLabel:LabelUU = TextUtil.createLabel6("清单", 27, 0xffb244, true, 0x352c0b);
			this.fusion.addNode(titleLabel);
			titleLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			titleLabel.locatingTypeForVerti = LocatingType.L___A___L; 
			
			var qualityTitle:LabelUU 
			var xuanyu:ImageLoaderUU;
			var priceTitle:LabelUU;
			var resultTitle:LabelUU;
			var i:int;
			for (i = 1; i <= 6;i++ ) {
				qualityTitle = TextUtil.createLabel6("", 22, 0xffde93, false, 0x341700);
				qualityTitle.text = getTitle(i);
				this.fusion.addNode(qualityTitle);
				//if (i == 1) {
					//qualityTitle.locatingNode = bg;
					//qualityTitle.locatingTypeForHoriz = LocatingType.L_A____L;
					//qualityTitle.locatingTypeForVerti = LocatingType.L_A____L; 
					//qualityTitle.locatingOffsetY = 100;
					//qualityTitle.locatingOffsetX = 30;
				//}else {
					qualityTitle.locatingNode = bg;
					qualityTitle.locatingTypeForHoriz = LocatingType.L_A____L;
					qualityTitle.locatingTypeForVerti = LocatingType.L_A____L 
					qualityTitle.locatingOffsetY = 100 + (i - 1)* 40;
					qualityTitle.locatingOffsetX = 50;
				//}
				
				
				this["qualityLabel" + i] = TextUtil.createLabel6("", 22, 0xffde93, false, 0x341700);
				this.fusion.addNode(this["qualityLabel" + i]);
				//if ( i == 1) {
					//this["qualityLabel" + i].locatingNode = bg;
					//this["qualityLabel" + i].locatingTypeForHoriz = LocatingType.L_A____L;
					//this["qualityLabel" + i].locatingTypeForVerti = LocatingType.L_A____L; 
					//this["qualityLabel" + i].locatingOffsetY = 100;
					//this["qualityLabel" + i].locatingOffsetX = 200;
				//}else {
					this["qualityLabel" + i].locatingNode = bg;
					this["qualityLabel" + i].locatingTypeForHoriz = LocatingType.L_A____L;
					this["qualityLabel" + i].locatingTypeForVerti = LocatingType.L_A____L; 
					this["qualityLabel" + i].locatingOffsetY = 100 + (i -1) * 40;
					this["qualityLabel" + i].locatingOffsetX = 250;
				//}
				
				
				
				
				xuanyu = new ImageLoaderUU;
				xuanyu.source = TResourceManager.getAsset("shop/img/xuanyu_icon.png");
				this.fusion.addNode(xuanyu);
				//if ( i == 1) {
					xuanyu.locatingNode = bg;
					xuanyu.locatingTypeForHoriz = LocatingType.L_A____L;
					xuanyu.locatingTypeForVerti = LocatingType.L_A____L; 
					xuanyu.locatingOffsetY = 100 + (i - 1) * 40;
					xuanyu.locatingOffsetX = 320;
				//}else {
					//xuanyu.locatingTypeForHoriz = LocatingType.L___A___L;
					//xuanyu.locatingTypeForVerti = LocatingType.L____L_A; 
					//xuanyu.locatingOffsetY = 15;
//
				//}
				
				
				priceTitle = TextUtil.createLabel6("", 22, 0xffde93, false, 0x341700);
				priceTitle.text = getPrice(i);
				this.fusion.addNode(priceTitle);
				//if ( i == 1) {
					priceTitle.locatingNode = bg;
					priceTitle.locatingTypeForHoriz = LocatingType.L_A____L;
					priceTitle.locatingTypeForVerti = LocatingType.L_A____L; 
					priceTitle.locatingOffsetY = 100 + (i - 1) * 40;
					priceTitle.locatingOffsetX = 350;
				//}else {
					//priceTitle.locatingTypeForHoriz = LocatingType.L___A___L;
					//priceTitle.locatingTypeForVerti = LocatingType.L____L_A; 
					//priceTitle.locatingOffsetY = 15;
				//}
			}
			resultTitle = TextUtil.createLabel6("获得：", 22, 0xffb244, true, 0x341700);
			this.fusion.addNode(resultTitle);
			resultTitle.locatingNode = bg;
			resultTitle.locatingTypeForHoriz = LocatingType.L_A____L;
			resultTitle.locatingTypeForVerti = LocatingType.L_A____L; 
			resultTitle.locatingOffsetY = 350;
			resultTitle.locatingOffsetX = 150;	
			
			xuanyu = new ImageLoaderUU;
			xuanyu.source = TResourceManager.getAsset("shop/img/xuanyu_icon.png");
			this.fusion.addNode(xuanyu);
			xuanyu.locatingTypeForHoriz = LocatingType.L____L_A;
			xuanyu.locatingTypeForVerti = LocatingType.L___A___L; 
			xuanyu.locatingOffsetX = 20;
			
			resultLabel = TextUtil.createLabel6("", 22, 0xffb244, false, 0x341700);
			this.fusion.addNode(resultLabel);
			resultLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			resultLabel.locatingTypeForVerti = LocatingType.L___A___L; 
			resultLabel.locatingOffsetX = 10;
			
			var btn:ButtonUU = new ButtonUU();
			btn.skinName = SkinNameConfig.shop_lianzi_btn;
			TextUtil.decorateLabel6(btn.getLabel(),"确认",18, 0xffb244, true,0xb50a00);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.A_L____L;
			btn.locatingTypeForVerti = LocatingType.L____L_A; 
			btn.locatingOffsetY = 50;
			btn.locatingOffsetX = 20;
			btn.addEventListener(ATouchEvent.CLICK,onBtnClick);
			
			updateInfo();
			
		}
		
		private function updateInfo():void {
			 var whiteCount:int = 0;
            var greenCout:int = 0;
            var buleCount:int = 0;
            var purpleCount:int = 0;
            var orangeCount:int = 0;
            var redCount:int = 0;
            var amount:int = 0;
			var len:int = ShopModule.baoheResultList.length;
            for (var i:int = 0; i < len; i++)
            {
				var quality:int = CardConfigurator.getCardById(ShopModule.baoheResultList[i]).quality;

				var saleCfg:ShopSaleCfg = ShopConfiguration.getShopSale(quality);
                if (quality == 1)
                {
                    whiteCount++; 
                }
                else if (quality == 2)
                {
                    greenCout++;
                }
                else if (quality == 3)
                {
                    buleCount++;
                }
                else if (quality == 4)
                {
                    purpleCount++;
                }
                else if (quality == 5)
                {
                    orangeCount++;
                }
				else if (quality == 6)
                {
                    redCount++;
                }
                amount += saleCfg.price;
            }
			qualityLabel1.text = whiteCount + "张";
			qualityLabel2.text = greenCout + "张";
			qualityLabel3.text = buleCount + "张";
			qualityLabel4.text = purpleCount + "张";
			qualityLabel5.text = orangeCount + "张";
			qualityLabel6.text = redCount + "张";
			resultLabel.text = amount.toString();
		}
		
		private function onBtnClick(evt:ATouchEvent):void {
			ShopConfig.baoheStep = 1;
			ShopModule.dispatchEvent(ShopEvent.Update_Box_Open_Status);
		}
		
		private function getTitle(quality:int):String {
			var colorStr:String;
			switch(quality) {
				case 1:
					colorStr = "白";
					break;
				case 2:
					colorStr = "绿";
					break;
				case 3:
					colorStr = "蓝";
					break;
				case 4:
					colorStr = "紫";
					break;
				case 5:
					colorStr = "橙";
					break;
				case 6:
					colorStr = "赤";
					break;
			}
			return "分解"+colorStr+"卡:"
		}
		
		private function getPrice(quality:int):String {
			var saleInfo:ShopSaleCfg = ShopConfiguration.getShopSale(quality);
			return ShopConfiguration.getShopSale(quality).price +"/张";
		}
		
		override public function onExit () : void {
			
		}
	}

}