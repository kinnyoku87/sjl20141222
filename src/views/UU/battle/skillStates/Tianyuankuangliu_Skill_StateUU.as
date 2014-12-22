package views.UU.battle.skillStates 
{
	import com.greensock.TweenLite;
	import configs.battle.BattleConfigurator;
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import models.GameModel;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import views.UU.battle.Battle_active_post_StateUU;
	
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Tianyuankuangliu_Skill_StateUU  extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		//BattleModel.tianyuanCount = 3;
		
		this.skillSendCard();
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
	}
	
	private function onSkill():void{	
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		// 天元特效.
		_anim = new AnimatorUU;
		_anim.play("common.eight", "atlas/skill/tianyuan", 0);
		_anim.x = fromView.x - _anim.sourceWidth / 2;
		_anim.y = fromView.y - _anim.sourceHeight / 2 - 22;
		_anim.touchable = false;
		this.fusion.addNode(_anim);
		
		TweenLite.from(_anim, 0.7, { alpha:0.03, onComplete:function():void {
			BattleModel.iterateNextAction();
		}} );
		
		//SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		
		GameModel.getNotifier().addEventListener("tianyuan", onComplete);
	}
	
	private function onComplete( e:AEvent ):void {
		GameModel.getNotifier().removeEventListener("tianyuan", onComplete);
		TweenLite.to(_anim, 0.8, { alpha:0.03, onComplete:function():void {
			fusion.kill();
		} } );
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
	}
	
	
	private var _anim:AnimatorUU;
}

}