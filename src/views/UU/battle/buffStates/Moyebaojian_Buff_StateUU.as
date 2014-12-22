package views.UU.battle.buffStates 
{
	import models.battle.BattleModel;
	import models.battle.CharacterVo;

	public class Moyebaojian_Buff_StateUU  extends Abstract_Buff_StateUU {
		
		override public function onEnter():void {
			var targetVo:CharacterVo;
			
			super.onEnter();
			targetVo = this.buffAction.targetVo;
			
			targetVo.updateValue2(this.buffAction.buff);
			//BattleModel.dispatchUpdateValue(targetVo);
		}
		
		override public function onExit():void {
			
		}
		
	}

}