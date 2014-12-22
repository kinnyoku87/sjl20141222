package views.UU.battle.skillStates {
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Wuluqiankunwang_Skill_StateUU extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
		
		// 射出的箭.
		animator = new AnimatorUU;
		this.fusion.addNode(animator);
		animator.play("common.seven", "atlas/skill/fazhoujinsan", 1);
		animator.pivotX = animator.sourceWidth / 2;
		animator.pivotY = animator.sourceHeight / 2;
		animator.x = fromView.x;
		animator.y = fromView.y - 11;
		
		//TweenMax.to(_arrow.displayObject, 0.8, { x:toView.x * Agony.getAdapter().pixelRatio, 
													//y:toView.y * Agony.getAdapter().pixelRatio, 
													//ease:Cubic.easeIn,
													//motionBlur: { strength:1.5, quality:1 },
													//onComplete:onArrive } );
													
		TweenLite.to(animator, 0.7, { delay:0.1, scaleX:12.5, scaleY:12.5, ease:Cubic.easeOut, onComplete:onComplete,
		onStart:function():void {
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/wuluqiankunwang.mp3");
		}});
		
	}
	
	private function onSkill():void {	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
	}
	
	private function onComplete():void {
		//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		
		TweenLite.to(animator, 0.7, { scaleX:0.01, scaleY:0.01, ease:Cubic.easeIn, onComplete:function():void {
			fusion.kill();
			
			BattleModel.iterateNextAction();
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		}})
		
		
		
	}
	
//	override public function onExit():void {
//		
//	}
	
	
	
	private var animator:AnimatorUU;
	
	
}
}