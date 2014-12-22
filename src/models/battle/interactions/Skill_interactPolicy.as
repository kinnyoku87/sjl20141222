package models.battle.interactions {
	import configs.cards.CardCfg;
	import configs.skills.SkillCfg;
	import configs.skills.SkillConfigurator;
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import views.UU.battle.Battle_active_StateUU;
	
	//无施放目标=0
	//己方全部人物=1
	//敌方全部人物=2
	//我方王=3
	//敌方王=4
	//用户头像=5
	//选择任意格子=6
	//场上所有人物=7
	//技能作用区域内所有人物=8
	//己方人物(非王)=9
	//敌方全部(非王)=10
	//选择手牌=11
	//敌方神或仙=12
	//受过伤的人=13
	//男性=14
	//自己=15
	//某方场上全部人物=16
	//己方和友方全部人物=17
	//场上全部王者=18
	//场上所有人物(非王)=19
public class Skill_interactPolicy extends InteractPolicy {
	
	// 所有敌方，2-3
	// 50004: 射击.
	// 50007: 精准射击.
	// 50009: 火龙毒镖.
	// 50017: 混元宝珠.
	// 50078: 乾坤弓.
	// 50098: 二龙剑.
	// 50137: 太阳金针.
	private static const allRival_2_3:Object = { 50004:true, 50007:true, 50009:true, 50017:true, 50078:true, 50098:true, 50137:true };
	
	// 显示各种技能的目标.
	override public function onExec( args:Array ) : void {
		
		// 清空Ui狀態.
		//BattleModel.setNullSelectedUiState();
		
		
		////////////////////////////////////////////////
		////////////////////////////////////////////////
		////////////////////////////////////////////////
		
		
		var cfg:SkillCfg;
		var i:int;
		var l:int;
		var gridId:int;
		var voList:Vector.<CharacterVo>;
		var vo:CharacterVo;
		var skillTargetType:int;  // 1:自己，2:对方，3:aoe
		var skillId:int; 
		
		var gridIdList:Vector.<int>;
		var skillTargetList:Vector.<CharacterVo>;
		var aoeSkillId:int;
		var cardCfg:CardCfg;
		
		// 技能id
		skillId = args[0];
		cardCfg = args[1];
		cfg = SkillConfigurator.getSkillById(skillId);
		skillTargetList = new <CharacterVo>[];
		
		// 没有技能，仅仅更新vo伤血. (无语的做法)
		if (!cardCfg && !cfg) {
			return;
		}
		
		//===============================
		// 装备
		//===============================
		
		// 30000: 天马.
		// 30001: 定风珠.
		// 30004 / 30007: 八卦仙衣.
		// 30009: 乾坤尺.
		// 30011: 莫邪宝剑.
		// 30017: 乾坤弓.
		// 30021: 黑麒麟.
		else if (cardCfg && (cardCfg.id == 30000 || cardCfg.id == 30001 || cardCfg.id == 30004 || cardCfg.id == 30007 || cardCfg.id == 30009 || cardCfg.id == 30011 || cardCfg.id == 30017 || cardCfg.id == 30021)) {
			skillTargetList = BattleModel.getAllFriendsVoList(true);
			skillTargetType = 1;
		}
		// 玄马
		else if (cardCfg && (cardCfg.id == 30003)) {
			skillTargetList = BattleModel.getAllFriendsVoList();
			skillTargetType = 1;
		}
		
		//===============================
		// 法术
		//===============================
		
		// 50089: 法咒尽散.
		else if (cfg.id == 50089) {
			voList = BattleModel.getAllVoList();
			l = voList.length;
			while (i < l) {
				vo = voList[i++];
				skillTargetList.push(vo);
			}
			skillTargetType = 2;
		}
		// 50124: 见龙卸甲.
		else if (cfg.id == 50124) {
			voList = BattleModel.getAllVoList();
			l = voList.length;
			while (i < l) {
				vo = voList[i++];
				if (vo.getEquip()) {
					skillTargetList.push(vo);
				}
			}
			skillTargetType = 2;
		}
		
		//===============================
		// 技能
		//===============================
		
		// 所有敌方，2-3
		else if (allRival_2_3[cfg.id]) { 
			skillTargetList = MapModel.getVoListByDistanceForRival(MapModel.cachedStartGridId, 2, 3);
			skillTargetType = 2;
		}
		// 聚风幡.
		else if (cfg.id == 50012) {
			gridIdList = MapModel.findFront_3_3_PosList(BattleRoleModel.getMyBattleRoleVo().roleVo.id, MapModel.cachedStartGridId);
			aoeSkillId = 50012;
			skillTargetType = 3;
		}
		// 开天珠.
		else if (cfg.id == 50015) {
			gridIdList = MapModel.findDiagonalPosList(MapModel.cachedStartGridId);
			l = gridIdList.length;
			while (i < l) {
				gridId = gridIdList[i++];
				vo = BattleModel.getVoByGridId(gridId);
				if (vo && !vo.isFriend) {
					skillTargetList.push(vo);
				}
			}
			skillTargetType = 2;
		}
		// 呼名夺魂.
		else if (cfg.id == 50018) {
			skillTargetList = MapModel.getVoListByDistanceForRival(MapModel.cachedStartGridId, 3, 4);
			l = skillTargetList.length;
			while (--l > -1) {
				vo = skillTargetList[l];
				if (vo.cfg.quality >= 5) {
					skillTargetList.splice(l, 1);
				}
			}
			skillTargetType = 2;
		}
		// 雌雄双鞭.
		else if (cfg.id == 50021) {
			skillTargetList = MapModel.getVoListByDistanceForRival(MapModel.cachedStartGridId, 2, 2);
			skillTargetType = 2;
		}
		// 三千火龙军.
		else if (cfg.id == 50022) {
			gridIdList = MapModel.findPosList(MapModel.cachedStartGridId, 1, 2);
			aoeSkillId = 50022;
			skillTargetType = 3;
		}
		// 飞蝗石.
		else if (cfg.id == 50026) {
			gridIdList = MapModel.findStraight_PosList(MapModel.cachedStartGridId, 1, 3);
			aoeSkillId = 50026;
			skillTargetType = 3;
		}
		// 镇压.
		else if (cfg.id == 50030) {
			if (BattleRoleModel.getMyBattleRoleVo().numDead <= 0) {
				(UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU).showBattleWarning("释放失败，没有墓地牌!");
				
				// 自己的回合，則操作狀態恢復.
				BattleModel.dispatchMyControlChanged(true);
				
				SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
				return;
			}
			else {
				skillTargetList = MapModel.getVoListByDistanceForRival(MapModel.cachedStartGridId, 3, 4);
				skillTargetType = 2;
			}
		}
		// 钻心钉.
		else if (cfg.id == 50033) {
			skillTargetList = MapModel.getVoListByFront_Verti(BattleRoleModel.getMyBattleRoleVo().roleVo.id, MapModel.cachedStartGridId, 2, 3);
			skillTargetType = 2;
		}
		// 乾坤圈.
		else if (cfg.id == 50034) {
			skillTargetList = MapModel.getVoListByDistanceForRival(MapModel.cachedStartGridId, 2, 3);
			skillTargetType = 2;
		}
		
		// 敌方任何将士
		// 诛仙剑气.
		else if (cfg.id == 50125) {
			voList = BattleModel.getRivalVoList();
			l = voList.length;
			while (i < l) {
				vo = voList[i++];
				if (vo.cfg.quality < 5 && vo.hp >= 4) {
					skillTargetList.push(vo);
				}
			}
			skillTargetType = 2;
		}
		// 敌方全部将士
		// 定海珠
		else if (cfg.id == 50138 ){
			voList = BattleModel.getRivalVoList();
			l = voList.length;
			while (i < l) {
				vo = voList[i++];
				if (vo.cfg.quality < 5) {
					skillTargetList.push(vo);
				}
			}
			skillTargetType = 2;
		}
		// 我方king
		// 天元狂流.
		else if (cfg.id == 50167) {
			skillTargetList.push(BattleRoleModel.getMyBattleRoleVo().kingVo);
			skillTargetType = 1;
		}
		// 神目之光.
		else if (cfg.id == 50192) {
			gridIdList = MapModel.findStraight_PosList(MapModel.cachedStartGridId, 1, 2);
			aoeSkillId = 50192;
			skillTargetType = 3;
		}
		// 己方全部人物=1
		else if (cfg.selectType == 1) {
			skillTargetList = BattleModel.getVoListByRoleId(BattleRoleModel.getMyBattleRoleVo().roleVo.id);
			skillTargetType = 1;
		}
		// 敌方全部人物=2
		else if (cfg.selectType == 2) {
			skillTargetList = BattleModel.getRivalVoList();
			skillTargetType = 2;
		}
		// 场上所有人物=7
		else if (cfg.selectType == 7) {
			skillTargetList = BattleModel.getAllVoList();
			skillTargetType = 2;
		}
		// 己方人物(非王)=9，
		else if (cfg.selectType == 9 //|| 
				//cfg.id == 50127 // 乾坤尺
			){
			
			voList = BattleModel.getMyVoList();
			l = voList.length;
			while (i < l) {
				vo = voList[i++];
				if (vo.cfg.quality < 5) {
					skillTargetList.push(vo);
				}
			}
			skillTargetType = 1;
		}
		
		
		BattleModel.setSelectedUiStateFoSkill(skillTargetType, skillTargetList, gridIdList, aoeSkillId);
	}
	
	
}
}