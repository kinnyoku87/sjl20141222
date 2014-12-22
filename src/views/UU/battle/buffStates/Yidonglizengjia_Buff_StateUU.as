package views.UU.battle.buffStates 
{
	import models.battle.BattleModel;
	import models.battle.CharacterVo;

	public class Yidonglizengjia_Buff_StateUU extends Abstract_Buff_StateUU {
		
		override public function onEnter():void {
			super.onEnter();
			
			toView.vo.max_move++;
			toView.vo.updateValue2(this.buffAction.buff);
			//BattleModel.dispatchUpdateValue(targetVo);
		}
		
		override public function onExit():void {
			toView.vo.max_move--;
			//BattleModel.dispatchUpdateValue(toView.vo);
		}
		
	}

}