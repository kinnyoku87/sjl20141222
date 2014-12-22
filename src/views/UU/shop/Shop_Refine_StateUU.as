package views.UU.shop 
{
	import configs.cards.CardCfg;
	import configs.cards.CardConfigurator;
	import configs.item.ItemCfg;
	import configs.item.ItemConfiguration;
	import configs.shop.ShopConfiguration;
	import configs.shop.ShopInfoCfg;
	import configs.skinname.SkinNameConfig;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import ui.ShildStateUU;
	import utils.GameUtil;
	import utils.TextUtil;
	/**
	 * ...
	 * @author dcl
	 */
	public class Shop_Refine_StateUU extends ShildStateUU
	{
		private var shopId:int;
		public function Shop_Refine_StateUU() 
		{
			notDefaultClose = true;
			bgAlpha = 0.5;
		}
		
		override public function onEnter () : void 
		{
			super.onEnter();
			shopId = this.stateArgs[0] as int;
			
			var img:ImageLoaderUU = new ImageLoaderUU();
			this.fusion.addNode(img);
			img.source = TResourceManager.getAsset("shop/img/refine_success_bg.png");
			this.fusion.spaceWidth = img.width;
			this.fusion.spaceHeight = img.height;
			
			var shopInfo:ShopInfoCfg = ShopConfiguration.getShopInfo(shopId);
			var itemInfo:ItemCfg = ItemConfiguration.getItem(shopInfo.goodId);
			var cardCfg:CardCfg = CardConfigurator.getCardById(itemInfo.value);
			var cardUU:FusionUU;
			cardUU = GameUtil.getCardUU(cardCfg.id);
			this.fusion.addNode(cardUU);
			cardUU.locatingTypeForHoriz = LocatingType.F___A___F;
			cardUU.locatingTypeForVerti = LocatingType.F___A___F;

			var label:LabelUU = TextUtil.createLabel6("", 24, ColorUtil.rgb(255, 178, 68), false, ColorUtil.rgb(36, 16, 0), 1);
			this.fusion.addNode(label);
			label.locatingTypeForHoriz = LocatingType.F___A___F;
			label.locatingTypeForVerti = LocatingType.A_L____L;
			label.locatingOffsetY = -10;
			label.text = "炼制成功，恭喜您获得一张新卡牌";
			
			var btn:ButtonUU = new ButtonUU;
			btn.skinName = SkinNameConfig.shop_lianzi_btn;
			TextUtil.decorateLabel6(btn.getLabel(),"确定",20, ColorUtil.rgb(255, 178, 68), false, ColorUtil.rgb(36, 16, 0), 1);
			this.fusion.addNode(btn);
			btn.locatingNode = cardUU;
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingOffsetY = 20;
			btn.addEventListener(ATouchEvent.CLICK, closeClick);
			addRootEvent();
		}
		
		override protected function closeClick(evt:ATouchEvent):void {
			UUFacade.getWindow(Shop_Refine_StateUU).close();
		}
		
	}

}