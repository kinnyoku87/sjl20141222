package configs.task 
{
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class TaskConfiguration 
	{
		private static var _taskList:Object = { };
		public function TaskConfiguration() 
		{
			
		}
		
		
		public static function initTask( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var task:TaskInfoCfg;

			const FIELDS:Array = ["taskId", "taskType", "name", "condent", "des", "taskRequirement", "amount", "awardType", "awardAmount", "nextTask", "taskMark", "frontTask"];
			l = v.length;
			while(i<l){
				task = new TaskInfoCfg;
				CsvUtil.setValues(task, v[i++], FIELDS);
				_taskList[task.taskId] = task;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Task ].");
		}
		
		public static function getTask(id:int):TaskInfoCfg {
			return _taskList[id];
		}
		
		static public function get taskList():Object 
		{
			return _taskList;
		}
	}

}