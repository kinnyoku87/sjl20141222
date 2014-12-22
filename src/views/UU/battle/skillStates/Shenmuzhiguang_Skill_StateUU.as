package views.UU.battle.skillStates {
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Strong;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Shenmuzhiguang_Skill_StateUU extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		var anim:AnimatorUU;
		
		super.onEnter();
		
		this.endPos = new Point(this.skillAction.endPos.x, this.skillAction.endPos.y);
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, this.endPos), 1, onSkill);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		
	}
	
	public var endPos:Point;
	
	private function onSkill():void {	
		var anim:AnimatorUU;
		
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/shenyanzhiguang.mp3");
		
		anim = new AnimatorUU;
		anim.play("common.shenyan_A", "atlas/skill/shenyanzhiguang/A", 1, onArrive)
		anim.x = fromView.x;
		anim.y = fromView.y - 11;
		anim.pivotX = anim.sourceWidth / 2;
		//anim.pivotY = anim.sourceHeight / 2 - 20;
		anim.pivotY = anim.sourceHeight / 2 + 72;
		anim.rotation = MapModel.getAngle(fromView.vo.pos, this.endPos);
		this.fusion.addNode(anim);
		
		var l:int;
		var battleEffect:BattleEffect;
		var view:CharacterUU;
		var vo:CharacterVo;
		var effects:Array;
		
		effects = this.skillAction.effects;
		l = effects.length;
		while (--l > -1) {
			battleEffect = effects[l];
			
			vo = BattleModel.getVoByGuid(battleEffect.objectUid);
			view = this.stateActive.getView(vo);
			
			anim = new AnimatorUU;
			anim.play("common.shenyan_B", "atlas/skill/shenyanzhiguang/B", 0)
			anim.x = view.x;
			anim.y = view.y;
			anim.pivotX = anim.sourceWidth / 2;
			//anim.pivotY = anim.sourceHeight / 2 - 20;
			anim.pivotY = anim.sourceHeight / 2 + 6;
			this.fusion.addNode(anim);
		}
		
	}
	
	
	
	private function onArrive():void {
		this.onLostHp(false);
		
		this.fusion.kill();
		
		BattleModel.iterateNextAction();
	}
	
	
	//private var _animList:AnimatorUU;
	//private var _numAnim:int;
	
}
}