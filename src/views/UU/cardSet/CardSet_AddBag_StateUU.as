package views.UU.cardSet 
{
	import configs.skinname.SkinNameConfig;
	import models.cardSet.CardSetModule;
	import models.PromptManager;
	import net.NetManager;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CAMP_ID;
	import proto.com.CampBattleCard;
	import proto.com.CardHoldUnit;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.SetBattleParamReq;
	import ui.ShildStateUU;
	import utils.GameUtil;
	import utils.TextUtil;
	import views.UU.cardSet.items.CardSet_BagCard_UU;
	import views.UU.cardSet.items.CardSet_Camp_UU;
	/**
	 * ...
	 * @author ...
	 */
	public class CardSet_AddBag_StateUU extends ShildStateUU
	{
		private var curCamp:CardSet_Camp_UU;
		public function CardSet_AddBag_StateUU() 
		{
			notDefaultClose = true;
			bgAlpha = 0.8;
		}
		
		override public function onEnter () : void 
		{
			super.onEnter();
			//var bg:FusionUU = new FusionUU();
			//this.fusion.addNode(bg);
			this.fusion.spaceWidth = 800;
			this.fusion.spaceHeight = 500;
			
			var titleBg:ImageLoaderUU = new ImageLoaderUU;
			titleBg.source = TResourceManager.getAsset("cardset/img/title_select.png");
			this.fusion.addNode(titleBg);
			titleBg.locatingTypeForHoriz = LocatingType.F___A___F;
			titleBg.locatingTypeForVerti = LocatingType.F_A____F;
			
			var campUU:CardSet_Camp_UU;
			var i:int;
			for (i = 0 ; i < CAMP_ID.CAMP_ID_YAO;i++ ) {
				campUU = new CardSet_Camp_UU();
				campUU.init(i + 1);
				campUU.userData = i + 1;
				this.fusion.addNode(campUU);
				campUU.x =  i * 250;
				campUU.y = 75;
				campUU.btn.addEventListener(ATouchEvent.CLICK,onBtnClick);
			}
			
			var okBtn:ButtonUU = new ButtonUU();
			okBtn.skinName = SkinNameConfig.cardset_back_btn;
			TextUtil.decorateLabel6(okBtn.getLabel(), "确认", 22, ColorUtil.rgb(227,175,142),false,ColorUtil.BLACK,1);
			this.fusion.addNode(okBtn);
			okBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			okBtn.locatingTypeForVerti = LocatingType.F____A_F;
			okBtn.locatingOffsetX = -150;
			okBtn.locatingOffsetY = -100;
			
			var canceBtn:ButtonUU = new ButtonUU();
			canceBtn.skinName = SkinNameConfig.cardset_back_btn;
			TextUtil.decorateLabel6(canceBtn.getLabel(), "取消", 22, ColorUtil.rgb(227,175,142),false,ColorUtil.BLACK,1);
			this.fusion.addNode(canceBtn);
			canceBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			canceBtn.locatingTypeForVerti = LocatingType.F____A_F;
			canceBtn.locatingOffsetX = 150;
			canceBtn.locatingOffsetY = -100;
			
			okBtn.addEventListener(ATouchEvent.CLICK,onOkClick);
			canceBtn.addEventListener(ATouchEvent.CLICK,onCancelClick);
			
			addRootEvent();
		}
		
		private function onOkClick(evt:ATouchEvent):void {
			if (!curCamp) {
				PromptManager.instanse.showPropmt("请选择阵营");
				return;
			}
				
			var bagIndex:int = CardSetModule.newBagIndex;
            var king:CardHoldUnit = new CardHoldUnit();
            king.cardId = GameUtil.getKing(curCamp.userData as int);
            king.cardNum = 1;
            //发送设置卡牌消息

			var setParmReq:SetBattleParamReq = new SetBattleParamReq();
			var campCard:CampBattleCard = new CampBattleCard;
			var cardIds:Array = [];
			campCard.bagIndex = bagIndex;
			campCard.campId = curCamp.userData as int;
			campCard.name = "自定义" + bagIndex;
			cardIds.push(king);
			campCard.cardIds = cardIds;
			setParmReq.campBattleCard = campCard;
			NetManager.sendRequest(CmdType.CT_BATTLE, CmdCodeBattle.CC_BATTLE_SET_PARAM_REQ, setParmReq);
			//CardSetModule.setCardBag(campCard);
			UUFacade.getWindow(CardSet_AddBag_StateUU).close();
		}
		
		private function onCancelClick(evt:ATouchEvent):void {
			UUFacade.getWindow(CardSet_AddBag_StateUU).close();
		}
		
		private function onBtnClick(evt:ATouchEvent):void {
			setCamp(ButtonUU(evt.target).parent as CardSet_Camp_UU);
		}
		
		private function setCamp( campView:CardSet_Camp_UU ) : void {
			if (curCamp == campView) {
				return;
			}
			if (curCamp) {
				curCamp.setSelected(false);	
			}
			curCamp = campView;
			curCamp.setSelected(true);
		}
	
	}

}