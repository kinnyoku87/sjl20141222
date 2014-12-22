package views.UU.battle.gameOver 
{
	import models.gameOver.GameOverEvent;
	import models.gameOver.GameOverModule;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateFusionUU;
	import ui.ShildStateUU;
	/**
	 * ...
	 * @author dcl
	 */
	public class Game_Over_StateUU extends ShildStateUU
	{
		private var gameState:StateFusionUU;
		
		public function Game_Over_StateUU() 
		{
			notDefaultClose = true;
		}
		
		
		override public function onEnter():void {
			super.onEnter();
			//var sprite:RawSpriteUU = new RawSpriteUU();
				//this.fusion.addNode(sprite);
				//sprite.graphics.beginFill(0xffffff,0.5); 
				//sprite.graphics.lineStyle(0, 0x000000, 0.5);
				//sprite.graphics.drawRect(0,0, 1000,800);
				//sprite.graphics.endFill();
				//sprite.touchable = false;
			gameState = new StateFusionUU();
			this.fusion.addNode(gameState);
			this.fusion.spaceWidth = 1000;
			this.fusion.spaceHeight = 800;
			gameState.spaceWidth = 1000;
			gameState.spaceHeight = 800;
			
			
			initData();
			
			updateState();
			GameOverModule.addEventListener(GameOverEvent.Game_Over_State_Event, onUpdateState);
			this.addRootEvent();
		}
		private function initData():void {
			//GameOverModule.isWin = false;

			GameOverModule.curState = GameOverModule.GAME_OVER_STATE_LEVEL;  

			//updateState();
			//dispatchEvent(GameOverEvent.Game_Over_Event);
			//UUFacade.getWindow(Game_Over_StateUU).activate();
		}
		
		private function onUpdateState(evt:GameOverEvent):void {
			updateState();
		}
		
		private function updateState():void {
			switch(GameOverModule.curState) {
				case GameOverModule.GAME_OVER_STATE_LEVEL:
					gameState.setState(Game_WinStatus_StateUU);
					break;
				case GameOverModule.GAME_OVER_STATE_DUAN:
					gameState.setState(Game_Duan_StateUU);
					break;
				case GameOverModule.GAME_OVER_STATE_TASK:
					gameState.setState(Game_Task_StateUU);
					break;
				case GameOverModule.GAME_OVER_STATE_UNLOCK:
					gameState.setState(Game_Unlock_StateUU);
					break;
			}
		}
		
		override public function onExit():void {
			super.onExit();
			GameOverModule.removeEventListener(GameOverEvent.Game_Over_State_Event, onUpdateState);
		}
		
	}

}