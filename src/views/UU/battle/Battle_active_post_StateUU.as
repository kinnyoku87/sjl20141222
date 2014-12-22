package views.UU.battle {
	import com.greensock.easing.Back;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Quad;
	import com.greensock.easing.Sine;
	import com.greensock.easing.Strong;
	import com.greensock.plugins.MotionBlurPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.netease.protobuf.UInt64;
	import configs.cards.CardCfg;
	import configs.cards.EquipmentCardCfg;
	import configs.cards.MagicCardCfg;
	import configs.ConfigBattle;
	import flash.geom.Point;
	import models.battle.actions.KillCardAction;
	import models.battle.actions.PlayCardAction;
	import models.battle.BattleRoleModel;
	import models.battle.BattleRoleVo;
	import models.battle.CharacterVo;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.sounds.SfxManager;
	import org.agony2d.utils.DelayMachine;
	import proto.cs.BattleEffect;
	import proto.cs.SkillUseReq;
	import views.UU.comps.CharacterUU;
	
	import configs.battle.BattleConfigurator;
	import configs.battle.GridCfg;
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	
	import models.GameModel;
	import models.battle.BattleModel;
	import models.battle.actions.BattleAction;
	import models.battle.actions.DebutAction;
	import models.battle.actions.RequestEndRoundAction;
	import models.battle.actions.NewCardAction;
	import models.battle.actions.NextRoundAction;
	import models.events.ActionEvent;
	import models.events.ControlEvent;
	import models.player.PlayerModel;
	
	import net.NetManager;
	
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.events.ATouchEvent;
	
	import proto.cs.ChessPos;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.PlayCardReq;
	
	import utils.TextUtil;
	
	import views.UU.comps.CardGroupSelfUU;
	import views.UU.comps.CardUU;
	import views.events.CardUUEvent;
	
	
	// 卡牌的顯示都在這層.
public class Battle_active_post_StateUU extends StateUU {
	
	
	private const hasYourRoundPrompt:Boolean = true;
	//private const hasYourRoundPrompt:Boolean = false;
	
	
	
	override public function onEnter():void {
		this.fusion.spaceWidth = Agony.getAdapter().rootWidth;
		this.fusion.spaceHeight = Agony.getAdapter().rootHeight;
		
		
		// 回合結束按鈕.
		_roundOkBtn = new ButtonUU;
		_roundOkBtn.skinName = "battle_roundOk";
		this.fusion.addNode(_roundOkBtn);
		
		_roundOkBtn.x = 1200;
		_roundOkBtn.y = 688;
		
		_roundLabel = TextUtil.createLabel("回合结束", 22, 0xddddaa, false);
		_roundOkBtn.addNode(_roundLabel);
		_roundLabel.x = 22;
		_roundLabel.y = 16;
//			_roundOkBtn.getLabel().locatingOffsetX = -15;
//			_roundOkBtn.getLabel().locatingOffsetY = -11;
		_roundOkBtn.addEventListener(ATouchEvent.CLICK, ____onRoundOkClick);
		_roundOkBtn.alpha = 0.3;
		_roundOkBtn.touchable = false;
		
		BattleModel.addEventListener(ControlEvent.CONTROL_CHANGE, onControlChanged);
		BattleModel.addEventListener(ActionEvent.NEXT_ACTION, onNextAction);
		
		this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		this.onResize(null);
	}
	
	override public function onExit():void {
		this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		
		if (_yourRoundImg) {
			TweenLite.killTweensOf(_yourRoundImg.displayObject);
			_yourRoundImg.kill();
		}
	}
	
	/**
	 * 发送卡牌至某处.
	 * 
	 * @param	cardGuid
	 * @param	posX
	 * @param	posY
	 */
	public function sendCardToPos( cardGuid:uint, posX:Number, posY:Number ):void {
		var cardView:CardUU;
		var coord:Point;
		var coord_A:Point;
		
		
		//DelayMachine.getInstance().delayedCall(0.2, function():void {
			//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		//})
		
		cardView = _cardGroup.removeCard(cardGuid);
		
		//先记录全局坐标.
		coord = cardView.parent.localToGlobal(cardView.x, cardView.y);
		cardView.kill();
		
		//加入到外层.
		//UUFacade.getRoot().addNode(cardView);
		//cardView.x = coord.x;
		//cardView.y = coord.y;
		
		coord_A = BattleConfigurator.getCoordByPos(posX, posY);
		coord_A = UUFacade.getWindow(Battle_active_StateUU).fusion.localToGlobal(coord_A.x, coord_A.y);
		
		
		//cardView.scaleX = cardView.scaleY = 0.88;
		//TweenMax.to(cardView.displayObject, duration, { rotation:270, 
														//x:coord.x * Agony.getAdapter().pixelRatio, 
														//y:coord.y * Agony.getAdapter().pixelRatio, 
														//scaleX:0.01,
														//scaleY:0.01, 
														//ease:Cubic.easeInOut, 
														//motionBlur: { strength:1, quality:1 }, 
		//onComplete:function():void {
			//cardView.kill();
		//}});
		
		var img_A:ImageLoaderUU;
		
		img_A = new ImageLoaderUU;
		img_A.source = TResourceManager.getAsset("card/img/back_A.png");
		img_A.pivotX = img_A.spaceWidth * .5;
		img_A.pivotY = img_A.spaceHeight * .5;
		img_A.x = coord.x;
		img_A.y = coord.y - 50;
		img_A.scaleX = img_A.scaleY = 0.70;
		UUFacade.getRoot().addNode(img_A);
		
		TweenLite.from(img_A, ConfigBattle.EMIT_CARD_DURATION_PRE, { 
																	scaleX:0.685,
																	scaleY:0.685,
																	//y:coord.y - 50,
																	onComplete:function():void {
			TweenMax.to(img_A.displayObject, ConfigBattle.EMIT_CARD_DURATION, { rotation:270, 
												x:coord_A.x * Agony.getAdapter().pixelRatio,
												y:coord_A.y * Agony.getAdapter().pixelRatio, 
												//delay:ConfigBattle.EMIT_CARD_DURATION_PRE,
												scaleX:0.001, 
												scaleY:0.001,
												//alpha:0.5,
												//ease:Cubic.easeInOut, 
												motionBlur: { strength:ConfigBattle.CARD_MOTION_STRENGTH, quality:ConfigBattle.CARD_MOTION_QUALITY },
			onComplete:function():void {
				img_A.kill();
			}});
		}});
		
		
		//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/choupai.mp3");
	}
	
	
	
	private var _roundOkBtn:ButtonUU;
	private var _roundOkAnimator:AnimatorUU;
	
	private var _roundLabel:LabelUU;
	private var _cardGroup:CardGroupSelfUU;
	
	
	
	
	private function onResize(e:AEvent):void{
		this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
		this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		
		
	}
	
	private function onControlChanged(e:ControlEvent):void{
		_cardGroup.enabled = e.isControlable;
	}
	
	private function ____onRoundOkClick(e:ATouchEvent):void{
		this.____doCheckRoundOver();
		
		BattleModel.endRound();
	}
	
	private function ____doCheckRoundOver(): void {
		Agony.getLog().message(this, "Self回合结束.");
		
		if(!_roundOkAnimator){
			return;
		}
		_roundOkBtn.alpha = 0.3;
		_roundOkBtn.touchable = false;
		if(_roundOkAnimator){
			_roundOkAnimator.kill()
			_roundOkAnimator = null;
		}
		
		UUToolTip.hideTip(false);
		
		_cardGroup.updateAllPos(true);
		_cardGroup.enabled = false;
	}
	
	private function ____onCardComplete(e:CardUUEvent):void {
		GameModel.getLog().simplify("派发一张自己的卡牌.");
		
		// 動作迭代.
		BattleModel.iterateNextAction();
		_currAction = null;
		
	}
	
	private function ____onCardDrop(e:CardUUEvent):void{
		var gridCfg:GridCfg;
		var cardGuid:int;
		var cardCfg:CardCfg;
		var characterView:CharacterUU;
		var msg:PlayCardReq;
		var msg1:SkillUseReq;
		
		cardGuid = e.cardGuid;
		cardCfg = CardConfigurator.getCardById(cardGuid);
		
		//Agony.getLog().simplify("[ Drop Card ]: {0} ({1})", cardCfg.name, cardCfg.id);
		
		// 登场.
		if(cardCfg is CharacterCardCfg && e.view.userData){
			gridCfg = e.view.userData as GridCfg;
			msg = new PlayCardReq;
			msg.cardId = cardGuid;
			var chessPos:ChessPos = new ChessPos;
			var pos:Point = BattleConfigurator.gridToPos(gridCfg.id);
			chessPos.x = pos.x;
			chessPos.y = pos.y;
			msg.chessPos = chessPos;
			NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_PALY_CARD_REQ, msg);
			
			// 人物登場動作進行時，暫不可操控其他.
			BattleModel.dispatchMyControlChanged(false);
		}
		
		// 魔法.
		else if (cardCfg is MagicCardCfg && e.view.parent is CharacterUU) {
			characterView = e.view.parent as CharacterUU;
			
			// 可释放.
			if (characterView.vo.interactionFlag & CharacterVo.TARGET) {
				//Agony.getLog().simplify("釋放法術: [ {0}( {1} ) ].", cardCfg.name ,cardCfg.id);
				
				msg = new PlayCardReq;
				msg.cardId = cardGuid;
				msg.chessPos = new ChessPos
				msg.chessPos.x = characterView.vo.pos.x
				msg.chessPos.y = characterView.vo.pos.y;
				
				msg1 = new SkillUseReq;
				msg1.fromGuid = BattleRoleModel.getMyBattleRoleVo().kingGuid;
				msg1.skillId = cardCfg.skill1;
				msg1.skillSource = BattleModel.skill_source = 2;
				msg1.endGuid = characterView.vo.guid;
				
				msg.skillUseReq = msg1;
				
				NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_PALY_CARD_REQ, msg);
				
				BattleModel.cardGuid = cardGuid;
				
				// 清空Ui狀態.
				BattleModel.setNullSelectedUiState();
				
				BattleModel.dispatchMyControlChanged(false);
			}
			
		}
		
		// 装备.
		else if (cardCfg is EquipmentCardCfg && e.view.parent is CharacterUU) {
			characterView = e.view.parent as CharacterUU;
			
			// 可释放.
			if (characterView.vo.interactionFlag & CharacterVo.TARGET) {
				//Agony.getLog().simplify("使用装备: [ {0}( {1} ) ].", cardCfg.name , cardCfg.id);
				
				msg = new PlayCardReq;
				msg.cardId = cardGuid;
				msg.chessPos = new ChessPos
				msg.chessPos.x = characterView.vo.pos.x
				msg.chessPos.y = characterView.vo.pos.y;
				
				NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_PALY_CARD_REQ, msg);
				
				BattleModel.cardGuid = cardGuid;
				
				// 清空Ui狀態.
				BattleModel.setNullSelectedUiState();
				
				BattleModel.dispatchMyControlChanged(false);
			}
		}
		
		//_cardGroup.removeCard(cardId);
	}
	
	private function onNextAction(e:ActionEvent):void{
		var newCardAction:NewCardAction
		var cardView:CardUU;
		var coord:Point;
		var playCardAction:PlayCardAction;
		var cardCfg:CardCfg;
		
		_currAction = e.action;
		
		// 新卡牌.
		if(_currAction is NewCardAction){
			newCardAction = e.action as NewCardAction;
			
			// 我方.
			if(PlayerModel.isMyRole(newCardAction.roleId)){
				_cardGroup.addCard(newCardAction.cardId);
				UUToolTip.hideTip(true);
				
				//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/choupai.mp3");
			}
			
			// 对方.
			//else {
				//TweenLite.delayedCall(ConfigBattle.CARD_POS_UPDATE_DURATION * 4.5, function():void {
					//BattleModel.iterateNextAction();
				//});
				
				//this.sendRivalCard(_currAction.roleId);
			//}
			
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/choupai.mp3");
			
			GameModel.getLog().simplify(newCardAction);
			
			
		}
		
		// 登场.
		else if (_currAction is DebutAction) {
			if (_cardGroup) {
				// 发我方牌
				if (BattleModel.isMyRound()) {
					this.sendCardToPos((_currAction as DebutAction).vo.card_guid, (_currAction as DebutAction).pos.x, (_currAction as DebutAction).pos.y);
				}
				
				// 发对方牌.
				else {
					//BattleModel.iterateNextAction();
				}
			}
		}
		
		// 回合结束.
		else if (_currAction is RequestEndRoundAction) {
			// 不是自己的回合，跳過.
			if(PlayerModel.isMyRole(_currAction.roleId)){
				
				// 超過一定時限，服務器會主動push.
				this.____doCheckRoundOver();
			}
			
		}
		
		
		
		// 下一回合.
		else if(_currAction is NextRoundAction){
			// 初期化卡牌，最開始.
			if(!this._cardGroup){
				// 底部卡牌.
				_cardGroup = new CardGroupSelfUU;
				_cardGroup.initialize(BattleModel.initCards);
				this.fusion.addNode(_cardGroup);
				_cardGroup.x = this.fusion.spaceWidth * .5;
				_cardGroup.y = 892;
				_cardGroup.addEventListener(CardUUEvent.CARD_COMPLETE, ____onCardComplete);
				_cardGroup.addEventListener(CardUUEvent.CARD_DROP,     ____onCardDrop);
				
				// 關閉準備視窗.
				UUFacade.getWindow(Battle_ready_StateUU).close();
			}
			
			// 自己的回合，開啟結束回合按鈕.
			if(PlayerModel.isMyRole(_currAction.roleId)){
				_roundOkBtn.alpha = 1.0;
				_roundOkBtn.touchable = true;
				
				_roundOkAnimator = new AnimatorUU;
				_roundOkBtn.addNode(_roundOkAnimator);
				_roundOkAnimator.play("common.eight", "atlas/common/roundOk", 0);
				_roundOkAnimator.x = -49;
				_roundOkAnimator.y = -113;
				_roundOkAnimator.touchable = false;
				
				if (hasYourRoundPrompt) {
					if (_yourRoundImg) {
						TweenLite.killTweensOf(_yourRoundImg.displayObject);
						_yourRoundImg.kill();
					}
					
					// 回合开始提示.
					_yourRoundImg = new ImageLoaderUU;
					_yourRoundImg.source = TResourceManager.getAsset("battle/img2/yourRound.png");
					this.fusion.addNode(_yourRoundImg);
					_yourRoundImg.pivotX = _yourRoundImg.sourceWidth / 2;
					_yourRoundImg.pivotY = _yourRoundImg.sourceHeight / 2;
					_yourRoundImg.x = this.fusion.spaceWidth / 2;
					_yourRoundImg.y = 135 + 48;
					_yourRoundImg.touchable = false;
					
					this.____onPreYourRound();
				}
				
				// 如果没有手牌，直接可操作.
				if (BattleModel.numCardsNextRound == 0) {
					_cardGroup.enabled = true;
				}
				
				Agony.getLog().simplify("[ numCardsNextRound ]: {0}", BattleModel.numCardsNextRound);
			}
			// 否则，检查是否为回合被动结束.
			else {
				this.____doCheckRoundOver();
			}
		}
		
		else if (_currAction is KillCardAction) {
			// 我方的.
			if (PlayerModel.isMyRole(_currAction._roleId)) {
				____doKillCard(_currAction as KillCardAction);
			}
		}
		
		// 出牌.
		else if(_currAction is PlayCardAction){
			//_cardGroup.removeCard((_currAction as PlayCardAction).cardId);
			
			//playCardAction = _currAction as PlayCardAction;
			
			//cardCfg = CardConfigurator.getCardById(playCardAction.cardGuid % 100000);
			
			// 装备牌.
			//if (cardCfg is EquipmentCardCfg) {
			//if (!(cardCfg is CharacterCardCfg)) {
				//if (BattleModel.isMyRound()) {
					//this.sendCardToPos(playCardAction.cardGuid, playCardAction.pos.x, playCardAction.pos.y, 0.55, BattleModel.iterateNextAction);
					
				//}
				//else {
					//BattleModel.iterateNextAction();
				//}
				//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
			//}
			//else {
			if (PlayerModel.isMyRole(_currAction.roleId)) {
				playCardAction = _currAction as PlayCardAction;
				____doPlayCard(playCardAction.cardGuid, playCardAction.pos);
			}
			
			//BattleModel.iterateNextAction();
		}
	}
	
	private function ____doPlayCard( cardGuid:int, pos:ChessPos ) : void {
		var cardId:int;
		
		cardId = cardGuid % 100000;
		// 30009: 乾坤尺
		// 30017: 乾坤弓
		if (cardId == 30009 || cardId == 30017) {
			this.sendCardToPos(cardGuid, pos.x, pos.y);
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3", 1);
		}
	}
	
	private var _yourRoundImg:ImageLoaderUU;
	
	// 回合开始文本提示.
	private function ____onPreYourRound():void {
		GameModel.getDelay().delayedCall(0.28, function():void {
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/roundBegin.mp3");
		});
		
		TweenMax.from(_yourRoundImg.displayObject, 1.0, { x:(this.fusion.root.spaceWidth + 10) * Agony.getAdapter().pixelRatio, 
											ease:Back.easeOut,
											motionBlur: { strength:1, quality:1 },
											onComplete:____doPostYourRound } );
	}
	
	private function ____doPostYourRound():void {
		//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/回合开始.mp3");
		
		TweenMax.to(_yourRoundImg.displayObject, 0.5, { delay:0.5, 
									x: (-this.fusion.x -_yourRoundImg.width - 110) * Agony.getAdapter().pixelRatio, 
									ease:Back.easeIn,
									motionBlur: { strength:1, quality:1 },
									onComplete:____doKillYourRoundImg});
	}
	
	private function ____doKillYourRoundImg():void {
		_yourRoundImg.kill();
		_yourRoundImg = null;
	}
	
	//private function sendRivalCard( roleId:UInt64 ):void {
		//var card:ImageLoaderUU;
		//var initX:Number;
		//var initY:Number;
		//var kingView:CharacterUU;
		//
		//initX = Agony.getAdapter().rootWidth / 2;
		//initY = 892;
		//kingView = (UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU).getView(BattleRoleModel.getBattleRoleVo(roleId).kingVo);
		//card = new ImageLoaderUU;
		//card.source = TResourceManager.getAsset("card/img/back_A.png");
		//card.pivotX = card.spaceWidth * .5;
		//card.pivotY = card.spaceHeight * .5;
		//card.x = 550 + initX;
		//card.y = 130 + 892;
		//this.fusion.addNode(card);
		//TweenLite.to(card, ConfigBattle.CARD_POS_UPDATE_DURATION * 3.5, { x:initX, y: -430 + 892, scaleX:1, scaleY:1, ease:Strong.easeOut, 
		//onComplete:function():void{
			//TweenLite.to(card, ConfigBattle.CARD_POS_UPDATE_DURATION, { x:kingView.x, y:kingView.y, scaleX:0.03, scaleY:0.03, 
			//onComplete:function():void {
				//card.kill();
				//BattleModel.iterateNextAction();
			//}});
		//}});
	//}
	
	
	public function ____doKillCard( action:KillCardAction ) : void {
		var cardView:CardUU;
		var coordX:Number;
		var coordY:Number;
		var coord:Point;
		var anim_A:AnimatorUU;
		var activeFusion:StateFusionUU;
		var battleRole:BattleRoleVo;
		
		Agony.getLog().simplify("[ 被消灭手牌 ]: {0}", action.battleEffect.effectValue);
		
		cardView = _cardGroup.removeCard(action.battleEffect.effectValue);
		
		//先记录全局坐标.
		coord = cardView.parent.localToGlobal(cardView.x, cardView.y);
		coord = UUFacade.getWindow(Battle_active_StateUU).fusion.globalToLocal(coord.x, coord.y);
		
		//加入到外层.
		activeFusion = UUFacade.getWindow(Battle_active_StateUU).fusion as StateFusionUU;
		activeFusion.addNode(cardView);
		cardView.x = coord.x;
		cardView.y = coord.y;
		
		//coord = BattleConfigurator.getCoordByPos(posX, posY);
		//coord = UUFacade.getWindow(Battle_active_StateUU).fusion.localToGlobal(coord.x, coord.y);
		coordX = activeFusion.spaceWidth / 2;
		coordY = activeFusion.spaceHeight / 2 - ConfigBattle.GRID_LOCATING_OFFSET_Y / 2;
		
		//cardView.scaleX = cardView.scaleY = 1.1;
		TweenMax.to(cardView.displayObject, 0.5, { x:coordX * Agony.getAdapter().pixelRatio, y:coordY * Agony.getAdapter().pixelRatio, rotation:360, scaleX:1.0, scaleY:1.0, motionBlur: { strength:1, quality:1 }, 
		onComplete:function():void {
			//(UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU).showHit(coord.x, coord.y);
			
			TweenLite.delayedCall(0.5, function():void {
				SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
				(activeFusion.state as Battle_active_StateUU).showHit(coordX, coordY, 2.6);
			});
			
			TweenLite.to(cardView, 1.0, { delay:0.5, alpha:0.03, scaleX:0.03, scaleY:0.03, ease:Back.easeIn, onComplete:function():void {
				SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
				
				battleRole = BattleRoleModel.getBattleRoleVo(action.roleId);
				battleRole.killCard2(cardView.userData);
				
				cardView.kill();
				
				BattleModel.iterateNextAction();
			}});
		}});
	}
	
	
	
	private var _currAction:BattleAction;
	
	
	
	
}
}