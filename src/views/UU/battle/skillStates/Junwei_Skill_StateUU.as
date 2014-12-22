package views.UU.battle.skillStates {
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Junwei_Skill_StateUU extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		//_Effect1 = this.skillAction.effects[0];
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
		
		
	}
	
	private function onSkill():void{	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/junwei.mp3");
		
		
		this.fusion.kill();
		
		
		BattleModel.iterateNextAction();
	}
	
//	override public function onExit():void {
//		
//	}
	
	
	//private var _Effect1:BattleEffect;
	//private var _Effect2:BattleEffect;
	
	//private var _animator:AnimatorUU;
	
	
	
}
}