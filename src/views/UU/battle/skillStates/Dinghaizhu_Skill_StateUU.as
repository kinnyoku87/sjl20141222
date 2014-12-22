package views.UU.battle.skillStates {
	import com.greensock.TweenLite;
	import flash.geom.Point;
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import models.GameModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Dinghaizhu_Skill_StateUU extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		this.skillSendCard();
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
		
		
	}
	
	
	private var _animList2:Array;
	private var _numAnim2:int;
	
	
	private function onSkill():void {
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		this.onSkill1();
		//GameModel.getDelay().delayedCall(0.05, onSkill1);
		GameModel.getDelay().delayedCall(1.35, onLostHp);
	}
	
	private function onSkill1():void {
		var i:int;
		var l:int;
		var anim_A:AnimatorUU;
		var effects:Array;
		var view:CharacterUU;
		var battleEffect:BattleEffect;
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/dinghaizhu.mp3");
		
		effects = this.skillAction.effects;
		l = effects.length;
		_animList2 = [];
		while (i < l) {
			battleEffect = effects[i++];
			view = this.stateActive.getView(BattleModel.getVoByGuid(battleEffect.objectUid));
			anim_A = _animList2[_numAnim2++] = new AnimatorUU;
			anim_A.play("common.eight", "atlas/skill/dinghaizhu/A", 2, i == 1 ? onSkill2 : null);
			this.stateActive.fusion.addNode(anim_A);
			anim_A.pivotX = anim_A.sourceWidth / 2;
			anim_A.pivotY = anim_A.sourceHeight / 2;
			anim_A.x = view.x;
			anim_A.y = view.y - 33;
			
			TweenLite.from(anim_A, 0.22, {scaleX:0.03, scaleY:0.03, alpha:0.03 } );
		}
	}
	
	private function onSkill2():void {
		var i:int;
		var anim_A:AnimatorUU;
		
		while (i < _numAnim2) {
			anim_A = _animList2[i++];
			anim_A.play("common.five", "atlas/skill/dinghaizhu/B", 1, i == 1 ? onSkill3 : null);
		}
	}
	
	private function onSkill3():void {
		var i:int;
		var anim_A:AnimatorUU;
		
		while (i < _numAnim2) {
			anim_A = _animList2[i++];
			anim_A.kill();
		}
		
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