package views.UU.battle.skillStates 
{
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Zuanxinding_Skill_StateUU extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		_Effect1 = this.skillAction.effects[0];
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/zuanxinding.mp3");
		
		_arrow = new AnimatorUU;
		_arrow.play("common.eight", "atlas/skill/zuanxinding", 0)
		_arrow.x = fromView.x;
		_arrow.y = fromView.y - 15;
		_arrow.pivotX = _arrow.sourceWidth / 2;
		//_arrow.pivotY = _arrow.sourceHeight / 2 - 20;
		_arrow.pivotY = _arrow.sourceHeight / 2 - 55;
		_arrow.rotation = MapModel.getAngle(fromView.vo.pos, toView.vo.pos);
		this.fusion.addNode(_arrow);
		
		//TweenMax.to(_arrow.displayObject, 0.8, { x:toView.x * Agony.getAdapter().pixelRatio, 
													//y:toView.y * Agony.getAdapter().pixelRatio, 
													//ease:Cubic.easeIn,
													//motionBlur: { strength:1.5, quality:1 },
													//onComplete:onArrive } );
													
		TweenLite.to(_arrow, 0.8, { x:toView.x, y:toView.y - 15, ease:Strong.easeIn, onComplete:onArrive});
		
		// 射击音效.
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
	}
	
	private function onSkill():void {	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
	}
	
	private function onArrive():void {
		var tView:CharacterUU;
		
		tView = this.getViewByEffect(_Effect1);
		this.stateActive.showShoot(tView.x, tView.y);
		
		// 攻擊失血view.
		this.stateActive.showLostHp(_Effect1.effectValue, tView.x, tView.y);
		
		tView.vo.updateValue(_Effect1);
		
		// 判斷死亡.
		if(_Effect1.remainHp == 0){
			BattleModel.killVo(tView.vo);
		}
		
		this.fusion.kill();
		
		BattleModel.iterateNextAction();
		
		// 击中音效.
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
	}
	
//	override public function onExit():void {
//		
//	}
	
	
	private var _Effect1:BattleEffect;
	//private var _Effect2:BattleEffect;
	
	private var _animator:AnimatorUU;
	private var _arrow:AnimatorUU;
	
	
}

}