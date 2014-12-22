package views.UU.task.items 
{
	import configs.task.TaskConfiguration;
	import configs.task.TaskInfoCfg;
	import configs.task.TaskVO;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import ui.ItemView;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Task_DayUU extends ItemView
	{
		private var complete:ImageLoaderUU;   //完成
		private var nameLabel:LabelUU;        //任务名称
		private var dscLabel:LabelUU;         //任务描述
		private var countLabel:LabelUU;       //任务数量
		private var awardLabel:LabelUU;       //任务奖励
		private var completeLabel:LabelUU;       //任务完成说明
		private var taskinfo:TaskVO;
		
		public function Task_DayUU() 
		{
			
		}
		
		override protected function init():void {
			super.init();
			var bg:ImageLoaderUU;
			var nameBack:ImageLoaderUU;
			var amountBack:ImageLoaderUU;
			var yinzi:ImageLoaderUU;
			var multi:ImageLoaderUU;
			
			bg = new ImageLoaderUU;
			bg.source = TResourceManager.getAsset("task/img/week_background.png");
			this.addNode(bg);
			
			this.spaceWidth = bg.width;
			this.spaceHeight = bg.height;
			
			nameBack = new ImageLoaderUU;
			nameBack.source = TResourceManager.getAsset("task/img/name_background.png");
			this.addNode(nameBack);
			nameBack.locatingTypeForHoriz = LocatingType.F___A___F;
			nameBack.locatingTypeForVerti = LocatingType.F_A____F;
			nameBack.locatingOffsetY = 50 / Agony.getAdapter().pixelRatio;
			
			amountBack = new ImageLoaderUU;
			amountBack.source = TResourceManager.getAsset("task/img/amount_background.png");
			this.addNode(amountBack);
			amountBack.locatingTypeForHoriz = LocatingType.F___A___F;
			amountBack.locatingTypeForVerti = LocatingType.F____A_F;
			amountBack.locatingOffsetY = -50 / Agony.getAdapter().pixelRatio;
			
			
			
			multi = new ImageLoaderUU;
			multi.source = TResourceManager.getAsset("task/img/multi.png");
			this.addNode(multi);
			multi.locatingTypeForHoriz = LocatingType.F___A___F;
			multi.locatingTypeForVerti = LocatingType.F___A___F;
			multi.locatingOffsetY = 60;
			
			yinzi = new ImageLoaderUU;
			yinzi.source = TResourceManager.getAsset("task/img/yinzi.png");
			this.addNode(yinzi);
			yinzi.locatingTypeForHoriz = LocatingType.A_L____L;
			yinzi.locatingTypeForVerti = LocatingType.L___A___L;
			yinzi.locatingOffsetX = -20;
			
			awardLabel = TextUtil.createLabel6("", 24, ColorUtil.WHITE,true,0x360e04);
			this.addNode(awardLabel);
			awardLabel.locatingNode = multi;
			awardLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			awardLabel.locatingTypeForVerti = LocatingType.L___A___L;
			awardLabel.locatingOffsetX = 15;
			
			nameLabel = TextUtil.createLabel6("", 35, 0x661706,false,-1);
			this.addNode(nameLabel);
			nameLabel.locatingNode = nameBack;
			nameLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			nameLabel.locatingTypeForVerti = LocatingType.L___A___L;
				
			dscLabel = TextUtil.createLabel6("", 19, 0x502720, false, -1);
			dscLabel.wordWrap = true;
			dscLabel.width = 300;
			this.addNode(dscLabel);
			dscLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			dscLabel.locatingTypeForVerti = LocatingType.F___A___F;
			dscLabel.locatingOffsetY = -20;
		
			
			countLabel = TextUtil.createLabel6("", 25, ColorUtil.WHITE,true,0x360e04);
			this.addNode(countLabel);
			countLabel.locatingNode = amountBack;
			countLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			countLabel.locatingTypeForVerti = LocatingType.L___A___L;
			
			completeLabel = TextUtil.createLabel6("", 20, ColorUtil.GREEN, false);
			this.addNode(completeLabel);
			completeLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			completeLabel.locatingTypeForVerti = LocatingType.F____A_F;
			completeLabel.locatingOffsetY = -30;
			
			complete = new ImageLoaderUU;
			complete.source = TResourceManager.getAsset("task/img/complete.png");
			this.addNode(complete);
			complete.locatingTypeForHoriz = LocatingType.F____A_F;
			complete.locatingTypeForVerti = LocatingType.F____A_F;
			complete.locatingOffsetY = -10;
			complete.visible = false;
			
			//updateView();
		}
		
		override protected function updateView():void {
			taskinfo = data as TaskVO;
			nameLabel.text = taskinfo.taskCfg.name;
			dscLabel.text = taskinfo.taskCfg.des;
			countLabel.text = taskinfo.value +"/" + taskinfo.taskCfg.amount;
			awardLabel.text = taskinfo.taskCfg.awardAmount.toString();
		}
		
		public function set completeTaskId(taskId:int):void {
			var taskCfg:TaskInfoCfg = TaskConfiguration.getTask(taskId);
			nameLabel.text = taskCfg.name;
			dscLabel.text = taskCfg.des;
			countLabel.text = taskCfg.amount +"/" + taskCfg.amount;
			awardLabel.text = taskCfg.awardAmount.toString(); 
			completeLabel.text = taskCfg.name + "任务已完成";
			complete.visible = true;
		}
		
	}

}