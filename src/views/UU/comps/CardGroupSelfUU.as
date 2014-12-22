package views.UU.comps
{
	import com.greensock.easing.Cubic;
	import com.greensock.TweenLite;
	import com.greensock.easing.Strong;
	import com.greensock.TweenMax;
	import configs.ConfigBattle;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.sounds.SfxManager;
	
	import flash.filters.GlowFilter;
	
	import configs.cards.CardConfigurator;
	
	import models.GameModel;
	import models.battle.BattleModel;
	import models.battle.interactions.HoverCharacterCard_InteractPolicy;
	import models.battle.interactions.HoverMagicCard_InteractPolicy;
	import models.battle.interactions.HoverEquipmentCard_InteractPolicy;
	import models.battle.interactions.InteractPolicy;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.DragFusionUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.Touch;
	import org.agony2d.inputs.events.ATouchEvent;
	
	import views.UU.tips.Card_TipViewStateUU;
	import views.events.CardUUEvent;
	
	
public class CardGroupSelfUU extends FusionUU
{
	
	/** 是否可操控手牌. */
	public function get enabled() : Boolean {
		return _enabled;
	}
	
	public function set enabled( b:Boolean ) : void {
		_enabled = b;
		//GameModel.getLog().simplify("[ 手牌操作状态 ]: {0}", _enabled);
	}
	
	/**
	 * 初期化卡牌
	 */		
	public function initialize( guidList:Array ) : void {
		var i:int;
		var l:int;
		
		_cardList = [];
		_cardCoordYList = [];
		_idList = {};
		l = guidList.length;
		while(i<l){
			this.____toCreateCard(guidList[i++]);
		}
		this.____doUpdateAllPos(false);
	}
	
	/**
	 * 加入卡牌 
	 * @param cardId
	 * 
	 */		
	public function addCard( cardId:int ) : void {
		//if (BattleModel.isMyRound()) {
			//this.touchable = _enabled = false;
			
			//UUToolTip.hideTip(false);
		//}
		_enabled = false;
		this.____doAddCard(cardId);
	}
	
	// 移除卡牌.
	public function removeCard( cardId:int, tween:Boolean = true ) : CardUU {
		var index:int;
		var card:CardUU;
		
		card = _idList[cardId];
		
		// 就是这个没有清除的偶尔可能存在的Tween，导致了有时发牌时出现"闪"到屏幕上方的bug，以及莫名其妙的Tween"y"属性错误.
		TweenLite.killTweensOf(card);
		
		if (card) {
			index = _cardList.indexOf(card);
			_cardList.splice(index, 1);
			_numCards--;
			delete _idList[cardId];
			//card.kill();
			//this.removeNode(card);
			this.____doUpdateAllPos(tween);
			return card;
		}
		return null;
	}
	
	// 更新卡牌位置.
	public function updateAllPos( isTween:Boolean ) : void {
		if (_isUpdatingCoords) {
			return;
		}
		this.____doUpdateAllPos(isTween);
	}
	
	
	
	
	private const CARD_OFFSET:int = 15;
	private const CARD_OFFSET_DURATION:Number = 0.60;
	private const CARD_SCALE:Number = 0.66;
	private const CARD_SCALE2:Number = 0.73;
	private const CARD_GAP_Y:Number = 15;
	
	
	private var _cardList:Array;
	private var _cardCoordYList:Array;
	private var _idList:Object; // id:cardUU
	private var _numCards:int;
	private var _totalRotation:int;
	private var _selectedCard:CardUU;
	private var _dragCard:DragFusionUU;
	private var _isHovered:Boolean;
	
	//private var _readyCardId:Array = [];
	private var _enabled:Boolean// = true;
	
	//private var _isAddingCard:Boolean;
	
	
	
	private function ____doAddCard( cardID:int ) : void {
		var card:CardUU;
		
		card = this.____toCreateCard(cardID);
		card.x = -480
		card.y = -160;
		card.scaleX = card.scaleY = 0.33;
		
		TweenLite.to(card, ConfigBattle.CARD_POS_UPDATE_DURATION * 2.0, { x:0, 
																	y: -380, 
																	scaleX:1.0, 
																	scaleY:1.0,
																	ease:Cubic.easeOut, 
																	//ease:Strong.easeOut, 
		onComplete:function():void {
			//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/choupai.mp3");
			
		//TweenMax.to(card.displayObject, CARD_POS_UPDATE_DURATION * 3, { x:0, y: -430 * Agony.getAdapter().pixelRatio, scaleX:1, scaleY:1, motionBlur: { strength:1.1, quality:1 }, ease:Strong.easeOut, 
		//onComplete:function():void{
			TweenLite.to(card, ConfigBattle.CARD_POS_UPDATE_DURATION * 1.7, { delay:ConfigBattle.CARD_POS_UPDATE_DURATION * 0.3, 
																			scaleX:CARD_SCALE, 
																			scaleY:CARD_SCALE,
																			//ease:Cubic.easeIn, 
			onStart:function():void {
				____doUpdateAllPos(true);
			}});
			TweenLite.delayedCall(ConfigBattle.CARD_POS_UPDATE_DURATION * 1.3, function():void{
			//TweenMax.to(card.displayObject, CARD_POS_UPDATE_DURATION * 0.5, {scaleX:CARD_SCALE, scaleY:CARD_SCALE, ease:Strong.easeIn, motionBlur:{strength:0.6, quality:1},onComplete:function():void{
				//if(_readyCardId.length > 0){
					//____doAddCard(_readyCardId.shift());
				//}
				//else {
					if (BattleModel.isMyRound()) {
						//touchable = _enabled = true;
						_enabled = true;
					}
					//touchable = true;
					// 完成後排放完成事件.
					dispatchEvent(new CardUUEvent(CardUUEvent.CARD_COMPLETE));
				//}
			});
		}});
	}
	
	// 更新全部卡牌位置.
	private function ____doUpdateAllPos( isTween:Boolean ) : void {
		var i:int;
		var card:CardUU;
		var gapX:Number;
		var gapY:Number;
		var coordX:Number;
		var coordY:Number;
		
		if(_numCards == 0){
			return;
		}
		gapX = _numCards > 7 ? 1030 / _numCards : 133;
		gapY = CARD_GAP_Y;
		if(isTween){
			while(i<_numCards){
				card = this._cardList[i];
				coordX = -((_numCards - 1) * .5) * gapX + i * gapX;
				coordY = _cardCoordYList[i] = Math.abs(i - (_numCards - 1) * .5) * gapY;
				TweenLite.to(card, ConfigBattle.CARD_POS_UPDATE_DURATION, {x:coordX, y:coordY, overwrite:0});
				i++;
			}
		}
		else{
			while(i<_numCards){
				card = this._cardList[i];
				card.x = -((_numCards - 1) * .5) * gapX + i * gapX;
				card.y = _cardCoordYList[i] = Math.abs(i - (_numCards - 1) * .5) * gapY;
				i++;
			}
		}
		_isUpdatingCoords = true;
		TweenLite.delayedCall(ConfigBattle.CARD_POS_UPDATE_DURATION, ____doCheckUpdateCoords);
	}
	
	private var _isUpdatingCoords:Boolean;
	private function ____doCheckUpdateCoords():void {
		_isUpdatingCoords = false;
	}
	
	// 生成卡牌.
	private function ____toCreateCard( guid:int, scale:Number = NaN ) : CardUU {
		var card:CardUU;
		
		// 服务端有出错可能性.
		if(_idList[guid]){
			GameModel.getLog().error(this, "____toCreateCard", "检测出重复的卡牌: [ {0} ].", guid);
		}
		
		_cardList[_numCards++] = _idList[guid] = card = new CardUU;
		card.setCardId(guid);
		
		card.pivotX = card.spaceWidth * .5;
		card.pivotY = card.spaceHeight * .5;
		
		// tip.
		UUToolTip.registerTip(card, Card_TipViewStateUU).userData = card.cardId;
		
		card.scaleX = card.scaleY = isNaN(scale) ? CARD_SCALE : scale;
		
		card.addEventListener(ATouchEvent.HOVER,  ____onHoverCard);
		card.addEventListener(ATouchEvent.LEAVING, ____onLeaveCard);
		card.addEventListener(ATouchEvent.PRESS, ____onSelectCard);
		
		this.addNode(card);
		
		//card.addEventListener(NodeEvent.DISPOSE, onCardDisposed);
		
		return card;
	}
	
	//private function onCardDisposed(e:NodeEvent):void {
		//var card:CardUU;
		//
		//card = e.target as CardUU;
		//TweenLite.killTweensOf(card.displayObject);
	//}
	
	private function ____onHoverCard(e:ATouchEvent):void{
		if(!_enabled || !e.touch.isReleaseState){
			return;
		}
		
		this.____doHoverCard(e.target as CardUU);
	}
	
	private function ____doHoverCard( card:CardUU ) : void {
		var index_A:int;
		var coordY:Number;
		var cardId:int;
		
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/card_selected.mp3");

		if(!_selectedCard){
			if(!_isHovered){
				index_A = _cardList.indexOf(card);
				coordY = _cardCoordYList[index_A];
				TweenLite.to(card, CARD_OFFSET_DURATION, { y:coordY - CARD_OFFSET, 
														scaleX:CARD_SCALE, 
														scaleY:CARD_SCALE,
														ease:Strong.easeOut, 
														overwrite:1});
				
				_isHovered = true;
			}
			
		}
		
		cardId = card.cardId;
		
		BattleModel.setNullSelectedUiState();
		
		// 人物.
		if(cardId >= 10000 && cardId < 20000){
			InteractPolicy.execPolicy(HoverCharacterCard_InteractPolicy, [cardId]);
		}
		
		// 法术.
		else if(cardId >= 20000 && cardId < 30000){
			InteractPolicy.execPolicy(HoverMagicCard_InteractPolicy, [cardId]);
		}
		
		// 装备.
		else if(cardId >= 30000 && cardId < 40000){
			InteractPolicy.execPolicy(HoverEquipmentCard_InteractPolicy, [cardId]);
		}
	}
	
	private function ____onLeaveCard(e:ATouchEvent):void{
		var card:CardUU;
		var index_A:int;
		var coordY:Number;
		
		if(!_enabled){
			return;
		}
		
		if(_isHovered && !_selectedCard){
			card = e.target as CardUU;
			
			index_A = _cardList.indexOf(card);
			coordY = _cardCoordYList[index_A];
			TweenLite.to(card, CARD_OFFSET_DURATION, {y:coordY, ease:Strong.easeOut, overwrite:1});
			
			_isHovered = false;
		}
		
		
		if(!_selectedCard){
			BattleModel.setNullSelectedUiState();
		}
	}
	
	private function ____onSelectCard(e:ATouchEvent):void{
		var card:CardUU;
		
		if(!_enabled){
			return;
		}
		
		e.touch.addEventListener(AEvent.COMPLETE, ____onTouchComplete, 100000);
		
		_selectedCard = e.target as CardUU;
		_selectedCard.filters = [new GlowFilter(0x33dd33, 0.88, 33, 33)];
		
		_dragCard = new DragFusionUU;
		card = new CardUU;
		card.setCardId(int(_selectedCard.guid));
		card.scaleX = card.scaleY = CARD_SCALE2;
		_dragCard.addNode(card);
		_dragCard.alpha = 0.48;
		
		_dragCard.touchable = false;
		this.addNode(_dragCard);
		//_dragCard.startDrag(e.touch, null,  0, card.spaceHeight / 2 - 11, true);
		_dragCard.startDrag(e.touch, null,  0, -110 , true);
		
	}
	
	
	// 觸摸彈起.
	private function ____onTouchComplete(e:AEvent):void{
		var touch:Touch;
		var index_A:int;
		var coordY:Number;
		
		touch = e.target as Touch;
		
		if(touch.hoveringNode == touch.bindingNode){
			this.____doHoverCard(_selectedCard);
		}
		else {
			if(touch.hoveringNode){
				var evt:CardUUEvent;
				
				evt = new CardUUEvent(CardUUEvent.CARD_DROP);
				evt.view = touch.hoveringNode as NodeUU;
				evt.cardGuid = _selectedCard.guid;
				this.dispatchEvent(evt);
			}
			
			if(_isHovered){
				index_A = _cardList.indexOf(_selectedCard);
				coordY = _cardCoordYList[index_A];
				TweenLite.to(_selectedCard, CARD_OFFSET_DURATION, {y:coordY, ease:Strong.easeOut});
				
				_isHovered = false;
			}
			
			
			BattleModel.setNullSelectedUiState();

		}
		
		_dragCard.kill();
		_dragCard = null;
		
		_selectedCard.filters = null;
		_selectedCard = null;
	}
}
}