package views.UU.battle.gameOver 
{
	import com.greensock.TweenMax;
	import configs.player.PlayerConfiguration;
	import configs.player.UpgradeExp;
	import models.battle.BattleModel;
	import models.GameModel;
	import models.gameOver.GameOverEvent;
	import models.gameOver.GameOverModule;
	import models.player.PlayerModel;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import utils.TextUtil;
	/**
	 * ...战斗胜利或失败
	 * @author dcl
	 */
	public class Game_WinStatus_StateUU extends StateUU
	{
		private var duanTween:TweenMax;
		private var expMask:RawSpriteUU;
		private var expImg:ImageLoaderUU;
		private var oldExpInfo:UpgradeExp;
		private var nowExpInfo:UpgradeExp;
		private var expOldY:Number;             //遮罩原始起点
		private var expViewHeight:Number;       //遮罩可变区域 
		
		private var _animator:AnimatorUU;
		private var animatorSourceWin:String = "atlas/gameover/win";
		private var animatorSourceLose:String = "atlas/gameover/lose";
		
		public function Game_WinStatus_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			var img:ImageLoaderUU = new ImageLoaderUU;
			if (BattleModel.isWinner) {
				img.source = TResourceManager.getAsset("gameover/img/win.png");
			}else {
				img.source = TResourceManager.getAsset("gameover/img/lose.png");
			}
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			expImg = new ImageLoaderUU;
			this.fusion.addNode(expImg);
			expImg.source = TResourceManager.getAsset("gameover/img/exp.png");
	
			expImg.x = (this.fusion.spaceWidth - expImg.width) / 2 - 3; 
			expImg.y = (this.fusion.spaceHeight - expImg.height) / 2 - 68; 
			
			expViewHeight = expImg.height;
			expOldY = expImg.y + expImg.height;
			
			expMask = new RawSpriteUU;
			expMask.graphics.beginFill(0x000000, 0);
			expMask.graphics.drawRect(0, 0, expImg.width, expImg.height);
			expMask.graphics.endFill();
			expImg.displayObject.mask = expMask.displayObject;
			this.fusion.addNode(expMask);
			expMask.x = expImg.x; 
			expMask.y =  expOldY
			expImg.touchable = expMask.touchable = false;	
			
			initDataToTween();
			
			var duanLabel:LabelUU = TextUtil.createLabel6("", 25, ColorUtil.WHITE,false,ColorUtil.BLACK,1);
			this.fusion.addNode(duanLabel);
			duanLabel.text = PlayerModel.getInstance().myRole.getCampLevel(GameModel.campBag.campId).toString();
			//duanLabel.text = "20";
			duanLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			duanLabel.locatingTypeForVerti = LocatingType.F___A___F;
			duanLabel.locatingOffsetY = 15;
			duanLabel.locatingOffsetX = -3;
			img.addEventListener(ATouchEvent.CLICK, onImgClick); 
			
			showAnimator();
		}
		
		private function initDataToTween():void {
			oldExpInfo = PlayerConfiguration.getExpInfo(GameOverModule.oldCampVo.level);
			nowExpInfo = PlayerConfiguration.getExpInfo(GameOverModule.nowCampVo.level);
			var tweenY:Number;
			//两者等级一样 设置此前的位置    升级了  则把位置设置到起始点  
			if (!GameOverModule.isUpGrade) {
				expMask.y = expOldY - (GameOverModule.oldCampVo.exp / oldExpInfo.exp) * expViewHeight;
			}else {
				expMask.y = expOldY;
			}
			//现在的位置
			tweenY = expOldY - (GameOverModule.nowCampVo.exp / nowExpInfo.exp) * expViewHeight;	
			duanTween = TweenMax.to(expMask, 1, { y: tweenY } );
		}
		
		private function onImgClick(evt:ATouchEvent):void {
			GameOverModule.curState = GameOverModule.GAME_OVER_STATE_DUAN;
			GameOverModule.checkAndUpdateSteps();
		}
		
		private function showAnimator():void {
			if (!_animator) {
				_animator = new AnimatorUU;
				if (GameOverModule.isWin) {
					_animator.play("common.eight", animatorSourceWin, 0);
				}else {
					_animator.play("common.eight", animatorSourceLose, 0);
				}
				_animator.scaleX = 2;
				_animator.scaleY = 2;
				_animator.locatingTypeForHoriz = LocatingType.F___A___F;
				_animator.locatingTypeForVerti = LocatingType.F___A___F;
				this.fusion.addNodeAt(_animator,0);
				_animator.touchable = false;
			}
		}
		
		
		override public function onExit():void {
			if (duanTween) {
				duanTween.kill();
				duanTween = null;
			}
			//为何这里不移除遮罩  会影响后面步骤界面的展示
			if (expMask) {
				expImg.displayObject.mask = null;
				expMask.kill();
				expMask = null;
			}
			if (_animator) {
				_animator.kill();
				_animator = null;
			}
		}
		
	}

}