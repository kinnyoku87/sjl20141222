package models.battle
{
	import com.netease.protobuf.UInt64;
	import configs.battle.BattleConfigurator;
	import configs.cards.EquipmentCardCfg;
	import configs.skills.BuffCfg;
	import configs.skills.SkillConfigurator;
	import models.GameModel;
	import org.agony2d.flashApi.UUFacade;
	import proto.cs.BattleBuff;
	import utils.GameUtil;
	import views.UU.battle.Battle_active_StateUU;
	
	import flash.geom.Point;
	
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	
	import models.player.PlayerModel;
	
	import proto.cs.BattleEffect;
	
	
	// 戰鬥時的角色即時vo.
public class CharacterVo {
	
	
	// 10050: 杨戬.
	// 10059: 鼠精.
	// 10068: 戴礼.
	public static const SNEAK_CHARACTER_ID_LIST:Object = { 10050:true, 10059:true, 10068:true };
	
	
	///////////////////////////////////
	// Interact Flag
	///////////////////////////////////
	
	public static const NONE:int = 0;
	
	// 可選擇.
	public static const SELECTABLE:int = 0x01;
	
	// 可攻擊.
	public static const ASSAULT:int = 0x02;
	
	// 發生過移動.
	public static const MOVE_DIRTY:int = 0x04;
	
	// 选中.
	public static const SELECTED:int = 0x08;
	
	// 选中 & 發生過移動.
	public static const SELECTED_MOVE_DIRTY:int = 0x10;
	
	// 自己技能的目标.
	public static const TARGET:int = 0x20; // 可与SELECTABLE状态同时存在.
	
	
	
	////////////////////////////////////////
	// Members
	////////////////////////////////////////
	
	public var role_id:UInt64; // 屬於的角色.
	
	public var battleRole:BattleRoleVo;
	
	public var guid:UInt64;
	
	public var card_guid:int;
	
	public var hp:int;
	
	public var max_hp:int;
	
	public var attack:int;
	
	public var max_attack:int;
	
	public var move:int;
	
	// 经过各种buff后的移动力.
	public function getFinalMove() : int {
		// 异兽龙威...攻...
		// 异兽龙威2...受...
		// 定风珠2...
		if (this.buffIdMap[60017] || this.buffIdMap[60055]) {
			move = move > 2 ? 2 : move;
		}
		return move;
	}
	
	public var max_move:int;
	
/*	public function updateMaxMove() : void {
		// 玄马.
		if (this.buffIdMap[60029]) {
			if (cfg.movement < 3) {
				max_move = 3;
			}
		}
	}*/
	
	public function isSneaking() : Boolean {
		return (SNEAK_CHARACTER_ID_LIST[cfg.id] && !this.isSneakingBroken);
	}
	
	/**
	 * 是否為可攻擊目標.
	 */		
	public function isAssaultable() : Boolean {
		return (((battleRole.chairId % 2) == 0 && !BattleRoleModel.isEven) || ((battleRole.chairId % 2) == 1 && BattleRoleModel.isEven)) && !(SNEAK_CHARACTER_ID_LIST[cfg.id] && !this.isSneakingBroken);
	}
	
	public var buffs:Array; // BattleBuff.

	public var name:String;
	
	public var pos:Point; // 行列.
	
	public function get gridId() : int {
		return BattleConfigurator.posToGrid3(pos);
	}
	
	public var buffIdMap:Object = {}; // buffId : effectValue
	
	public var numBuff:int;
	
	private var _equip:EquipmentCardCfg;
	
	private var _equipCardguid:int;
	
	public var isKilled:Boolean;
	
	
	
	/** 是否為友方. */
	public function get isFriend() : Boolean {
		return PlayerModel.isMyRole(role_id);
	}
	
	/** 原始卡牌配置. */
	public var cfg:CharacterCardCfg;
	//public function get cfg() : CharacterCardCfg {
		//return CardConfigurator.getCardById(card_guid) as CharacterCardCfg;
	//}
	
	/**
	 * 更新數值.
	 *  
	 * @param effect
	 */		
	public function updateValue( effect:BattleEffect ) : void {
		var isChanged:Boolean;
		
		//isChanged = (this.attack != effect.attack || this.hp != effect.remainHp || this.move != effect.move);
		isChanged = (this.attack != effect.attack || this.hp != effect.remainHp);
		this.attack = effect.attack;
		this.hp = effect.remainHp;
		//this.move = effect.move;
		this.max_hp = effect.maxHp;
		if(isChanged){
			BattleModel.dispatchUpdateValue(this);
		}
	}
	
	public function updateValue2( effect:BattleBuff = null ) : void {
		var isChanged:Boolean;
		
		isChanged = (this.attack != effect.attack || this.hp != effect.remainHp || this.move != effect.move);
		//isChanged = (this.attack != effect.attack || this.hp != effect.remainHp);
		this.attack = effect.attack;
		this.hp = effect.remainHp;
		this.max_hp = effect.maxHp;
		this.move = effect.move;
		if(isChanged){
			BattleModel.dispatchUpdateValue(this);
		}
	}
	
	
	
	/** 上次可操作狀態. */
	public var oldInteractionFlag:int;
	/** 當前可操作狀態. */
	public var interactionFlag:int; // 是否可操作.
	
	public function setInteractionFlag( v:int ) : void {
		if(interactionFlag == v){
			return;
		}
		
		oldInteractionFlag = interactionFlag;
		interactionFlag = v;
		
		BattleModel.dispatchInteractionChanged(this);
	}
	
	public function setInteractionFlag2( v:int, addFlag:Boolean ) : void {
		if (addFlag) {
			v = interactionFlag | v;
		}
		else {
			v = interactionFlag & (~v);
		}
		if(interactionFlag == v){
			return;
		}
		
		oldInteractionFlag = interactionFlag;
		interactionFlag = v;
		
		BattleModel.dispatchInteractionChanged(this);
	}
	
	/**
	 *  獲取戰鬥角色vo.
	 */		
	public function getBattleRole() : BattleRoleVo {
		return BattleRoleModel.getBattleRoleVo(this.role_id);
	}
	
	/**
	 * 回合結束人物屬性重置.
	 *  
	 * @return 是否發生變化.
	 * 
	 */		
	public function resetStatusForRoundEnd() : Boolean {
		var changed:Boolean;
		//var cfg:CharacterCardCfg;
		
		//cfg = CardConfigurator.getCardById(this.card_guid) as CharacterCardCfg;
		
		// 王者不恢復生命.
		if(cfg.quality < 5){
			if(this.hp != this.max_hp){
				this.hp = this.max_hp;
				changed = true;
			}
		}
		
		// 攻击力.
		// 莫邪宝剑.
		if (this.buffIdMap[60058]) {
			if (this.max_attack < 4) {
				if (this.attack != 4) {
					changed = true;
				}
				this.attack = 4;
			}
		}
		else {
			if(max_attack != this.attack){
				this.attack = max_attack;
				changed = true;
			}
		}
		
		// 移动力.
		// 玄马.
		if (this.buffIdMap[60029]) {
			if (this.max_move < 3) {
				if (this.move != 3) {
					changed = true;
				}
				this.move = 3;
			}
		}
		else {
			if (this.move != max_move) {
				this.move = max_move;
				changed = true;
			}
		}
		return changed;
	}
	
	public function updateMove() : void {
		// 玄马.
		if (this.buffIdMap[60029]) {
			if (this.move < 3) {
				this.move = 3;
			}
		}
		else {
			if (this.move > this.cfg.movement) {
				this.move = this.cfg.movement;
			}
		}
	}
	
	/**
	 * 设定buff
	 * 
	 * @param	buffId
	 * @param	isAdded
	 * @param	data
	 */
	public function setBuff( buff:BattleBuff, isAdded:Boolean ) : void {
		if (isAdded) {
			if (!buffIdMap[buff.buffId]) {
				numBuff++;
			}
			buffIdMap[buff.buffId] = buff;
		}
		else {
			numBuff--;
			delete buffIdMap[buff.buffId];
			
			// 移除直接更新.
			this.updateValue2(buff);
		}
	}
	
	/**
	 * 自动移除回合结束时buff.
	 */
	public function autoRemoveRoundBuff( currRole:UInt64 ) : void {
		var v:BattleBuff;
		var buffCfg:BuffCfg;
		
		for each(v in buffIdMap) {
			buffCfg = SkillConfigurator.getBuffById(v.buffId);
			if (buffCfg && buffCfg.keepRounds == 0 && GameUtil.isUint64Equal(currRole, BattleModel.getVoByGuid(v.objectUid).role_id)) {
				numBuff--;
				delete buffIdMap[v.buffId];
				BattleModel.dispatchRemoveBuff(this, v.buffId);
			}
		}
	}
	
	
	public var isSneakingBroken:Boolean;
	
	
	public function checkSelectable() : Boolean {
		// 60008: 定身.
		if (buffIdMap[60008]) {
			return false;
		}
		return true;
	}
	
	/**
	 * 获取装备.
	 * @return
	 */
	public function getEquip() : EquipmentCardCfg {
		return _equip;
	}
	
	/**
	 * 设定装备
	 * @param	equipCardguid
	 */
	public function setEquip( equipCardguid:int ) : void {
		if (_equip) {
			BattleRoleModel.getBattleRoleVo(role_id).killCard(_equipCardguid);
		}
		if (equipCardguid <= 0) {
			_equip = null;
		}
		else {
			_equipCardguid = equipCardguid;
			_equip = CardConfigurator.getCardById(equipCardguid) as EquipmentCardCfg;
			
			// 装备文字提示.
			BattleModel.dispatchUpdateEquip(this);
		}
		
		GameModel.getLog().simplify("{0} 更新装备: [ {1} ]", this.name, _equip ? _equip.name : "NULL");
	}
	
	// 是否可穿越敌方.
	public function get allWalkable() :Boolean {
		// 飞行.
		return (buffIdMap[60006] != null && buffIdMap[60055] == null);
	}
	
	public function toString() : String {
		return this.name + this.pos;
	}

	
}
}