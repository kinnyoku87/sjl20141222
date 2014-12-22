package views.UU.battle.buffStates {
	import com.greensock.TweenLite;
	import models.battle.BattleModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.UUFacade;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.battle.Battle_active_StateUU;
	
	import views.UU.comps.CharacterUU;
	
	public class Yishoulongwei2_Buff_StateUU extends Abstract_Buff_StateUU
	{
		
		override public function onEnter():void {
			super.onEnter();
			
			_animator = new AnimatorUU;
			_animator.play("common.eight", "atlas/skill/yishoulongwei", 1, onPlayComplete);
			_animator.pivotX = _animator.sourceWidth / 2;
			_animator.pivotY = _animator.sourceHeight / 2;
			_animator.y = -22;
			_animator.scaleX = _animator.scaleY = 0.64;
			_animator.touchable = false;
			this.fusion.addNode(_animator);
			
			//TweenLite.from(_animator, 0.3, { alpha:0.03, onComplete:function():void {
				//buffAction.next();
			//}});
			
			BattleModel.dispatchUpdateValue(this.buffAction.targetVo);
		}
		
		override public function onExit():void {
			//_animator.kill();
			
			// 还原移动力.
			//this.buffAction.targetVo.max_move -= this.buffAction.buff.buffValue;
			//BattleModel.dispatchUpdateValue(this.buffAction.targetVo);
			
			if (this.buffAction.targetVo) {
				BattleModel.dispatchUpdateValue(this.buffAction.targetVo);
			}
		}
		
		
		private var _animator:AnimatorUU;
		
		
		private function onPlayComplete():void {
			_animator.kill();
		}
	}

}