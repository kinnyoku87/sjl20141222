package views.UU.battle.skillStates 
{
	import configs.battle.BattleConfigurator;
	import flash.geom.Point;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import models.battle.MapModel;
	import models.GameModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	import proto.cs.BattleEffect;
	import views.UU.comps.CharacterUU;
	
public class Pidizhu_Skill_StateUU  extends Abstract_Skill_StateUU {
	
	
	override public function onEnter():void {
		super.onEnter();
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
		
		// 释放技能view.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onSkill);
	}
	
	private function onSkill():void {
		var animator:AnimatorUU;
		var l:int;
		var coord:Point;
		var gridId:int;
		var posY:int;
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/pidizhu.mp3");
		
		animList = [];
		
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		if (fromView.vo.getBattleRole().chairId == 0) {
			posY = fromView.vo.pos.y + 1;
		}
		else {
			posY = fromView.vo.pos.y - 1;
		}
		
		// 动画特效.
		gridIdList = MapModel.getGridIdListByRow(posY);
		l = gridIdList.length;
		
		//trace(gridIdList);
		
		while (--l > -1) {
			gridId = gridIdList[l];
			coord = BattleConfigurator.getCoordByGridId(gridId);
			
			// 上层.
			animator = animList[numAnim++] = new AnimatorUU;
			animator.play("common.eight", "atlas/skill/pidizhu_A", 1);
			animator.x = coord.x - animator.sourceWidth / 2;
			animator.y = coord.y - animator.sourceHeight / 2 - 50;
			this.stateActive.fusion.addNode(animator);
			
			// 下层.
			animator = animList[numAnim++] = new AnimatorUU;
			animator.play("common.eight", "atlas/skill/pidizhu_B", 1, l == 0 ? onSkill2 : null);
			animator.x = coord.x - animator.sourceWidth / 2;
			animator.y = coord.y - animator.sourceHeight / 2 - 50;
			this.stateActivePre.fusion.addNode(animator);
		}
		
		GameModel.getDelay().delayedCall(0.5, onLostHp);
		
		
	}
	
	//private function onLostHp() : void {
		//var l:int;
		//var battleEffect:BattleEffect;
		//var view:CharacterUU;
		//var vo:CharacterVo;
		//var effects:Array;
		//
		//effects = this.skillAction.effects;
		//l = effects.length;
		//while (--l > -1) {
			//battleEffect = effects[l];
			//
			//vo = BattleModel.getVoByGuid(battleEffect.objectUid);
			//view = this.stateActive.getView(vo);
			//
			//this.stateActive.showShoot(view.x, view.y);
			//
			// 攻擊失血view.
			//this.stateActive.showLostHp(battleEffect.effectValue, view.x, view.y);
			//
			//vo.updateValue(battleEffect);
			//
			//if(battleEffect.remainHp == 0){
				//BattleModel.killVo(vo);
			//}
		//}
	//}
	
	private function onSkill2():void {
		var i:int;
		var anim:AnimatorUU;
		
		while (i < numAnim) {
			anim = animList[i++];
			anim.kill();
		}
		
		this.fusion.kill();
		
		
		BattleModel.iterateNextAction();
	}
	
	
	private var gridIdList:Vector.<int>; 
	private var animList:Array; 
	private var numAnim:int; 
	
}
}