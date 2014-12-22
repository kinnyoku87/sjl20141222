package views.UU.shop.states 
{
	import configs.shop.ShopConfiguration;
	import configs.shop.ShopConfig;
	import configs.skinname.SkinNameConfig;
	import flash.text.TextFieldAutoSize;
	import models.PromptManager;
	import models.player.PlayerModel;
	import net.NetManager;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.cs.CmdCodeItem;
	import proto.cs.CmdType;
	import proto.cs.MysticalBoxOpenReq;
	import utils.GameUtil;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_BaoHe_StateUU extends StateUU
	{
		private var dscLabel:LabelUU;
		private var priceLabel:LabelUU;
		private var timeLabel:LabelUU;
		private var openBtn:ButtonUU;
		private var needMoney:int;
		private var animator:AnimatorUU;
		private var animatorSource:String = "atlas/shop/xuanjibaohe";
		public function Shop_BaoHe_StateUU() 
		{
			
		}
		
		override public function onEnter () : void {
			var boxBg:ImageLoaderUU = new ImageLoaderUU;
			boxBg.source = TResourceManager.getAsset("shop/img/box_bg.png");
			this.fusion.addNode(boxBg);
			boxBg.locatingTypeForHoriz = LocatingType.F___A___F;
			boxBg.locatingTypeForVerti = LocatingType.F_A____F;
			boxBg.locatingOffsetY = 60;
			boxBg.locatingOffsetX = -10;
			
			var boxUI:ImageLoaderUU = new ImageLoaderUU;
			boxUI.source = TResourceManager.getAsset("shop/img/box_ui_bg.png");
			this.fusion.addNode(boxUI);
			boxUI.locatingTypeForHoriz = LocatingType.L___A___L;
			boxUI.locatingTypeForVerti = LocatingType.L___A___L;
			//boxUI.locatingOffsetY = 30;
			
			dscLabel = TextUtil.createLabel6("", 20, ColorUtil.BLACK, true, -1);
			this.fusion.addNode(dscLabel);
			dscLabel.text = "打开玄机宝盒可获得6张卡牌， 其中至少一张蓝色以上品质卡牌";
			dscLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			dscLabel.locatingTypeForVerti = LocatingType.L____L_A;
			//dscLabel.locatingOffsetY = 10;
			
			var yinzi:ImageLoaderUU = new ImageLoaderUU;
			yinzi.source = TResourceManager.getAsset("shop/img/yinzi_icon.png");
			this.fusion.addNode(yinzi);
			yinzi.locatingTypeForHoriz = LocatingType.L___A___L;
			yinzi.locatingTypeForVerti = LocatingType.L____L_A;
			yinzi.locatingOffsetY = 30;
			yinzi.locatingOffsetX = -30;
			
			timeLabel = TextUtil.createLabel6("", 24, 0xffb244, true, -1, 2, TextFieldAutoSize.LEFT);
			this.fusion.addNode(timeLabel);
			timeLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			timeLabel.locatingTypeForVerti = LocatingType.L___A___L;
			timeLabel.locatingOffsetX = 20;
			needMoney = ShopConfiguration.getShopInfo(ShopConfig.BAOHE_SHOPID).price;
			timeLabel.text = needMoney.toString();
			
			openBtn = new ButtonUU;
			openBtn.skinName = SkinNameConfig.shop_lianzi_btn;
			TextUtil.decorateLabel6(openBtn.getLabel(),"打开",18, 0xffb244, true,0xb50a00,1);
			this.fusion.addNode(openBtn);
			openBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			openBtn.locatingTypeForVerti = LocatingType.F____A_F;
			openBtn.locatingOffsetY = -80;
			openBtn.addEventListener(ATouchEvent.CLICK, onOpenClick);
			//showAnimator();
		}
		
		private function onOpenClick(evt:ATouchEvent):void {
			if (!GameUtil.isEnoughMoney(needMoney)) {
				PromptManager.instanse.showPropmt("银子不足，打开失败");
			}else {
				showAnimator();
			}
		}
		
		private function openBox():void {
			var openBox:MysticalBoxOpenReq = new MysticalBoxOpenReq();
			openBox.shopId = ShopConfig.BAOHE_SHOPID;
			openBox.buyType = ShopConfiguration.getShopInfo(openBox.shopId).sellType;
			NetManager.sendRequest(CmdType.CT_ITEM,CmdCodeItem.CC_ITEM_OPEN_MYSTICAL_BOX_REQ,openBox);
		}
		
		public function showAnimator():void {
			if (!animator) {
				animator = new AnimatorUU;
				animator.play("common.twentynine", animatorSource, 1,function():void {
					openBox();
					if (animator) {
						animator.kill();
						animator = null;
					}	
				});

				animator.locatingTypeForHoriz = LocatingType.F___A___F;
				animator.locatingTypeForVerti = LocatingType.F_A____F;
				animator.locatingOffsetY = 90;
				animator.locatingOffsetX = -2;
				this.fusion.addNode(animator);
			}
		}
		
		override public function onExit () : void {
			
		}
	}

}