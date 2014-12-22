package configs.task 
{
	/**
	 * ...任务配置数据
	 * @author ... dcl
	 */
	public class TaskInfoCfg 
	{
		//id
		public var taskId:int;     
		
		//类型
		public var taskType:int;
		
		//名称
		public var name:String;
		
		//简短描述
		public var condent:String;
		
		//详细描述
		public var des:String;
		
		//完成必要条件
		public var taskRequirement:int;
		
		//任务数量
		public var amount:int;
		
		//奖励类型 = 任务
		public var awardType:int;
		
		//奖励数量
		public var awardAmount:int;
		
		//下一个任务id   没有的为0
		public var nextTask:int;
		
		//任务标记
		public var taskMark:int;
		
		//前置任务
		public var frontTask:int;
		
		public function TaskInfoCfg() 
		{
			
		}
		
	}

}