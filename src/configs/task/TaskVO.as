package configs.task 
{
	/**
	 * ... 任务信息
	 * @author ... dcl
	 */
	public class TaskVO 
	{
		private var _requirementID:int;   //必要条件
        private var _taskID:int;          //任务id
        private var _value:int;           //任务完成值
		public var taskCfg:TaskInfoCfg;  //任务信息
		
		public function TaskVO() 
		{
			
		}
		
		public function get requirementID():int 
		{
			return _requirementID;
		}
		
		public function set requirementID(value:int):void 
		{
			_requirementID = value;
		}
		
		public function get taskID():int 
		{
			return _taskID;
		}
		
		public function set taskID(value:int):void 
		{
			_taskID = value;
			taskCfg = TaskConfiguration.getTask(taskID);
		}
		
		public function get value():int 
		{
			return _value;
		}
		
		public function set value(value:int):void 
		{
			_value = value;
		}
		
		
		
	}

}