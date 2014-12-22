package views.UU.battle.skillStates 
{
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.MapModel;
	import org.agony2d.flashApi.UUFacade;
	import proto.cs.BattleEffect;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.comps.CharacterUU;

public class DingShen_Skill_StateUU extends Abstract_Skill_StateUU {
	
	override public function onEnter():void {
		super.onEnter();
		
		this.skillSendCard();
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
	}
	
	private function onSkill():void{	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		
		this.fusion.kill();
		
		
		BattleModel.iterateNextAction();
	}
	
//	override public function onExit():void {
//		
//	}
	
	
	
}
}