package views.UU.battle
{
	import com.greensock.easing.Back;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Linear;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.greensock.easing.Bounce;
	import com.greensock.TweenMax;
	import com.netease.protobuf.UInt64;
	import configs.battle.BattleErrorValidator;
	import configs.cards.EquipmentCardCfg;
	import configs.skills.BuffCfg;
	import models.battle.actions.ChongzhuangAction;
	import models.battle.actions.KillCardAction;
	import models.battle.actions.NewCardAction;
	import models.battle.actions.PlayCardAction;
	import models.battle.actions.YuanhuAction;
	import models.battle.BattleRoleModel;
	import models.battle.BattleRoleVo;
	import models.events.BuffEvent;
	import models.events.GuessCardEvent;
	import models.events.SelectedUiAoeSkillEvent;
	import models.player.PlayerModel;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.BattleEffect;
	import views.UU.comps.CardUU;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import configs.ConfigBattle;
	import configs.ConfigRes;
	import configs.battle.BattleConfigurator;
	import configs.skills.SkillCfg;
	import configs.skills.SkillConfigurator;
	
	import models.GameModel;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	import models.battle.actions.BattleAction;
	import models.battle.actions.BuffAction;
	import models.battle.actions.DebutAction;
	import models.battle.actions.RequestEndRoundAction;
	import models.battle.actions.MovementAction;
	import models.battle.actions.NextRoundAction;
	import models.battle.actions.SkillAction;
	import models.battle.interactions.InteractPolicy;
	import models.battle.interactions.Skill_interactPolicy;
	import models.events.ActionEvent;
	import models.events.CharacterEvent;
	import models.events.ControlEvent;
	import models.events.NullSelectedUiEvent;
	import models.events.SelectedUiChooseCharacterEvent;
	
	import org.agony2d.Agony;
	import org.agony2d.base.events.TickEvent;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.events.ATouchEvent;
	
	import proto.cs.BattleBuff;
	import proto.cs.ChessPos;
	
	import utils.TextUtil;
	
	import views.UU.battle.buffStates.*;
	
	import views.UU.battle.skillStates.*;
	
	import views.UU.comps.CharacterUU;
	import views.UU.tips.BattleSkill_TipViewStateUU;
	import views.UU.tips.Character_TipViewStateUU;
	
public class Battle_active_StateUU extends StateUU {
	
	
	public const MOVE_DURATION:Number = 0.5;
	
	
	// 是否显示技能与装备文本.
	public const isShowSkillAndEquipTxt:Boolean = true;
	//public const isShowSkillAndEquipTxt:Boolean = false;
	
	
	// 是否显示派发对手卡牌动画.
	public const isSendRivalCard:Boolean = true;
	//public const isSendRivalCard:Boolean = false;
	
	
	// 对方视角是否显示发射卡牌.
	public const isEmitCard:Boolean = true;
	//public const isEmitCard:Boolean = false;
	
	
	
	override public function onEnter():void
	{
		var img:BitmapLoaderUU;
		var pos:Point;
		
		_gameObjectList = new <NodeUU>[];
		_vo2ViewList = new Dictionary;
		
		this.fusion.spaceWidth = BattleModel.gridWidth;
		this.fusion.spaceHeight = BattleModel.gridHeight;
		this.fusion.locatingOffsetY = ConfigBattle.GRID_LOCATING_OFFSET_Y;
		
		// 遊戲對象圖層.
		_objectFusion = new FusionUU;
		this.fusion.addNode(_objectFusion);
		
		// 天元.
		//pos = BattleConfigurator.gridToPos(13);
		//this.____doAddTianyuan(pos.x, pos.y);
		
		// 特效圖層.
		_effectFusion = new FusionUU;
		this.fusion.addNode(_effectFusion);
		
		// Ui.
		_uiFusion = new FusionUU;
		this.fusion.addNode(_uiFusion);
		
		// 技能狀態列表.
		if(!_skillStateList){
			_skillStateList = { };
			// None.
			_skillStateList[0]     = None_Skill_StateUU;
			// 普通攻击.
			_skillStateList[50000] = CommonAttack_Skill_StateUU;
			// 君威
			_skillStateList[50002] = Junwei_Skill_StateUU;
			// 射击.
			_skillStateList[50004] = Sheji_Skill_StateUU;
			// 精准射击.
			_skillStateList[50007] = Sheji_Skill_StateUU;
			// 火龙毒镖.
			_skillStateList[50009] = Huolongdubiao_Skill_StateUU;
			// 聚风幡.
			_skillStateList[50012] = Jufengfan_Skill_StateUU;
			// 辟地珠.
			_skillStateList[50014] = Pidizhu_Skill_StateUU;
			// 开天珠.
			_skillStateList[50015] = Kaitianzhu_Skill_StateUU;
			// 混元宝珠.
			_skillStateList[50017] = Hunyuanbaozhu_Skill_StateUU;
			// 呼名夺魂.
			_skillStateList[50018] = Humingduohun_Skill_StateUU;
			// 神眼之光.
			_skillStateList[50020] = Shenyanzhiguang_Skill_StateUU;
			// 雌雄双鞭.
			_skillStateList[50021] = Cixiongshuangbian_Skill_StateUU;
			// 三千火龙军.
			_skillStateList[50022] = Sanqianhuolongjun_Skill_StateUU;
			// 飞蝗石.
			_skillStateList[50026] = Feihuangshi_Skill_StateUU;
			// 吴钩剑气.
			_skillStateList[50028] = Wugoujianqi_Skill_StateUU;
			// 镇压.
			_skillStateList[50030] = Zhenya_Skill_StateUU;
			// 钻心钉.
			_skillStateList[50033] = Zuanxinding_Skill_StateUU;
			// 乾坤圈.
			_skillStateList[50034] = Qiankunquan_Skill_StateUU;
			// 50076: 定风珠.
			// 50077: 八卦仙衣
			// 50082: 定身
			// 50095: 玄马
			// 50123: 天马
			// 50127: 乾坤尺
			// 50129: 莫邪宝剑
			// 50174: 黑麒麟
			_skillStateList[50076] = _skillStateList[50077] = _skillStateList[50082] = _skillStateList[50095] = _skillStateList[50123] = _skillStateList[50129] = _skillStateList[50174] = DingShen_Skill_StateUU;
			// 乾坤弓.
			_skillStateList[50078] = Qiankungong_Skill_StateUU;
			// 法咒尽散.
			_skillStateList[50089] = Fazhoujinsan_Skill_StateUU;
			// 二龙剑.
			_skillStateList[50098] = Erlongjian_Skill_StateUU;
			// 雾露乾坤网.
			_skillStateList[50099] = Wuluqiankunwang_Skill_StateUU;
			// 见龙卸甲.
			_skillStateList[50124] = Jianlongxiejia_Skill_StateUU;
			// 诛仙剑气.
			_skillStateList[50125] = Zhuxianjianqi_Skill_StateUU;
			// 太阳金针.
			_skillStateList[50137] = Taiyangjinzhen_Skill_StateUU;
			// 定海珠.
			_skillStateList[50138] = Dinghaizhu_Skill_StateUU;
			// 天元狂流.
			_skillStateList[50167] = Tianyuankuangliu_Skill_StateUU;
			// 神目之光.
			_skillStateList[50192] = Shenmuzhiguang_Skill_StateUU;
		}
		
		if(!_buffStateList){
			_buffStateList = {};
			// 飞行.
			_buffStateList[60006] = Feixing_Buff_StateUU;
			// 异兽龙威.
			_buffStateList[60007] = Yishoulongwei_Buff_StateUU;
			// 定身l.
			_buffStateList[60008] = DingShen_Buff_StateUU;
			// 异兽龙威2.
			_buffStateList[60017] = Yishoulongwei2_Buff_StateUU;
			// 援护.
			_buffStateList[60018] = Yuanhu_Buff_StateUU;
			// 定风珠.
			_buffStateList[60020] = Dingfengzhu_Buff_StateUU;
			// 八卦仙衣.
			_buffStateList[60021] = Baguaxianyi_Buff_StateUU;
			// 鼓舞.
			_buffStateList[60026] = Guwu_Buff_StateUU;
			// 八九玄功、潜行.
			_buffStateList[60028] = _buffStateList[60062] = Qianxing_Buff_StateUU;
			// 玄马.
			_buffStateList[60029] = Xuanma_Buff_StateUU;
			// 杏黄旗.
			//_buffStateList[60038] = Xinghuangqi_Buff_StateUU;
			// 君威.
			_buffStateList[60053] = Junwei_Buff_StateUU;
			// 定风珠2.
			_buffStateList[60055] = Dingfengzhu2_Buff_StateUU;
			// 60058: 莫邪宝剑.
			// 60064 / 60066: 寿星高照.
			// 60088: 黑麒麟2.
			_buffStateList[60058] = _buffStateList[60064] = _buffStateList[60066] = _buffStateList[60088] = Moyebaojian_Buff_StateUU;
			// 60082: 移动力增加.
			// 60087: 黑麒麟1.
			_buffStateList[60082] = _buffStateList[60087] = Yidonglizengjia_Buff_StateUU;
			
		}
		
		BattleModel.addEventListener(CharacterEvent.UPDATE_VALUES,       onUpdateValues);
		BattleModel.addEventListener(CharacterEvent.UPDATE_EQUIP,        onUpdateEquip);
		BattleModel.addEventListener(CharacterEvent.INTERACTION_CHANGED, onInteractionChanged);
		BattleModel.addEventListener(CharacterEvent.KILL_CHARACTER,      onKillCharacter);
		BattleModel.addEventListener(ActionEvent.NEXT_ACTION,            onNextAction);
		
		BattleModel.addEventListener(SelectedUiChooseCharacterEvent.CHOOSE_CHARACTER, onSelectedUiChooseCharacter);
		BattleModel.addEventListener(SelectedUiAoeSkillEvent.AOE,                     ____onSelectedUiAoeSkill);
		BattleModel.addEventListener(NullSelectedUiEvent.NULL_SELECTED,               onNullSelectedUi);
		
		BattleModel.addEventListener(BuffEvent.REMOVE_BUFF,              onRemoveBuff);
		BattleModel.addEventListener(GuessCardEvent.GUESS_CARDS,         onGuessCards);
		
		// 不斷監測人物"z軸"更新.
		Agony.getFrame().addEventListener(TickEvent.TICK, ____onTick);
		this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		this.onResize(null);
	}
	
	override public function onExit():void {
		Agony.getFrame().removeEventListener(TickEvent.TICK, ____onTick);
		this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
	}
	
	
	
	//////////////////////////////////////////
	// Useful
	//////////////////////////////////////////

	/**
	 * vo => 人物UU
	 * 
	 * @param vo
	 * @return 
	 * 
	 */	
	public function getView( vo:CharacterVo ) : CharacterUU {
		return _vo2ViewList[vo];
	}
	
	
	/**
	 * 顯示失去的hp. 
	 */	
	public function showLostHp( v:int, coordX:Number, coordY:Number ) : void {
		var hpView:LabelUU;
		hpView = TextUtil.createLabel(v, 33, 0xFF0000,true,1,6,22);
		
		hpView.x = coordX - 5;
		hpView.y = coordY - 3;
		hpView.touchable = false;
		this.fusion.addNode(hpView);
		TweenLite.to(hpView, ConfigBattle.LOST_HP_OFFSET_DURATION, {y:coordY - 51, ease:Bounce.easeOut});
		TweenLite.to(hpView, ConfigBattle.LOST_HP_ALPHA_DURATION, {delay:ConfigBattle.LOST_HP_OFFSET_DURATION - 0.2, alpha:0.03, overwrite:0, onComplete:function():void{
			hpView.kill();
		}});
		
	}
	
	public function showDebutHalo( coordX:Number, coordY:Number, delay:Number ) : void {
		var animator:AnimatorUU;
		
		TweenLite.delayedCall(delay, function():void {
			animator = new AnimatorUU
			//animator.play("common.scene.debut", "atlas/scene/debut2", 1, function():void {
			animator.play("common.debut3", "atlas/scene/debut3", 1, function():void {
				animator.kill();
			});
			animator.x = coordX - animator.sourceWidth / 2;
			animator.y = coordY - animator.sourceHeight / 2 - 110;
			//animator.y = coordY - animator.sourceHeight / 2 - 20;
			animator.touchable = false;
			//fusion.addNodeAt(animator, 0);
			fusion.addNode(animator);
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
			
			
		});
	}
	
	/**
	 * 近战受击. 
	 */	
	public function showHit( coordX:Number, coordY:Number, scale:Number = 1.0 ) : void {
		var animator:AnimatorUU;
		
		animator = new AnimatorUU
		animator.play("common.eight", "atlas/scene/hit", 1, function():void {
			animator.kill();
		});
		animator.x = coordX;
		animator.y = coordY - 6;
		animator.pivotX = animator.sourceWidth / 2;
		animator.pivotY = animator.sourceHeight / 2;
		animator.touchable = false;
		fusion.addNode(animator);
		animator.scaleX = animator.scaleY = scale;
		
	}
	
	/**
	 * 远程命中. 
	 */	
	public function showShoot( coordX:Number, coordY:Number ) : void {
		var animator:AnimatorUU;
		
		animator = new AnimatorUU
		animator.x = coordX - 128 + 2;
		animator.y = coordY - 128 - 8;
		animator.touchable = false;
		fusion.addNode(animator);
		
		animator.play("common.eight", "atlas/scene/shoot", 1, function():void {
			animator.kill();
		});
	}
	
	public function showSkillName( v:String, coordX:Number, coordY:Number, isEquip:Boolean ) : void {
		var hpView:LabelUU;
		
		if (isShowSkillAndEquipTxt) {
			//hpView = TextUtil.createLabelBlur2(v, 35, isEquip ? 0x8080FF : 0xdddd33, true, 5.0, 6.5, 11.5 );
			hpView = TextUtil.createLabelBlur2(v, 33, isEquip ? 0x8080FF : 0xcbcb00, true, 1.0, 3.2, 35.0);
			//hpView = TextUtil.createLabelBlur2(v, 40, isEquip ? 0xdddd33 : 0x8080FF, true, 2.2, 3.5, 16.5);
			hpView.x = coordX - 15;
			hpView.y = coordY - 75;
			hpView.touchable = false;
			this.fusion.addNode(hpView);
			TweenLite.from(hpView, ConfigBattle.SKILL_TXT_OFFSET_DURATION, { x:coordX - 115, alpha:0.01, ease:Cubic.easeOut,
			onComplete:function():void {
				TweenLite.to(hpView, ConfigBattle.SKILL_TXT_ALPHA_DURATION - 0.3, { delay:0.3, alpha:0.01, ease:Cubic.easeIn, overwrite:0, onComplete:function():void{
					hpView.kill();
				}});
			}});
		}
	}
	
	/**
	 * 发射卡牌.
	 */
	public function emitCard( emitVo:CharacterVo, targetView:CharacterUU, alpha:Number = 1.0 ) : void {
		var emitView:CharacterUU;
		
		if (isEmitCard) {
			emitView = getView(emitVo);
			this.____doEmitCard(emitView, targetView, alpha);
		}
	}
	
	private function ____doEmitCard( emitView:CharacterUU, targetView:CharacterUU, alpha:Number ) : void {
		var cardView:ImageLoaderUU;
		
		cardView = new ImageLoaderUU;
		cardView.source = TResourceManager.getAsset("card/img/back_A.png");
		cardView.pivotX = cardView.spaceWidth * .5;
		cardView.pivotY = cardView.spaceHeight * .5;
		cardView.x = emitView.x - 33;
		cardView.y = emitView.y - 33;
		cardView.alpha = alpha;
		cardView.scaleX = cardView.scaleY = 0.55;
		this.fusion.addNode(cardView);
		
		TweenLite.from(cardView, ConfigBattle.EMIT_CARD_DURATION_PRE, { scaleX:0.535, 
																		scaleY:0.535, 
																		onComplete:function():void {
			TweenMax.to(cardView.displayObject, ConfigBattle.EMIT_CARD_DURATION, { rotation:-270, 
												x:targetView.x * Agony.getAdapter().pixelRatio,
												y:targetView.y * Agony.getAdapter().pixelRatio, 
												//delay:ConfigBattle.EMIT_CARD_DURATION_PRE,
												scaleX:0.001, 
												scaleY:0.001,
												//alpha:0.5,
												//ease:Cubic.easeInOut, 
												motionBlur: { strength:ConfigBattle.CARD_MOTION_STRENGTH, quality:ConfigBattle.CARD_MOTION_QUALITY },
			onComplete:function():void {
				cardView.kill();
			}});
		}});
		
		
		//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/choupai.mp3");
	}
	
	/**
	 * 战斗警告提示.
	 * 
	 * @param	v
	 */
	public function showBattleWarning( v:String, delay:Number = 0.8 ) : void {
		var hpView:LabelUU;
		
		//TweenLite.delayedCall(delay, function():void {
			hpView = TextUtil.createLabelBlur2(v, 60, 0xdd3333, true, 4.5, 6, 16 );
			hpView.locatingTypeForHoriz = LocatingType.F___A___F;
			hpView.y = 110;
			fusion.addNode(hpView);
			hpView.touchable = false;
			
			Agony.getFrame().addEventListener(AEvent.COMPLETE, function():void {
				Agony.getFrame().removeEventListener(AEvent.COMPLETE, arguments.callee);
				
				TweenLite.from(hpView, ConfigBattle.SKILL_TXT_OFFSET_DURATION, { x:hpView.x - 220, ease:Cubic.easeOut, alpha:0.03,
				onComplete:function():void {
					TweenLite.to(hpView, ConfigBattle.SKILL_TXT_ALPHA_DURATION, { alpha:0.03, ease:Cubic.easeIn, overwrite:0, onComplete:function():void{
						hpView.kill();
					}});
				}});
			});
		//});
	}
	
	
	
	
	private static var _skillStateList:Object;
	private static var _buffStateList:Object;
	
	//private var _tianyan:AnimatorUU;
	
	private var _gameObjectList:Vector.<NodeUU>;
	private var _numGameObjects:int;
	
	private var _vo2ViewList:Dictionary;
	
	private var _objectFusion:FusionUU;
	private var _effectFusion:FusionUU;
	private var _uiFusion:FusionUU;
	
	
	
	private var _currAction:BattleAction;
	private var _currPath:Array;
	
	private var _currSkillView:CharacterUU;
	
	private var _movedView:CharacterUU;
	
	
	
	
	/**
	 * 加入人物.
	 */	
	public function ____toAddCharacter( vo:CharacterVo, duration:Number, delay:Number, coordX:int, coordY:int ) : CharacterUU {
		var character:CharacterUU
		
		character = new CharacterUU(vo);
		
		// 睡眠.
		character.setSleep(true);
		
		//coord = BattleConfigurator.getCoordByPos(posX, posY);
		character.x = coordX;
		character.y = coordY;
		
		this._objectFusion.addNode(character);
		_gameObjectList[_numGameObjects++] = _vo2ViewList[vo] = character;
		
		//TweenLite.from(character, duration * 2, { delay:delay } );
		TweenLite.from(character, duration, { delay:delay, 
												alpha:0.001, 
												scaleX:0.01, 
												//ease:Cubic.easeIn,
		onStart:function() : void {
			BattleModel.iterateNextAction();
		}});
		
		
		
		// tip.
		UUToolTip.registerTip(character, Character_TipViewStateUU).userData = vo;
		
		_movedView = character;
		
		return character;
	}
	
	// 加入天元.
	//private function ____doAddTianyuan( posX:int, posY:int ) : void {
		//var coord:Point;
		//
		//_tianyan = new AnimatorUU;
		//_tianyan.play("common.eight", "atlas/tianyuan", 0);
		//coord = BattleConfigurator.getCoordByPos(posX, posY);
		//_tianyan.pivotX = ConfigRes.FRAME_SIZE * .5;
		//_tianyan.pivotY = ConfigRes.FRAME_SIZE * .5 + 22;
		//_tianyan.x = coord.x;
		//_tianyan.y = coord.y;
		//_tianyan.touchable = false;
		//this._objectFusion.addNode(_tianyan);
		//_gameObjectList[_numGameObjects++] = _tianyan;
	//}

	// 移動人物.
	public function ____doMoveCharacter( vo:CharacterVo ) : void {
		var pos:ChessPos;

		pos = _currPath.shift();
		this.____doMoveToPos(pos, _vo2ViewList[vo]);
	}
	
	private function ____doMoveToPos( oldPos:ChessPos, view:CharacterUU ) : void {
		var coord:Point;
		var pos:ChessPos;
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_move.mp3", 3);
		
		// 當前行列.
		pos = _currPath.shift()
		coord = BattleConfigurator.getCoordByGridId(BattleConfigurator.posToGrid2(pos));
		
		view.run(MapModel.getDirection3(oldPos, pos));
		
		TweenLite.to(view, MOVE_DURATION, { x:coord.x, y:coord.y, //ease:Cubic.easeOut,
		onUpdate:function():void {
			_movedView = view;
		},
		onComplete:function():void {
			if(_currPath.length > 0){
				____doMoveToPos(pos, view);
			}
			else {
				view.idleNormal(view.vo.role_id);
				
				BattleModel.iterateNextAction();
				
				// 移動後自動攻擊.
				if(MapModel.cachedAssaultGridId > 0){
					BattleModel.commonAttack();
				}
			}
		}});
		
	}

	private function onResize(e:AEvent):void{
		this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
		this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		
		
	}
	
	private function onUpdateValues(e:CharacterEvent):void{
		var view:CharacterUU;
		
		view = _vo2ViewList[e.vo];
		view.updateValues();
	}
	
	private function onUpdateEquip(e:CharacterEvent):void {
		var view:CharacterUU;
		
		view = _vo2ViewList[e.vo];
		this.showSkillName(e.vo.getEquip().name, view.x, view.y, true);
	}
	
	private function onInteractionChanged(e:CharacterEvent):void{
		var view:CharacterUU;
		
		view = _vo2ViewList[e.vo];
		view.changeViewByOperationFlag();
	}
	
	private function onKillCharacter(e:CharacterEvent):void{
		var view:CharacterUU;
		var animator:AnimatorUU;
		
		view = _vo2ViewList[e.vo];
		
		view.setSleep(false);
		
		_gameObjectList.splice(_gameObjectList.indexOf(view), 1);
		_numGameObjects--;
		
		delete _vo2ViewList[e.vo];
		TweenLite.to(view, ConfigBattle.DEATH_DELAY, {alpha:0.1, onComplete:function():void {
			view.kill();
		}});
		
		// 死亡特效.
		animator = new AnimatorUU;
		animator.play("common.death", "atlas/scene/death2", 1, function():void {
			animator.kill();
		});
		animator.x = view.x - 128;
		animator.y = view.y - 128 - 10;
		this.fusion.addNode(animator);
	}
	
	private function ____onTick(e:TickEvent):void{
		if (_movedView) {
			this.____doUpdateAllObjectsLayer();
			_movedView = null;
		}
	}
	
	private function ____doUpdateAllObjectsLayer():void {
		_gameObjectList.sort(____onSort);
		
		var i:int;
		var node:NodeUU;
		var currLayer:int;
		var newLayer:int;
		
		while (i < _numGameObjects) {
			node = _gameObjectList[i++];
			currLayer = _objectFusion.getNodeIndex(node);
			newLayer = _gameObjectList.indexOf(node);
			if (currLayer != newLayer) {
				_objectFusion.addNodeAt(node, newLayer);
			}
		}
		
		//Agony.getLog().simplify(_gameObjectList);
	}
	
	private function ____onSort( objA:NodeUU, objB:NodeUU ):Number {
		if (objA.y < objB.y) {
			return -1;
		}
		else if (objA.y > objB.y) {
			return 1
		}
		else if (objA.x < objB.x) {
			return -1;
		}
		else if (objA.x > objB.x) {
			return 1;
		}
		return 0;
	}
	
	//private function onControlChanged(e:ControlEvent):void{
		//this.fusion.touchable = e.isControlable;
		
	//}
	
	
	
	///////////////////////////////////////////////////////
	// 点选战斗相关元素的Ui状态变化.
	///////////////////////////////////////////////////////
	
	private static var cachedAssaultableGridIdList:Vector.<int>;
	
	/**
	 * 正在操作人物.
	 * 
	 * @param	e
	 */
	private function onSelectedUiChooseCharacter(e:SelectedUiChooseCharacterEvent):void{
		var img:ImageLoaderUU;
		var i:int;
		var l:int;
		var coord:Point;
		var gridId:int;
		var gridIdList:Vector.<int>;
		var vo:CharacterVo;
		var btn:ButtonUU;
		var skillList:Array;
		var cfg:SkillCfg;
		var offsetX:Number = 0;
		var btnFusion:FusionUU;
		var hasActiveSkill:Boolean;
		var equipCfg:EquipmentCardCfg;
//		var effectFusion:StateFusionUU;
		
		// 產生可被攻擊圖示.
		cachedAssaultableGridIdList = e.assaultableGridIdList;
		l = cachedAssaultableGridIdList.length;
		while(i<l){
			vo = BattleModel.getVoByGridId(cachedAssaultableGridIdList[i++]);
			vo.setInteractionFlag(CharacterVo.ASSAULT);
		}
		
		// 当前选中人物.
		vo = BattleModel.getVoByGridId(e.startGridId);
		_currSkillView = getView(vo);
		// 选择人物后的特效.
		if (e.isMoveDiry) {
			_currSkillView.setSelectedUiState(CharacterVo.SELECTED_MOVE_DIRTY);
		}
		else {
			_currSkillView.setSelectedUiState(CharacterVo.SELECTED);
		}
		
		// 可用技能按钮.
		skillList = vo.cfg.getSkillList();
		l = skillList.length;
		i = 0;
		while (i < l) {
			cfg = skillList[i++];
			
			if (!btnFusion) {
				btnFusion = new FusionUU;
				_uiFusion.addNode(btnFusion);
			}
			btn = new ButtonUU();
			// 被动技能 | 发生过移动 => 按钮无效.
			if (cfg.howRun == 2 || e.isMoveDiry) {
				btn.skinName = "battle_common_B";
				//btn.touchable = false;
			}
			
			// 可释放的主动技能
			else {
				btn.skinName = "common_A";
				btn.addEventListener(ATouchEvent.CLICK, ____onSelectSkill);
			}
			btn.image.height = 20;
			btnFusion.addNode(btn);
			TextUtil.decorateLabel2(btn.getLabel(), cfg.name, 17, 0xFFFFFF, 3);
			
			btn.image.width = btn.getLabel().width + 11;
			if (!hasActiveSkill) {
				hasActiveSkill = true;
			}
			else {
				btn.locatingTypeForHoriz = LocatingType.L____L_A;
				btn.locatingOffsetX = -3
			}
			
			btn.userData = int(cfg.id);
			
			UUToolTip.registerTip(btn, BattleSkill_TipViewStateUU).userData = [int(cfg.id), this.getView(BattleModel.getVoByGridId(e.startGridId))];
		}
		// 可能加入的装备技能.
		equipCfg = vo.getEquip();
		if (equipCfg && equipCfg.skill1 > 0) {
			cfg = SkillConfigurator.getSkillById(equipCfg.skill1);
			if (!btnFusion) {
				btnFusion = new FusionUU;
				_uiFusion.addNode(btnFusion);
			}
			btn = new ButtonUU();
			
			// 被动技能 | 发生过移动 => 按钮无效.
			if (cfg.howRun == 2 || e.isMoveDiry) {
				btn.skinName = "battle_common_B";
				//btn.touchable = false;
			}
			
			// 可释放的主动技能
			else {
				btn.skinName = "common_A";
				btn.addEventListener(ATouchEvent.CLICK, ____onSelectSkill);
			}
			
			btn.image.height = 20;
			btnFusion.addNode(btn);
			TextUtil.decorateLabel2(btn.getLabel(), cfg.name, 17, 0xFFFFFF, 3);
			
			btn.image.width = btn.getLabel().width + 11;
			if (!hasActiveSkill) {
				hasActiveSkill = true;
			}
			else {
				btn.locatingTypeForHoriz = LocatingType.L____L_A;
				btn.locatingOffsetX = -3
			}
			
			btn.userData = int(cfg.id);
			
			UUToolTip.registerTip(btn, BattleSkill_TipViewStateUU).userData = [int(cfg.id), this.getView(BattleModel.getVoByGridId(e.startGridId))];
		}
		
		if (btnFusion) {
			coord = BattleConfigurator.getCoordByGridId(e.startGridId);
			Agony.getFrame().addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				Agony.getFrame().removeEventListener(AEvent.COMPLETE, arguments.callee);
				btnFusion.x = coord.x - btnFusion.width / 2;
				btnFusion.y = coord.y + 24;
			});
		}
	}
	
	private function ____onSelectSkill(e:ATouchEvent):void {
		BattleModel.skillId = int(e.target.userData);
		BattleModel.skillCharacterVo = _currSkillView.vo;
		BattleModel.skill_source = 0;
		
		BattleModel.setNullSelectedUiState();
		
		InteractPolicy.execPolicy(Skill_interactPolicy, [BattleModel.skillId]);
	}
	
	
	private var _aoeCharacterVoList:Vector.<CharacterUU>;
	private var _numAoeCharacterVo:int;
	private function ____onSelectedUiAoeSkill( e:SelectedUiAoeSkillEvent ) : void {
		var gridId:int;
		var aoeInfo:Array;
		var i:int;
		var l:int;
		var characterView:CharacterUU;
		
		if (!_aoeCharacterVoList) {
			_aoeCharacterVoList = new <CharacterUU>[];
		}
		l = e.aoeGridIdList.length;
		while(i<l){
			gridId = e.aoeGridIdList[i++];
			characterView = getView(BattleModel.getVoByGridId(gridId));
			if (characterView && !characterView.vo.isFriend) {
				_aoeCharacterVoList[_numAoeCharacterVo++] = characterView;
				characterView.touchable = false;
			}
		}
		
		//Agony.getLog().simplify("[ Aoe Enemies Pre ]: {0}", _aoeCharacterVoList.length);
	}
	
	/**
	 * Null状态.
	 * 
	 * @param	e
	 */
	private function onNullSelectedUi(e:NullSelectedUiEvent):void{
		var i:int;
		var l:int;
		var coord:Point;
		var gridId:int;
		var gridIdList:Vector.<int>;
		var vo:CharacterVo;
		var characterView:CharacterUU;
		
		// 检查aoe.
		if (_numAoeCharacterVo > 0) {
			//Agony.getLog().simplify("[ Aoe Enemies Post ]: {0}", _aoeCharacterVoList.length);
			
			while (--_numAoeCharacterVo > -1) {
				characterView = _aoeCharacterVoList[_numAoeCharacterVo];
				characterView.touchable = true;
			}
			
			_numAoeCharacterVo = _aoeCharacterVoList.length = 0;
		}
		// 可被攻擊圖示.
		if(cachedAssaultableGridIdList){
			l = cachedAssaultableGridIdList.length;
			while(i<l){
				vo = BattleModel.getVoByGridId(cachedAssaultableGridIdList[i++]);
				vo.setInteractionFlag(CharacterVo.NONE);
			}
			
			
			cachedAssaultableGridIdList = null;
		}
		
		// 选中的人物特效消失.
		if (e.selectedVo) {
			characterView = getView(e.selectedVo);
			characterView.setSelectedUiState(CharacterVo.NONE);
		}
		
		// NULL视图.
		_uiFusion.killNodesAt();
	}
	
	private function onNextAction( e:ActionEvent ) : void {
		var vo:CharacterVo;
		var obj:CharacterUU;
		var debutAction:DebutAction;
		var movementAction:MovementAction;
		var czAction:ChongzhuangAction;
		var playCardAction:PlayCardAction;
		var effectView:NodeUU;
		var coord:Point;
		var oldCoord:Point;
		var view:CharacterUU;
		var voList:Vector.<CharacterVo>;
		var i:int;
		var l:int;
		
		_currAction = e.action;
		
		// 登場.
		if (_currAction is DebutAction) {
			debutAction = _currAction as DebutAction;
			
			vo = debutAction.vo;
			coord = BattleConfigurator.getCoordByPos2(debutAction.pos);
			
			obj = this.____toAddCharacter(vo, 0.65, 1.15, coord.x, coord.y);
			
			if (!BattleModel.isMyRound()) {
				this.emitCard(BattleRoleModel.getBattleRoleVo(vo.role_id).kingVo, obj);
			}
			
			// 判斷角色朝向.
			//obj.idle(BattleModel.getIdleDirection(vo.role_id));
			
			// 登场特效.
			this.showDebutHalo(coord.x, coord.y, 0.95);
			
		}
		
		// 移動.
		else if(_currAction is MovementAction) {
			movementAction = _currAction as MovementAction;
			_currPath = movementAction.movePath;
			this.____doMoveCharacter(movementAction.vo);
		}
		
		// 技能.
		else if(_currAction is SkillAction){
			this.____doFireSkill(_currAction as SkillAction);
		}
		
		// Buff.
		else if(_currAction is BuffAction){
			this.____doHandleBuff(_currAction as BuffAction);
		}
		
		// 回合结束.
		else if (_currAction is RequestEndRoundAction) {
			
		}
		
		// 下回合.
		else if(_currAction is NextRoundAction){
			BattleModel.resetAllStatus();
			
			// 重置全部人物状态.
			voList = BattleModel.cachedStatusResetVoList;
			if(voList){
				l = voList.length;
				while(i<l){
					view = _vo2ViewList[voList[i++]];
					view.updateValues();
				}
			}
			
			// 猜牌状态中.
			//if (GuessCard_StateUU.currState) {
				//(UUFacade.getWindow(GuessCard_StateUU).state as GuessCard_StateUU).finish();
			//}
		}
		
		// 消灭手牌.
		else if (_currAction is KillCardAction) {
			// 对方的.
			if (!PlayerModel.isMyRole(_currAction._roleId)) {
				this.____doKillCard(_currAction as KillCardAction);
			}
		}
		
		// 新卡片.
		else if (_currAction is NewCardAction) {
			if (!PlayerModel.isMyRole(_currAction.roleId)) {
				this.sendRivalCard(_currAction.roleId);
			}
		}
		// 援护.
		//else if (_currAction is YuanhuAction) {
			//this.doYuanhu();
		//}
		
		// 冲撞.
		else if (_currAction is ChongzhuangAction) {
			czAction = _currAction as ChongzhuangAction;
			
			view = getView(czAction.targetVo);
			coord = BattleConfigurator.getCoordByPos3(czAction.pos);
			//view.x = coord.x;
			//view.y = coord.y;
			
			_____doChongzhuang(view, getView(czAction.fromVo), coord);
		}
		
		else if (_currAction is PlayCardAction) {
			if (!PlayerModel.isMyRole(_currAction.roleId)) {
				playCardAction = _currAction as PlayCardAction;
				____doPlayCard(playCardAction.cardGuid, playCardAction.pos, playCardAction.roleId);
			}
		}
	}
	
	
	// 30009: 乾坤尺
	private function ____doPlayCard( cardGuid:int, pos:ChessPos, roleId:UInt64 ) : void {
		var cardId:int;
		
		cardId = cardGuid % 100000;
		if (cardId == 30009) {
			this.emitCard(BattleRoleModel.getBattleRoleVo(roleId).kingVo, getView(BattleModel.getVoByPos(pos.x, pos.y)));
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3", 1);
		}
	}
	
	private function sendRivalCard( roleId:UInt64 ):void {
		var card:ImageLoaderUU;
		var initX:Number;
		var kingView:CharacterUU;
		
		if (!isSendRivalCard) {
			TweenLite.delayedCall(ConfigBattle.CARD_POS_UPDATE_DURATION * 3.3, BattleModel.iterateNextAction);
			return;
		}
		
		initX = this.fusion.spaceWidth / 2;
		kingView = getView(BattleRoleModel.getBattleRoleVo(roleId).kingVo);
		card = new ImageLoaderUU;
		card.source = TResourceManager.getAsset("card/img/back_A.png");
		card.pivotX = card.spaceWidth * .5;
		card.pivotY = card.spaceHeight * .5;
		card.x = 480 + initX;
		card.y = 220;
		card.scaleX = card.scaleY = 0.33;
		this.fusion.addNode(card);
		//TweenLite.to(card, ConfigBattle.CARD_POS_UPDATE_DURATION * 3.5, { x:initX, y: this.fusion.spaceHeight / 2 - ConfigBattle.GRID_LOCATING_OFFSET_Y / 2, scaleX:1, scaleY:1, ease:Strong.easeOut, 
		TweenMax.to(card.displayObject, ConfigBattle.CARD_POS_UPDATE_DURATION * 1.8, { x:initX * Agony.getAdapter().pixelRatio, 
																					y: (this.fusion.spaceHeight / 2 - ConfigBattle.GRID_LOCATING_OFFSET_Y / 2) * Agony.getAdapter().pixelRatio, 
																					scaleX:1, 
																					scaleY:1, 
																					//ease:Cubic.easeOut, 
																					ease:Strong.easeOut, 
																					motionBlur: { strength:1, quality:1 },
		onComplete:function():void {
			//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/choupai.mp3");
			
			//TweenLite.to(card, ConfigBattle.CARD_POS_UPDATE_DURATION, { x:kingView.x, y:kingView.y, scaleX:0.03, scaleY:0.03, 
			TweenMax.to(card.displayObject, ConfigBattle.CARD_POS_UPDATE_DURATION * 1.5, { x:kingView.x * Agony.getAdapter().pixelRatio, 
																						y:(kingView.y - 11) * Agony.getAdapter().pixelRatio, 
																						scaleX:0.01, 
																						scaleY:0.01, 
																						rotation:270,
																						ease:Cubic.easeOut, 
																						motionBlur: { strength:1, quality:1 },
			onComplete:function():void {
				card.kill();
				BattleModel.iterateNextAction();
			}});
		}});
	}
	
	//private function doYuanhu( battleEffect:BattleEffect ):void {
		//
	//}
	
	public function ____doKillCard( action:KillCardAction ) : void {
		var cardView:CardUU;
		var initX:Number;
		var battleRole:BattleRoleVo;
		var kingView:CharacterUU;
		
		initX = this.fusion.spaceWidth / 2;
		kingView = getView(BattleRoleModel.getBattleRoleVo(action._roleId).kingVo);
		cardView = new CardUU;
		cardView.setCardId(action.battleEffect.effectValue);
		//card.source = TResourceManager.getAsset("card/img/back_A.png");
		cardView.pivotX = cardView.spaceWidth * .5;
		cardView.pivotY = cardView.spaceHeight * .5;
		cardView.x = kingView.x;
		cardView.y = kingView.y - 11;
		cardView.scaleX = cardView.scaleY = 0.06;
		this.fusion.addNode(cardView);
		
		TweenMax.to(cardView.displayObject, 0.5, { x:initX * Agony.getAdapter().pixelRatio, y:(this.fusion.spaceHeight / 2 - ConfigBattle.GRID_LOCATING_OFFSET_Y / 2) * Agony.getAdapter().pixelRatio, rotation:360, scaleX:0.88, scaleY:0.88, motionBlur: { strength:1, quality:1 },
			onComplete:function():void {
				TweenLite.delayedCall(0.5, function():void {
					SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
					showHit(initX, (fusion.spaceHeight / 2 - ConfigBattle.GRID_LOCATING_OFFSET_Y / 2), 2.6);
				})
				
				TweenLite.to(cardView, 1.0, { delay:0.5, alpha:0.03, scaleX:0.03, scaleY:0.03, ease:Back.easeIn, onComplete:function():void {
					SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
					
					battleRole = BattleRoleModel.getBattleRoleVo(action.roleId);
					battleRole.killCard2(cardView.userData);
					
					cardView.kill();
					
					BattleModel.iterateNextAction();
				}});
				
			}});
	}
	
	private function _____doChongzhuang( targetView:CharacterUU, fromView:CharacterUU, coord:Point ) : void {
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		
		showSkillName("冲撞", targetView.x, targetView.y, false);
		
		TweenMax.to(targetView.displayObject, 0.55, { x:coord.x * Agony.getAdapter().pixelRatio, 
												y:coord.y * Agony.getAdapter().pixelRatio, 
												//motionBlur: { strength:1.5, quality:1.5 },
												ease:Cubic.easeIn, 
												onComplete:function():void {
			BattleModel.iterateNextAction();
		}});
	}
	
	
	
	private function ____doFireSkill( v:SkillAction ) : void {
		var skillStateRef:Class;
		var skillView:StateFusionUU;
		var characterView:CharacterUU;
		
		//if(v.ret != 0){
			//GameModel.getLog().warning(this, "____doFireSkill", "技能釋放失敗.");
			//BattleModel.iterateNextAction();
			//return;
		//}
		skillStateRef = _skillStateList[v.skillId];
		
		// 非普通攻击，显示技能名称.
		if (v.skillId != 50000 && v.skillId != 0) {
			characterView = getView(v.fromVo);
			// 手动排除异常.
			// 服务器bug: 人已经死掉，但还会触发技能，例如 - 乾坤尺.
			if (!characterView) {
				BattleModel.iterateNextAction();
				return;
			}
			this.showSkillName(v.cfg.name, characterView.x, characterView.y, false);
		}
		
		if(!skillStateRef){
			Agony.getLog().simplify("\n\n\n×××××××××××××××××××××××××××××××××××××××××××××\n技能( {0}: {1} )尚未製作完成.\n×××××××××××××××××××××××××××××××××××××××××××××\n", v.skillId, SkillConfigurator.getSkillById(v.skillId).name);
			BattleModel.iterateNextAction();
		}
		// 釋放技能執行.
		else {
			//Agony.getLog().simplify("{1} 释放技能: [ {0} ].", SkillConfigurator.getSkillById(v.skillId).name, v.fromVo.name);
			
			Agony.getLog().simplify("[ SkillView數目 ]: {0}", _effectFusion.numNodes);
			
			skillView = new StateFusionUU;
			_effectFusion.addNode(skillView);
			skillView.setState(skillStateRef, [v]);
		}
	}
	
	
	private function ____doHandleBuff( v:BuffAction ) : void {
		var buffStateRef:Class;
		var battleBuff:BattleBuff;
		var buffView:StateFusionUU;
		var characterView:CharacterUU;
		var vo:CharacterVo;
		var buffCfg:BuffCfg;
		
		battleBuff = v.buff;
		buffStateRef = _buffStateList[battleBuff.buffId];
		if (!buffStateRef) {
			buffCfg = SkillConfigurator.getBuffById(battleBuff.buffId);
			Agony.getLog().simplify("Buff 尚未製作完成: [ {0} ({1}) ].", (buffCfg ? buffCfg.name : "???"), battleBuff.buffId);
			//BattleModel.iterateNextAction();
		}
		
		// buff執行.
		else {
			vo = v.targetVo;
			// 有可能已经死亡，但是server没判断...
			if (!vo) {
				return;
			}
			Agony.getLog().simplify("{2} " + (battleBuff.addOrRemove == 1 ? "加入" : "移除") + "buff: [ {0} ({1}) ].", SkillConfigurator.getBuffById(battleBuff.buffId).name, battleBuff.buffId, v.targetVo.name);
			
			characterView = getView(vo);
			
			// 加入
			if(battleBuff.addOrRemove == 1){
				characterView.addBuffView(v, buffStateRef);
				
				//DelayMachine.getInstance().delayedCall(0.1, function():void {
					SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3", 1, 0.75);
				//})
			}
			
			// 移除
			else {
				characterView.removeBuffView(battleBuff.buffId);
			}
		}
	}
	
	private function onRemoveBuff(e:BuffEvent):void {
		var characterView:CharacterUU;
		
		characterView = getView(e.vo);
		characterView.removeBuffView(e.buffId);
	}
	
	private function onGuessCards(e:GuessCardEvent):void {
		TweenLite.delayedCall(1.0, function():void {
			UUFacade.getWindow(GuessCard_StateUU).activate([e.guessCards, e.fromVo, e.targetVo]);
		});
	}
}
}