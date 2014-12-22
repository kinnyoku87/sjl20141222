package views.UU.battle.skillStates {
	import configs.battle.BattleErrorValidator;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	import views.UU.battle.core.IGuessCards;
	import views.UU.battle.GuessCard_StateUU;
	
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Humingduohun_Skill_StateUU extends Abstract_Skill_StateUU implements IGuessCards {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		GuessCard_StateUU.currState = this;
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
	}
	
	private function onSkill():void{	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
	}
	
	public function guessCardsPost( isSuccess:Boolean ) : void {
		if (!isSuccess) {
			this.fusion.kill();
			
			BattleModel.iterateNextAction();
		}
		else {
			this.____doFireEffect();
		}
	}
	
//	override public function onExit():void {
//		
//	}
	

	private function ____doFireEffect():void {
		var anim_A:AnimatorUU;
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/humingduohun.mp3");
		
		anim_A = new AnimatorUU;
		anim_A.play("common.eight", "atlas/skill/humingduohun", 1, function():void {
			
			anim_A.kill();
			
			BattleModel.killVo(toView.vo);
			
			fusion.kill();
			
			BattleModel.iterateNextAction();
		});
		this.stateActive.fusion.addNode(anim_A);
		anim_A.pivotX = anim_A.sourceWidth / 2;
		anim_A.pivotY = anim_A.sourceHeight / 2;
		anim_A.x = toView.x;
		anim_A.y = toView.y - 33;
	}
	
	//private var _Effect1:BattleEffect;
	//private var _Effect2:BattleEffect;
	
	//private var _animator:AnimatorUU;
	
	
	
}
}