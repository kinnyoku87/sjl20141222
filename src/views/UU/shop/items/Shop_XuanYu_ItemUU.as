package views.UU.shop.items 
{
	import configs.shop.ShopConfiguration;
	import configs.shop.ShopInfoCfg;
	import configs.skinname.SkinNameConfig;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import utils.TextUtil;
	import views.UU.shop.Shop_Buy_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_XuanYu_ItemUU extends FusionUU
	{
		private var moneyLabel:LabelUU;
		private var buyBtn:ButtonUU;
		private var shopInfo:ShopInfoCfg;
		public function Shop_XuanYu_ItemUU() 
		{
			init();
		}
		
		private function init():void {
			//黑色背景
			var bg:Scale9BitmapUU = new Scale9BitmapUU();
			bg.source = TResourceManager.getAsset("common/img/background_scale9.png");
			this.addNode(bg);
			bg.width = 250;
			bg.height = 280;
			this.spaceWidth = 250;
			this.spaceHeight = 315;
			
			//玄玉
			var xuanyuBg:ImageLoaderUU = new ImageLoaderUU;
			xuanyuBg.source = TResourceManager.getAsset("shop/img/xuanyu_bg.png");
			this.addNode(xuanyuBg);
			xuanyuBg.locatingTypeForHoriz = LocatingType.F___A___F;
			xuanyuBg.locatingTypeForVerti = LocatingType.F_A____F;
			
			//元宝图标
			var yuanbao:ImageLoaderUU = new ImageLoaderUU;
			yuanbao.source = TResourceManager.getAsset("shop/img/yuanbao_icon.png");
			this.addNode(yuanbao);
			yuanbao.locatingTypeForHoriz = LocatingType.F___A___F;
			yuanbao.locatingTypeForVerti = LocatingType.L____L_A;
			yuanbao.locatingOffsetY = 5;
			yuanbao.locatingOffsetX = -20;
			
			moneyLabel = TextUtil.createLabel6("100", 24, 0xffb244, true, -1);
			moneyLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			moneyLabel.locatingTypeForVerti = LocatingType.L___A___L;
			moneyLabel.locatingOffsetX = 10;
			this.addNode(moneyLabel);
			
			buyBtn = new ButtonUU;
			buyBtn.skinName = SkinNameConfig.shop_lianzi_btn;
			TextUtil.decorateLabel6(buyBtn.getLabel(),"购买",18, 0xffb244, true,0xb50a00,1);
			this.addNode(buyBtn);
			buyBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			buyBtn.locatingTypeForVerti = LocatingType.F____A_F;
			//buyBtn.locatingOffsetY = -5;
			buyBtn.addEventListener(ATouchEvent.CLICK,onBuyClick);
		}
		
		public function setData(shopId:int):void {
			shopInfo = ShopConfiguration.getShopInfo(shopId);
			moneyLabel.text = shopInfo.price.toString();
		}
		
		private function onBuyClick(evt:ATouchEvent):void {
			UUFacade.getWindow(Shop_Buy_StateUU).activate([shopInfo]);
		}
		
	}

}