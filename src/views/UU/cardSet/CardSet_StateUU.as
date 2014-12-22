package views.UU.cardSet 
{
	import cn.flashk.controls.CheckBox;
	import configs.cards.CardCfg;
	import configs.cards.CardConfigurator;
	import configs.cardset.CardSetConfig;
	import configs.error.ErrorConfiguration;
	import configs.skinname.SkinNameConfig;
	import flash.ui.Keyboard;
	import flash.ui.KeyboardType;
	import models.cardSet.CardSetEvent;
	import models.cardSet.CardSetModule;
	import models.GameModel;
	import models.PromptManager;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.CheckBoxUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.SliderUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.ViewportFusion;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.keyboard.TKeyboardManager;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import org.agony2d.utils.StringUtil;
	import proto.com.CAMP_ID;
	import proto.com.CampBattleCard;
	import proto.com.CardHoldUnit;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.SetBattleParamReq;
	import ui.AlertInfo;
	import ui.ShildStateUU;
	import utils.GameUtil;
	import utils.TextUtil;
	import views.Room_StateVV;
	import views.UU.cardSet.items.CardSet_BagCard_UU;
	import views.UU.cardSet.items.CardSet_CharacterCard_UU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CardSet_StateUU extends ShildStateUU
	{
		private var btnBack:ButtonUU;   //返回按钮
		private var btnComplete:ButtonUU; //完成按钮
		private var btnCardInfo:CheckBoxUU; //卡牌图鉴按钮
		
		private var shangCamp:RadioUU;      
		private var zhouCamp:RadioUU;
		private var yaoCamp:RadioUU;
		private var wuCamp:RadioUU;
		private var neutralCamp:RadioUU;
		private var campGroup:RadioGroupUU;
		private var magicGroup:RadioGroupUU;
		private var selectCampImg:ImageLoaderUU;
		
		private var campTitle:ImageLoaderUU;   //阵营图片
		private var campTitleComo:FusionUU;    //阵营图片容器
		
		private var pageComo:FusionUU;        
		private var pageIcon:ImageLoaderUU;        
		private var leftPage:ButtonUU;
		private var rightPage:ButtonUU;
		
		private var searchBg:CheckBoxUU;
		private var searchInput:TextInputUU;
		
		private var _isSetBag:Boolean;  //是否在设置卡包
		
		private var showList:Array;    //显示卡牌列表
		private var cardCountLabel:LabelUU;
		private var bagNameLabel:LabelUU;
		
		public function CardSet_StateUU() 
		{
			notDefaultClose = true;
		}
		
		override public function onEnter () : void {
			super.onEnter();
			
			//背景
			var backGround:ImageLoaderUU = new ImageLoaderUU;
			backGround.source = TResourceManager.getAsset("cardset/img/card_background.png");
			this.fusion.addNode(backGround);
			this.fusion.spaceWidth = backGround.width;
			this.fusion.spaceHeight = backGround.height;
			
			closeBtn = new ButtonUU;
			this.fusion.addNode(closeBtn);
			closeBtn.skinName  = SkinNameConfig.common_close_C;
			closeBtn.locatingTypeForHoriz = LocatingType.F____A_F;
			closeBtn.locatingTypeForVerti = LocatingType.F_A____F;
			closeBtn.locatingOffsetY = 50;
			closeBtn.locatingOffsetX = -10;
			closeBtn.addEventListener(ATouchEvent.CLICK,closeClick);
			
			
			//
			//返回按钮
			//btnBack = new ButtonUU;
			//btnBack.skinName = SkinNameConfig.cardset_back_btn;
			//this.fusion.addNode(btnBack);
			//btnBack.locatingTypeForHoriz = LocatingType.F_A____F;
			//btnBack.locatingTypeForVerti = LocatingType.F____A_F;
			//btnBack.locatingOffsetX = 120;
			//btnBack.locatingOffsetY = -75;
			//var btnBackTitle:ImageLoaderUU = new ImageLoaderUU;
			//btnBackTitle.source = TResourceManager.getAsset("cardset/img/back.png");
			//btnBack.addNode(btnBackTitle);
			//btnBackTitle.locatingTypeForHoriz = LocatingType.F___A___F;
			//btnBackTitle.locatingTypeForVerti = LocatingType.F___A___F;
			//btnBack.addEventListener(ATouchEvent.CLICK, onBtnClick );
			
			//完成按钮
			btnComplete = new ButtonUU;
			btnComplete.skinName = SkinNameConfig.cardset_back_btn;
			this.fusion.addNode(btnComplete);
			btnComplete.locatingTypeForHoriz = LocatingType.F_A____F;
			btnComplete.locatingTypeForVerti = LocatingType.F____A_F;
			btnComplete.locatingOffsetX = 125;
			btnComplete.locatingOffsetY = -75;
			var btnCompleteTitle:ImageLoaderUU = new ImageLoaderUU;
			btnCompleteTitle.source = TResourceManager.getAsset("cardset/img/complete.png");
			btnComplete.addNode(btnCompleteTitle);
			btnCompleteTitle.locatingTypeForHoriz = LocatingType.F___A___F;
			btnCompleteTitle.locatingTypeForVerti = LocatingType.F___A___F;
			btnComplete.addEventListener(ATouchEvent.CLICK, onBtnClick );
			
			cardCountLabel = TextUtil.createLabel6("", 24, 0xcda37d,false,0x1d170f,2);
			this.fusion.addNode(cardCountLabel);
			cardCountLabel.locatingTypeForHoriz = LocatingType.A_L____L;
			cardCountLabel.locatingTypeForVerti = LocatingType.L___A___L;
			cardCountLabel.locatingOffsetX = -35;
			cardCountLabel.locatingOffsetY = -15;
			
			bagNameLabel = TextUtil.createLabel6("", 30, 0xcda37d,false,0x1d170f,2);
			this.fusion.addNode(bagNameLabel);
			bagNameLabel.locatingTypeForHoriz = LocatingType.F_A____F;
			bagNameLabel.locatingTypeForVerti = LocatingType.F_A____F;
			bagNameLabel.locatingOffsetX = 140;
			bagNameLabel.locatingOffsetY = 80;
			
			//卡牌图鉴
			btnCardInfo = new CheckBoxUU;
			btnCardInfo.skinName = SkinNameConfig.cardset_card_info;
			this.fusion.addNode(btnCardInfo);
			btnCardInfo.locatingTypeForHoriz = LocatingType.F___A___F;
			btnCardInfo.locatingTypeForVerti = LocatingType.F_A____F;
			btnCardInfo.locatingOffsetX = 345;
			btnCardInfo.locatingOffsetY = 64;
			//btnCardInfo.addEventListener(ATouchEvent.CLICK,onCardInfoClick);
			btnCardInfo.addEventListener(AEvent.CHANGE,onCardInfoChange);
			
			campGroup = new RadioGroupUU;
			//商
			shangCamp = new RadioUU;
			shangCamp.skinName = SkinNameConfig.cardset_camp_tab;
			this.fusion.addNode(shangCamp);
			shangCamp.locatingTypeForHoriz = LocatingType.F_A____F;
			shangCamp.locatingTypeForVerti = LocatingType.F_A____F;
			shangCamp.locatingOffsetX = 280;
			shangCamp.locatingOffsetY = 60;
			shangCamp.group = campGroup;
			shangCamp.userData = CAMP_ID.CAMP_ID_SHANG;
			
			var shang:ImageLoaderUU = new ImageLoaderUU;
			shang.source = TResourceManager.getAsset("cardset/img/shang_select.png");
			shangCamp.addNode(shang);
			shang.locatingTypeForHoriz = LocatingType.F___A___F;
			shang.locatingTypeForVerti = LocatingType.F___A___F;
			
			//周
			zhouCamp = new RadioUU;
			zhouCamp.skinName = SkinNameConfig.cardset_camp_tab;
			this.fusion.addNode(zhouCamp);
			zhouCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			zhouCamp.locatingTypeForVerti = LocatingType.L___A___L;
			zhouCamp.locatingOffsetX = 5;
			zhouCamp.group = campGroup;
			zhouCamp.userData = CAMP_ID.CAMP_ID_ZHOU;
			
			var zhou:ImageLoaderUU = new ImageLoaderUU;
			zhou.source = TResourceManager.getAsset("cardset/img/zhou_select.png");
			zhouCamp.addNode(zhou);
			zhou.locatingTypeForHoriz = LocatingType.F___A___F;
			zhou.locatingTypeForVerti = LocatingType.F___A___F;
			
			//妖
			yaoCamp = new RadioUU;
			yaoCamp.skinName = SkinNameConfig.cardset_camp_tab;
			this.fusion.addNode(yaoCamp);
			yaoCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			yaoCamp.locatingTypeForVerti = LocatingType.L___A___L;
			yaoCamp.locatingOffsetX = 5;
			yaoCamp.group = campGroup;
			yaoCamp.userData = CAMP_ID.CAMP_ID_YAO;
			
			var yao:ImageLoaderUU = new ImageLoaderUU;
			yao.source = TResourceManager.getAsset("cardset/img/yao_select.png");
			yaoCamp.addNode(yao);
			yao.locatingTypeForHoriz = LocatingType.F___A___F;
			yao.locatingTypeForVerti = LocatingType.F___A___F;
			
			//巫
			wuCamp = new RadioUU;
			wuCamp.skinName = SkinNameConfig.cardset_camp_tab;
			this.fusion.addNode(wuCamp);
			wuCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			wuCamp.locatingTypeForVerti = LocatingType.L___A___L;
			wuCamp.locatingOffsetX = 5;
			wuCamp.group = campGroup;
			wuCamp.userData = CAMP_ID.CAMP_ID_WU;
			
			var wu:ImageLoaderUU = new ImageLoaderUU;
			wu.source = TResourceManager.getAsset("cardset/img/wu_select.png");
			wuCamp.addNode(wu);
			wu.locatingTypeForHoriz = LocatingType.F___A___F;
			wu.locatingTypeForVerti = LocatingType.F___A___F;
			
			//中立
			neutralCamp = new RadioUU;
			neutralCamp.skinName = SkinNameConfig.cardset_neutral_tab;
			this.fusion.addNode(neutralCamp);
			neutralCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			neutralCamp.locatingTypeForVerti = LocatingType.L___A___L;
			neutralCamp.locatingOffsetX = 5;
			neutralCamp.group = campGroup;
			neutralCamp.userData = 9;
			
			campGroup.addEventListener(AEvent.CHANGE, onCampChange);
			
			selectCampImg = new ImageLoaderUU();
			selectCampImg.source = TResourceManager.getAsset("cardset/img/effect_campselect.png");
			this.fusion.addNode(selectCampImg);
			selectCampImg.touchable = false;
			
			//阵营标题容器
			campTitleComo = new FusionUU;
			campTitleComo.locatingTypeForHoriz = LocatingType.F___A___F;
			campTitleComo.locatingTypeForVerti = LocatingType.F_A____F;
			campTitleComo.locatingOffsetY = 115;
			campTitleComo.locatingOffsetX = 80;
			this.fusion.addNode(campTitleComo);
			
			//魔法值筛选按钮
			magicGroup = new RadioGroupUU;
			var magicBg:ImageLoaderUU;
			var lastbg:ImageLoaderUU;
			var magicRadio:RadioUU;
			var i:int;
			for (i = -1; i < 10; i++ ) {
				
				magicRadio = new RadioUU;
				
				magicRadio.group = magicGroup;
				magicRadio.userData = i;
				if (i == -1) {
					magicRadio.skinName = SkinNameConfig.cardset_all_btn;
					magicRadio.locatingTypeForHoriz = LocatingType.F_A____F;
					magicRadio.locatingTypeForVerti = LocatingType.F____A_F;
					magicRadio.locatingOffsetX = 280;
					magicRadio.locatingOffsetY = -55;
					this.fusion.addNode(magicRadio);
				}else {
					magicBg = new ImageLoaderUU;
					magicBg.source = TResourceManager.getAsset("cardset/img/mp_bg.png");
					this.fusion.addNode(magicBg);
					this.fusion.addNode(magicRadio);
					magicRadio.skinName = SkinNameConfig.cardset_blue_btn;
					var num:ImageLoaderUU = new ImageLoaderUU;
					num.source = TResourceManager.getAsset("cardset/num/num_" + i + ".png");
					magicRadio.addNode(num);
					num.locatingTypeForHoriz = LocatingType.F___A___F;
					num.locatingTypeForVerti = LocatingType.F___A___F;
					if (i == 0) {
						lastbg = magicBg;
					}else {
						magicBg.locatingNode = lastbg;
						lastbg = magicBg;
					}
					magicBg.locatingTypeForHoriz = LocatingType.L____L_A;
					magicBg.locatingTypeForVerti = LocatingType.L___A___L;
					magicRadio.locatingTypeForHoriz = LocatingType.L___A___L;
					magicRadio.locatingTypeForVerti = LocatingType.L___A___L;
					if (i == 0 ) {
						magicBg.locatingOffsetX = 8;
						
					}else {
						magicBg.locatingOffsetX = 5;
						
					}
					
					
				}
			}
			magicGroup.addEventListener(AEvent.CHANGE,onMagicGroup);
			
			//翻页
			//pageLabel = TextUtil.createLabel6("1", 30, ColorUtil.BROWN);
			//this.fusion.addNode(pageLabel);
			//pageLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			//pageLabel.locatingTypeForVerti = LocatingType.F____A_F;
			//pageLabel.locatingOffsetY = -105;
			//pageLabel.locatingOffsetX = 90;
			
			pageComo = new FusionUU;
			pageComo.locatingTypeForHoriz = LocatingType.F___A___F;
			pageComo.locatingTypeForVerti = LocatingType.F____A_F;
			pageComo.locatingOffsetY = -115;
			pageComo.locatingOffsetX = 95;
			this.fusion.addNode(pageComo);
			
			
			leftPage = new ButtonUU;
			this.fusion.addNode(leftPage);
			leftPage.skinName = SkinNameConfig.cardset_lPage_btn;
			leftPage.locatingTypeForHoriz = LocatingType.A_L____L;
			leftPage.locatingTypeForVerti = LocatingType.L___A___L;
			leftPage.locatingOffsetX = -35;
			leftPage.addEventListener(ATouchEvent.CLICK,onPageClick);
			
			rightPage = new ButtonUU;
			this.fusion.addNode(rightPage);
			rightPage.locatingNode = pageComo;
			rightPage.skinName = SkinNameConfig.cardset_rPage_btn;
			rightPage.locatingTypeForHoriz = LocatingType.L____L_A;
			rightPage.locatingTypeForVerti = LocatingType.L___A___L;
			rightPage.locatingOffsetX = 35;
			rightPage.addEventListener(ATouchEvent.CLICK, onPageClick);
			
			//查找
			searchBg = new CheckBoxUU;
			searchBg.skinName = SkinNameConfig.cardset_search_btn;
			this.fusion.addNode(searchBg);
			searchBg.locatingTypeForHoriz = LocatingType.F____A_F;
			searchBg.locatingTypeForVerti = LocatingType.F____A_F;
			searchBg.locatingOffsetY = -60;
			searchBg.locatingOffsetX = -110;
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
			searchInput.addEventListener(NodeEvent.FOCUS_OUT,onSeachFocus);
				
			campGroup.selectedUserData = CAMP_ID.CAMP_ID_SHANG;
			isSetBag = false;
			
			show();
			updatePageStatus();
			
	
			initPinzhi();
			TKeyboardManager.getInstance().getState().press.addEventListener("ENTER", searchEnter);

			addRootEvent();
			
			cardInfoFusion = new FusionUU;
			this.fusion.addNode(cardInfoFusion);
			cardInfoFusion.locatingTypeForHoriz = LocatingType.F_A____F;
			cardInfoFusion.locatingTypeForVerti = LocatingType.F_A____F;
			cardInfoFusion.locatingOffsetX = 45;
			cardInfoFusion.locatingOffsetY = 130;
			
			
			cardBagFusion = new FusionUU;
			this.fusion.addNode(cardBagFusion);
			cardBagFusion.locatingTypeForHoriz = LocatingType.F_A____F;
			cardBagFusion.locatingTypeForVerti = LocatingType.F_A____F;
			cardBagFusion.locatingOffsetX = 45;
			cardBagFusion.locatingOffsetY = 130;
			
		
			
			cardSelectFusion = new FusionUU;
			this.fusion.addNode(cardSelectFusion);
			cardSelectFusion.locatingTypeForHoriz = LocatingType.F_A____F;
			cardSelectFusion.locatingTypeForVerti = LocatingType.F_A____F;
			cardSelectFusion.locatingOffsetX = 45;
			cardSelectFusion.locatingOffsetY = 130;
			cardSelectFusion.spaceWidth = 200;
			cardSelectFusion.spaceHeight = 700;
			
				//var rawSprite:RawSpriteUU = new RawSpriteUU;
			//rawSprite.graphics.beginFill(0xff0000, 1.0);
			//rawSprite.graphics.drawRect(0, 0, 200, 700);
			//cardSelectFusion.addNode(rawSprite);
			//cardBagFusion.addNode(rawSprite);
			//rawSprite.locatingTypeForHoriz = LocatingType.F_A____F;
			//rawSprite.locatingTypeForVerti = LocatingType.F_A____F;
			//rawSprite.locatingOffsetX = 45;
			//rawSprite.locatingOffsetY = 130;
			
			initBags();
			
			infoLabel = TextUtil.createLabel6("", 25, ColorUtil.WHITE);
			infoLabel.x = 15;
			infoLabel.y = 50;
			infoLabel.width = 180;
			infoLabel.wordWrap = true;
			cardInfoFusion.addNode(infoLabel);
			
			CardSetModule.addEventListener(CardSetEvent.Add_Reduce_Card_Num,onUpdateCardBags);
			CardSetModule.addEventListener(CardSetEvent.Add_Card_Num,onUpdateCardBags);
			CardSetModule.addEventListener(CardSetEvent.Delete_Card_Num,onUpdateCardBags);
			CardSetModule.addEventListener(CardSetEvent.Change_Card_Num, onUpdateCardBags);
			
			CardSetModule.addEventListener(CardSetEvent.Add_Card_Bag,onAddCardBag);
			CardSetModule.addEventListener(CardSetEvent.Remove_Card_Bag,onRemoveCardBag);
			
		}
		
		private var cardSelectFusion:FusionUU;     //选包容器
		private var cardBagFusion:FusionUU;        //卡包列表容器
		private var cardInfoFusion:FusionUU;       //图鉴容器
		private var cardListFusion:FusionUU;       //卡牌容器
		private var infoLabel:LabelUU;             //图鉴卡牌描述
		private var curCard:CardSet_CharacterCard_UU;  //当前选中的卡牌
		private var isCloseBagClick:Boolean;
		private function initBags():void {
			var bagNum:int = CardSetModule.cardBagNum;
			var campBag:CampBattleCard;
			var btnBag:ButtonUU;
			var image:ImageLoaderUU;
			var closeBag:ButtonUU;
			var i:int;
			for (i = 0; i < bagNum;i++ ) {
				campBag = CardSetModule.getCardBgByIndex(i);
				btnBag = new ButtonUU;
				btnBag.skinName = SkinNameConfig.cardset_card_bag;
				cardSelectFusion.addNode(btnBag);
				//if (campBag.name == "") {
					//image = new ImageLoaderUU;
					//image.source = TResourceManager.getAsset(CardSetModule.getBagName(campBag.campId));
					//btnBag.addNode(image);
					//image.locatingTypeForHoriz = LocatingType.L___A___L;
					//image.locatingTypeForVerti = LocatingType.L___A___L;
				//}else {
					TextUtil.decorateLabel6(btnBag.getLabel(),campBag.name,27,ColorUtil.rgb(213,149,88),false,ColorUtil.rgb(46,31,17),3);
				//}
				btnBag.locatingTypeForHoriz = LocatingType.F_A____F;
				btnBag.locatingTypeForVerti = LocatingType.F_A____F;
				btnBag.locatingOffsetY = i * (btnBag.height);
				btnBag.userData = campBag.bagIndex;
				btnBag.addEventListener(ATouchEvent.CLICK,onBtnBagClick);
				btnBag.addEventListener(ATouchEvent.HOVER,onBtnBagHover);
				btnBag.addEventListener(ATouchEvent.LEAVING,onBtnBagOut);
				
				closeBag = new ButtonUU;
				closeBag.skinName = SkinNameConfig.cardset_close_bag;
				closeBag.userData = campBag.bagIndex;
				btnBag.addNode(closeBag);
				closeBag.locatingTypeForHoriz = LocatingType.F____A_F;
				closeBag.locatingTypeForVerti = LocatingType.F_A____F;
				closeBag.addEventListener(ATouchEvent.CLICK, onCloseBagClick);
				closeBag.visible = false;
			}
			if (bagNum <= 7) {
				btnBag = new ButtonUU;
				btnBag.skinName = SkinNameConfig.cardset_increase_bag;
				cardSelectFusion.addNode(btnBag);
				btnBag.userData = 100;
				btnBag.locatingTypeForHoriz = LocatingType.L___A___L;
				btnBag.locatingTypeForVerti = LocatingType.L____L_A;
				btnBag.addEventListener(ATouchEvent.CLICK,onBtnBagClick);
			}
		}
		
		//点击卡包
		private function onBtnBagClick(evt:ATouchEvent):void {
			if (isCloseBagClick) {
				isCloseBagClick = false;
				return;
			}
			CardSetConfig.curBagIndex  = evt.target.userData as int;
			if (CardSetConfig.curBagIndex == 100) {
				UUFacade.getWindow(CardSet_AddBag_StateUU).activate();
			}else {
				
				showCardBags();
				isSetBag = true;
				CardSetConfig.campId = CardSetModule.getCardBag(CardSetConfig.curBagIndex).campId; 
				selectCamp = CardSetConfig.campId;
				updateCamp();
				curStep = CardSetConfig.Cardset_Bag_Step2;
				toFusion();
			}
			bagNameLabel.text = CardSetModule.getCardBag(CardSetConfig.curBagIndex).name;
		}
		
		//移上卡包
		private function onBtnBagHover(evt:ATouchEvent):void {
			var bagIndex:int  = evt.target.userData as int;
			if (bagIndex != 100) {
				var target:ButtonUU  = evt.target as ButtonUU;
				var close:ButtonUU = target.getNodeAt(target.numNodes - 1) as ButtonUU;
				close.visible = true;
			}
			
		}
		//移出卡包
		private function onBtnBagOut(evt:ATouchEvent):void {
			var bagIndex:int  = evt.target.userData as int;
			if (bagIndex != 100) {
				var target:ButtonUU  = evt.target as ButtonUU;
				var close:ButtonUU = target.getNodeAt(target.numNodes - 1) as ButtonUU;
				close.visible = false;
			}
			
		}
		
		//移出卡包
		private function onCloseBagClick(evt:ATouchEvent):void {
			isCloseBagClick = true;
			var bagIndex:int  = evt.target.userData as int;
			if (CardSetModule.cardBagNum == 1) {
				PromptManager.instanse.showPropmt("您必须拥有至少一个套牌包");
				return;
			}
			var alert:AlertInfo = new AlertInfo();
			alert.skin = 3;
			alert.type = 3;
			alert.msg = "确定删除此套牌包？";
			alert.msgLocatingY = -30;
			alert.btnLocatingY = -50;
			alert.sizeWidth = 400;
			alert.sizeHeight = 300;
			alert.okCallback = function():void {
				var setParamReq:SetBattleParamReq = new SetBattleParamReq();
				var camp:CampBattleCard = new CampBattleCard();
				camp.bagIndex = bagIndex;
				setParamReq.isDelete = true;
				setParamReq.campBattleCard = camp;
				NetManager.sendRequest(CmdType.CT_BATTLE,CmdCodeBattle.CC_BATTLE_SET_PARAM_REQ,setParamReq);
			};
			PromptManager.instanse.showAlert(alert);
			
		}
		
		private function onAddCardBag(evt:String,data:Object = null):void {
			var i:int;
			var len:int = cardSelectFusion.numNodes;
			for (i = len - 1; i >= 0 ;i-- ) {
				cardSelectFusion.removeNodesAt(i);
			}
			initBags();
			
			showCardBags();
			isSetBag = true;
			bagNameLabel.text = CardSetModule.getCardBag(CardSetConfig.curBagIndex).name;
			CardSetConfig.campId = CardSetModule.getCardBag(CardSetConfig.curBagIndex).campId; 
			updateCamp();
			curStep = CardSetConfig.Cardset_Bag_Step2;
			toFusion();
		}
		
		private function onRemoveCardBag(evt:String,data:Object = null):void {
			var i:int;
			var len:int = cardSelectFusion.numNodes;
			for (i = len - 1; i >= 0 ;i-- ) {
				cardSelectFusion.removeNodesAt(i);
			}
			initBags();
		}
		
		
		
		private var pinzhiBtn:ButtonUU;
		private var pinzhiBtn0:ButtonUU;
		private var pinzhiBtn1:ButtonUU;
		private var pinzhiBtn2:ButtonUU;
		private var pinzhiBtn3:ButtonUU;
		private var pinzhiBtn4:ButtonUU;
		private var pinzhiBtn5:ButtonUU;
		private var pinzhiOpen:Boolean;         //是否品质下拉
		
		private function initPinzhi():void {

			pinzhiBtn = new ButtonUU();
			pinzhiBtn.skinName = SkinNameConfig.cardset_pinzhi_btn;
			TextUtil.decorateLabel6(pinzhiBtn.getLabel(),CardSetModule.getPinzhiStr(CardSetConfig.quality),22,CardSetModule.getPinzhiColor(CardSetConfig.quality),false,ColorUtil.BLACK,1);
			pinzhiBtn.userData = CardSetConfig.quality;
			this.fusion.addNode(pinzhiBtn);
			pinzhiBtn.addEventListener(ATouchEvent.CLICK, onPinzhiClick);
			pinzhiBtn.locatingNode = closeBtn;
			pinzhiBtn.locatingTypeForHoriz = LocatingType.A_L____L;
			pinzhiBtn.locatingTypeForVerti = LocatingType.L___A___L;
			pinzhiBtn.locatingOffsetX = 8;
			pinzhiBtn.locatingOffsetY = 3;
		}
		
		
		//显示卡牌
		private function show():void {
			showList = CardSetModule.getShowList(CardSetConfig.campId, CardSetConfig.curPage, CardSetConfig.quality, CardSetConfig.magic,CardSetConfig.searchName);
			updateCardList();

		}
		
		
		
		
		
		private var curStep:int = CardSetConfig.Cardset_Bag_Step1;
		// 切换容器
		private function toFusion():void {
			if (curStep == CardSetConfig.Cardset_Bag_Step1) {
				cardInfoFusion.visible = cardBagFusion.visible = false;
				cardSelectFusion.visible = true;
				trace();
			}else if (curStep == CardSetConfig.Cardset_Bag_Step2) {
				cardInfoFusion.visible = cardSelectFusion.visible = false;
				cardBagFusion.visible = true;
				trace();
			}else if (curStep == CardSetConfig.Cardset_Bag_Step3) {
				cardBagFusion.visible = cardSelectFusion.visible = false;
				cardInfoFusion.visible = true;
				trace();
			}
		}
		
		
		private var bagViewPort:ViewportFusion;
		private var listFusion:FusionUU;
		private var listFusionWidth:Number;
		private var listFusionHeight:Number;
		private var viewportWidth:Number;
		private var viewportHeight:Number;
		private var slider_A:SliderUU;
		
		private function clearBagCards():void {
			if (listFusion) {
				listFusion.kill()
				listFusion = null;
			}
			if (bagViewPort) {
				bagViewPort.kill();
				bagViewPort = null;
			}
			if (slider_A) {
				slider_A.kill();
				slider_A = null;
			}
		}
		
		private function onUpdateCardBags(evt:String, data:Object = null):void {
			//clearBagCards();
			updateCardBags(CardSetModule._bagList);
		}
		
		private function updateCardBags(bagList:Array):void {
			clearBagCards();
			listFusion = new FusionUU;
			var len:int = bagList.length;
			var bagCard:CardSet_BagCard_UU;
			var pointX:Number;
			var pointY:Number;

			var i:int;
			var cutCout:int;
			for (i = 0; i < len; i++ ) {
				bagCard = new CardSet_BagCard_UU();
				bagCard.setData(bagList[i] as CardHoldUnit);
				listFusion.addNode(bagCard);
				
				bagCard.locatingTypeForHoriz = LocatingType.F_A____F;
				bagCard.locatingTypeForVerti = LocatingType.F_A____F;
				bagCard.locatingOffsetY = bagCard.height * i;
				bagCard.addEventListener(ATouchEvent.CLICK,onBagCardClick);
			}
			
			Agony.getFrame().addEventListener(AEvent.COMPLETE, addListComplete);
			cardCountLabel.text = CardSetModule.bagListCount +"/50";
			
		}
		
		private function showCardBags():void {
			//clearBagCards();
			updateCardBags(CardSetModule.bagList);
		}
		
		private function addListComplete(evt:AEvent):void {
			Agony.getFrame().removeEventListener(AEvent.COMPLETE, addListComplete);
			listFusionWidth = listFusion.width;
			listFusionHeight = listFusion.height;
			
			
			var btn:ButtonUU;
			
			slider_A = new SliderUU(false);
			cardBagFusion.addNode(slider_A);
			slider_A.x = 200 -10;
			
			btn = new ButtonUU;
			btn.skinName = SkinNameConfig.scroll_bar;
			btn.image.height = 50;
			slider_A.getThumb().addNode(btn);
			slider_A.dragOffsetValue = 700 - btn.image.height;
			slider_A.model.addEventListener("change", function(e:AEvent):void {
				bagViewPort.vertiRatio = slider_A.model.ratio;
			});
			
			bagViewPort = new ViewportFusion(200, 700 * 0.75);
			cardBagFusion.addNode(bagViewPort);
			bagViewPort.contentWidth = listFusionWidth;
			bagViewPort.contentHeight = listFusionHeight;
			
			bagViewPort.content.addNode(listFusion);
			
		}
		
		private function onBagCardClick(evt:ATouchEvent):void {
			var bagCard:CardSet_BagCard_UU = evt.target as CardSet_BagCard_UU;
			if (GameUtil.isKing(bagCard.cardUnit.cardId)) return;
			bagCard.showAnimator();
			// 停頓0.5s.
			GameModel.getDelay().delayedCall(0.5, function():void {
				CardSetModule.deleteCardNumFromBag(bagCard.cardUnit.cardId);
			});
			
		}
		
		//品质点击
		private function onPinzhiClick(evt:ATouchEvent):void {
			
			if (evt.target == pinzhiBtn) {
				pinzhiOpen = !pinzhiOpen;
			}else {
				pinzhiOpen = false;
				CardSetConfig.quality = evt.target.userData as int;
				resetPageSearch();
				show();
			}
			changePinzhi();
		}
		
		//切换品质
		private function changePinzhi():void {
			if (pinzhiOpen) {
				openPinzhi();
			}else {			
				clearPinzhi();
			}
			pinzhiBtn.getLabel().text = CardSetModule.getPinzhiStr(CardSetConfig.quality);
			pinzhiBtn.getLabel().color = CardSetModule.getPinzhiColor(CardSetConfig.quality);
			
		}
		
		//弹出下拉品质
		private function openPinzhi():void {
			var i:int;
			for (i = 0; i <= 5; i++ ) {
				this["pinzhiBtn" + i] = new ButtonUU();
				this["pinzhiBtn" + i].skinName = SkinNameConfig.cardset_pinzhi_btn;
				TextUtil.decorateLabel6(ButtonUU(this["pinzhiBtn" + i]).getLabel(),CardSetModule.getPinzhiStr(i),22,CardSetModule.getPinzhiColor(i),false,ColorUtil.BLACK,1);
				this["pinzhiBtn" + i].userData = i;
				this.fusion.addNode(this["pinzhiBtn" + i]);
				ButtonUU(this["pinzhiBtn" + i]).locatingNode = pinzhiBtn;
				ButtonUU(this["pinzhiBtn" + i]).locatingTypeForHoriz = LocatingType.L___A___L;
				ButtonUU(this["pinzhiBtn" + i]).locatingTypeForVerti = LocatingType.L____L_A;
				ButtonUU(this["pinzhiBtn" + i]).locatingOffsetY = (i) * ButtonUU(this["pinzhiBtn" + i]).height;
				this["pinzhiBtn" + i].addEventListener(ATouchEvent.CLICK,onPinzhiClick);
			}
		}
		
		//清除下拉出的品质按钮  既收缩
		private function clearPinzhi():void {
			var i:int;
			for (i = 0; i <= 5; i++ ) {
				//if (this.fusion.getNodeIndex(this["pinzhiBtn" + i]) != -1) {
					//this["pinzhiBtn" + i].removeEventListener(ATouchEvent.CLICK,onPinzhiClick);
					//this.fusion.removeNode(this["pinzhiBtn" + i]);
					this["pinzhiBtn" + i].visible = false;
				//}
			}
		}
	
		
		private function onBtnClick(evt:ATouchEvent):void {
			if (CardSetModule.bagListCount < 15) {
				PromptManager.instanse.showPropmt(ErrorConfiguration.getError(6009));
				return;
			}
			var setParmReq:SetBattleParamReq = new SetBattleParamReq();
			var campCard:CampBattleCard = new CampBattleCard;
			var cardIds:Array = [];
			campCard.bagIndex = CardSetConfig.curBagIndex;
			campCard.campId = CardSetModule.getCardBag(CardSetConfig.curBagIndex).campId;
			//var i:int;
			//for ( i = 0 ; i < CardSetModule._bagList.length;i++ ) {
				//var card:CardHoldUnit = new CardHoldUnit();
				//card.cardId = CardSetModule._bagList[i].cardId;
				//card.cardNum = CardSetModule._bagList[i].cardNum;
			//}
			campCard.name = CardSetModule.getCardBag(CardSetConfig.curBagIndex).name;
			campCard.cardIds = CardSetModule._bagList;
			setParmReq.campBattleCard = campCard;
			NetManager.sendRequest(CmdType.CT_BATTLE, CmdCodeBattle.CC_BATTLE_SET_PARAM_REQ, setParmReq);
			
			
			isSetBag = false;
			updateCamp();
			curStep = CardSetConfig.Cardset_Bag_Step1;
			toFusion();
		}
		
		//页码切换
		private function onPageClick(evt:ATouchEvent):void {
			if (evt.target == leftPage) {
				CardSetConfig.curPage -= 1;
			}else if (evt.target == rightPage ) {
				CardSetConfig.curPage += 1;
			}
			show();
			//updatePageStatus();
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
		
		//private function updateBtnBack():void {
			//btnComplete.visible = isSetBag;
			//btnBack.visible = !isSetBag;
		//}
		
		
		//图鉴切换
		private function onCardInfoChange(evt:AEvent):void {
			//btnCardInfo.selected = !btnCardInfo.selected;
			if (btnCardInfo.selected) {
				curStep = CardSetConfig.Cardset_Bag_Step3;
				toFusion();
				//infoLabel.text = CardConfigurator.getCardById(curCard.cardId).desc;
				updateCardInfo();
				trace();
			}else {
				if (isSetBag) {
					curStep = CardSetConfig.Cardset_Bag_Step2;
					toFusion();
				}else {
					curStep = CardSetConfig.Cardset_Bag_Step1;
					toFusion();
				}
			}
		}
		
		private function updateCardInfo():void {
			var curCardInfo:CardCfg = CardConfigurator.getCardById(curCard.cardId);
			if (curCardInfo.guide != null) {
				infoLabel.text = CardConfigurator.getCardById(curCard.cardId).guide;
			}else {
				infoLabel.text = CardConfigurator.getCardById(curCard.cardId).name;
			}
			
		}
		
		private var selectCamp:int;
		//阵营切换
		private function onCampChange(evt:AEvent):void {
			CardSetConfig.campId = campGroup.selectedUserData as int;
			if (CardSetConfig.campId != CardSetConfig.Camp_Neatrual_Id) selectCamp = CardSetConfig.campId;
			updateCamp();
		}
		
		private function updateCamp():void {
			setCampPosition();
			updateCampSelectImg();
			updateCampTitle();
			resetPageSearch();
			show();
		}
		
		//魔法切换
		private function onMagicGroup(evt:AEvent):void {
			CardSetConfig.magic = magicGroup.selectedUserData as int;
			resetPageSearch();
			show();
		}
		
		//重置 页码和查找
		private function resetPageSearch():void {
			CardSetConfig.curPage = 1;
			CardSetConfig.searchName = "";
		}
		
		private function updateCampSelectImg():void {
			switch(CardSetConfig.campId) {
				case CAMP_ID.CAMP_ID_SHANG:
					selectCampImg.locatingNode = shangCamp;
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					selectCampImg.locatingNode = zhouCamp;
					break;
				case CAMP_ID.CAMP_ID_YAO:
					selectCampImg.locatingNode = yaoCamp;
					break;
				case CAMP_ID.CAMP_ID_WU:
					selectCampImg.locatingNode = wuCamp;
					break;
				case CardSetConfig.Camp_Neatrual_Id:
					selectCampImg.locatingNode = neutralCamp;
					break;
			}
			selectCampImg.locatingTypeForHoriz = LocatingType.L_A____L;
			selectCampImg.locatingTypeForVerti = LocatingType.L_A____L;
			selectCampImg.locatingOffsetX = -45;
			selectCampImg.locatingOffsetY = -30;
		}
		
		//更新阵营状态
		private function updateCampTitle():void {
			if (campTitleComo.numNodes > 0) {
				campTitleComo.removeNodesAt(0);
			}
			campTitle = new ImageLoaderUU;
			var source:String;
			switch(CardSetConfig.campId) {
				case CAMP_ID.CAMP_ID_SHANG:
					source = "cardset/img/title_shang.png";
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					source = "cardset/img/title_zhou.png";
					break;
				case CAMP_ID.CAMP_ID_YAO:
					source = "cardset/img/title_yao.png";
					break;
				case CAMP_ID.CAMP_ID_WU:
					source = "cardset/img/title_wu.png";
					break;
				case CardSetConfig.Camp_Neatrual_Id:
					source = "cardset/img/title_neutral.png";
					break;
			}
			campTitle.source = TResourceManager.getAsset(source);
			campTitleComo.addNode(campTitle);
		}
		
		//更新页码数值
		private function updatePageStatus():void {
			leftPage.visible = rightPage.visible = true;
			if (CardSetConfig.curPage == 1) {
				leftPage.visible = false;
			}
			if (CardSetConfig.maxPage <= CardSetConfig.curPage) {
				rightPage.visible = false;
			}
			//pageLabel.text = CardSetConfig.curPage.toString();
			setPage();
		}
		
		private function setPage():void {
			if (pageComo.numNodes > 0) {
				pageComo.removeNodesAt(0);
			}
			pageIcon = new ImageLoaderUU;
			pageIcon.source = TResourceManager.getAsset("cardset/num/" + CardSetConfig.curPage + ".png");
			pageIcon.locatingTypeForHoriz
			pageComo.addNode(pageIcon);
		}
		
	
		private function updateCardList():void {
			clear();
			
			cardListFusion = new FusionUU;
			this.fusion.addNode(cardListFusion);
			cardListFusion.x = 270; 
			cardListFusion.y = 150;
			
			
			//var rawSprite:RawSpriteUU = new RawSpriteUU;
			//rawSprite.graphics.beginFill(0xff0000, 1.0);
			//rawSprite.graphics.drawRect(0, 0, 950, 700);
			//cardListFusion.addNode(rawSprite);
			
			var i:int;
			var cardsetUU:CardSet_CharacterCard_UU;
			var pointX:Number;
			var pointY:Number;
			for (i = 0; i < showList.length; i++ ) {
				cardsetUU = new CardSet_CharacterCard_UU();
				cardsetUU.setData(showList[i] as int);
				
				cardListFusion.addNode(cardsetUU);
				cardsetUU.locatingTypeForHoriz = LocatingType.F_A____F;
				cardsetUU.locatingTypeForVerti = LocatingType.F_A____F;
				pointX = 10 + (CardSetConfig.Cardset_Card_Width + 5) * (i % (CardSetConfig.Page_Num / 2));
				pointY = 5 + (CardSetConfig.Cardset_Card_Height) * int(i / (CardSetConfig.Page_Num / 2));	
				cardsetUU.locatingOffsetX = pointX;
				cardsetUU.locatingOffsetY = pointY;
				cardsetUU.addEventListener(ATouchEvent.CLICK, onCardClick);
				if (i == 0) {
					curCard = cardsetUU;
					curCard.selected = true;
					if (curStep == CardSetConfig.Cardset_Bag_Step3) {
						updateCardInfo();
					}
				}
			}
			updatePageStatus();
			
	
		}

		private function onCardClick(evt:ATouchEvent):void {
			curCard.selected = false;
			curCard = evt.target as CardSet_CharacterCard_UU;
			curCard.selected = true;
			if (curStep == CardSetConfig.Cardset_Bag_Step3) {
				updateCardInfo();
			}else {
				if (curStep == CardSetConfig.Cardset_Bag_Step2) {
					// TODO 加卡牌
					var maxNum:int = CardSetModule.bagListCount;
					if (curCard.num == 0) {
						PromptManager.instanse.showPropmt("这张卡牌在卡包中的数量已达上限！");	
					}else if(maxNum >= 50){
						PromptManager.instanse.showPropmt("卡包卡牌数量达到上限！");	
					}else {
						CardSetModule.addCardNumToBag(curCard.cardId);
						curCard.showAnimator2();
					}
				}
			}
		}
		
		//查找
		private function searchEnter(e:AEvent):void {
			resetPageSearch();
			CardSetConfig.searchName = StringUtil.Trim(searchInput.text);	
			show();
		}
		
		//清除卡牌列表
		private function clear():void {
			if (cardListFusion) {
				cardListFusion.kill();
				cardListFusion = null;
			}
		}
		
		private function setCampPosition():void {
			shangCamp.visible = zhouCamp.visible = yaoCamp.visible = wuCamp.visible = neutralCamp.visible =  true,
			
			//商
			shangCamp.locatingTypeForHoriz = LocatingType.F_A____F;
			shangCamp.locatingTypeForVerti = LocatingType.F_A____F;
			shangCamp.locatingOffsetX = 280;
			shangCamp.locatingOffsetY = 60;
			
			//周
			zhouCamp.locatingNode = shangCamp;
			zhouCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			zhouCamp.locatingTypeForVerti = LocatingType.L___A___L;
			zhouCamp.locatingOffsetX = 5;
			zhouCamp.locatingOffsetY = 0;
	
			//妖
			yaoCamp.locatingNode = zhouCamp;
			yaoCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			yaoCamp.locatingTypeForVerti = LocatingType.L___A___L;
			yaoCamp.locatingOffsetX = 5;
			yaoCamp.locatingOffsetY = 0;
			
			//巫
			wuCamp.locatingNode = yaoCamp;
			wuCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			wuCamp.locatingTypeForVerti = LocatingType.L___A___L;
			wuCamp.locatingOffsetX = 5;
			wuCamp.locatingOffsetY = 0;
			
			//中立
			neutralCamp.locatingNode = wuCamp;
			neutralCamp.locatingTypeForHoriz = LocatingType.L____L_A;
			neutralCamp.locatingTypeForVerti = LocatingType.L___A___L;
			neutralCamp.locatingOffsetX = 5;
			neutralCamp.locatingOffsetY = 0;
			
			if (isSetBag) {
				switch(selectCamp) {
					case CAMP_ID.CAMP_ID_SHANG:
						zhouCamp.visible = yaoCamp.visible = wuCamp.visible = false;
						neutralCamp.locatingNode = shangCamp;
						break;
					case CAMP_ID.CAMP_ID_ZHOU:
						shangCamp.visible = yaoCamp.visible = wuCamp.visible = false;
						zhouCamp.locatingTypeForHoriz = LocatingType.F_A____F;
						zhouCamp.locatingTypeForVerti = LocatingType.F_A____F;
						zhouCamp.locatingOffsetX = 280;
						zhouCamp.locatingOffsetY = 60;
						neutralCamp.locatingNode = zhouCamp;
						break;
					case CAMP_ID.CAMP_ID_YAO:
						shangCamp.visible = zhouCamp.visible = wuCamp.visible = false;
						yaoCamp.locatingTypeForHoriz = LocatingType.F_A____F;
						yaoCamp.locatingTypeForVerti = LocatingType.F_A____F;
						yaoCamp.locatingOffsetX = 280;
						yaoCamp.locatingOffsetY = 60;
						neutralCamp.locatingNode = yaoCamp;
						break;
					case CAMP_ID.CAMP_ID_WU:
						shangCamp.visible = zhouCamp.visible = yaoCamp.visible = false;
						wuCamp.locatingTypeForHoriz = LocatingType.F_A____F;
						wuCamp.locatingTypeForVerti = LocatingType.F_A____F;
						wuCamp.locatingOffsetX = 280;
						wuCamp.locatingOffsetY = 60;
						neutralCamp.locatingNode = wuCamp;
						break;
				}
			}
		
		}
		
		private function clearParams():void {
			curStep = CardSetConfig.Cardset_Bag_Step1;
			_isSetBag = false;
			CardSetConfig.campId = CAMP_ID.CAMP_ID_SHANG;
			CardSetConfig.quality = 0;
			CardSetConfig.magic = -1;
			CardSetConfig.curPage = 1;
			CardSetConfig.maxPage = 1;
			CardSetConfig.searchName = "";
			CardSetConfig.isSetCard = false;
			CardSetConfig.curBagIndex = 0;
		}
		
		override protected function closeClick(evt:ATouchEvent):void {
			if (curStep == CardSetConfig.Cardset_Bag_Step2) {
				if (CardSetModule.bagListCount < 15) {
					ViewFacade.setStateView(Room_StateVV);
					return;
				}
				var setParmReq:SetBattleParamReq = new SetBattleParamReq();
				var campCard:CampBattleCard = new CampBattleCard;
				var cardIds:Array = [];
				campCard.bagIndex = CardSetConfig.curBagIndex;
				campCard.campId = CardSetModule.getCardBag(CardSetConfig.curBagIndex).campId;
				//var i:int;
				//for ( i = 0 ; i < CardSetModule._bagList.length;i++ ) {
					//var card:CardHoldUnit = new CardHoldUnit();
					//card.cardId = CardSetModule._bagList[i].cardId;
					//card.cardNum = CardSetModule._bagList[i].cardNum;
				//}
				campCard.name = CardSetModule.getCardBag(CardSetConfig.curBagIndex).name;
				campCard.cardIds = CardSetModule._bagList;
				setParmReq.campBattleCard = campCard;
				NetManager.sendRequest(CmdType.CT_BATTLE, CmdCodeBattle.CC_BATTLE_SET_PARAM_REQ, setParmReq);
			}
			ViewFacade.setStateView(Room_StateVV);
		}
		
		override public function onExit () : void {			
			super.onExit();
			clearBagCards();
			clearParams();
			TKeyboardManager.getInstance().getState().press.removeEventListener("ENTER", searchEnter);
			
			CardSetModule.removeEventListener(CardSetEvent.Add_Reduce_Card_Num,onUpdateCardBags);
			CardSetModule.removeEventListener(CardSetEvent.Add_Card_Num,onUpdateCardBags);
			CardSetModule.removeEventListener(CardSetEvent.Delete_Card_Num,onUpdateCardBags);
			CardSetModule.removeEventListener(CardSetEvent.Change_Card_Num, onUpdateCardBags);
			CardSetModule.removeEventListener(CardSetEvent.Add_Card_Bag,onAddCardBag);
			CardSetModule.removeEventListener(CardSetEvent.Remove_Card_Bag,onRemoveCardBag);
		}
		
		public function get isSetBag():Boolean 
		{
			return _isSetBag;
		}
		
		public function set isSetBag(value:Boolean):void 
		{
			_isSetBag = value;
			btnComplete.visible = _isSetBag;
			cardCountLabel.visible = _isSetBag;
			bagNameLabel.visible = _isSetBag;
			CardSetConfig.isSetCard = _isSetBag;
			CardSetModule.dispatchEvent(CardSetEvent.Set_Bag_Status);
		}
		
	}

}