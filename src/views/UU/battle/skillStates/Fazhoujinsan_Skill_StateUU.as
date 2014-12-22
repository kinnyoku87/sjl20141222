package views.UU.battle.skillStates 
{
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.MapModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.BattleEffect;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.comps.CharacterUU;
	
public class Fazhoujinsan_Skill_StateUU extends Abstract_Skill_StateUU {
	
	override public function onEnter():void {
		super.onEnter();
		
		_Effect1 = this.skillAction.effects[0];
		
		this.skillSendCard();
		
		// 释放技能view.
		fromView.attack((fromView === toView) ? BattleModel.getIdleDirection(this.skillAction.roleId) : MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
		
		
	}
	
	private function onSkill():void{	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		// 动画.
		animator = new AnimatorUU;
		toView.addNode(animator);
		animator.play("common.eight", "atlas/skill/fazhoujinsan", 1, onComplete);
		animator.x = -animator.sourceWidth / 2;
		animator.y = -animator.sourceHeight / 2 - 11;
		
		//  去除buff.
		//toView.vo.setEquip(0);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/wuluqiankunwang.mp3");
		
		BattleModel.iterateNextAction();
	}
	
	private function onComplete():void {
		//this.toView.vo.updateValue(_Effect1);
		
		this.fusion.kill();
		animator.kill();
	}
	
	
	
	private var _Effect1:BattleEffect;
	private var animator:AnimatorUU;
}

}