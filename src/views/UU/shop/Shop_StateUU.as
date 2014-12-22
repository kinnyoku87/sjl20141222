package views.UU.shop 
{
	import configs.cardset.CardSetConfig;
	import configs.shop.ShopConfig;
	import configs.skinname.SkinNameConfig;
	import flash.text.TextFieldAutoSize;
	import models.cardSet.CardSetModule;
	import models.player.PlayerModel;
	import models.player.RoleEvent;
	import models.shop.ShopEvent;
	import models.shop.ShopModule;
	import net.NetManager;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.CheckBoxUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.StringUtil;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import ui.ShildStateUU;
	import utils.TextUtil;
	import views.CardSet_StateVV;
	import views.Room_StateVV;
	import views.UU.shop.items.Shop_CardTab_UU;
	import views.UU.shop.states.Shop_BaoHe_StateUU;
	import views.UU.shop.states.Shop_BaoHe2_StateUU;
	import views.UU.shop.states.Shop_BaoHe3_StateUU;
	import views.UU.shop.states.Shop_CampCard_StateUU;
	import views.UU.shop.states.Shop_XuanYu_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_StateUU extends ShildStateUU
	{
		private var searchBg:CheckBoxUU;
		private var searchInput:TextInputUU;
		
		private var yinziLabel:LabelUU;
		private var yuanbaoLabel:LabelUU;
		private var xuanyuLabel:LabelUU;
		
		private var xuanyuTab:RadioUU;
		private var baoheTab:RadioUU;
		private var cardTab:RadioUU;
		private var tabGroup:RadioGroupUU;
		private var cardOpenCheck:CheckBoxUU;
		
		private var curCamp:Shop_CardTab_UU;
		private var camps:Array;
		
		private var contentFusion:StateFusionUU;
		public function Shop_StateUU() 
		{
			notDefaultClose = true;
		}
		
		override public function onEnter () : void {
			super.onEnter();
			//背景
			var backGround:ImageLoaderUU = new ImageLoaderUU;
			backGround.source = TResourceManager.getAsset("shop/img/shop_background.png");
			this.fusion.addNode(backGround);
			this.fusion.spaceWidth = backGround.width;
			this.fusion.spaceHeight = backGround.height;
			
			var closeBtn:ButtonUU = new ButtonUU;
			this.fusion.addNode(closeBtn);
			closeBtn.skinName  = SkinNameConfig.common_close_C;
			closeBtn.locatingTypeForHoriz = LocatingType.F____A_F;
			closeBtn.locatingTypeForVerti = LocatingType.F_A____F;
			closeBtn.locatingOffsetY = 30;
			closeBtn.locatingOffsetX = -10;
			closeBtn.addEventListener(ATouchEvent.CLICK, onCloseClick);
			
			//我的卡牌
			var cardsetBtn:ButtonUU = new ButtonUU;
			cardsetBtn.skinName = SkinNameConfig.shop_cardset_btn;
			this.fusion.addNode(cardsetBtn);
			cardsetBtn.locatingTypeForHoriz = LocatingType.F____A_F;
			cardsetBtn.locatingTypeForVerti = LocatingType.F_A____F;
			cardsetBtn.locatingOffsetY = 50;
			cardsetBtn.locatingOffsetX = -110;
			cardsetBtn.addEventListener(ATouchEvent.CLICK, onCardsetClick);
			
			//查找
			searchBg = new CheckBoxUU;
			searchBg.skinName = SkinNameConfig.shop_search_btn;
			this.fusion.addNode(searchBg);
			searchBg.locatingTypeForHoriz = LocatingType.F_A____F;
			searchBg.locatingTypeForVerti = LocatingType.F____A_F;
			searchBg.locatingOffsetY = -20;
			searchBg.locatingOffsetX = 50;
			searchBg.touchable = false;
			
			searchInput = new TextInputUU(false);
			this.fusion.addNode(searchInput);
			searchInput.locatingTypeForHoriz = LocatingType.L_A____L;
			searchInput.locatingTypeForVerti = LocatingType.L_A____L;
			searchInput.locatingOffsetX = 50;
			searchInput.locatingOffsetY = 5;
			searchInput.width = 120;
			searchInput.height = 25;
			searchInput.color = 0xFFFFFF
			searchInput.size = 22;
			searchInput.font = "Courier New";
			searchInput.addEventListener(NodeEvent.FOCUS_IN,onSeachFocus);
			searchInput.addEventListener(NodeEvent.FOCUS_OUT, onSeachFocus);
			
			//充值
			var btnRecharge:ButtonUU = new ButtonUU;
			btnRecharge.skinName = SkinNameConfig.shop_recharge_btn;
			this.fusion.addNode(btnRecharge);
			btnRecharge.locatingTypeForHoriz = LocatingType.F_A____F;
			btnRecharge.locatingTypeForVerti = LocatingType.F____A_F;
			btnRecharge.locatingOffsetY = -80;
			btnRecharge.locatingOffsetX = 80;
			
			var recharge:ImageLoaderUU = new ImageLoaderUU;
			recharge.source = TResourceManager.getAsset("shop/img/recharge.png");
			btnRecharge.addNode(recharge);
			recharge.locatingTypeForHoriz = LocatingType.F___A___F;
			recharge.locatingTypeForVerti = LocatingType.F___A___F;
			
			//银子
			var yinzi:ImageLoaderUU = new ImageLoaderUU;
			yinzi.source = TResourceManager.getAsset("shop/img/yinzi_icon.png");
			this.fusion.addNode(yinzi);
			yinzi.locatingTypeForHoriz = LocatingType.F_A____F;
			yinzi.locatingTypeForVerti = LocatingType.F____A_F;
			yinzi.locatingOffsetY = -140;
			yinzi.locatingOffsetX = 60;
			
			//元宝
			var yuanbao:ImageLoaderUU = new ImageLoaderUU;
			yuanbao.source = TResourceManager.getAsset("shop/img/yuanbao_icon.png");
			this.fusion.addNode(yuanbao);
			yuanbao.locatingTypeForHoriz = LocatingType.L___A___L;
			yuanbao.locatingTypeForVerti = LocatingType.A_L____L;
			yuanbao.locatingOffsetY = -20;
			
			//玄玉
			var xuanyu:ImageLoaderUU = new ImageLoaderUU;
			xuanyu.source = TResourceManager.getAsset("shop/img/xuanyu_icon.png");
			this.fusion.addNode(xuanyu);
			xuanyu.locatingTypeForHoriz = LocatingType.L___A___L;
			xuanyu.locatingTypeForVerti = LocatingType.A_L____L;
			xuanyu.locatingOffsetY = -20;
			
			//银子数量
			yinziLabel = TextUtil.createLabel6("", 24, 0xffb244, true, -1, 2, TextFieldAutoSize.LEFT);
			yinziLabel.locatingNode = yinzi;
			this.fusion.addNode(yinziLabel);
			yinziLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			yinziLabel.locatingTypeForVerti = LocatingType.L___A___L;
			yinziLabel.locatingOffsetX = 10;
			
			//元宝数量
			yuanbaoLabel = TextUtil.createLabel6("", 24, 0xffb244, true, -1, 2, TextFieldAutoSize.LEFT);
			yuanbaoLabel.locatingNode = yuanbao;
			this.fusion.addNode(yuanbaoLabel);
			yuanbaoLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			yuanbaoLabel.locatingTypeForVerti = LocatingType.L___A___L;
			yuanbaoLabel.locatingOffsetX = 10;
			
			//银子数量
			xuanyuLabel = TextUtil.createLabel6("", 24, 0xffb244, true, -1, 2, TextFieldAutoSize.LEFT);
			xuanyuLabel.locatingNode = xuanyu;
			this.fusion.addNode(xuanyuLabel);
			xuanyuLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			xuanyuLabel.locatingTypeForVerti = LocatingType.L___A___L;
			xuanyuLabel.locatingOffsetX = 10;
			
			tabGroup = new RadioGroupUU;
			tabGroup.canSelectClick = true;
			//玄玉标签
			xuanyuTab = new RadioUU;
			xuanyuTab.skinName = SkinNameConfig.shop_tab_btn;
			TextUtil.decorateLabel6(xuanyuTab.getLabel(), "玄玉", 20, 0xffde93, true, 0x4c1a14);
			this.fusion.addNode(xuanyuTab);
			xuanyuTab.locatingTypeForHoriz = LocatingType.F_A____F;
			xuanyuTab.locatingTypeForVerti = LocatingType.F_A____F;
			xuanyuTab.locatingOffsetX = 40;
			xuanyuTab.locatingOffsetY = 100;
			xuanyuTab.group = tabGroup;
			
			//玄玉宝盒标签
			baoheTab = new RadioUU;
			baoheTab.skinName = SkinNameConfig.shop_tab_btn;
			TextUtil.decorateLabel6(baoheTab.getLabel(), "玄机宝盒", 20, 0xffde93, true, 0x4c1a14);
			this.fusion.addNode(baoheTab);
			baoheTab.locatingTypeForHoriz = LocatingType.L___A___L;
			baoheTab.locatingTypeForVerti = LocatingType.L____L_A;
			baoheTab.locatingOffsetY = 3;
			baoheTab.group = tabGroup;
			
			//卡牌标签
			cardTab = new RadioUU;
			cardTab.skinName = SkinNameConfig.shop_tab_btn;
			TextUtil.decorateLabel6(cardTab.getLabel(), "卡牌", 20, 0xffde93, true, 0x4c1a14);
			this.fusion.addNode(cardTab);
			cardTab.locatingTypeForHoriz = LocatingType.L___A___L;
			cardTab.locatingTypeForVerti = LocatingType.L____L_A;
			cardTab.locatingOffsetY = 3;
			cardTab.group = tabGroup;
			
			cardOpenCheck = new CheckBoxUU();
			cardOpenCheck.skinName = SkinNameConfig.shop_tab_status;
			cardTab.addNode(cardOpenCheck);
			cardOpenCheck.locatingTypeForHoriz = LocatingType.F_A____F;
			cardOpenCheck.locatingTypeForVerti = LocatingType.F___A___F;
			cardOpenCheck.touchable = false;
			
			camps = [];
			var i:int ;
			var tabCamp:Shop_CardTab_UU;
			for (i = 0; i < 4; i++ ) {
				tabCamp = new Shop_CardTab_UU();
				if (i == 3) {
					tabCamp.campId = CardSetConfig.Camp_Neatrual_Id;
				}else {
					tabCamp.campId = i + 1;
				}
				
				this.fusion.addNode(tabCamp);
				tabCamp.locatingTypeForHoriz = LocatingType.L___A___L;
				tabCamp.locatingTypeForVerti = LocatingType.L____L_A;
				tabCamp.selected = false;
				//if (i == 1) {
					//curCamp = tabCamp;
					//curCamp.selected = true;
				//} 
			
				tabCamp.touchable = true;
				tabCamp.addEventListener(ATouchEvent.CLICK, onTabCampClick);
				camps.push(tabCamp);
			}
			curCamp = camps[0];
			curCamp.selected = true;
			ShopConfig.campId = curCamp.campId;
			
			contentFusion = new StateFusionUU();
			this.fusion.addNode(contentFusion);
			contentFusion.locatingTypeForHoriz = LocatingType.F_A____F;
			contentFusion.locatingTypeForVerti = LocatingType.F_A____F;
			contentFusion.locatingOffsetX = 230;
			contentFusion.locatingOffsetY = 100;
			contentFusion.spaceWidth = 750 / 0.75;
			contentFusion.spaceHeight = 600 / 0.75;
			
			//var rawSprite:RawSpriteUU = new RawSpriteUU;
			//rawSprite.graphics.beginFill(0xffffff, 1.0);
			//rawSprite.graphics.drawRect(0, 0, contentFusion.spaceWidth, contentFusion.spaceHeight);
			//contentFusion.addNode(rawSprite);
			
			tabGroup.addEventListener(AEvent.CHANGE, onTabGroupChange);
			tabGroup.selectedIndex = 2;
			
			
			
			addRootEvent();
			updateMoneys("");
			
			addEvents();
					
			requstBattleParams();
		}
		
		//请求参数数据
		private function requstBattleParams():void {
			   NetManager.sendRequest(CmdType.CT_BATTLE,CmdCodeBattle.CC_BATTLE_GET_PARAM_REQ,null);
		}
		
		private function onTabCampClick( e:ATouchEvent ) : void {
			setCamp(e.target as Shop_CardTab_UU);
			
		}
		
		//更新财富
		private function updateMoneys(evt:String,data:Object = null):void {
			yinziLabel.text = PlayerModel.getInstance().myRole.money.toString();
			yuanbaoLabel.text = PlayerModel.getInstance().myRole.rmb.toString();
			xuanyuLabel.text = PlayerModel.getInstance().myRole.xuanyu.toString();
		}
		
		private function setCamp(campTab:Shop_CardTab_UU):void {
			if (curCamp == campTab) {
				return;
			}
			curCamp.selected = false;
			curCamp = campTab;
			curCamp.selected = true;
			ShopConfig.campId = campTab.campId;
			ShopModule.dispatchEvent(ShopEvent.Update_ShopCards);
		}
		
		private function setCampsVisible():void {
			for (var i:int = 0; i < camps.length;i++ ) {
				camps[i].visible = cardOpenCheck.selected;
			}
		}
		
		
		private function onSeachFocus(evt:NodeEvent): void {
			if (evt.type == NodeEvent.FOCUS_IN) {
				searchBg.selected = true;
			}else {
				if (StringUtil.Trim(searchInput.text) == "" ) {
					searchBg.selected = false;
				}
			}
		}
		
		private function onTabGroupChange(evt:AEvent):void {
			if (tabGroup.selectedIndex == 0) {
				this.contentFusion.setState(Shop_XuanYu_StateUU);
				cardOpenCheck.selected = false;
				setCampsVisible();
			}else if (tabGroup.selectedIndex == 1) {
				if (ShopConfig.baoheStep == 1) {
					this.contentFusion.setState(Shop_BaoHe_StateUU);
				}else if (ShopConfig.baoheStep == 2) {
					this.contentFusion.setState(Shop_BaoHe2_StateUU);
				}else if (ShopConfig.baoheStep == 3) {
					this.contentFusion.setState(Shop_BaoHe3_StateUU);
				}
				cardOpenCheck.selected = false;
				setCampsVisible();
			}else if (tabGroup.selectedIndex == 2) {
				cardOpenCheck.selected = !cardOpenCheck.selected;
				setCampsVisible();
				this.contentFusion.setState(Shop_CampCard_StateUU);
			}
		}
		
		private function onCloseClick(evt:ATouchEvent):void {
			ViewFacade.setStateView(Room_StateVV);
		}
		
		private function onCardsetClick(evt:ATouchEvent):void {
			ViewFacade.setStateView(CardSet_StateVV);
		}
		
		private function onBoxOpen(evt:String,data:Object = null):void {
			onTabGroupChange(null);
		}
		
		private function addEvents():void {
			ShopModule.addEventListener(ShopEvent.Update_Box_Open_Status, onBoxOpen);	
			PlayerModel.addEventListener(RoleEvent.Update_Role_Info,updateMoneys);
		}
		
		private function removeEvents():void {
			ShopModule.removeEventListener(ShopEvent.Update_Box_Open_Status, onBoxOpen);		
			PlayerModel.removeEventListener(RoleEvent.Update_Role_Info,updateMoneys);
		}
		
		

		override public function onExit () : void {
			super.onExit();
			removeEvents();
		}
		
		//private function onResize(evt:NodeEvent):void {
			//this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			//this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		//}
		
	}

}