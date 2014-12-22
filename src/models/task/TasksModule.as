package models.task 
{
	import configs.task.AchievementVO;
	import configs.task.TaskConfiguration;
	import configs.task.TaskInfoCfg;
	import configs.task.TaskVO;
	import models.GameModel;
	import models.player.PlayerModel;
	import net.NetManager;
	import proto.com.CAMP_ID;
	import proto.com.EventCond;
	import proto.com.EventID;
	import proto.cs.AcceptQuestReq;
	import proto.cs.CmdCodeQuest;
	import proto.cs.CmdType;
	import proto.cs.CommitQuestReq;
	import proto.cs.GetQuestRes;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class TasksModule 
	{
		//任务类型
		public static const TASK_DAY:int = 1;
		public static const TASK_WEEK:int = 2;
		public static const TASK_GROWTH:int = 3;
		public static const TASK_FIXED:int = 4;
		
		
		public static var isFirstOpen:Boolean = false;    //是否打开过了
		
		public static var completed:Array = [];           //前端存储的完成的任务id
		
		public static var acceptedList:Vector.<TaskVO> = new Vector.<TaskVO>();   // 后台返回的接收的任务数据
		public static var completedList:Array = [];                            //后台返回的完成的任务id
		
		public static var achivementVO:AchievementVO = new AchievementVO();
		
		public function TasksModule() 
		{
			
		}
		
		public static function whatWrong():void {
			if (acceptedList.length != 0)
            {
                acceptedList = new Vector.<TaskVO>();
            }
		}
		
		public static function initAllTask(questRes:GetQuestRes):void {
			if (acceptedList.length != 0)
            {
                acceptedList = new Vector.<TaskVO>();
            }
			var info:TaskInfoCfg;
			var i:int;
			var j:int;
            for (i = 0; i < questRes.acceptedIds.length; i++)
			{
                var temp:TaskVO = new TaskVO();
			    temp.taskID = questRes.acceptedIds[i];
				info = TaskConfiguration.getTask(temp.taskID);
				if (info == null)
                {
                    continue;
                }

                temp.requirementID = info.taskRequirement;
                if (temp.requirementID > EventID.EID_KILL_FOE_COUNT)
                {
                    temp.value = getTaskValue(temp.requirementID);
                }
                else
                {
                    temp.value = 0;
                }
                acceptedList.push(temp);
				GameModel.getLog().simplify("收到的任务有: [ {0}:{1} ].", temp.taskID,temp.taskCfg.name);		
			}

            for ( i = 0; i < questRes.completedIds.length; i++)
            {
				info = TaskConfiguration.getTask(questRes.completedIds[i]);
                if (info.taskType== TASK_GROWTH)
                {
                    completedList.push(questRes.completedIds[i]);
					GameModel.getLog().simplify("完成的任务有: [ {0}:{1} ].", info.taskId,info.name);		
                }
                

            }

            for ( i = 0; i < questRes.eventConds.length; i++)
            {
                for ( j  = 0; j < acceptedList.length; j++)
                {
                    if (EventCond(questRes.eventConds[i]).eventId == acceptedList[j].requirementID)
                    {
                        if (EventCond(questRes.eventConds[i]).resId == 0)
                        {
                            acceptedList[j].value = EventCond(questRes.eventConds[i]).value;
                        }
                        else if (EventCond(questRes.eventConds[i]).resId == acceptedList[j].taskID)
                        {
                            acceptedList[j].value = EventCond(questRes.eventConds[i]).value;
                            break;
                        }
                    }
                }
            }

            //填充永久成就信息
            for (i = 0; i < acceptedList.length; i++ )
            {
                setAchievementInfo(acceptedList[i].requirementID, acceptedList[i].value);
            }
            initGrowthTask();
		}
		
		public static function  initGrowthTask():void
        {
			var taskInfo:TaskInfoCfg;
			var i:int;
			var j:int;
            // 根据_acceptedList向服务器接取任务，过滤掉已经完成的任务
            for ( i = 0; i < acceptedList.length; i++)
            {
				taskInfo =  TaskConfiguration.getTask(acceptedList[i].taskID);
                var taskType:int = taskInfo.taskType;
                if (taskType == TASK_GROWTH)
                {
                    var bCompleted:Boolean = false;
                    for ( j = 0; j < completedList.length; j++)
                    {
                        if (acceptedList[i].taskID == completedList[j])
                        {
                            bCompleted = true;
                            break;
                        }
                    }
                    if (!bCompleted)
                    {
                        newTask(acceptedList[i].taskID);
                    }
                }
            }

            // 遍历tasktable表格, 过滤掉接受过的任务, 根据任务类型和前置条件去请求接受任务
			
			for each(var task:TaskInfoCfg in TaskConfiguration.taskList) {
				var bAccepted:Boolean = false;
				for (i = 0; i < acceptedList.length;i++ ) {
					if (acceptedList[i].taskID == task.taskId) {
						bAccepted = true;
						break;
					}
				}
				if (!bAccepted && task.taskType == TASK_GROWTH && task.frontTask == 0) {
					newTask(task.taskId);
				}
			}
        }
		
		
        /// 请求新的任务

        public static function newTask(taskID:int):void
        {
			var acceptQuestReq:AcceptQuestReq = new AcceptQuestReq;
			acceptQuestReq.resId = taskID;
			NetManager.sendRequest(CmdType.CT_QUEST, CmdCodeQuest.CC_QUEST_ACCEPT_REQ, acceptQuestReq);
			GameModel.getLog().simplify("向服务器请求了任务: [ {0} ].", taskID);		
        }
		

		/// 提交任务
        public static function submitTask(taskID:int):void
        {
			var questCommitReq:CommitQuestReq = new CommitQuestReq;
			questCommitReq.resId = taskID;
			NetManager.sendRequest(CmdType.CT_QUEST, CmdCodeQuest.CC_QUEST_COMMIT_REQ, questCommitReq);
			GameModel.getLog().simplify("向服务器提交了任务: [ {0} ].", taskID);
        }
		
		/**
		 * 查找该任务类型的所有任务ID
		 * @param	type   1. 每日任务 2. 周任务 3. 成长任务 4. 固定任务
		 * @return
		 */
		public static function findTask(type:int):Vector.<TaskVO>
        {
			var list:Vector.<TaskVO> = new Vector.<TaskVO>();	
            for (var i:int = 0; i < acceptedList.length; i++)
            {
				var info:TaskInfoCfg = TaskConfiguration.getTask(acceptedList[i].taskID);
				if (info.taskType == type || (type == 1 && info.taskType == TASK_FIXED)) {
					list.push(acceptedList[i]);
				}
            }
            return list;
        }
		
        /// 接受任务

        public static function  accepteTask(taskID:int):void
        {
            var temp:TaskVO = new TaskVO();
            temp.taskID = taskID;
			
			var info:TaskInfoCfg = TaskConfiguration.getTask(taskID);
			if (info == null)
            {
                return;
            }	
			
            
            if (temp.requirementID > EventID.EID_KILL_FOE_COUNT)
            {
                temp.value = getTaskValue(temp.requirementID);
            }
            else
            {
                temp.value = 0;
            }

            if (info.taskType == TASK_DAY)
            {
                //EventManager.instance.EmitEvent<Task>((uint)Events.TASK_RESET, temp);
            }

            acceptedList.push(temp);
			//EventManager.instance.EmitEvent((uint)Events.TASK_ACCEPT, temp);
            checkTask();
        }
		
		
        /// 更新任务进度

        public static function updateTaskSchedule(eventCond:Array):void
        {
			var i:int;
			var j:int;
            for (i = 0; i < eventCond.length; i++)
            {
                for (j = 0; j < acceptedList.length; j++)
                {
					var event:EventCond = eventCond[i];
                    if (event.eventId == acceptedList[j].requirementID)
                    {
						acceptedList[j].value = event.value;
                        if (acceptedList[j].requirementID >= EventID.EID_BATTLE_WIN_COUNT_1V1_HISTORY)
                        {
                            setAchievementInfo(acceptedList[j].requirementID, event.value);
                        }

						var  info:TaskInfoCfg = TaskConfiguration.getTask(acceptedList[j].taskID);
						if (acceptedList[j].value >= info.amount)
                        {
                            submitTask(acceptedList[j].taskID);
                        }

						if (event.resId == acceptedList[j].taskID)
                        {
                            break;
                        }
                    }
                }
            }
        }
        /// 删除任务

        public static function deletTask(taskId:int):void
        {
            for (var i:int = 0; i < acceptedList.length; i++)
            {
                if (taskId == acceptedList[i].taskID)
                {
                    acceptedList.splice(i,1);
                }
            }
        }
		
        /// 检测需要更新的任务进行更新。
        public static function checkTask():void
        {
            var value:int;
			var i:int;
            for (i = 0; i < acceptedList.length; i++)
            {
                if (acceptedList[i].requirementID > EventID.EID_KILL_FOE_COUNT)
                {
					var info:TaskInfoCfg = TaskConfiguration.getTask(acceptedList[i].taskID);
                    value = getTaskValue(acceptedList[i].requirementID);
                    if (value >= info.amount)
                    {
                        submitTask(acceptedList[i].taskID);
                    }
      
                }
            }
        }
		
		//获取已完成的任务
		//public static function getComplete():Array
        //{
           //
        //}
		
		//添加完成的任务
		public static function addCompletedId(id:int):void {
			if (completed.length > 0) {
				for (var i:int = 0 ; i < completed.length;i++ ) {
					if(completed[i] == id){
						return;
					}
				}
			}
			completed.push(id);
		}
		
		
        /// 获取任务当前值
        public static function getTaskValue(requirementID:int):int
        {
            var value:int = 0;

            switch (requirementID)
            {
                case EventID.EID_CAMP_LEVEL_TOTAL:
                {
					value = PlayerModel.getInstance().myRole.getTotalLevel;
                }
                break;

				case EventID.EID_CAMP_LEVEL_ZHOU:
				{
					value = PlayerModel.getInstance().myRole.getCampLevel(CAMP_ID.CAMP_ID_ZHOU);
                }
                break;

                case EventID.EID_CAMP_LEVEL_SHANGE:
                {
                    value = PlayerModel.getInstance().myRole.getCampLevel(CAMP_ID.CAMP_ID_SHANG);
                }
                break;
                case EventID.EID_CAMP_LEVEL_YAO:
                    {
                         value = PlayerModel.getInstance().myRole.getCampLevel(CAMP_ID.CAMP_ID_YAO);
                    }
                    break;
                case EventID.EID_CAMP_LEVEL_WU:
                 {
                        value = PlayerModel.getInstance().myRole.getCampLevel(CAMP_ID.CAMP_ID_WU);
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_1V1_HISTORY:
                    {
                        value = achivementVO._1v1WinCount;
                    }
                    break;

                case EventID.EID_BATTLE_WIN_COUNT_IDENTITY_HISTORY:
                    {
                        value = achivementVO._identityWinCount;
                    }
                    break;

                case EventID.EID_BATTLE_WIN_ALL_COUNT_HISTORY:
                    {
                        value = achivementVO._winCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_SHANGE_HISTORY:
                    {
                        value = achivementVO._shangWinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_ZHOU_HISTORY:
                    {
                        value = achivementVO._zhouWinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_YAO_HISTORY:
                    {
                        value = achivementVO._yaoWinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_WU_HISTORY:
                    {
                        value = achivementVO._wuWinCount;
                    }
                    break;
                case EventID.EID_SHOP_CONSUME_COUNT_HISTORY:
                    {
                        value = achivementVO._shopSpendCount;
                    }
                    break;
                case EventID.EID_KILL_FOE_COUNT_HISTORY:
                    {
                        value = achivementVO._killCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_2V2_HISTORY:
                    {
                        value = achivementVO._2v2WinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_3V3_HISTORY:
                    {
                        value = achivementVO._3v3WinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_4V4_HISTORY:
                    {
                        value = achivementVO._4v4WinCount;
                    }
                    break;
            }
            return value;
        }
		
		
		
		// 获得成就信息
        public static function  getAchievementInfo(requirementID:int):int
        {
            var value:int = 0;
            switch (requirementID)
            {
                case EventID.EID_BATTLE_WIN_COUNT_1V1_HISTORY:
                    {
                        value = achivementVO._1v1WinCount;
                    }
                    break;

                case EventID.EID_BATTLE_WIN_COUNT_IDENTITY_HISTORY:
                    {
                        value = achivementVO._identityWinCount;
                    }
                    break;

                case EventID.EID_BATTLE_WIN_ALL_COUNT_HISTORY:
                    {
                        value = achivementVO._winCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_SHANGE_HISTORY:
                    {
                        value = achivementVO._shangWinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_ZHOU_HISTORY:
                    {
                        value = achivementVO._zhouWinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_YAO_HISTORY:
                    {
                        value = achivementVO._yaoWinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_WU_HISTORY:
                    {
                        value = achivementVO._wuWinCount;
                    }
                    break;
                case EventID.EID_SHOP_CONSUME_COUNT_HISTORY:
                    {
                        value = achivementVO._shopSpendCount;
                    }
                    break;
                case EventID.EID_KILL_FOE_COUNT_HISTORY:
                    {
                        value = achivementVO._killCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_2V2_HISTORY:
                    {
                        value = achivementVO._2v2WinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_3V3_HISTORY:
                    {
                        value = achivementVO._3v3WinCount;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_4V4_HISTORY:
                    {
                        value = achivementVO._4v4WinCount;
                    }
                    break;
            }
            return value;
        }
		
		
		//设置成就信息
        public static function  setAchievementInfo( requirementID:int, value:int):void
        {
            switch (requirementID)
            {
                case EventID.EID_BATTLE_WIN_COUNT_1V1_HISTORY:
                    {
                        achivementVO._1v1WinCount = value;
                    }
                    break;

                case EventID.EID_BATTLE_WIN_COUNT_IDENTITY_HISTORY:
                    {
                        achivementVO._identityWinCount = value;
                    }
                    break;

                case EventID.EID_BATTLE_WIN_ALL_COUNT_HISTORY:
                    {
                        achivementVO._winCount = value;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_SHANGE_HISTORY:
                    {
                        achivementVO._shangWinCount = value;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_ZHOU_HISTORY:
                    {
                        achivementVO._zhouWinCount = value;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_YAO_HISTORY:
                    {
                        achivementVO._yaoWinCount = value;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_CAMP_WU_HISTORY:
                    {
                        achivementVO._wuWinCount = value;
                    }
                    break;
                case EventID.EID_SHOP_CONSUME_COUNT_HISTORY:
                    {
                        achivementVO._shopSpendCount = value;
                    }
                    break;
                case EventID.EID_KILL_FOE_COUNT_HISTORY:
                    {
                        achivementVO._killCount = value;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_2V2_HISTORY:
                    {
                        achivementVO._2v2WinCount = value;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_3V3_HISTORY:
                    {
                        achivementVO._3v3WinCount = value;
                    }
                    break;
                case EventID.EID_BATTLE_WIN_COUNT_4V4_HISTORY:
                    {
                        achivementVO._4v4WinCount = value;
                    }
                    break;
            }
        }
		
				
		//清除
		public static function clear():void
		{
			completedList = [];
			acceptedList = new Vector.<TaskVO>();
			completed = [];
		}
		
	}

}