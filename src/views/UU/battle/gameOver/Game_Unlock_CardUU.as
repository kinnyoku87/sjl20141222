package views.UU.battle.gameOver 
{
	import configs.cardset.CardSetConfig;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LocatingType;
	import utils.GameUtil;
	/**
	 * ...
	 * @author dcl
	 */
	public class Game_Unlock_CardUU extends FusionUU
	{
		private var cardUU:FusionUU;
		//public var cardId:int;
		private var _animator:AnimatorUU;
		private var animatorSource:String = "atlas/gameover/unlock";
		public function Game_Unlock_CardUU(cardId:int) 
		{
			init(cardId);
		}
		
		
		private function init(cardId:int):void {
			
			this.spaceWidth = 350;
			this.spaceHeight = 500;
			cardUU = GameUtil.getCardUU(cardId);
			this.addNode(cardUU);
			cardUU.scaleX = 0.95;
			cardUU.scaleY = 0.95;
			cardUU.locatingTypeForHoriz = LocatingType.F___A___F;
			cardUU.locatingTypeForVerti = LocatingType.F___A___F;
			showAnimator();
		}
		
		private function showAnimator():void {
			if (!_animator) {
				_animator = new AnimatorUU;
				_animator.play("common.eight", animatorSource, 0);
				_animator.locatingTypeForHoriz = LocatingType.F___A___F;
				_animator.locatingTypeForVerti = LocatingType.F___A___F;
				_animator.locatingOffsetX = -12;
				_animator.locatingOffsetY = -20;
				this.addNode(_animator);
				_animator.touchable = false;
			}
		}
		
		public function clearAnimatir():void {
			if (_animator) {
				_animator.kill();
				_animator = null;
			}
		}
		
	}

}