package models.battle {
	import com.netease.protobuf.UInt64;
	import configs.battle.BattleErrorValidator;
	import configs.cards.CardCfg;
	import configs.cards.CharacterCardCfg;
	import configs.cards.EquipmentCardCfg;
	import configs.cards.MagicCardCfg;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	import models.battle.actions.ChongzhuangAction;
	import models.battle.actions.KillCardAction;
	import models.events.BattleEvent;
	import models.events.GuessCardEvent;
	import models.events.SelectedUiAoeSkillEvent;
	import models.player.RoleVo;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.GuessCardNameNtf;
	import proto.cs.GuessCardNameResNtf;
	import views.UU.battle.Battle_active_StateUU;
	import views.UU.battle.BattleOverMask_StateUU;
	import views.UU.battle.GuessCard_StateUU;
	//import models.battle.actions.YuanhuAction;
	import models.events.BuffEvent;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.inputs.Touch;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.utils.getClassName;
	import proto.cs.BattleEffect;
	import proto.cs.BattleStatusNtf;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import configs.ConfigBattle;
	import configs.battle.BattleConfigurator;
	import configs.cards.CardConfigurator;
	import configs.skills.SkillCfg;
	import configs.skills.SkillConfigurator;
	
	import models.GameModel;
	import models.battle.actions.BattleAction;
	import models.battle.actions.BuffAction;
	import models.battle.actions.DebutAction;
	import models.battle.actions.RequestEndRoundAction;
	import models.battle.actions.MovementAction;
	import models.battle.actions.NewCardAction;
	import models.battle.actions.NextRoundAction;
	import models.battle.actions.PlayCardAction;
	import models.battle.actions.SkillAction;
	import models.events.ActionEvent;
	import models.events.CharacterEvent;
	import models.events.ControlEvent;
	import models.events.NullSelectedUiEvent;
	import models.events.SelectedUiChooseCharacterEvent;
	import models.events.SelectedUiHoverCardEvent;
	import models.player.PlayerModel;
	
	import net.NetManager;
	
	import org.agony2d.events.Notifier;
	
	import proto.cs.BattleBuff;
	import proto.cs.BoutBeginNtf;
	import proto.cs.BoutEndNtf;
	import proto.cs.ChessPos;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.SkillUseReq;
	import proto.cs.SkillUseRes;
	import proto.cs.UpdateMonsterNtf;
	
	import utils.GameUtil;
	
	// 每個guid對應一個vo.
public class BattleModel {
	
	
	//public static const autoMouseReset:Boolean = false;
	public static const autoMouseReset:Boolean = true;
	
	
	
	public static const CREATION:String = "creation";
	public static const MOVEMENT:String = "movement";
	public static const SELECTION:String = "selection";
	public static const TARGET:String = "target";
	
	public static var gridWidth:int;
	public static var gridHeight:int;
	
	
	public static var numGrids:int;
	
	public static var isRequestRoundOver:Boolean;
	
	public static var isWinner:Boolean;
	
	
	//50031  鼓舞
	//50076  定风珠
	//50077  八卦仙衣
	//50082  定身
	//50095  玄马
	//50096  杏黄旗
	//50123  天马
	//50124  见龙卸甲
	//50125  诛仙剑气
	//50127  乾坤尺
	//50129  莫邪宝剑
	//50138  定海珠
	//50167  天元狂流
	//50174  黑麒麟
	public static var equipAndMagicSkillIds:Object = { 50031:true, 50076:true, 50077:true, 50082:true, 50095:true, 50096:true, 50123:true, 50124:true, 50125:true, 50127:true, 50129:true, 50138:true, 50167:true, 50174:true};
	
	
	// 8015 人物的主动技能对其无效.
	// 8022 对方手牌为空.
	//public static var failSkillRet:Object = { 8015:true, 8022:true };
	
	/**
	 * 偵聽事件.
	 * 
	 * @param type
	 * @param listener
	 */		
	public static function addEventListener( type:String, listener:Function ) : void {
		_notifier.addEventListener(type, listener);
	}
	
	/**
	 * 移除偵聽.
	 * 
	 * @param type
	 * @param listener
	 */		
	public static function removeEventListener( type:String, listener:Function ) : void {
		_notifier.removeEventListener(type, listener);
	}
	
	/**
	 * 初期化.
	 */		
	public static function initialize( numGridsArg:int ) : void {
		if (!_notifier) {
			_notifier = new Notifier;
			//GameModel.getNotifier().addEventListener(BattleEvent.BATTLE_OVER,    ____onBattleOver, 11000);
			GameModel.getNotifier().addEventListener(BattleEvent.BATTLE_EXITING, ____onBattleExiting, 11000);
		}
		_grid2voMap = {};
		_roleId2MapVoMap = {};
		skillTargetList = new <CharacterVo>[];
		numGrids = numGridsArg;
	}
	
	private static var _winRoles:Array;
	
	public static function netBattleOver( v:Array ) : void {
		//g_notifier.dispatchEvent(new BattleEvent(BattleEvent.BATTLE_OVER));
		GameModel.getLog().simplify("比賽結束.");
		____doCheckBattleResult(v);
		_isBattleOver = true;
		isBattleStarted = false;
	}
	
	private static function ____doCheckBattleResult( winRoles:Array ):void {
		var roleVo:RoleVo;
		var i:int;
		var l:int;
		var roleId:UInt64;
		
		l = winRoles.length;
		while (i < l) {
			roleId = winRoles[i++];
			if (PlayerModel.isMyRole(roleId)) {
				isWinner = true;
				return;
			}
		}
		isWinner = false;
	}
	
	//private static function ____onBattleOver(e:BattleEvent):void {
		
	//}
	
	private static function ____onBattleExiting(e:BattleEvent):void {
		_notifier.removeAllListeners();
		GameModel.getDelay().killAll();
		_grid2voMap = null;
		_roleId2MapVoMap = null;
		skillTargetList = null;
		_isBattleOver = false
		_currRoleId = null;
		
	}
	
	
	
	/**
	 * 獲取人物空閒時的方向值.
	 *  
	 * @param roleId	Null代表是我方 (調試).
	 */		
	//private static const DIRECTION_FOR_CHAIR:Object = {0:8, 1:4, 2:2, 3:6};
	private static const DIRECTION_FOR_CHAIR:Object = {0:8, 1:2};
	
	public static function getIdleDirection( roleId:UInt64 = null ) : int {
		return DIRECTION_FOR_CHAIR[BattleRoleModel.getBattleRoleVo(roleId).chairId];
	}
	
	/**
	 * 杀死模型數據.
	 *  
	 * @param vo
	 */		
	public static function killVo( vo:CharacterVo ) : void {
		var gridId:int;
		
		// 更新卡牌.
		BattleRoleModel.getBattleRoleVo(vo.role_id).killCard(vo.card_guid);
		
		vo.isKilled = true;
		vo.setEquip(0);
		gridId = BattleConfigurator.posToGrid(vo.pos.x, vo.pos.y);
		delete _grid2voMap[gridId];
		delete (_roleId2MapVoMap[vo.role_id])[vo];
		
		MapModel.autoUpdatePathNodeWalkable(gridId);
		
		GameModel.getLog().simplify("!!!!!死亡({0}): [ {1} ].", vo.getBattleRole().roleVo.name, vo);
		
		_notifier.dispatchEvent(new CharacterEvent(CharacterEvent.KILL_CHARACTER, vo));
	}
	
	/**
	 * 查找可放置的格子列表.
	 */	
	//private static const POS_FOR_CHAIR:Object = {0:[2,4,8], 1:[], 2:[18, 22, 24], 3:[]};
	//private static const POS_FOR_CHAIR:Object = { 0:[3, 5, 10, 11, 12], 1:[38, 40, 45, 46, 47], 2:[], 3:[] };
	private static const POS_FOR_CHAIR:Object = { 0:[3, 5, 10, 11, 12], 1:[38, 39, 40, 45, 47], 2:[], 3:[] };
	private static var _cachedIdleGridIdList:Array;
	public static function getIdleGridIdList() : Array {
		var i:int;
		var l:int;
		var gridId:int;
		var gridIdList:Array;
		
		if(!_cachedIdleGridIdList){
			_cachedIdleGridIdList = [];
		}
		else{
			_cachedIdleGridIdList.length = 0;
		}
		
		
		
		gridIdList = POS_FOR_CHAIR[BattleRoleModel.getMyBattleRoleVo().chairId];
		
		//Agony.getLog().simplify("chairId: " + BattleRoleModel.getMyBattleRoleVo().chairId + " | " + gridIdList);
		
		l = gridIdList.length;
		while(i < l){
			gridId = gridIdList[i++];
			if(!getVoByGridId(gridId)){
				_cachedIdleGridIdList.push(gridId);
			}
		}
		return _cachedIdleGridIdList;
	}
	
	/**
	 * guid => gridId.
	 */		
	public static function getGridIdByGuid( guid:UInt64 ) : int {
		var gridId:*;
		
		if (int(guid) == 0) {
			return 0;
		}
		for (gridId in _grid2voMap){
			if(GameUtil.isUint64Equal(guid, (_grid2voMap[gridId] as CharacterVo).guid)){
				return gridId as int;
			}
		}
		
		return 0;
	}
	
	/**
	 * gridId => vo.
	 */
	public static function getVoByGridId( gridId:int ) : CharacterVo {
		return _grid2voMap[gridId];
	}
	
	/**
	 * pos => vo.
	 */
	public static function getVoByPos( posX:int, posY:int ) : CharacterVo {
		return _grid2voMap[BattleConfigurator.posToGrid(posX, posY)];
	}
	
	/**
	 * guid => vo.
	 */
	public static function getVoByGuid( guid:UInt64 ) : CharacterVo {
		return _grid2voMap[getGridIdByGuid(guid)];
	}
	
	
	
	//////////////////////////////////////////////////////
	// Character Of Role
	//////////////////////////////////////////////////////
	
	// 1v1状态下，可先做成[ 我方，友方，敌方 ]三种势力，这样可以先把友方写成我方来做，以后再做调整。
	
	/**
	 * 由角色id返回一個該角色擁有人物的列表.
	 */	
	public static function getVoListByRoleId( roleId:UInt64, exceptKing:Boolean = false ) : Vector.<CharacterVo> {
		var result:Vector.<CharacterVo>;
		var dict:Dictionary;
		var vo:*;
		
		result = new <CharacterVo>[];
		dict = _roleId2MapVoMap[roleId];
		for (vo in dict){
			if (!exceptKing || vo.cfg.quality < 5) {
				result.push(vo as CharacterVo);
			}
		}
		return result;
	}
	
	/**
	 * 我方全部人物.
	 * @return
	 */
	public static function getMyVoList( exceptKing:Boolean = false ) : Vector.<CharacterVo> {
		return getVoListByRoleId(BattleRoleModel.getMyBattleRoleVo().roleVo.id, exceptKing);
	}
	
	/**
	 * 友方和我方全部人物.
	 * @return
	 */
	public static function getAllFriendsVoList( exceptKing:Boolean = false ) : Vector.<CharacterVo> {
		//return getVoListByRoleId(BattleRoleModel.getMyBattleRoleVo().roleVo.id);
		var result:Vector.<CharacterVo>;
		var dict:Dictionary;
		var vo:CharacterVo;
		var battleRole:BattleRoleVo;
		var roleId:String;
		
		result = new <CharacterVo>[];
		for (roleId in _roleId2MapVoMap) {
			battleRole = BattleRoleModel.getBattleRoleVo(roleId);
			if (((battleRole.chairId % 2) == 0 && BattleRoleModel.isEven) || ((battleRole.chairId % 2) == 1 && !BattleRoleModel.isEven)) {
				dict = _roleId2MapVoMap[roleId];
				for (var v:* in dict) {
					vo = v as CharacterVo;
					if (!exceptKing || vo.cfg.quality < 5) {
						result.push(vo as CharacterVo);
					}
				}
			}
		}
		return result;
	}
	
	/**
	 * 敌方全部人物.
	 * @return
	 */
	public static function getRivalVoList() : Vector.<CharacterVo> {
		//var result:Vector.<CharacterVo>;
		//var dict:Dictionary;
		//var vo:CharacterVo;
		//
		//result = new <CharacterVo>[];
		//for each(vo in _grid2voMap) {
			//if (!PlayerModel.isMyRole(vo.role_id)) {
				//result.push(vo as CharacterVo);
			//}
		//}
		//return result;
		var result:Vector.<CharacterVo>;
		var dict:Dictionary;
		var vo:*;
		var battleRole:BattleRoleVo;
		var roleId:String;
		
		result = new <CharacterVo>[];
		for (roleId in _roleId2MapVoMap) {
			battleRole = BattleRoleModel.getBattleRoleVo(roleId);
			if (((battleRole.chairId % 2) == 0 && !BattleRoleModel.isEven) || ((battleRole.chairId % 2) == 1 && BattleRoleModel.isEven)) {
				dict = _roleId2MapVoMap[roleId];
				for (vo in dict){
					result.push(vo as CharacterVo);
				}
			}
		}
		return result;
	}
	
	public static function getAllVoList() : Vector.<CharacterVo> {
		var result:Vector.<CharacterVo>;
		var dict:Dictionary;
		var vo:CharacterVo;
		
		result = new <CharacterVo>[];
		for each(vo in _grid2voMap) {
			result.push(vo as CharacterVo);
		}
		return result;
	}
	
	//public static function getKing() : Vector.<CharacterVo> {
		//
	//}
	
	/**
	 * 是否為可攻擊目標.
	 */		
	public static function isAssaultable( vo:CharacterVo ) : Boolean {
		return !PlayerModel.isMyRole(vo.role_id) && vo.isSneaking();
	}
	
	/**
	 * 普通攻擊.
	 */		
	public static function commonAttack() : void {
		var msg:SkillUseReq;
		var vo:CharacterVo;
		
		vo = getVoByGridId(MapModel.cachedStartGridId);
		//vo.setInteractionFlag(CharacterVo.NONE);
		
		msg = new SkillUseReq;
		msg.fromGuid = vo.guid;
		msg.endGuid = getVoByGridId(MapModel.cachedAssaultGridId).guid;
		msg.skillId = 50000;
		msg.skillSource = BattleModel.skill_source = 0;
		NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_BATTTE_SKILL_USE_REQ, msg);
		
		MapModel.cachedAssaultGridId = 0;
	}
	
	public static function isMyRound() : Boolean {
		return _currRoleId && PlayerModel.isMyRole(_currRoleId);
	}
	
	public static function endRound() : void {
		var action1:RequestEndRoundAction;
		
		isRequestRoundOver = true;
		
		// + 进入下一回合動作.
		action1 = new RequestEndRoundAction(_currRoleId);
		____doQueueAction(action1);
	}
	
	// 重置全部人物状态.
	public static function resetAllStatus() : void {
		var vo:*;
		var len:int;
		
		// 重置生命值，移動力.
		if(!cachedStatusResetVoList){
			cachedStatusResetVoList = new <CharacterVo>[];
		}
		else {
			cachedStatusResetVoList.length = 0;
		}
		
		// 遍历全部人物，找到回合结束时有数值变化的vo.
		for each(vo in _grid2voMap){
			if(vo.resetStatusForRoundEnd()){
				cachedStatusResetVoList[len++] = vo;
			}
		}
	}
	
	
	
	//////////////////////////////////////////////////////////////////
	// 选中Ui状态效果.
	//////////////////////////////////////////////////////////////////
	
	// 1. 創建
	// 2. 移動
	// 3. 選中人物
	// 4. 技能目標
	
	// 可能的情況:
	
	// 1. 卡牌hover => 登場×法術×裝備 (單獨)
	// 2. 初次點選人物 => 移動×攻擊標識 (單獨)
	// 3. 初次點選人物 => 技能按鈕 => 技能目標
	
	// 滑动至卡牌.
	public static function setSelectedUiStateForHoverCard( cardId:int, gridIdList:Array ) : void {
		//setNullSelectedUiState();
		
		_notifier.dispatchEvent(new SelectedUiHoverCardEvent(SelectedUiHoverCardEvent.HOVER_CARD, gridIdList));
	}
	
	// 选择可行动的人物.
	public static function setSelectedUiStateForChooseCharacter( startGridId:int, numStep:int, isMoveDiry:Boolean ) : void {
		var pathGridIdList:Vector.<int>;
		var assaultGridIdList:Vector.<int>;
		var i:int;
		var l:int;
		var gridId:int;
		
		setNullSelectedUiState();
		
		
		MapModel.cachedStartGridId = startGridId;
		
		cachedSelectedVo = getVoByGridId(startGridId);
		
		// 飞行buff.
		//if (cachedSelectedVo.buffIdMap[60006]) {
			//MapModel.makePath(startGridId, numStep, true);
		//}
		//else {
			//MapModel.makePath(startGridId, numStep, false);
		//}
		MapModel.makePath(startGridId, numStep, cachedSelectedVo.allWalkable);
		
		pathGridIdList = MapModel.cachedResult_A;
		assaultGridIdList = MapModel.cachedResult_B;
		
		//BattleModel.setNullSelectedUiState();
		
//			trace(startGridId, numStep, " ---- ", gridIdList)
		_notifier.dispatchEvent(new SelectedUiChooseCharacterEvent(SelectedUiChooseCharacterEvent.CHOOSE_CHARACTER, pathGridIdList, startGridId, assaultGridIdList, isMoveDiry));
	}
	
	// 技能 (選中Ui狀態).
	public static function setSelectedUiStateFoSkill( skillTargetType:int, targetList:Vector.<CharacterVo>, aoeGridIdList:Vector.<int>, aoeSkillId:int ) : void {
		var vo:CharacterVo;
		var i:int;
		var l:int;
		
		skillTargetList = targetList;
		
		//自己.
		if (skillTargetType == 1) {
			l = skillTargetList.length;
			while (i < l) {
				vo = skillTargetList[i++];
				vo.setInteractionFlag2(CharacterVo.TARGET, true);
			}
		}
		
		//对方.
		else if (skillTargetType == 2) {
			l = skillTargetList.length;
			while (i < l) {
				vo = skillTargetList[i++];
				vo.setInteractionFlag2(CharacterVo.TARGET, true);
			}
		}
		
		// Aoe.
		else if (skillTargetType == 3) {
			//Agony.getLog().simplify(aoeGridIdList);
			
			
			_notifier.dispatchEvent(new SelectedUiAoeSkillEvent(SelectedUiAoeSkillEvent.AOE, aoeGridIdList, aoeSkillId));
		}
	}
	
	
	public static var cachedSelectedVo:CharacterVo;
	
	// 清除 (選中Ui狀態).
	public static function setNullSelectedUiState() : void {
		var i:int;
		var l:int;
		var vo:CharacterVo;
		
		// 技能指向目标列表.
		if (skillTargetList) {
			l = skillTargetList.length;
			while (i < l) {
				vo = skillTargetList[i++];
				vo.setInteractionFlag2(CharacterVo.TARGET, false);
			}
			skillTargetList = null;
			
		}
		
		_notifier.dispatchEvent(new NullSelectedUiEvent(NullSelectedUiEvent.NULL_SELECTED, cachedSelectedVo));
		cachedSelectedVo = null;
	}
	
	
	
	
	
	/////////////////////////////////////////////////
	// Server
	/////////////////////////////////////////////////
	
	/**
	 * 開始戰鬥.
	 */		
	public static function netStartBattle() : void {
		GameModel.getLog().simplify("開始戰鬥 !!!");
		
		
		isBattleStarted = true;
	}
	
	/**
	 * 更新角色卡牌 (沒有則創建)
	 */		
	public static function netUpdateCharacter( v:UpdateMonsterNtf ) : void {
		var vo:CharacterVo;
		
		vo          =  new CharacterVo;
		vo.card_guid  =  v.cardId;
		vo.guid     =  v.guid;
		vo.role_id  =  v.roleId;
		vo.battleRole = BattleRoleModel.getBattleRoleVo(vo.role_id);
		vo.name     =  CardConfigurator.getCardById(v.cardId % 100000).name;
		vo.cfg      =  CardConfigurator.getCardById(vo.card_guid) as CharacterCardCfg;
		
		vo.hp       =  v.hp;
		vo.max_hp   =  v.maxHp;
		vo.attack   =  vo.max_attack = v.attack;
		vo.move     =  vo.max_move = v.move;
		vo.pos      =  new Point(v.chessPos.x, v.chessPos.y);
		
		// + 登場動作.
		var action:DebutAction;
		
		action = new DebutAction(v.roleId);
		action.vo = vo;
		action.pos = v.chessPos;
		____doQueueAction(action);
	}
	
	/**
	 * 出牌.
	 */		
	public static function netPlayCard( cardId:int, pos:ChessPos, remain_Mp:int, roleId:UInt64 ) : void {
		// + 出牌動作.
		var action:PlayCardAction;
		
		// 排除释放失败技能.
		if (BattleErrorValidator.isWarning()) {
			(UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU).showBattleWarning(BattleErrorValidator.toWarning());
			BattleErrorValidator.ret = 0;
			
			// 自己的回合，則操作狀態恢復.
			dispatchMyControlChanged(true);
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
			return;
		}
		action = new PlayCardAction(roleId);
		action.cardGuid = cardId;
		action.pos = pos;
		action.remainMp = remain_Mp;
		____doQueueAction(action);
	}
	
	/**
	 * 當前回合結束. 
	 */		
	public static function netEndRound(v:BoutEndNtf):void{
		GameModel.getLog().simplify("玩家回合結束: [ {0} ]\n", BattleRoleModel.getBattleRoleVo(v.roleId).roleVo.name);
	}
	
	// 下一轮卡牌数目，没有则直接操作 (否则，CardGroup将不会重置).
	public static var numCardsNextRound:int;
	
	/**
	 * 下一回合開始.
	 */		
	public static function netNextRound(v:BoutBeginNtf) : void {
		var action1:NextRoundAction;
		
		// + 进入下一回合動作.
		action1 = new NextRoundAction(v.roleId);
		action1.cardCount = numCardsNextRound = v.cardCount;
		____doQueueAction(action1);
		
		// + 新卡牌動作.
		var i:int;
		var l:int;
		
		while(i<numCardsNextRound){
			var action2:NewCardAction;
			
			action2 = new NewCardAction(v.roleId);
			if (v.cardIds[i]) {
				action2.cardId = v.cardIds[i];
			}
			i++;
			____doQueueAction(action2);
		}
		
		// 检查是否猜牌状态中.
		if (GuessCard_StateUU.currState) {
			(UUFacade.getWindow(GuessCard_StateUU).state as GuessCard_StateUU).checkFinish();
		}
	}
	
	/**
	 * 移動人物.
	 *  
	 * @param guid
	 * @param movePath
	 * 
	 */		
	public static function netMoveCharacter( guid:UInt64, movePath:Array, roleId:UInt64 ) : void {
		//var vo:CharacterVo;
		//var gridId:int;
		//var numStep:int;
		
		//gridId = getGridIdByGuid(guid);
		//vo = getVoByGridId(gridId);
		//numStep = movePath.length;
		
		// + 移動動作.
		var action:MovementAction;
		
		action = new MovementAction(roleId);
		//action.vo = vo;
		action.objectGuid = guid;
		action.movePath = movePath;
		____doQueueAction(action);
	}
	
	/**
	 * 发动技能
	 * 
	 * @param	v
	 */
	public static function netFireSkill( v:SkillUseRes ) : void {
		var action:SkillAction;
		var buffAction:BuffAction;
		var i:int;
		var l:int;
		var battleBuff:BattleBuff;
		var fromVo:CharacterVo;
		var skillId:int;
		var effects:Array;
		var battleEffect:BattleEffect;
		var action2:NewCardAction;
		var action4:KillCardAction;
		var action5:ChongzhuangAction;
		//var action3:YuanhuAction;
		var targetVo:CharacterVo;
		var effectId:int;
		
		// + 技能動作，释放人物存在.
		if (v.skillId > 0) {
			// 排除释放失败技能.
			if (BattleErrorValidator.isWarning()) {
				(UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU).showBattleWarning(BattleErrorValidator.toWarning());
				BattleErrorValidator.ret = 0;
				
				// 自己的回合，則操作狀態恢復.
				dispatchMyControlChanged(true);
				
				SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
				return;
			}
			//action = new SkillAction(getVoByGuid(v.fromGuid).role_id);
			action = new SkillAction();
			action.skillId = skillId = v.skillId;
			action.effects = v.effects;
			action.fromGuid = v.fromGuid;
			action.costMp = v.costMp;
			action.endGuid = v.endGuid;
			action.endPos = v.endChessPos;
			____doQueueAction(action);
			
			// 释放的人物不再可操作.
			fromVo = v.fromGuid ? getVoByGuid(v.fromGuid) : null;
			
			// 排除装备 and 法术技能.
			if (fromVo && !equipAndMagicSkillIds[skillId]) {
				// 排除释放失败技能.
				//if (!failSkillRet[BattleErrorValidator.ret]) {
					fromVo.setInteractionFlag(CharacterVo.NONE);
				//}
				//else {
					//BattleErrorValidator.ret = 0;
				//}
			}
		}
		// 更新人物状态 (例如没有手牌时，王掉血).
		else {
			if (v.effects.length > 0) {
				action = new SkillAction();
				action.skillId = v.skillId;
				action.effects = v.effects;
				
				____doQueueAction(action);
			}
		}
		
		// + Buff动作.
		l = v.buffs.length;
		while(i<l){
			battleBuff = v.buffs[i++];
			buffAction = new BuffAction(_currRoleId);
			//buffAction.targetVo = getVoByGuid(battleBuff.objectUid);
			buffAction.buff = battleBuff;
			
			____doQueueAction(buffAction);
		}
		
		// 将特殊BattleEffect单独作为Action.
		effects = v.effects;
		l = effects.length;
		while (--l > -1) {
			battleEffect = effects[l];
			effectId = battleEffect.effectId;
			
			// + 摸牌动作.
			if (effectId == 5) {
				effects.splice(l, 1);
				
				// 天元狂流.
				if (skillId == 50167) {
					tianyuanCount++;
				}
				
				action2 = new NewCardAction(getVoByGuid(battleEffect.objectUid).role_id);
				action2.cardId = battleEffect.effectValue;
				
				// [ 撒豆成兵 ]的摸牌永远最初执行 (否则会出现卡牌不存在的隐患).
				if (skillId == 50016) {
					____doQueueAction(action2, true);
				}
				else {
					____doQueueAction(action2);
				}
			}
			// 援护，伤害转移.
			//else if (effectId == 7) {
				//action3 = new YuanhuAction(getVoByGuid(battleEffect.objectUid).role_id);
				//action3.battleEffect = battleEffect;
				//____doQueueAction(action3);
			//}
			
			
			// + 消灭手牌动作.
			else if (effectId == 21) {
				effects.splice(l, 1);
				
				action4 = new KillCardAction(getVoByGuid(battleEffect.objectUid).role_id);
				action4.battleEffect = battleEffect;
				
				____doQueueAction(action4);
			}
			
			// + 冲撞动作.
			else if (effectId == 22) {
				effects.splice(l, 1);
				
				targetVo = getVoByGuid(battleEffect.objectUid);
				action5 = new ChongzhuangAction(targetVo.role_id);
				action5.fromVo = getVoByGuid(battleEffect.fromUid);
				action5.targetVo = targetVo;
				action5.pos = new Point(battleEffect.effectValue >> 16, battleEffect.effectValue & 0xFFFF);
				
				____doQueueAction(action5);
			}
		}
	}
	
	/**
	 * Buff状态变化
	 * 
	 * @param	v
	 */
	public static function netBuffChange(v:BattleStatusNtf):void {
		var action:SkillAction;
		var buffAction:BuffAction;
		var i:int;
		var l:int;
		var battleBuff:BattleBuff;
		
		// 自动技能.
		
		// + 技能動作.
/*		if (v.skillId > 0) {
			//action = new SkillAction(v.fromRoleId);
			action = new SkillAction();
			action.skillId = v.skillId;
			action.effects = v.effects;
			//action.fromVo = getVoByGuid(v.fromGuid);
			action.costMp = v.costMp;
		}*/
		
		// + Buff动作.
		l = v.buffs.length;
		while(i<l){
			battleBuff = v.buffs[i++];
			buffAction = new BuffAction(battleBuff.fromRoleId);
			//buffAction.targetVo = getVoByGuid(battleBuff.objectUid);
			buffAction.buff = battleBuff;
			
			____doQueueAction(buffAction);
		}
	}
	
	/**
	 * 准备猜卡牌.
	 * 
	 * @param	v
	 */
	public static function netGressCardName( v:GuessCardNameNtf ) : void {
		var evt:GuessCardEvent;
		
		evt = new GuessCardEvent(GuessCardEvent.GUESS_CARDS, v.guessCards, getVoByGuid(v.fromId), getVoByGuid(v.targetId));
		_notifier.dispatchEvent(evt);
		
		//trace("netGressCardName");
		
	}
	
	/**
	 * 猜开始结果.
	 * 
	 * @param	v
	 */
	public static function netGressCardNameRes( v:GuessCardNameResNtf ) : void {
		var evt:GuessCardEvent;
		
		evt = new GuessCardEvent(GuessCardEvent.GUESS_CARDS_RES, v.guessCardList, getVoByGuid(v.fromId), getVoByGuid(v.targetId));
		evt.realCardId = v.realCardId;
		evt.isRight = v.isRight;
		evt.guessCardId = v.guessCardId;
		_notifier.dispatchEvent(evt);
		
		//trace("netGressCardNameRes");
	}
	
	
	
	
	//////////////////////////////////////////////////////////
	// Queue
	//////////////////////////////////////////////////////////
	
	/**
	 * 迭代下一動作.
	 * 
	 * @return	true表示存在下一個迭代
	 */		
	private static var cachedTouchList:Vector.<Touch>;
	public static function iterateNextAction() : void {
		var touch:Touch;
		
		GameModel.getLog().simplify("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Iterate Next Action: [ {0} ]", getClassName(_oldAction));
		
		// 间接动作.
		if(hasIndirectAction){
			hasIndirectAction = _isActionExcuting = false;
		}
		// 动作队列执行完成.
		else if (_actionList.length == 0) {
			if (!_isActionExcuting) {
				GameModel.getLog().error("BattleModel", "iterateNextAction", "迭代错误.");
			}
			_isActionExcuting = false;
			
			if(_currRoleId && PlayerModel.isMyRole(_currRoleId)){
				// 自己的回合，則操作狀態恢復.
				dispatchMyControlChanged(true);
				
				// 动作完成后，滑鼠自動重置.
				if (autoMouseReset) {
					if (!cachedTouchList) {
						cachedTouchList = new <Touch>[];
					}
					touch = TouchManager.getInstance().getTouchList(cachedTouchList)[0];
					if (touch.isReleaseState) {
						touch.move(8888, 8888);
						touch.move(touch.prevRootX, touch.prevRootY);
					}
				}
			}
			if (_isBattleOver) {
				GameModel.getLog().simplify("[ 我方是胜利者 ]: {0}", isWinner);
				
				UUFacade.getWindow(BattleOverMask_StateUU).activate([function():void {
					GameModel.getNotifier().dispatchEvent(new BattleEvent(BattleEvent.BATTLE_OVER));
				}]);
			}
		}
		else {
			_oldAction = _actionList.shift();
			____doExecDispatchNextAction(_oldAction);
		}
		
		
	}
	private static var _oldAction:BattleAction;
	
	
	
	////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////
	
	public static var initCards:Array;
	public static var loadCards:Array;
	public static var cachedStatusResetVoList:Vector.<CharacterVo>
	
	// 有過移動的人物.
	public static var cachedMoveDirtyVo:CharacterVo;
	
	public static var remainMp:int;
	
	public static var hasIndirectAction:Boolean; // 是否存在间接动作，一旦存在动作，动作列表需要等待间接动作先触发.
	
	
	
	///////////////////////////////////////
	// Skill
	///////////////////////////////////////
	
	public static var skillTargetList:Vector.<CharacterVo>
	
	public static var skillId:int;
	
	//public static var from_guid:UInt64;
	public static var skillCharacterVo:CharacterVo;
	
	public static var skill_source:int; // 技能来源:0人物,1装备,2卡牌
	
	public static var cardGuid:uint;
	
	
	///////////////////////////////////////
	// members
	///////////////////////////////////////
	
	private static var _grid2voMap:Object // gridId: 人物vo
	
	private static var _roleId2MapVoMap:Object; // roleId: (<人物vo>: bool)
	
	private static var _notifier:Notifier;
	
	private static var _isStarted:Boolean;
	
	
	
	////////////////////////////////
	// Battle Actions
	////////////////////////////////
	
	private static var _actionList:Vector.<BattleAction>; // 动作列表.
	
	private static var _isActionExcuting:Boolean; // 是否動作執行中.
	
	private static var _currRoleId:UInt64; // 當前回合的角色id.
	
	public static var isBattleStarted:Boolean;
	private static var _isBattleOver:Boolean; // 是否战斗结束.
	
	
	
	/**
	 * 將動作加入隊列. 
	 * 
	 * @param action
	 * @param useQueue 為false的話，直接執行動作.
	 * 
	 */		
	private static function ____doQueueAction( action:BattleAction, highPriority:Boolean = false ) : void {
		var battleRoleVo:BattleRoleVo;
		
		// 战斗结束，关闭队列.
		if (_isBattleOver) {
			return;
		}
		
		if(cachedMoveDirtyVo){
			if(!(action is MovementAction) || (action as MovementAction).vo != cachedMoveDirtyVo){
				cachedMoveDirtyVo.setInteractionFlag(CharacterVo.NONE);
				cachedMoveDirtyVo = null;
			}
		}
		
		battleRoleVo = BattleRoleModel.getBattleRoleVo(action.roleId);
		GameModel.getLog().simplify("+++++ ({0}) 加入動作隊列( {2} ): {1}\n", battleRoleVo ? battleRoleVo.roleVo.name : "???", action, _actionList ? _actionList.length + 1: 1);
		
		if(!_actionList){
			_actionList = new <BattleAction>[];
		}
		// 啟動隊列.
		 if(!_isActionExcuting){
			_isActionExcuting = true;
			
			// 自己的回合，則操作狀態無效.
			if(_currRoleId && PlayerModel.isMyRole(_currRoleId)){
				dispatchMyControlChanged(false);
			}
			
			//Agony.getFrame().addEventListener(AEvent.COMPLETE, ____doPostExec);
			____doExecDispatchNextAction(action);
		}
		// 加入隊列，等待執行.
		else {
			if (highPriority) {
				_actionList.unshift(action);
			}
			else {
				_actionList.push(action);
			}
		}
	}
	
	//private static function ____doPostExec( e:AEvent ) : void {
		//Agony.getFrame().removeEventListener(AEvent.COMPLETE, ____doPostExec);
		//____doExecDispatchNextAction(action);
		//iterateNextAction();
	//}
	
	//public static function getCurrRoundRole() : BattleRoleVo {
		//return BattleRoleModel.getBattleRoleVo(_currRoleId);
	//}
	
	
	// 檢查是否有移動過的人物，操作狀態變為NULL.
	//private static function ____doCheckMoveDirty() : void {
		//if(cachedMoveDirtyVo){
			//if(!(action is MovementAction) || (action as MovementAction).vo != cachedMoveDirtyVo){
				//cachedMoveDirtyVo.setInteractionFlag(CharacterVo.NONE);
				//cachedMoveDirtyVo = null;
			//}
		//}
	//}
	
	public static var tianyuanCount:int; // 天元的摸牌计数.
	
	/**
	 * 執行觸發下一動作.
	 * 
	 * @param action 
	 */		
	private static function ____doExecDispatchNextAction( action:BattleAction ) : void {
		var movePath:Array;
		var startGridId:int;
		var endGridId:int;
		var moveAction:MovementAction;
		var debutAction:DebutAction;
		var playCardAction:PlayCardAction;
		var buffAction:BuffAction;
		var czAction:ChongzhuangAction;
		var immediateIterateNext:Boolean;
		var vo:CharacterVo;
		var len:int;
		var AY:Vector.<CharacterVo>;
		var battleRoleVo:BattleRoleVo;
		var currRoundBattleRoleVo:BattleRoleVo;
		var cardCfg:CardCfg;
		
		battleRoleVo = BattleRoleModel.getBattleRoleVo(action.roleId);
		currRoundBattleRoleVo = BattleRoleModel.getBattleRoleVo(_currRoleId);
		//GameModel.getLog().message("执行战斗队列", "====> [ {0} ]: Next戰鬥動作( {2} ): {1}\n", battleRoleVo ? battleRoleVo.roleVo.name : "???", action, _actionList.length);
		GameModel.getLog().message("执行战斗队列", "====> ({3}) [ {0} ]: Next戰鬥動作( {2} ): {1}\n", battleRoleVo ? battleRoleVo.roleVo.name : "???", action, _actionList.length, currRoundBattleRoleVo ? currRoundBattleRoleVo.roleVo.name : "Null");
		
		// 檢查是否有移動過的人物，操作狀態變為NULL.
		//if(cachedMoveDirtyVo){
			//if(!(action is MovementAction) || (action as MovementAction).vo != cachedMoveDirtyVo){
				//cachedMoveDirtyVo.setInteractionFlag(CharacterVo.NONE);
				//cachedMoveDirtyVo = null;
			//}
		//}
		
		//____doCheckMoveDirty();
		
		// Action - 移动
		if (action is MovementAction) {
			moveAction = action as MovementAction;
			// 更新vo grid(pos).
			movePath = moveAction.movePath;
			
			moveAction.vo.move -= movePath.length - 1;
			dispatchUpdateValue(moveAction.vo);
			
			startGridId = BattleConfigurator.posToGrid2(movePath[0]);
			endGridId = BattleConfigurator.posToGrid2(movePath[movePath.length - 1]);
			____doUpdatePos(startGridId, endGridId);
			
			// 尋路數據.
			MapModel.autoUpdatePathNodeWalkable(startGridId);
			MapModel.autoUpdatePathNodeWalkable(endGridId);
			
			// 為自己的回合時，交互狀態變化.
			if(PlayerModel.isMyRole(_currRoleId)){
				BattleModel.cachedMoveDirtyVo = moveAction.vo;
				BattleModel.cachedMoveDirtyVo.setInteractionFlag(CharacterVo.MOVE_DIRTY);
			}
		}
		
		// Action - 登场
		else if (action is DebutAction) {
			debutAction = action as DebutAction;
			startGridId = BattleConfigurator.posToGrid2(debutAction.pos);
			
			// 將vo放置于model的行列上.
			_grid2voMap[startGridId] = debutAction.vo;
			// 編隊.
			(((_roleId2MapVoMap ||= {})[action.roleId]) ||= new Dictionary)[debutAction.vo] = true;
			
			// 尋路數據.
			MapModel.autoUpdatePathNodeWalkable(startGridId);
			
			// 如果没有开始，初期化王.
			if (!isBattleStarted) {
				battleRoleVo = BattleRoleModel.getBattleRoleVo(debutAction.vo.role_id);
				battleRoleVo.kingGuid = debutAction.vo.guid;
			}
			else {
				// 更新卡牌.
				BattleRoleModel.getBattleRoleVo(action.roleId).playCard(false);
			}
		}
		
		// Action - 新卡牌
		else if(action is NewCardAction){
			//immediateIterateNext = true;
			
			
			BattleRoleModel.getBattleRoleVo(action.roleId).newCard();
			
			// 天元狂流.
			if (tianyuanCount > 0) {
				if (--tianyuanCount == 0) {
					GameModel.getNotifier().dispatchDirectEvent("tianyuan");
				}
			}
		}
		
		// Action - 出牌
		else if(action is PlayCardAction) {
			playCardAction = action as PlayCardAction;
			cardCfg = CardConfigurator.getCardById(playCardAction.cardGuid % 100000);
			
			// 法术.
			if (cardCfg is MagicCardCfg) {
				BattleRoleModel.getBattleRoleVo(action.roleId).playCard(true, playCardAction.cardGuid);
			}
			// 装备.
			else if (cardCfg is EquipmentCardCfg) {
				BattleRoleModel.getBattleRoleVo(action.roleId).playCard(false, playCardAction.cardGuid);
				getVoByGridId(BattleConfigurator.posToGrid2(playCardAction.pos)).setEquip(playCardAction.cardGuid);
			}
			//else {
				//immediateIterateNext = true;
			//}
			// 天元狂流.
			//if (cardCfg.id == 20044) {
				//GameModel.getNotifier().dispatchDirectEvent("tianyuan");
				//isTianyuanCount = 
			//}
			
			// 更新法力.
			remainMp = playCardAction.remainMp;
			
			//trace("Net更新法力 ", playCardAction.remainMp);
		}
		
		// Action - 下一回合.
		else if (action is RequestEndRoundAction) {
			GameModel.getLog().simplify("\n===================================================\n回合結束({0}).", BattleRoleModel.getBattleRoleVo(_currRoleId).roleVo.name);
			
			// 如果為自己方，變為不可操作.
			if(PlayerModel.isMyRole(_currRoleId)){
				AY = getVoListByRoleId(_currRoleId);
				len = AY.length;
				while(--len>-1){
					vo = AY[len];
					vo.setInteractionFlag(CharacterVo.NONE);
				}
				
				setNullSelectedUiState();
			}
			
			immediateIterateNext = true;
			
			NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_BOUT_END_REQ, null);
		}
		
		// Action - 下一回合.
		else if (action is NextRoundAction) {
			// 当没有手牌王掉血结束时，在接收战斗结束消息之前，会先接收到一个下一回合的消息...
			if (_isBattleOver) {
				iterateNextAction();
				return;
			}
			// 如果為自己方，且被动结束回合，變為不可操作.
			if(!isRequestRoundOver){
				AY = getVoListByRoleId(_currRoleId);
				len = AY.length;
				while(--len>-1){
					vo = AY[len];
					vo.setInteractionFlag(CharacterVo.NONE);
				}
				
				setNullSelectedUiState();
			}
			else {
				isRequestRoundOver = false;
			}
			
			// 清除一回合buff.
			for each(vo in _grid2voMap) {
				vo.autoRemoveRoundBuff(_currRoleId);
			}
			
			// 下一回合.
			_currRoleId = action.roleId;
			remainMp = ConfigBattle.INIT_MANA_FOR_ROUND;
			
			
			GameModel.getLog().simplify("\n===================================================\n" + action);
			
			
			// 如果是我方回合，恢复为可操作.
			if(PlayerModel.isMyRole(_currRoleId)){
				AY = getVoListByRoleId(_currRoleId);
				len = AY.length;
				while(--len>-1){
					vo = AY[len];
					// 检查是否存在定身等buff
					//if (vo.checkSelectable()) {
						vo.setInteractionFlag(CharacterVo.SELECTABLE);
					//}
					
				}
			}
			
			numCardsNextRound = (action as NextRoundAction).cardCount;
			
			immediateIterateNext = true;
		}
		
		// Action - 技能
		else if (action is SkillAction) {
			// 消耗法力.
			remainMp -= (action as SkillAction).costMp;
		}
		
		// Action - Buff.
		else if(action is BuffAction){
			buffAction = action as BuffAction;
			
			// 设定buff，有可能已经死亡，但是server没判断...
			vo = buffAction.targetVo;
			if (vo) {
				vo.setBuff(buffAction.buff, buffAction.buff.addOrRemove == 1);
			}
			
			// Buff动作没有"过程"
			immediateIterateNext = true;
		}
		
		// 冲撞.
		else if (action is ChongzhuangAction) {
			czAction = action as ChongzhuangAction;
			startGridId = BattleConfigurator.posToGrid3(czAction.targetVo.pos);
			endGridId = BattleConfigurator.posToGrid3(czAction.pos);
			____doUpdatePos(startGridId, endGridId);
			
			// 尋路數據.
			MapModel.autoUpdatePathNodeWalkable(startGridId);
			MapModel.autoUpdatePathNodeWalkable(endGridId);
		}
		
		// Action - Kill card.
		//else if (action is KillCardAction) {
			//if (PlayerModel.isMyRole(_currRoleId)) {
				//
			//}
		//}
		
		// 执行动作.
		_notifier.dispatchEvent(new ActionEvent(ActionEvent.NEXT_ACTION, action));
		
		if (immediateIterateNext) {
			iterateNextAction();
		}
	}
	
	// 位置的移動只能由服務器決定.
	public static function ____doUpdatePos( beginGridId:int, endGridId:int ) : void {
		var vo:CharacterVo;
		
		vo = _grid2voMap[beginGridId];
		delete _grid2voMap[beginGridId];
		_grid2voMap[endGridId] = vo;
		vo.pos = BattleConfigurator.gridToPos(endGridId);
		
		//GameModel.getLog().simplify("更新vo({0}) grid: {1} -> {2}.", vo.name, beginGridId, endGridId);
	}
	
	/**
	 * 觸發更新vo數據.
	 *  
	 * @param vo
	 */		
	public static function dispatchUpdateValue( vo:CharacterVo ) : void {
		_notifier.dispatchEvent(new CharacterEvent(CharacterEvent.UPDATE_VALUES, vo));
	}
	
	/**
	 * 觸發更新vo行動狀態.
	 * 
	 * @param vo
	 */		
	public static function dispatchInteractionChanged( vo:CharacterVo ) : void {
		_notifier.dispatchEvent(new CharacterEvent(CharacterEvent.INTERACTION_CHANGED, vo));
	}
	
	public static var isCharacterControllable:Boolean;
	
	public static function dispatchMyControlChanged( isControllable:Boolean ) : void {
		//if (isControlable) {
			//Agony.getLog().simplify("[ 己方操作开始 ]: !!");
		//}
		isCharacterControllable = isControllable;
		
		_notifier.dispatchEvent(new ControlEvent(ControlEvent.CONTROL_CHANGE, isControllable));
		
		
		
		//GameModel.getLog().simplify("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%..." + isControlable)
	}
	
	public static function dispatchRemoveBuff( vo:CharacterVo, buffId:int ) : void {
		_notifier.dispatchEvent(new BuffEvent(BuffEvent.REMOVE_BUFF, vo, buffId));
	}
	
	public static function dispatchUpdateEquip( vo:CharacterVo ) : void {
		_notifier.dispatchEvent(new CharacterEvent(CharacterEvent.UPDATE_EQUIP, vo));
	}
}
}