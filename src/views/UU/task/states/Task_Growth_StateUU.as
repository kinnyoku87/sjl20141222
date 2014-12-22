package views.UU.task.states 
{
	import configs.skinname.SkinNameConfig;
	import configs.task.TaskVO;
	import flash.text.TextFieldAutoSize;
	import models.task.TasksModule;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.inside.ViewFusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.PivotFusionUU;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.SliderUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.ViewportFusion;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import view.AA.ImageLoader_StateAA;
	import utils.TextUtil;
	import views.UU.task.items.Task_DayUU;
	import views.UU.task.items.Task_GrowthUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Task_Growth_StateUU extends StateUU
	{
		private var curInfo:TaskVO;
		private var curUU:Task_GrowthUU;
		private var growthHeight:Number;
		private var viewportFusion:ViewportFusion;
		private var listFusion:FusionUU;
		private var listFusionWidth:Number;
		private var listFusionHeight:Number;
		private var viewportHeight:Number;
		private var dscLabel:LabelUU;
		private var yinziLabel:LabelUU;
		
		public function Task_Growth_StateUU() 
		{
			
		}
		
		
		override public function onEnter():void {
			
			listFusion = new FusionUU;
			initGrowth();
		}
		
		private function initViews():void {
			var slider_A:SliderUU;
			var btn:ButtonUU;
			
			slider_A = new SliderUU(false);
			this.fusion.addNode(slider_A);
			slider_A.x = 90 + listFusionWidth + 5;
			slider_A.y = 180;
			
			btn = new ButtonUU;
			btn.skinName = SkinNameConfig.scroll_bar;
			btn.image.height = 50;
			slider_A.getThumb().addNode(btn);
			slider_A.dragOffsetValue = viewportHeight - btn.image.height;
			slider_A.model.addEventListener("change", function(e:AEvent):void {
				viewportFusion.vertiRatio = slider_A.model.ratio;
			});
			
			
			
			viewportFusion = new ViewportFusion(listFusionWidth, viewportHeight);
			this.fusion.addNode(viewportFusion);
			viewportFusion.x = 90;
			viewportFusion.y = 180;
			viewportFusion.contentWidth = listFusionWidth;
			viewportFusion.contentHeight = listFusionHeight;
			
			//var rawSprite:RawSpriteUU = new RawSpriteUU;
			//rawSprite.graphics.beginFill(0x0, 1.0);
			//rawSprite.graphics.drawRect(0, 0, listFusionWidth, listFusionHeight);
			//viewportFusion.content.addNode(rawSprite);
			
			
			//stateFusion.spaceWidth = 700;
			//stateFusion.spaceHeight = 500;
			viewportFusion.content.addNode(listFusion);
			
			
			var taskShow:ImageLoaderUU = new ImageLoaderUU;
			taskShow.source = TResourceManager.getAsset("task/img/task_show.png");
			this.fusion.addNode(taskShow);
			taskShow.locatingTypeForHoriz = LocatingType.F____A_F;
			taskShow.locatingOffsetX = -50;
			//taskShow.x = 90 + listFusionWidth + 30;
			taskShow.y = 170;
			
			var dscTitle:LabelUU = TextUtil.createLabel6("成就说明：", 30, ColorUtil.rgb(150, 111, 72), false, ColorUtil.BLACK, 1, TextFieldAutoSize.LEFT);
			this.fusion.addNode(dscTitle);
			dscTitle.locatingTypeForHoriz = LocatingType.L_A____L;
			dscTitle.locatingTypeForVerti = LocatingType.L____L_A;
			dscTitle.locatingOffsetY = 10;
			
			dscLabel = TextUtil.createLabel6("", 28, ColorUtil.rgb(191, 158, 124), false, ColorUtil.BLACK, 1, TextFieldAutoSize.LEFT,null,4);
			this.fusion.addNode(dscLabel);
			dscLabel.wordWrap = true;
			dscLabel.width = 330;
			dscLabel.locatingTypeForHoriz = LocatingType.L_A____L;
			dscLabel.locatingTypeForVerti = LocatingType.L____L_A;
			dscLabel.locatingOffsetY = 3;
			
			
			var awardTitle:LabelUU = TextUtil.createLabel6("获得奖励：", 30, ColorUtil.rgb(150, 111, 72), false, ColorUtil.BLACK, 1, TextFieldAutoSize.LEFT);
			this.fusion.addNode(awardTitle);
			awardTitle.locatingNode = taskShow;
			awardTitle.locatingTypeForHoriz = LocatingType.L_A____L;
			awardTitle.locatingTypeForVerti = LocatingType.L____L_A;
			awardTitle.locatingOffsetY = 300;
			
			var yinzi:ImageLoaderUU =  new ImageLoaderUU;
			yinzi.source = TResourceManager.getAsset("task/img/yinzi.png");
			this.fusion.addNode(yinzi);
			yinzi.locatingTypeForHoriz = LocatingType.L_A____L;
			yinzi.locatingTypeForVerti = LocatingType.L____L_A;
			yinzi.locatingOffsetY = 10;
			yinzi.locatingOffsetX = 30;
			
			
			var multi:ImageLoaderUU =  new ImageLoaderUU;
			multi.source = TResourceManager.getAsset("task/img/multi.png");
			this.fusion.addNode(multi);
			multi.locatingTypeForHoriz = LocatingType.L____L_A;
			multi.locatingTypeForVerti = LocatingType.L___A___L;
			multi.locatingOffsetX = 10;

			
			//银子数量
			yinziLabel = TextUtil.createLabel6("", 24, 0xffb244, true, -1, 1, TextFieldAutoSize.LEFT);
			this.fusion.addNode(yinziLabel);
			yinziLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			yinziLabel.locatingTypeForVerti = LocatingType.L___A___L;
			yinziLabel.locatingOffsetX = 10;
			
			setTaskGrowUU(curUU);
		}
		
		private  function initGrowth():void
        {
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
				listFusion.addNode(taskGrowthUU);
				//if (i == 0) {
					taskGrowthUU.locatingTypeForHoriz = LocatingType.F_A____F;
					taskGrowthUU.locatingTypeForVerti = LocatingType.F_A____F;
					//taskGrowthUU.locatingOffsetY = 120 / Agony.getAdapter().pixelRatio;
					//taskGrowthUU.locatingOffsetX = 50 / Agony.getAdapter().pixelRatio;
//
				//}else {
					//taskGrowthUU.locatingTypeForHoriz = LocatingType.L___A___L;
					//taskGrowthUU.locatingTypeForVerti = LocatingType.L____L_A;
				//}
				taskGrowthUU.locatingOffsetX = 0;
				taskGrowthUU.locatingOffsetY = (taskGrowthUU.height) * i;
				if (i == 0) {
					growthHeight = taskGrowthUU.height;
				}
				//taskGrowthUU.pivotX = 50;
				//taskGrowthUU.pivotY = (taskGrowthUU.height) * i;;
				taskGrowthUU.addEventListener(ATouchEvent.CLICK, onTaskSelect);
				if (i == 0 ) {
					curUU = taskGrowthUU;
				
				}
			}
			
			Agony.getFrame().addEventListener(AEvent.COMPLETE, addListComplete);
        }
		
		private function addListComplete(e:AEvent):void {
				trace("=======================" + listFusion.width + "," + listFusion.height);
				//viewportFusion.contentWidth = stateFusion.width;
				//viewportFusion.contentHeight = stateFusion.height;
				listFusionWidth = listFusion.width;
				listFusionHeight = listFusion.height;
				trace("==="+growthHeight * 4);
				viewportHeight = Math.min(listFusionHeight, growthHeight * 7);
				Agony.getFrame().removeEventListener(AEvent.COMPLETE, addListComplete);
				initViews();
		}
		
		
		private function updateInfos():void {
			dscLabel.text = curInfo.taskCfg.des;
			yinziLabel.text = "    "+curInfo.taskCfg.awardAmount.toString();
		}
		
		private function onTaskSelect(e:ATouchEvent):void {
			var target:Task_GrowthUU = e.target as Task_GrowthUU;
			//curInfo = target.data as TaskVO;
			//updateInfos();
			if (target == curUU) return;
			
			setTaskGrowUU(target);
		}
		
		private function setTaskGrowUU(taskUU:Task_GrowthUU):void {
			curUU.selected = false;
			curUU = taskUU;
			curUU.selected = true;
			curInfo = taskUU.data as TaskVO;
			updateInfos();
		}
		
		
		
		override public function onExit():void {
			//listFusion.kill();
			//listFusion.doDispose();
			//listFusion = null;
		}
		
	}

}