package views.UU.battle 
{
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Cubic;
	import com.greensock.TweenMax;
	import flash.filters.GlowFilter;
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.CharacterVo;
	import models.events.GuessCardEvent;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.GuessCardNameReq;
	import proto.cs.GuessCardNameResNtf;
	import utils.TextUtil;
	import views.UU.battle.core.IGuessCards;
	import views.UU.comps.CardUU;
	import views.UU.comps.CharacterUU;
	
public class GuessCard_StateUU extends StateUU
{
	
	public static var currState:IGuessCards;
	private var rawSprite:RawSpriteUU;
	
	override public function onEnter() : void
	{
		var guessCards:Array;
		
		var img_A:BitmapLoaderUU;
		var i:int;
		var l:int;
		var cardGuid:int;
		var cardBackView:BitmapLoaderUU;
		var char_A:String;
		
		guessCards = this.stateArgs[0];
		fromVo = this.stateArgs[1];
		targetVo = this.stateArgs[2];
		
		if (fromVo) {
			stateActive = UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU;
			fromView = this.stateActive.getView(fromVo);
			toView = this.stateActive.getView(targetVo);
		}
		
		
		// 背景.
		rawSprite = new RawSpriteUU;
		rawSprite.graphics.beginFill(0x0, 0.3);
		rawSprite.graphics.drawRect(0,0,2000, 1200);
		this.fusion.addNode(rawSprite);
		rawSprite.locatingTypeForHoriz = LocatingType.F___A___F;
		rawSprite.locatingTypeForVerti = LocatingType.F___A___F;
		rawSprite.displayObject.cacheAsBitmap = true;
		
		isMyRound = (!fromVo || BattleModel.isMyRound());
		if (isMyRound) {
			char_A = "猜哪一张是 " + (targetVo ? targetVo.cfg.name : "张桂芳") + " ?!";
		}
		else {
			char_A = "玩家 " + BattleRoleModel.getBattleRoleVo(fromVo.role_id).roleVo.name + " \n  能否猜中 " + (targetVo ? targetVo.cfg.name : "张桂芳") + " ?!";
		}
		
		// 提示文本.
		label_A = TextUtil.createLabelBlur2(char_A, 60, 0xdddd33, true, 3.5, 6, 16);
		this.fusion.addNode(label_A);
		label_A.locatingTypeForHoriz = LocatingType.F___A___F;
		label_A.y = 70;
		Agony.getFrame().addEventListener(AEvent.COMPLETE, ____onLabel);
		
		// 卡牌.
		fus_A = new FusionUU;
		this.fusion.addNode(fus_A);
		fus_A.locatingTypeForHoriz = LocatingType.F___A___F;
		fus_A.y = 260;
		fus_A.touchable = false;
		l = guessCards.length;
		while (i < l) {
			cardGuid = guessCards[i];
			cardBackView = cardViewMap[cardGuid] = new BitmapLoaderUU;
			cardBackView.source = TResourceManager.getAsset("card/img/back_A.png");
			fus_A.addNode(cardBackView);
			cardBackView.x = i * 330;
			cardBackView.userData = cardGuid;
			cardBackView.addEventListener(ATouchEvent.CLICK, ____onClickCardBack);
			i++;
		}
		cardBackViewHeight = cardBackView.height;
		TweenMax.from(fus_A.displayObject, DURATION, { delay:DELAY,
												y:-cardBackViewHeight * Agony.getAdapter().pixelRatio - 50, 
												ease:Back.easeOut, 
												motionBlur: { strength:1, quality:1 },
		onComplete:function():void {
			if (isMyRound) {
				fus_A.touchable = true;
			}
		}} );
		
		BattleModel.addEventListener(GuessCardEvent.GUESS_CARDS_RES, ____onGuessCardsRes);
		
		this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		this.onResize(null);
	}
	
	override public function onExit():void {
		this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		rawSprite.displayObject.cacheAsBitmap = false;
		BattleModel.removeEventListener(GuessCardEvent.GUESS_CARDS_RES, ____onGuessCardsRes);
	}
	
	public function checkFinish() : void {
		if (currState && !isHasRet) {
			finish();
		}
	}
	
	public function finish() : void {
		if (!isLabelFramePost) {
			Agony.getFrame().removeEventListener(AEvent.COMPLETE, ____onLabel);
		}
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		
		this.fusion.touchable = false;
		
		TweenMax.to(label_A, DURATION * 0.8, { x: this.fusion.spaceWidth + 50, ease:Back.easeIn } );
		
		TweenMax.to(fus_A.displayObject, DURATION * 0.8, { delay:DELAY, y:-cardBackViewHeight * Agony.getAdapter().pixelRatio - 50, 
												ease:Back.easeIn, 
												//motionBlur: { strength:1, quality:1 },
		onComplete:function():void {
			fusion.kill();
			
			if (currState) {
				currState.guessCardsPost(isRight);
				currState = null;
			}
		}} );
	}
	
	
	
	public const DURATION:Number = 0.75;
	public const DELAY:Number = 0.3;
	
	public var stateActive:Battle_active_StateUU;
	public var fromView:CharacterUU;
	public var toView:CharacterUU;
	public var fus_A:FusionUU;
	public var label_A:LabelUU;
	public var isLabelFramePost:Boolean;
	public var cardBackViewHeight:Number;
	public var isMyRound:Boolean;
	public var fromVo:CharacterVo;
	public var targetVo:CharacterVo;
	public var isRight:Boolean;
	public var isHasRet:Boolean;
	public var cardViewMap:Object = {};
	
	
	private function onResize(e:AEvent):void {
		this.fusion.spaceWidth = this.fusion.root.spaceWidth;
		this.fusion.spaceHeight = this.fusion.root.spaceHeight;
		this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
		this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		
		
	}
	
	private function ____onLabel(e:AEvent):void {
		isLabelFramePost = true;
		Agony.getFrame().removeEventListener(AEvent.COMPLETE, ____onLabel);
		TweenMax.from(label_A, DURATION, { x: -label_A.width - 50, ease:Back.easeOut});
	}
	
	
	private function ____onClickCardBack(e:ATouchEvent):void {
		var cardGuid:int;
		var cardBackView:BitmapLoaderUU;
		
		cardBackView = e.target as BitmapLoaderUU;
		cardGuid = int(cardBackView.userData);
		
		var msg_A:GuessCardNameReq;
		
		if (fromVo) {
			msg_A = new GuessCardNameReq;
			msg_A.guessCardId = cardGuid;
			msg_A.guessCardIdx = cardBackView.parent.getNodeIndex(cardBackView);
			NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_GUESS_CARD_NAME_REQ, msg_A);
		}
		else {
			this.____doTurnOverCard(cardGuid);
		}
	}
	
	private function ____onGuessCardsRes(e:GuessCardEvent):void {
		this.isRight = e.isRight;
		isHasRet = true;
		this.____doTurnOverCard(e.realCardId);
	}
	
	private function ____doTurnOverCard( cardGuid:int ) : void {
		var cardView:CardUU;
		var answerLabel:LabelUU;
		var char_A:String;
		var cardBackView:BitmapLoaderUU;
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/choupai.mp3");
		
		cardBackView = cardViewMap[cardGuid];
		cardView = new CardUU;
		cardView.setCardId(cardGuid);
		cardView.alpha = 0.0;
		this.fus_A.addNode(cardView);
		cardView.x = cardBackView.x;
		cardView.y = cardBackView.y;
		cardBackView.filters = cardView.filters = [new GlowFilter(0x33dd33, 0.66, 16, 16, 11, 1)];
		
		TweenMax.to(cardBackView, 0.3, { alpha:0.0 } );
		TweenMax.to(cardView, 0.3, { delay:0.2, alpha:1.0 } );
		
		char_A = isRight ? "猜对了!" : "猜错了!";
		answerLabel = TextUtil.createLabelBlur2(char_A, 66, 0xdd3333, true, 5, 6, 16);
		answerLabel.locatingNode = cardView;
		fus_A.addNode(answerLabel);
		answerLabel.locatingTypeForHoriz = LocatingType.L___A___L;
		answerLabel.locatingOffsetX = 15;
		answerLabel.y = 60;
		TweenMax.from(answerLabel, 0.5, { delay:0.5, alpha:0.0} );
		TweenMax.delayedCall(1.2, finish);
		
		
		
		//trace(cardGuid);
	}
	
}

}