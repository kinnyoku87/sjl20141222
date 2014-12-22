package views.UU.task.states 
{
	import configs.task.TaskVO;
	import models.task.TasksModule;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import views.UU.task.items.Task_GrowthUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Task_Growth_ListUU extends StateUU
	{
		
		public function Task_Growth_ListUU() 
		{
			
		}
		
		override public function onEnter():void {
			var i:int;
			var j:int;
            var _taskList:Vector.<TaskVO> = TasksModule.findTask(TasksModule.TASK_GROWTH);
			var len:int = _taskList.length;
            for (i = 0; i < len; i++ )
            {
                for( j = 0; j < len - i - 1; j++)
                {
                   if(_taskList[j].taskID > _taskList[j+1].taskID)
                   {
                       var temp:TaskVO = _taskList[j];
                       _taskList[j] = _taskList[j + 1];
                       _taskList[j + 1] = temp;
                   }
                }
            }	
			var taskGrowthUU:Task_GrowthUU;
			for (i = 0; i < len; i++ ) {
				taskGrowthUU = new Task_GrowthUU();
				taskGrowthUU.data = _taskList[i];
				this.fusion.addNode(taskGrowthUU);
				//if (i == 0) {
					taskGrowthUU.locatingTypeForHoriz = LocatingType.F_A____F;
					taskGrowthUU.locatingTypeForVerti = LocatingType.F_A____F;
					//taskGrowthUU.locatingOffsetY = 120 / Agony.getAdapter().pixelRatio;
					//taskGrowthUU.locatingOffsetX = 50 / Agony.getAdapter().pixelRatio;

				//}else {
					//taskGrowthUU.locatingTypeForHoriz = LocatingType.L___A___L;
					//taskGrowthUU.locatingTypeForVerti = LocatingType.L____L_A;
				//}
				//
				//taskGrowthUU.locatingOffsetX = 50;
				//taskGrowthUU.locatingOffsetY = ;
				taskGrowthUU.pivotX = 0;
				taskGrowthUU.pivotX = (taskGrowthUU.height) * i;
				//taskGrowthUU.addEventListener(ATouchEvent.CLICK, onTaskSelect);
				//if (i == 0 ) {
					//curUU = taskGrowthUU;
					//setTaskGrowUU(curUU);
				//}
			}
			//viewportFusion.contentWidth = stateFusion.width;
			//viewportFusion.contentHeight = stateFusion.height;
			//trace("======================="+stateFusion.width+","+stateFusion.height);
		}
		
	}

}