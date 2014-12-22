package views.UU.battle.buffStates 
{
	import com.greensock.TweenLite;
	import models.battle.BattleModel;
	import models.battle.CharacterVo;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.sounds.SfxManager;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.battle.Battle_active_StateUU;
	
	import views.UU.comps.CharacterUU;
	
	public class Xuanma_Buff_StateUU extends Abstract_Buff_StateUU {
		
		
		
		override public function onEnter():void {
			var targetVo:CharacterVo;
			
			super.onEnter();
			targetVo = this.buffAction.targetVo;
			
			// 更新移动力.
			
			//if (targetVo.move < 3) {
				//targetVo.move = 3;
				targetVo.updateMove();
				BattleModel.dispatchUpdateValue(targetVo);
			//}
			
			SfxManager.getInstance().loadAndPlay("assets/sounds/sfx/xuanma.mp3");
		}
		
		override public function onExit():void {
			var targetVo:CharacterVo;
			
			// 还原移动力.
			//if (this.buffAction.targetVo) {
				//this.buffAction.targetVo.max_move -= 3;
				//this.buffAction.targetVo.move -= 3;
				//if (this.buffAction.targetVo.move < 0) {
					//this.buffAction.targetVo.move = 0;
				//}
				
				//BattleModel.dispatchUpdateValue(this.buffAction.targetVo);
			//}
			
			//targetVo = this.buffAction.targetVo;
			// 死了就pass.
			//if (targetVo) {
				//targetVo.updateMove();
				//BattleModel.dispatchUpdateValue(targetVo);
			//}
			
		}
		
	}

}