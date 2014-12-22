package views.UU.battle.gameOver 
{
	import configs.skinname.SkinNameConfig;
	import configs.unlock.UnlockConfiguration;
	import models.cardSet.CardSetModule;
	import models.GameModel;
	import models.gameOver.GameOverModule;
	import models.player.PlayerModel;
	import models.PromptManager;
	import models.unlock.UnlockModule;
	import net.NetManager;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CampBattleCard;
	import proto.com.CardHoldUnit;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.SetBattleParamReq;
	import utils.GameUtil;
	import utils.TextUtil;
	import views.UU.comps.CardUU;
	/**
	 * ...卡牌解锁展示
	 * @author dcl
	 */
	public class Game_Unlock_StateUU extends StateUU
	{
		private var mountBtn:ButtonUU;
		private var closeBtn:ButtonUU;
		private var rightBtn:ButtonUU;
		private var leftBtn:ButtonUU;
		private var numImgFusion:FusionUU;
		private var numLabel:LabelUU;
		private var cardFusion:FusionUU;
		private var curLevel:int;
		private var cards:Array;
		public function Game_Unlock_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			
			this.fusion.spaceWidth = 1000;
			this.fusion.spaceHeight = 800;
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			var img:ImageLoaderUU = new ImageLoaderUU;
			img.source = TResourceManager.getAsset("gameover/img/text_bg.png");
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F_A____F;
			
			var num:int = 2;
			numImgFusion = new FusionUU;
			this.fusion.addNode(numImgFusion);
			numImgFusion.locatingTypeForHoriz = LocatingType.L_A____L;
			numImgFusion.locatingTypeForVerti = LocatingType.L_A____L;
			numImgFusion.locatingOffsetX = 510;
			numImgFusion.locatingOffsetY = 20;
			
			numLabel = TextUtil.createLabel6("", 48, 0xffb244, true, 0x24100);
			this.fusion.addNode(numLabel);
			numLabel.locatingNode = img;
			numLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			numLabel.locatingTypeForVerti = LocatingType.L___A___L;
			numLabel.locatingOffsetX = 10;
			
			mountBtn = new ButtonUU();
			mountBtn.skinName = SkinNameConfig.unlock_mount_btn;
			TextUtil.decorateLabel6(mountBtn.getLabel(), "立刻装上", 30, 0xffb244, false, 0x241000);		
			this.fusion.addNode(mountBtn);		
			mountBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			mountBtn.locatingTypeForVerti = LocatingType.F____A_F;
			mountBtn.locatingOffsetY = -50;
			mountBtn.addEventListener(ATouchEvent.CLICK,onBtnClick);
			
			
			closeBtn = new ButtonUU();
			closeBtn.skinName = SkinNameConfig.unlock_close_btn;
			TextUtil.decorateLabel6(closeBtn.getLabel(),"关闭",30,0xffb244,false,0x241000);
			
			this.fusion.addNode(closeBtn);		
			closeBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			closeBtn.locatingTypeForVerti = LocatingType.F____A_F;
			closeBtn.locatingOffsetY = -50;
			closeBtn.addEventListener(ATouchEvent.CLICK, onBtnClick);
			
			
			rightBtn = new ButtonUU();
			rightBtn.skinName = SkinNameConfig.unlock_right_btn;
			this.fusion.addNode(rightBtn);		
			rightBtn.locatingTypeForHoriz = LocatingType.L____L_A;
			rightBtn.locatingTypeForVerti = LocatingType.A_L____L;
			rightBtn.locatingOffsetY = -20;
			rightBtn.locatingOffsetX = -90;
			rightBtn.addEventListener(ATouchEvent.CLICK, onBtnClick);
			
			leftBtn = new ButtonUU();
			leftBtn.skinName = SkinNameConfig.unlock_left_btn;
			this.fusion.addNode(leftBtn);		
			leftBtn.locatingTypeForHoriz = LocatingType.A_L____L;
			leftBtn.locatingTypeForVerti = LocatingType.L___A___L;
			leftBtn.locatingOffsetX = -40;
			leftBtn.addEventListener(ATouchEvent.CLICK, onBtnClick);
			
			cardFusion = new FusionUU;
			this.fusion.addNode(cardFusion);

			
			//var sprite:RawSpriteUU = new RawSpriteUU();
				//this.cardFusion.addNode(sprite);
				//sprite.graphics.beginFill(ColorUtil.BLACK,0.5); 
				//sprite.graphics.lineStyle(0, 0x000000, 0.5);
				//shildSprite.graphics.drawRect(0 - Agony.getAdapter().rootWidth / 2,0 - Agony.getAdapter().rootHeight / 2, Agony.getAdapter().rootWidth, Agony.getAdapter().rootHeight);
				//sprite.graphics.drawRect(0,0, 1000,500);
				//sprite.graphics.endFill();
				//sprite.touchable = false;
			
			curLevel = UnlockModule.campLevel;
			updateCards();
			updateBtnStatus();
		}
		
		private function updateBtnStatus():void {
			mountBtn.visible = curLevel == UnlockModule.campLevel;
			closeBtn.visible = !mountBtn.visible;	
			
			leftBtn.visible = rightBtn.visible = true;
			if(curLevel == UnlockModule.campLevel) {
				leftBtn.visible = false;
				
			}else if(curLevel == UnlockModule.unLockMaxLevelLevel){
				rightBtn.visible = false;
			}
			
			numLabel.text = curLevel == curLevel ? "你解锁了      张牌" : "阵营等级达到      级后解锁";
			
			if (numImgFusion.numNodes > 0) {
				numImgFusion.removeNodesAt(0);
			}
			var numImg:ImageLoaderUU = new ImageLoaderUU;
			numImg.source = TResourceManager.getAsset("gameover/img/"+cards.length+".png");
			numImgFusion.addNode(numImg);
		}
		
		private function updateCards():void {
			
			var l:int = this.cardFusion.numNodes;
			var i:int;
			if (l > 0) {
				for (i = l - 1; i >= 1; i-- ) {
					if (this.cardFusion.getNodeAt(i) is Game_Unlock_CardUU) {
						Game_Unlock_CardUU(this.cardFusion.getNodeAt(i)).clearAnimatir();
					}
					this.cardFusion.removeNodesAt(i);
				}
			}
			cards = UnlockModule.getUnlockCards(GameModel.campBag.campId, curLevel);
			var len:int = cards.length;				
			var width:Number = 333.3;
			var height:Number = 500;
			var n:int;
			var m:int;
			var lineCap:int = 3;
			var bgWidth:Number;
			var bgHeight:Number;
			
			n = len % 3;
			m = int(len / 3);
			
			if (m == 0) {
				bgWidth = width * n;
			}else {
				bgWidth = width * lineCap;
			}
			
			if (n == 0) {
				bgHeight = height * m;
				
			}else {
				bgHeight = height * (m + 1);
			}
			cardFusion.spaceWidth = bgWidth
			cardFusion.spaceHeight = bgHeight
			cardFusion.locatingTypeForHoriz = LocatingType.F___A___F;
			cardFusion.locatingTypeForVerti = LocatingType.F___A___F;
			cardFusion.locatingOffsetY = -20;
			var pointX:int;
			var pointY:int;
			for (i = 0; i < len; i++ ) {
				var cardUU:Game_Unlock_CardUU = new Game_Unlock_CardUU(cards[i] as int);
				this.cardFusion.addNode(cardUU);
				cardUU.locatingTypeForHoriz = LocatingType.F_A____F;
				cardUU.locatingTypeForVerti = LocatingType.F_A____F;
				pointX =  cardUU.spaceWidth * (i % lineCap);
				pointY = cardUU.spaceHeight * int(i / lineCap);
				cardUU.locatingOffsetX = pointX;	
				cardUU.locatingOffsetY = pointY;	 
			}	
		}
		
		private function onBtnClick(evt:ATouchEvent):void {
			if (evt.target == mountBtn) {
					// TODO 加卡牌
					var maxNum:int = GameModel.campBag.cardIds.length;
					if(maxNum >= 50){
						PromptManager.instanse.showPropmt("卡包卡牌数量达到上限！");	
					}else {
						addUnlockCard();
					}
			
				//先提示 停頓退出.
				GameModel.getDelay().delayedCall(1, function():void {
					GameOverModule.curState = GameOverModule.GAME_OVER_STATE_END;
					GameOverModule.checkAndUpdateSteps();
				});				
			}else if (evt.target == closeBtn) {
				GameOverModule.curState = GameOverModule.GAME_OVER_STATE_END;
				GameOverModule.checkAndUpdateSteps();
				
			}else if (evt.target == rightBtn) {
				curLevel++;
				updateBtnStatus();
				updateCards();
			}else if (evt.target == leftBtn) {
				curLevel--;
				updateBtnStatus();
				updateCards();
			}
		}
		
		//装上卡牌
		private function addUnlockCard():void {
			var setParmReq:SetBattleParamReq = new SetBattleParamReq();
			var campCard:CampBattleCard = new CampBattleCard;
			var cardIds:Array = [];
			var i:int;
			var j:int;
			for (i = 0 ; i < cards.length;i++ ) {
				var i:int;
				var has:Boolean = false;
				for (j = 0; j < GameModel.campBag.cardIds.length;j++ ) {
					if (cards[i] == CardHoldUnit(GameModel.campBag.cardIds[j]).cardId) {
						has = true;
						CardHoldUnit(GameModel.campBag.cardIds[j]).cardNum++;
					}
				}
				if (!has) {
					var cardUnit:CardHoldUnit = new CardHoldUnit();
					cardUnit.cardId = cards[i];
					cardUnit.cardNum = 1;
					GameModel.campBag.cardIds.push(cardUnit);
				}
			}
			campCard = GameModel.campBag;
			setParmReq.campBattleCard = campCard;
			NetManager.sendRequest(CmdType.CT_BATTLE, CmdCodeBattle.CC_BATTLE_SET_PARAM_REQ, setParmReq);
			PromptManager.instanse.showPropmt("加入套牌包成功");
		}
		
		override public function onExit():void {
			
		}
	}

}