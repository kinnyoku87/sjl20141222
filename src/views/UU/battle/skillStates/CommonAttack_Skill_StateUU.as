package views.UU.battle.skillStates
{
	import models.battle.BattleModel;
	import models.battle.MapModel;
	import org.agony2d.sounds.SfxManager;
	
	import proto.cs.BattleEffect;
	
	import views.UU.comps.CharacterUU;
	
	// 普通攻擊.
public class CommonAttack_Skill_StateUU extends Abstract_Skill_StateUU
{
	
	override public function onEnter():void{
		super.onEnter();
		
		
		_Effect1 = this.skillAction.effects[0];
		_Effect2 = this.skillAction.effects[1];
		
		// 服务端bug，有时被定身也会触发普通攻击，但是又没有产生effect!!
		if (!_Effect1) {
			this.fusion.kill();
			BattleModel.iterateNextAction();
			return;
		}
		
		// 攻擊.
		fromView.attack(MapModel.getDirection2(fromView.vo.pos, toView.vo.pos), 1, onAttack);
		
	}
	
	
	private var _Effect1:BattleEffect;
	private var _Effect2:BattleEffect;
	
	
	private function onAttack() : void {
		var tView:CharacterUU;
		
		// 攻擊後恢復idle.
		fromView.idleNormal(fromView.vo.role_id);
		
		tView = this.getViewByEffect(_Effect1);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
		
		// 改變vo.
		tView.vo.updateValue(_Effect1);
		
		// 受击
		this.stateActive.showHit(tView.x, tView.y)
		
		// 攻擊失血view.
		this.stateActive.showLostHp(_Effect1.effectValue, tView.x, tView.y);
		
		// 反擊.
		// 王者死亡不會反擊，有时候会是其他的effect，1和2都是反击 (服务端想怎么干就怎么干啊)，还可能是援护...
		if(!_Effect2 || (_Effect2.effectId != 1 && _Effect2.effectId != 2 && _Effect2.effectId != 7)){
			// 判斷死亡.
			if(_Effect1.remainHp == 0){
				BattleModel.killVo(tView.vo);
			}
			this.fusion.kill();
			BattleModel.iterateNextAction();
			return;
		}
		
		toView.attack(MapModel.getDirection2(toView.vo.pos, fromView.vo.pos), 1, onCounter);
	}
	
	private function onCounter() : void {
		var tView:CharacterUU;
		var effectId:int;
		
		// 攻擊後恢復idle.
		toView.idleNormal(toView.vo.role_id);
		
		tView = this.getViewByEffect(_Effect2);
		
		SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/common_attack.mp3");
		
		// 受击
		this.stateActive.showHit(tView.x, tView.y)
		
		// 反擊失血view.
		this.stateActive.showLostHp(_Effect2.effectValue, tView.x, tView.y);
		
		// 改變vo.
		tView.vo.updateValue(_Effect2);
		
		// 判斷死亡.
		if(_Effect1.remainHp == 0){
			BattleModel.killVo(this.getVoByEffect(_Effect1));
		}
		if(_Effect2.remainHp == 0){
			BattleModel.killVo(this.getVoByEffect(_Effect2));
		}
		
		this.fusion.kill();
		BattleModel.iterateNextAction();
	}
}
}