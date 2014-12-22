package views.UU.battle.skillStates 
{
	import com.greensock.easing.Back;
	import com.greensock.TweenLite;
	import models.battle.BattleModel;
	import models.battle.BattleRoleModel;
	import models.battle.MapModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.BattleEffect;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.comps.CharacterUU;
	
public class Zhenya_Skill_StateUU extends Abstract_Skill_StateUU {
	
	override public function onEnter():void {
		super.onEnter();
		
		this.stateActive.emitCard(fromView.vo, toView, 0.70);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
	}
	
	
	
	private var _arrow:AnimatorUU;
	
	private function onSkill():void {	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		_arrow = new AnimatorUU;
		_arrow.play("common.eight", "atlas/skill/qibaolinglongta", 1)
		_arrow.x = toView.x;
		_arrow.y = toView.y;
		_arrow.pivotX = _arrow.sourceWidth / 2;
		_arrow.pivotY = _arrow.sourceHeight / 2 + 75;
		this.fusion.addNode(_arrow);
		
		_arrow.scaleX = 1.6;
		_arrow.scaleY = 1.6;
		TweenLite.to(_arrow, 1.0, { scaleX:0.01, scaleY:0.01, ease:Back.easeIn, onComplete:onAnim_1 } );
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/qibaolinglongta.mp3");
	}
	
	private function onAnim_1():void {
		this.fusion.kill();
		
		BattleModel.iterateNextAction();
	}
	
//	override public function onExit():void {
//		
//	}
	
	
}
}