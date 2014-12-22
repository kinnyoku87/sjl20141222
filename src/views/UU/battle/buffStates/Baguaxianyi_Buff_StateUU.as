package views.UU.battle.buffStates 
{
	import com.greensock.TweenLite;
	import models.battle.BattleModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.UUFacade;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.battle.Battle_active_StateUU;
	
	import views.UU.comps.CharacterUU;
	
	public class Baguaxianyi_Buff_StateUU extends Abstract_Buff_StateUU
	{
		

		public static const bottomEffect:Boolean  = true;
		
		
		override public function onEnter():void {
			super.onEnter();
			
			_animator = new AnimatorUU;
			_animator.play("common.eight", "atlas/skill/baguaxianyi", 0);
			_animator.pivotX = _animator.sourceWidth / 2;
			_animator.pivotY = _animator.sourceHeight / 2;
			_animator.y = 8.8;
			_animator.touchable = false;
			this.fusion.addNode(_animator);
			
			//TweenLite.from(_animator, 0.3, { alpha:0.03, onComplete:function():void {
				//buffAction.next();
			//}});
			
		}
		
		//override public function onExit():void {
			
		//}
		
		
		
		private var _animator:AnimatorUU;
	}

}