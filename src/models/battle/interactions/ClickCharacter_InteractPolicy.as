package models.battle.interactions {
	import configs.battle.BattleConfigurator;
	import models.battle.BattleRoleModel;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.ChessPos;
	import proto.cs.SkillUseReq;
	
	import models.GameModel;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	
	import net.NetManager;
	
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdType;
	import proto.cs.MoveChessReq;
	
	// 点击人物时，发生的交互判断.
	public class ClickCharacter_InteractPolicy extends InteractPolicy {
		
		public static var needDeadCardSkillList:Object = { 50030:true };
		
		override public function onExec( args:Array ) : void {
			var _vo:CharacterVo;
			var pos:ChessPos;
			
			if (!BattleModel.isCharacterControllable) {
				return;
			}
			
			_vo = args[0];
			
			// 释放指向技能.
			if (_vo.interactionFlag & CharacterVo.TARGET) {
				// 清空Ui狀態.
				BattleModel.setNullSelectedUiState();
				
				BattleModel.dispatchMyControlChanged(false);
				
				var msg1:SkillUseReq;
				
				msg1 = new SkillUseReq;
				msg1.fromGuid = BattleModel.skillCharacterVo.guid;
				msg1.skillId = BattleModel.skillId;
				msg1.skillSource = BattleModel.skill_source;
				msg1.endGuid = _vo.guid;
				if (needDeadCardSkillList[BattleModel.skillId]) {
					msg1.costDieCards = [BattleRoleModel.getMyBattleRoleVo().useDead()];
					BattleRoleModel.getMyBattleRoleVo().updateCards();
				}
				
				pos = new ChessPos;
				pos.x = _vo.pos.x;
				pos.y = _vo.pos.y;
				msg1.endChessPos = pos;
				
				// 判断是否消耗手牌.
				
				// 50078: 乾坤弓
				if (BattleModel.skillId == 50078) {
					
				}
				else {
					NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_BATTTE_SKILL_USE_REQ, msg1);
				}
			}
			
			// 可控制.
			else if ((_vo.interactionFlag & CharacterVo.SELECTABLE || _vo.interactionFlag & CharacterVo.MOVE_DIRTY) && _vo.checkSelectable()) {
				SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/card_selected.mp3");
				
				
				BattleModel.setSelectedUiStateForChooseCharacter(BattleConfigurator.posToGrid(_vo.pos.x, _vo.pos.y), _vo.getFinalMove(), Boolean(_vo.interactionFlag == CharacterVo.MOVE_DIRTY));
			}
			
			// 可被攻擊.
			else if(_vo.interactionFlag & CharacterVo.ASSAULT){
				// 攻擊 or 移動后攻擊.
				
				var assaultGridId:int;
				var msg:MoveChessReq;
				var startVo:CharacterVo;
				var movePath:Array;
				
				
				// 清空Ui狀態.
				BattleModel.setNullSelectedUiState();
				
				////////////////////////////////////////////////
				////////////////////////////////////////////////
				////////////////////////////////////////////////
				
				
				// 將接下來要攻擊的人物緩存.
				assaultGridId = MapModel.cachedAssaultGridId = BattleConfigurator.posToGrid3(_vo.pos);
				
				startVo = BattleModel.getVoByGridId(MapModel.cachedStartGridId)
				
				// 判斷是否為臨位，為true則直接攻擊.
				if((startVo.pos.x - _vo.pos.x)*(startVo.pos.x - _vo.pos.x) + (startVo.pos.y - _vo.pos.y)*(startVo.pos.y - _vo.pos.y) == 1){
					BattleModel.commonAttack();
				}
				else {
					// 移動后攻擊，产生了间接动作.
					BattleModel.hasIndirectAction = true;
				
					// 暫時先把assault的walkable設為true，之後再設回false.
					//MapModel.setPathNodeWalkable(assaultGridId, true);
					
					movePath = MapModel.findPath(MapModel.cachedStartGridId, assaultGridId, true, startVo.allWalkable);
					
					//MapModel.setPathNodeWalkable(assaultGridId, false);
					
					
					//movePath.pop();
					
					// 起始點重置.
					MapModel.cachedStartGridId = BattleConfigurator.posToGrid2(movePath[movePath.length - 1]);
					
					msg = new MoveChessReq;
					msg.chessUid = startVo.guid;
					msg.movePath = movePath;
					NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_MOVE_CHESS_REQ, msg);
					
					GameModel.getLog().simplify("客戶端尋路: {0}", movePath);
				}
				
				// 交互狀態變化.
				//_vo.setInteractionFlag(CharacterVo.NONE);
				
				// 攻擊動作進行時，暫不可操控其他.
				BattleModel.dispatchMyControlChanged(false);
			}
		}
		
	}
}