package views.UU.battle.gameOver 
{
	import models.gameOver.GameOverModule;
	import models.task.TasksModule;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import views.UU.task.items.Task_DayUU;
	/**
	 * ...任务奖励展示
	 * @author dcl
	 */
	public class Game_Task_StateUU extends StateUU
	{
		
		public function Game_Task_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			var bg:Scale9BitmapUU = new Scale9BitmapUU;
			bg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			this.fusion.addNode(bg);
			
			//TasksModule.addCompletedId(1000);
			//TasksModule.addCompletedId(1001);
			//TasksModule.addCompletedId(1002);
			//TasksModule.addCompletedId(1003);
			var len:int = TasksModule.completed.length;				
			var width:Number = 333.3;
			var height:Number = 400;
			var n:int;
			var m:int;
			var lineCap:int = 3;
			var bgWidth:Number;
			var bgHeight:Number;
			
			n = len % 3;
			m = int(len / 3);
			
			if (m == 0) {
				bgWidth = width * n;
			}else {
				bgWidth = width * lineCap;
			}
			
			if (n == 0) {
				bgHeight = height * m;
				
			}else {
				bgHeight = height * (m + 1);
			}
					
			bg.width = bgWidth;
			bg.height = bgHeight == 400 ? bgHeight + 30 : bgHeight;
			bg.locatingTypeForHoriz = LocatingType.F___A___F;
			bg.locatingTypeForVerti = LocatingType.F___A___F;
			this.fusion.spaceWidth = bg.width;
			this.fusion.spaceHeight = bg.height;
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			
			var i:int;
			var pointX:int;
			var pointY:int;
			var taskDayUU:Task_DayUU;
			if (len != 0) {
				for (i = 0; i < len; i++ ) {
					taskDayUU = new Task_DayUU();
					this.fusion.addNode(taskDayUU);
					taskDayUU.scaleX = 0.75;
					taskDayUU.scaleY = 0.75;
					taskDayUU.locatingTypeForHoriz = LocatingType.F_A____F;
					taskDayUU.locatingTypeForVerti = LocatingType.F_A____F;
					pointX = 30 + (300 + 20) * (i % lineCap);
					pointY = 45 + 375 * int(i / lineCap);	
					taskDayUU.locatingOffsetX = pointX;
					taskDayUU.locatingOffsetY = pointY;
					taskDayUU.completeTaskId = TasksModule.completed[i];
				}
				taskDayUU.touchable = false;
			}
			
			bg.addEventListener(ATouchEvent.CLICK, onClick);
			
		}
		
		private function onClick(evt:ATouchEvent):void {
			GameOverModule.curState = GameOverModule.GAME_OVER_STATE_UNLOCK;
			GameOverModule.checkAndUpdateSteps();
		}
		
		override public function onExit():void {
			
		}
		
	}

}