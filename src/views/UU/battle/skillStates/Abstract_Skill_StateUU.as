package views.UU.battle.skillStates
{
	import com.greensock.TweenLite;
	import models.battle.actions.SkillAction;
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.CharacterVo;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import org.agony2d.utils.DelayMachine;
	import proto.cs.BattleEffect;
	import proto.cs.ChessPos;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.battle.Battle_active_pre_StateUU;
	import views.UU.comps.CharacterUU;
	
	import org.agony2d.flashApi.StateUU;
	
	import views.UU.battle.Battle_active_StateUU;
	
	public class Abstract_Skill_StateUU extends StateUU
	{
		
		// 狀態對象.
		public var stateActivePre:Battle_active_pre_StateUU;
		public var stateActive:Battle_active_StateUU;
		public var stateActivePost:Battle_active_post_StateUU;
		
		public var fromView:CharacterUU;
		public var toView:CharacterUU;
		
		
		// 技能動作.
		public var skillAction:SkillAction;
		
		
		
		override public function onEnter():void {
			this.skillAction = this.stateArgs[0];
			//this.stateForBattleActive = this.stateArgs[1];
			
			stateActivePre = UUFacade.getWindow(Battle_active_pre_StateUU).state as Battle_active_pre_StateUU;
			stateActive = UUFacade.getWindow(Battle_active_StateUU).state as Battle_active_StateUU;
			stateActivePost = UUFacade.getWindow(Battle_active_post_StateUU).state as Battle_active_post_StateUU;
			
			fromView = this.stateActive.getView(this.skillAction.fromVo);
			toView = this.stateActive.getView(this.skillAction.targetVo);
			
		}
		
		public function onLostHp( hitEffect:Boolean = true ) : void {
			var i:int;
			var l:int;
			var effects:Array;
			var battleEffect:BattleEffect;
			
			effects = this.skillAction.effects;
			l = effects.length;
			while (i < l) {
				battleEffect = effects[i++];
				//DelayMachine.getInstance().delayedCall(i * delayTime, updateObj, battleEffect, hitEffect); 
				//i++;
				
				this.updateObj(battleEffect, hitEffect); 
			}
			if (l > 0) {
				SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
			}
		}
		
		private function updateObj( battleEffect:BattleEffect, hitEffect:Boolean ):void {
			var vo:CharacterVo;
			var view:CharacterUU;
			
			vo = BattleModel.getVoByGuid(battleEffect.objectUid);
			view = this.stateActive.getView(vo);
			
			// 打中效果.
			if (hitEffect) {
				this.stateActive.showHit(view.x, view.y);
			}
			else {
				this.stateActive.showShoot(view.x, view.y);
			}
			// 攻擊失血view.
			this.stateActive.showLostHp(battleEffect.effectValue, view.x, (battleEffect.effectId == 7 ? view.y + 48 : view.y));
			
			vo.updateValue(battleEffect);
			
			if(battleEffect.remainHp == 0){
				BattleModel.killVo(vo);
			}
		}
		
		public function skillSendCard() : void {
			//我的回合.
			if (BattleModel.isMyRound()) {
				this.stateActivePost.sendCardToPos(BattleModel.cardGuid, this.skillAction.targetVo.pos.x, this.skillAction.targetVo.pos.y)
			}
			
			//对手回合.
			else {
				if (fromView != toView) {
					this.stateActive.emitCard(BattleRoleModel.getBattleRoleVo(this.skillAction.roleId).kingVo, toView);
				}
			}
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		}
		
		public function getVoByEffect( battleEffect:BattleEffect ) : CharacterVo {
			return BattleModel.getVoByGuid(battleEffect.objectUid);
		}
		
		public function getViewByEffect( battleEffect:BattleEffect ) : CharacterUU {
			var vo:CharacterVo;
			
			vo = BattleModel.getVoByGuid(battleEffect.objectUid);
			return this.stateActive.getView(vo);
		}
	}
}