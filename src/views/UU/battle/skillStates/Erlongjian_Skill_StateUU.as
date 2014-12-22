package views.UU.battle.skillStates {
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.BattleEffect;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.comps.CharacterUU;
	
public class Erlongjian_Skill_StateUU extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		_Effect1 = this.skillAction.effects[0];
		_Effect2 = this.skillAction.effects[1];
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
	}
	
	private function onSkill():void {	
		var tView:CharacterUU;
		
		tView = this.getViewByEffect(_Effect1);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
		
		// 击中效果.
		this.stateActive.showHit(tView.x, tView.y);
		
		// 攻擊失血view.
		this.stateActive.showLostHp(_Effect1.effectValue, tView.x, tView.y);
		
		tView.vo.updateValue(_Effect1);
		
		
		// 判斷死亡.
		if (_Effect1.remainHp == 0) {
			// 攻擊後恢復idle.
			fromView.idleNormal(fromView.vo.role_id);
			
			BattleModel.killVo(tView.vo);
			
			this.fusion.kill();
			
			BattleModel.iterateNextAction();
		}
		else {
			// 释放技能view.
			fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill2);
		}
	}
	
	private function onSkill2():void {
		var tView:CharacterUU;
		
		tView = this.getViewByEffect(_Effect1);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
		
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		// 击中效果.
		this.stateActive.showShoot(tView.x, tView.y);
		
		// 攻擊失血view.
		this.stateActive.showLostHp(_Effect2.effectValue, tView.x, tView.y);
		
		tView.vo.updateValue(_Effect2);
		
		// 判斷死亡.
		if(_Effect2.remainHp == 0){
			BattleModel.killVo(tView.vo);
		}
		
		this.fusion.kill();
		
		BattleModel.iterateNextAction();
	}
	
//	override public function onExit():void {
//		
//	}
	
	
	private var _Effect1:BattleEffect;
	private var _Effect2:BattleEffect;
	
	
	
}
}