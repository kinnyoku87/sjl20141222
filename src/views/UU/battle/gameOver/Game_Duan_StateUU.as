package views.UU.battle.gameOver 
{
	import com.greensock.TweenMax;
	import models.GameModel;
	import models.gameOver.GameOverModule;
	import models.player.PlayerModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import utils.TextUtil;
	/**
	 * ...段位展示>
	 * @author dcl
	 */
	public class Game_Duan_StateUU extends StateUU
	{
		
		private var _animator:AnimatorUU;
		private var animatorSource:String = "atlas/gameover/duan";

		public function Game_Duan_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			var img:ImageLoaderUU = new ImageLoaderUU;
			//img.source = TResourceManager.getAsset(GameOverModule.duanImg);
			img.source = TResourceManager.getAsset("gameover/img/rumen.png");
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			img.addEventListener(ATouchEvent.CLICK,onImgClick);
			img.scaleX = 0.75;
			img.scaleY = 0.75;
			img.visible = true;
			//img.locatingOffsetY = -50;
			
			
			var txtImg:ImageLoaderUU = new ImageLoaderUU;
			txtImg.source = TResourceManager.getAsset("gameover/img/duan_text_bg.png");
			this.fusion.addNode(txtImg);
			txtImg.locatingTypeForHoriz = LocatingType.F___A___F;
			txtImg.locatingTypeForVerti = LocatingType.L____L_A;
			txtImg.locatingOffsetY = 20;
			
			var scroeLabel:LabelUU = TextUtil.createLabel6("", 25, ColorUtil.WHITE);
			this.fusion.addNode(scroeLabel);
			scroeLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			scroeLabel.locatingTypeForVerti = LocatingType.L___A___L;
			//scroeLabel.text ="当前积分：" + PlayerModel.getInstance().myRole.getScore(GameModel.gameMode).toString();
			scroeLabel.text ="当前积分：" + 20;
			showAnimator();
		}
		
		private function onImgClick(evt:ATouchEvent):void {
			GameOverModule.curState = GameOverModule.GAME_OVER_STATE_TASK;
			GameOverModule.checkAndUpdateSteps();    
		}
		
		private function showAnimator():void {
			if (!_animator) {
				_animator = new AnimatorUU;
				_animator.play("common.eight", animatorSource, 0);
				_animator.scaleX = 1.5;
				_animator.scaleY = 1.5;
				_animator.locatingTypeForHoriz = LocatingType.F___A___F;
				_animator.locatingTypeForVerti = LocatingType.F___A___F;
				_animator.locatingOffsetY = -20;
				this.fusion.addNodeAt(_animator,0);
				_animator.touchable = false;
			}
		}
		
		override public function onExit():void {
			if (_animator) {
				_animator.kill();
				_animator = null;
			}
		}
		
	}


}