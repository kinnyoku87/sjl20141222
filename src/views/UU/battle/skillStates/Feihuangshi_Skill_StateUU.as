package views.UU.battle.skillStates {
	import com.greensock.TweenLite;
	import configs.battle.BattleConfigurator;
	import flash.geom.Point;
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import models.GameModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.sounds.SfxManager;
	
public class Feihuangshi_Skill_StateUU  extends Abstract_Skill_StateUU {
	
	override public function onEnter():void {
		super.onEnter();
		
		// 释放技能view.
		fromView.attack(BattleModel.getIdleDirection(this.skillAction.roleId), 1, onSkill);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/character_debut.mp3");
	}
	
	private function onSkill():void {
		
		GameModel.getDelay().delayedCall(0.15, onSkill1);
		GameModel.getDelay().delayedCall(0.75, onLostHp);
	}
	
	private var _animList:Array;
	private var _numAnim:int;
	
	private function onSkill1():void {
		var gridId:int;
		var gridIdList:Vector.<int>;
		var i:int;
		var l:int;
		var coord:Point;
		var anim_A:AnimatorUU;
		
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/pidizhu.mp3");
		
		gridIdList = MapModel.findStraight_PosList(this.fromView.vo.gridId, 1, 3, BattleConfigurator.posToGrid2(this.skillAction.endPos));
		
		l = gridIdList.length;
		_animList = [];
		while (i < l) {
			gridId = gridIdList[i++];
			coord = BattleConfigurator.getCoordByGridId(gridId);
			
			// 上层
			anim_A = _animList[_numAnim++] = new AnimatorUU;
			anim_A.play("common.eleven", "atlas/skill/feihuangshi", 1, i == 1 ? onSkill2 : null);
			this.stateActive.fusion.addNode(anim_A);
			anim_A.x = coord.x - anim_A.sourceWidth / 2;
			anim_A.y = coord.y - anim_A.sourceHeight / 2;
			
		}
	}
	
	private function onSkill2():void {
		var i:int;
		var anim:AnimatorUU;
		
		while (i < _numAnim) {
			anim = _animList[i++];
			anim.kill();
		}
		
		this.fusion.kill();
		
		
		BattleModel.iterateNextAction();
	}
	
}
}