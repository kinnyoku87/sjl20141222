package views.UU.shop 
{
	import configs.shop.ShopConfig;
	import configs.shop.ShopInfoCfg;
	import configs.skinname.SkinNameConfig;
	import flash.text.TextFieldAutoSize;
	import models.PromptManager;
	import models.player.PlayerModel;
	import net.NetManager;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import proto.cs.CmdCodeItem;
	import proto.cs.CmdType;
	import proto.cs.ItemShopBuyReq;
	import ui.ShildStateUU;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_Buy_StateUU extends ShildStateUU
	{
		private var buyNumLabel:TextInputUU;
		private var priceLabel:LabelUU;
		private var buyBtn:ButtonUU;
		private var shopInfo:ShopInfoCfg;
		public function Shop_Buy_StateUU() 
		{
			NAME = "购买";
		}
		
		override public function onEnter () : void {
			super.onEnter();
			
			shopInfo = this.stateArgs[0];
			//背景框
			var bgImg:Scale9BitmapUU = new Scale9BitmapUU;
			bgImg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			bgImg.width = 500 ;
			bgImg.height = 300 ;
			this.fusion.addNode(bgImg);
			this.fusion.spaceWidth = bgImg.width;
			this.fusion.spaceHeight = bgImg.height;
						
			this.fusion.addNode(title);
			this.fusion.addNode(closeBtn);
			
			var buyNumTitle:LabelUU = TextUtil.createLabel6("购买数量：", 22,0xa38a69);
			this.fusion.addNode(buyNumTitle);
			buyNumTitle.locatingOffsetX = -8;
			buyNumTitle.locatingOffsetY = -3;
			buyNumTitle.locatingTypeForHoriz = LocatingType.F_A____F;
			buyNumTitle.locatingTypeForVerti = LocatingType.F_A____F;
			buyNumTitle.locatingOffsetX = 50;
			buyNumTitle.locatingOffsetY = 90;
			
			var inputBg:Scale9BitmapUU = new Scale9BitmapUU;
			inputBg.source = TResourceManager.getAsset("common/img/background_scale9.png");
			this.fusion.addNode(inputBg);
			inputBg.width = 160;
			inputBg.locatingTypeForHoriz = LocatingType.L____L_A;
			inputBg.locatingTypeForVerti = LocatingType.L___A___L;
			inputBg.locatingOffsetX = 10;
			
			buyNumLabel = new TextInputUU(true);
			this.fusion.addNode(buyNumLabel);
			buyNumLabel.locatingTypeForHoriz = LocatingType.L_A____L;
			buyNumLabel.locatingTypeForVerti = LocatingType.L_A____L;
			buyNumLabel.locatingOffsetX = 10;
			buyNumLabel.locatingOffsetY = 3;
			buyNumLabel.width = 150;
			buyNumLabel.height = 30;
			buyNumLabel.color = 0xFFFFFF
			buyNumLabel.size = 22
			buyNumLabel.font = TextUtil.FONT_A;
			buyNumLabel.restrict = "0-9";
			buyNumLabel.maxChars = 5;
			buyNumLabel.addEventListener(AEvent.CHANGE,onBuyNumChange);
			
			var priceTitle:LabelUU = TextUtil.createLabel6("花    费：", 22,0xa38a69);
			this.fusion.addNode(priceTitle);
			priceTitle.locatingNode = buyNumTitle;
			priceTitle.locatingOffsetY = 30;
			priceTitle.locatingTypeForHoriz = LocatingType.L___A___L;
			priceTitle.locatingTypeForVerti = LocatingType.L____L_A;
			
			var yuanbao:ImageLoaderUU = new ImageLoaderUU;
			yuanbao.source = TResourceManager.getAsset("shop/img/yuanbao_icon.png");
			this.fusion.addNode(yuanbao);

			yuanbao.locatingTypeForHoriz = LocatingType.L____L_A;
			yuanbao.locatingTypeForVerti = LocatingType.L___A___L;
			yuanbao.locatingOffsetX = 10;
			
			priceLabel = TextUtil.createLabel6("", 22, 0xffb244, true, -1,2,TextFieldAutoSize.LEFT);
			this.fusion.addNode(priceLabel);
			priceLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			priceLabel.locatingTypeForVerti = LocatingType.L___A___L;
			priceLabel.locatingOffsetX = 10;
			
			buyBtn = new ButtonUU;
			buyBtn.skinName = SkinNameConfig.shop_lianzi_btn;
			TextUtil.decorateLabel6(buyBtn.getLabel(),"确认",18, 0xffb244, true,0xb50a00,1);
			
			this.fusion.addNode(buyBtn);
			buyBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			buyBtn.locatingTypeForVerti = LocatingType.F____A_F;
			buyBtn.locatingOffsetY = -40;
			buyBtn.addEventListener(ATouchEvent.CLICK,onBuyClick);
			
			addRootEvent();
			buyNumLabel.text = ShopConfig.DEFAULT_BUY_NUM +"";
			updatePrice();
		}
		
		private function onBuyNumChange(evt:AEvent):void {
			//var num:int = int(buyNumLabel.text);
			updatePrice();
		}
		
		private function updatePrice():void {
			priceLabel.text = int(buyNumLabel.text) * shopInfo.price + "";
		}
		
		override protected function closeClick(evt:ATouchEvent):void {
			UUFacade.getWindow(Shop_Buy_StateUU).close();
		}

		override public function onExit () : void {
			buyNumLabel.removeEventListener(AEvent.CHANGE,onBuyNumChange);
			buyBtn.removeEventListener(ATouchEvent.CLICK, onBuyClick);
			priceLabel.text = "";
			buyNumLabel.text = "";
		}
		
		private function onBuyClick(evt:ATouchEvent):void {
			if (int(buyNumLabel.text) <= 0) {
				PromptManager.instanse.showPropmt("购买数量不能为0");
				return;
			}
			
			
			if (PlayerModel.getInstance().myRole.rmb < int(priceLabel.text)) {
				PromptManager.instanse.showPropmt("余额不足，购买失败，请充值");
			}else {
				var shopBuyReq:ItemShopBuyReq = new ItemShopBuyReq;
				shopBuyReq.shopId = shopInfo.shopId;
				shopBuyReq.buyType = shopInfo.sellType;
				shopBuyReq.count = int(buyNumLabel.text);
				NetManager.sendRequest(CmdType.CT_ITEM,CmdCodeItem.CC_ITEM_SHOP_BUY_REQ,shopBuyReq);
				//UUFacade.getWindow(Shop_Buy_StateUU).close();
			}
			
		}
		
	}

}