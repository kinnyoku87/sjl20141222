package views.UU.shop.items 
{
	import configs.item.ItemCfg;
	import configs.item.ItemConfiguration;
	import configs.shop.ShopConfig;
	import configs.shop.ShopConfiguration;
	import configs.shop.ShopInfoVO;
	import configs.skinname.SkinNameConfig;
	import models.player.PlayerModel;
	import models.PromptManager;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.cs.CmdCodeItem;
	import proto.cs.CmdType;
	import proto.cs.ItemShopBuyReq;
	import ui.AlertInfo;
	import utils.GameUtil;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_Card_UU extends FusionUU
	{
		private var cardUU:FusionUU;
		private var shopVO:ShopInfoVO;
		public function Shop_Card_UU() 
		{
			//init();
		}
		
		private function init():void {
			cardUU = GameUtil.getCardUU(shopVO.cardId);
			this.addNode(cardUU);
			this.spaceWidth = ShopConfig.Shop_Card_Width;
			this.spaceHeight =  ShopConfig.Shop_Card_Height;
			cardUU.locatingTypeForHoriz = LocatingType.F___A___F;
			cardUU.locatingTypeForVerti = LocatingType.F_A____F;
			cardUU.locatingOffsetY = 20;
			cardUU.locatingOffsetX = 40;
			
			cardUU.scaleX = Agony.getAdapter().pixelRatio;
			cardUU.scaleY = Agony.getAdapter().pixelRatio;
			
			var priceBg:Scale9BitmapUU = new Scale9BitmapUU;
			priceBg.source = TResourceManager.getAsset("shop/img/price_bg_scale9.png");
			this.addNode(priceBg);
			//priceBg.locatingNode = cardUU;
			priceBg.locatingTypeForHoriz = LocatingType.F___A___F;
			priceBg.locatingTypeForVerti = LocatingType.F____A_F;
			priceBg.locatingOffsetY = -70;
			priceBg.width = ShopConfig.Shop_Card_Width -30;
			
			//元宝图标
			var xuanyu:ImageLoaderUU = new ImageLoaderUU;
			xuanyu.source = TResourceManager.getAsset("shop/img/xuanyu_icon.png");
			this.addNode(xuanyu);
			xuanyu.locatingTypeForHoriz = LocatingType.L___A___L;
			xuanyu.locatingTypeForVerti = LocatingType.L___A___L;
			xuanyu.locatingOffsetX = -30;
			
			var priceLabel:LabelUU = TextUtil.createLabel6("", 22, 0xffb244, true, -1);
			priceLabel.text = shopVO.price.toString();
			this.addNode(priceLabel);
			priceLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			priceLabel.locatingTypeForVerti = LocatingType.L___A___L;
			priceLabel.locatingOffsetX = 10;
			
			
			var hoverBg:ImageLoaderUU = new ImageLoaderUU;
			hoverBg.source = TResourceManager.getAsset("shop/img/haved_bg.png");
			this.addNode(hoverBg);
			hoverBg.locatingTypeForHoriz = LocatingType.F___A___F;
			hoverBg.locatingTypeForVerti = LocatingType.F____A_F;
			hoverBg.locatingOffsetY = -15;
			
			var hasLabel:LabelUU = TextUtil.createLabel6("", 22, ColorUtil.WHITE, true, -1);
			hasLabel.text = "已拥有";
			this.addNode(hasLabel);
			hasLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			hasLabel.locatingTypeForVerti = LocatingType.L___A___L;
			hoverBg.visible = hasLabel.visible =  shopVO.bHad;
			
			var lianzhiBtn:ButtonUU = new ButtonUU;
			lianzhiBtn.skinName = SkinNameConfig.shop_lianzi_btn;
			TextUtil.decorateLabel6(lianzhiBtn.getLabel(),"炼制",18, 0xffb244, true,0xb50a00,1);
			this.addNode(lianzhiBtn);
			lianzhiBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			lianzhiBtn.locatingTypeForVerti = LocatingType.F____A_F;
			lianzhiBtn.locatingOffsetY = -10;
			lianzhiBtn.addEventListener(ATouchEvent.CLICK, onBtnClick);
			lianzhiBtn.visible = !shopVO.bHad;
			
		}
		
		public function setData(_shopVO:ShopInfoVO):void {
			shopVO = _shopVO;
			init();
			//updateView();
		}
		
		private function onBtnClick(evt:ATouchEvent):void {
			var alert:AlertInfo = new AlertInfo();
			if (PlayerModel.getInstance().myRole.xuanyu < shopVO.price) {
				alert.msg = "玄玉不足,炼制失败";
				alert.sizeWidth = 300;
				alert.sizeHeight = 130;
				alert.type = 2;
			}else {
				alert.title = "提示";
				alert.msg = "是否确定花费" + shopVO.price + "玄玉炼制【" + shopVO.name +"】";
				alert.okCallback = okBuy;
				alert.sizeWidth = 500;
				alert.sizeHeight = 200;
				alert.msgLocatingY = -10;
				alert.btnLocatingY = -10;
				alert.type = 3;
				//alert.cancelback = cancelBuy;
			}
			
			PromptManager.instanse.showAlert(alert);
			
		}
		
		private function okBuy():void {
			var itemBuy:ItemShopBuyReq = new ItemShopBuyReq();
			itemBuy.shopId = shopVO.shopId;
			itemBuy.count = 1;
			itemBuy.buyType = shopVO.type;
			NetManager.sendRequest(CmdType.CT_ITEM,CmdCodeItem.CC_ITEM_SHOP_BUY_REQ,itemBuy);
		}
		//private function cancelBuy():void {
			//
		//}
		
		private function updateView():void {
			
		}
		
	}

}