package views.UU.task 
{
	import configs.skinname.SkinNameConfig;
	import configs.task.TaskVO;
	import flash.events.TouchEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import ui.ShildStateUU;
	import utils.TextUtil;
	import views.UU.task.states.Task_Day_StateUU;
	import views.UU.task.states.Task_Growth_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Task_StateUU extends ShildStateUU
	{
		private var tabGroup:RadioGroupUU;
		private var bg:ImageLoaderUU;
		private var dayBtn:RadioUU;
		private var growthBtn:RadioUU;
		private var tabContent:StateFusionUU;
		
		public function Task_StateUU() 
		{
			notDefaultClose = true;
		}
		
		override public function onEnter():void {
			super.onEnter();
			bg = new ImageLoaderUU;
			bg.source = TResourceManager.getAsset("task/img/task_background.png");
			this.fusion.addNode(bg);
			this.fusion.spaceWidth = bg.width;
			this.fusion.spaceHeight = bg.height;
			
			
			tabContent = new StateFusionUU();
			this.fusion.addNode(tabContent);
			tabContent.spaceWidth = this.fusion.spaceWidth;
			tabContent.spaceHeight = this.fusion.spaceHeight;
			
			closeBtn = new ButtonUU;
			closeBtn.skinName = SkinNameConfig.common_close_C;
			
			closeBtn.locatingTypeForHoriz = LocatingType.F____A_F;
			closeBtn.locatingTypeForVerti = LocatingType.F_A____F;
			closeBtn.locatingOffsetY = 50;
			closeBtn.addEventListener(ATouchEvent.CLICK,onCloseClick);
			this.fusion.addNode(closeBtn);
			
			tabGroup = new RadioGroupUU();
			
			dayBtn = new RadioUU();
			dayBtn.skinName = SkinNameConfig.task_tab_btn;
			TextUtil.decorateLabel6(dayBtn.getLabel(),"今日任务",20,0xa57b55,true,0x1d170f,2);
			this.fusion.addNode(dayBtn);
			dayBtn.locatingTypeForHoriz = LocatingType.F_A____F;
			dayBtn.locatingTypeForVerti = LocatingType.F_A____F;
			dayBtn.locatingOffsetX = 70;
			dayBtn.locatingOffsetY = 110;
			dayBtn.group = tabGroup;
			
			growthBtn = new RadioUU();
			growthBtn.skinName = SkinNameConfig.task_tab_btn;
			TextUtil.decorateLabel6(growthBtn.getLabel(),"成就",20,0xa57b55,true,0x1d170f,2);
			this.fusion.addNode(growthBtn);
			growthBtn.locatingTypeForHoriz = LocatingType.L____L_A;
			growthBtn.locatingTypeForVerti = LocatingType.L___A___L;
			growthBtn.locatingOffsetX = 10;
			growthBtn.group = tabGroup;
			
			tabGroup.addEventListener(AEvent.CHANGE,onTabChange);
			tabGroup.selectedIndex = 0;
			addRootEvent();
		}

		private function onTabChange(evt:AEvent):void {
			var index:int  = tabGroup.selectedIndex;
			if (index == 0) {
				tabContent.setState(Task_Day_StateUU);
			}else if (index == 1) {
				tabContent.setState(Task_Growth_StateUU);
			}
		}
		
		private function onCloseClick(evt:ATouchEvent):void {
			UUFacade.getWindow(Task_StateUU).close();
		}
		
		override public function onExit():void {
			
		}
	}

}