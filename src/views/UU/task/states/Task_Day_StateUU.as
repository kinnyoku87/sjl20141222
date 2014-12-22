package views.UU.task.states 
{
	import configs.task.TaskVO;
	import models.task.TasksModule;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.utils.ColorUtil;
	import utils.TextUtil;
	import views.UU.task.items.Task_DayUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Task_Day_StateUU extends StateUU
	{
		private var completeLabel:LabelUU;
		public function Task_Day_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			completeLabel = TextUtil.createLabel6("今日任务已完成", 32,ColorUtil.GREEN, false,-1);
			
			updateView();
		}
		
		private function updateView():void {
			var i:int;
			var taskDayUU:Task_DayUU;
            var _alist:Vector.<TaskVO> = TasksModule.findTask(TasksModule.TASK_DAY);
			var len:int = _alist.length;
			if (len != 0) {
				for (i = 0; i < len; i++ ) {
					taskDayUU = new Task_DayUU();
					this.fusion.addNode(taskDayUU);
					if (i == 0) {
						taskDayUU.locatingTypeForHoriz = LocatingType.F___A___F;
						taskDayUU.locatingTypeForVerti = LocatingType.F___A___F;
						taskDayUU.locatingOffsetX = - taskDayUU.width - 10;
					}else {
						taskDayUU.locatingTypeForHoriz = LocatingType.L____L_A;
						taskDayUU.locatingTypeForVerti = LocatingType.F___A___F;
						taskDayUU.locatingOffsetX = 30;
					}
					taskDayUU.data = _alist[i];
				}
				completeLabel.visible = false;
			}else {
				completeLabel.visible = true;
			}
			
		}
		
		override public function onExit():void {
			
		}
		
	}

}