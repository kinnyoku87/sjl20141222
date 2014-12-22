package views.UU.battle.skillStates {
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import models.GameModel;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;

public class None_Skill_StateUU extends Abstract_Skill_StateUU {
	
	override public function onEnter():void {
		super.onEnter();
		
		var effects:Array;
		var i:int;
		var l:int;
		var battleEffect:BattleEffect;
		var vo:CharacterVo;
		var view:CharacterUU;
		
		effects = this.skillAction.effects;
		l = effects.length;
		while (i < l) {
			battleEffect = effects[i++];
			vo = BattleModel.getVoByGuid(battleEffect.objectUid);
			vo.updateValue(battleEffect);
			view = this.stateActive.getView(vo);
			this.stateActive.showLostHp(battleEffect.effectValue, view.x, view.y);
			view.updateValues();
			
			if (battleEffect.remainHp == 0) {
				BattleModel.killVo(vo);
			}
		}
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
		
		GameModel.getDelay().delayedCall(0.3, function():void {
			fusion.kill();
			
			BattleModel.iterateNextAction();
		});
	}
}
}