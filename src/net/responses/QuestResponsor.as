package net.responses
{
	import models.task.TasksModule;
	import models.battle.BattleModel;
	
	import proto.cs.AcceptQuestRes;
	import proto.cs.CmdCodeQuest;
	import proto.cs.CommitQuestRes;
	import proto.cs.EventCondNtf;
	import proto.cs.GetQuestRes;
	import proto.cs.QuestBody;
	import proto.cs.ResetQuestRes;

	public class QuestResponsor implements IResponsor
	{
		
		public function onHandle(cmd_B:int, subMsg:Object,ret:int):void
		{
			var subMsg_A:QuestBody;
			
			subMsg_A = subMsg as QuestBody;
			switch(cmd_B){
				
				// 任務.
				case CmdCodeQuest.CC_QUEST_GET_RES:
					this.onQuestGet(subMsg_A.getQuestRes as GetQuestRes);
					break;
				case CmdCodeQuest.CC_QUEST_ACCEPT_RES:
					this.onAcceptRes(subMsg_A.acceptQuestRes as AcceptQuestRes);
					break;
				case CmdCodeQuest.CC_QUEST_COMMIT_RES:
					this.onCommitRes(subMsg_A.commitQuestRes as CommitQuestRes);
					break;
				case CmdCodeQuest.CC_QUEST_EVENT_COND_NTF:
					this.onEventNtf(subMsg_A.eventCondNtf as EventCondNtf);
					break;
				case CmdCodeQuest.CC_QUEST_RESET_RES:
					this.onResetRes(subMsg_A.resetQuestRes as ResetQuestRes);
					break;
				case CmdCodeQuest.CC_QUEST_SET_CUSTOM_VALUE_RES:
					
					break;
				default:
					
					break;
			}
		}
		
		// 获取任务列表
		private  function onQuestGet(v:GetQuestRes):void{
			//Global.getLog().message(this, v);
			TasksModule.initAllTask(v);
		}
		
		//接收任务
		private function onAcceptRes(v:AcceptQuestRes):void {
			TasksModule.accepteTask(v.resId);
		}
		
		//提交任务返回
		private function onCommitRes(v:CommitQuestRes):void {
			TasksModule.addCompletedId(v.resId);
			TasksModule.deletTask(v.resId);
            TasksModule.checkTask();
		}
		
		//有任务信息变更
		private function onEventNtf(v:EventCondNtf):void {
            TasksModule.updateTaskSchedule(v.eventConds);
		}
		
		//重置任务
		private function onResetRes(v:ResetQuestRes):void {
			TasksModule.deletTask(v.resId);
		}
	}
}