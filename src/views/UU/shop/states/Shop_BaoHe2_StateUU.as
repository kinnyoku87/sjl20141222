package views.UU.shop.states 
{
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	import configs.cards.EquipmentCardCfg;
	import configs.cards.MagicCardCfg;
	import configs.shop.ShopConfiguration;
	import configs.shop.ShopInfoCfg;
	import configs.shop.ShopConfig;
	import configs.skinname.SkinNameConfig;
	import models.shop.ShopModule;
	import net.NetManager;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.utils.ColorUtil;
	import proto.cs.CmdCodeItem;
	import proto.cs.CmdType;
	import proto.cs.ConfirmBoxReq;
	import utils.GameUtil;
	import utils.TextUtil;
	import views.UU.comps.cardFustions.CharacterCard_UU;
	import views.UU.comps.cardFustions.EquipmentCard_UU;
	import views.UU.comps.cardFustions.MagicCard_UU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_BaoHe2_StateUU extends StateUU
	{
		
		public function Shop_BaoHe2_StateUU() 
		{
			
		}
		
		override public function onEnter () : void {
			//整理卡牌
			var cardUU:FusionUU;
			var i:int;
			var pointX:Number
			var pointY:Number
			var id:Number
			var cardWidth:Number;
			var cardHeight:Number;
			
			for (i = 0; i < ShopModule.baoheCardList.length; i++ ) {
				id = ShopModule.baoheCardList[i];
				cardUU = GameUtil.getCardUU(id);
				cardUU.scaleX = 0.75;
				cardUU.scaleY = 0.75;
				this.fusion.addNode(cardUU);
				if (i == 0) {
					cardWidth = cardUU.width;
					cardHeight = cardUU.height;
				}
				cardUU.locatingTypeForHoriz = LocatingType.F_A____F;
				cardUU.locatingTypeForVerti = LocatingType.F_A____F;
				pointX = 100 + (cardWidth + 10) * (i % 3);
				pointY = 20 + (cardHeight + 5) * int(i / 3);	
				cardUU.locatingOffsetX = pointX;
				cardUU.locatingOffsetY = pointY;
			}
			
			//描述
			var dscLabel:LabelUU = TextUtil.createLabel6("", 25, ColorUtil.BLACK, true, -1);
			dscLabel.text = "点击确定，系统将回收多余的卡牌进入玄玉池";
			this.fusion.addNode(dscLabel);
			dscLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			dscLabel.locatingTypeForVerti = LocatingType.F____A_F;
			dscLabel.locatingOffsetY = -100;
			dscLabel.locatingOffsetX = -50;
			
			//确定
			var btn:ButtonUU = new ButtonUU();
			btn.skinName = SkinNameConfig.shop_lianzi_btn;
			TextUtil.decorateLabel6(btn.getLabel(),"确认",18, 0xffb244, true,0xb50a00,1);
			this.fusion.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.L____L_A;
			btn.locatingOffsetY = 20;
			btn.locatingOffsetX = -50;
			btn.addEventListener(ATouchEvent.CLICK,onBtnClick);
		}
		
		private function onBtnClick(evt:ATouchEvent):void {
			var shopInfo:ShopInfoCfg = ShopConfiguration.getShopInfo(ShopConfig.BAOHE_SHOPID);
			var confirmReq:ConfirmBoxReq = new ConfirmBoxReq();
			confirmReq.boxId = shopInfo.goodId;
			NetManager.sendRequest(CmdType.CT_ITEM,CmdCodeItem.CC_ITEM_CONFIRM_RESULT_REQ,confirmReq);
		}
		
		override public function onExit () : void {
			
		}
	}

}