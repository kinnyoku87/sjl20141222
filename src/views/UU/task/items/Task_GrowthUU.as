package views.UU.task.items 
{
	import configs.task.TaskVO;
	import flash.text.TextFieldAutoSize;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import ui.ItemView;
	import utils.TextUtil;
	/**
	 * ...成长任务item
	 * @author ... dcl
	 */
	public class Task_GrowthUU extends ItemView
	{
		private var hoverBg:ImageLoaderUU;
		private	var selectBg:ImageLoaderUU;
		private var nameLabel:LabelUU;
		private var dscLabel:LabelUU;
		private var amoutLabel:LabelUU;
		private var taskInfo:TaskVO;
		
		public function Task_GrowthUU() 
		{
			
		}
		
		
		override protected function init():void {
			super.init();
			var bg:ImageLoaderUU;
			
			bg = new ImageLoaderUU;
			bg.source = TResourceManager.getAsset("task/img/growth_background.png");
			this.addNode(bg);
			this.spaceWidth = bg.width;
			this.spaceHeight = bg.height;
			
			hoverBg = new ImageLoaderUU;
			hoverBg.source = TResourceManager.getAsset("task/img/task_hover.png");
			hoverBg.width = bg.width - 25;
			this.addNode(hoverBg);
			hoverBg.locatingTypeForHoriz = LocatingType.F_A____F;
			hoverBg.locatingTypeForVerti = LocatingType.F___A___F;
			hoverBg.locatingOffsetX = 25;
			
			selectBg = new ImageLoaderUU;
			selectBg.source = TResourceManager.getAsset("task/img/task_select.png");
			selectBg.width = bg.width - 25;
			this.addNode(selectBg);
			selectBg.locatingTypeForHoriz = LocatingType.L_A____L;
			selectBg.locatingTypeForVerti = LocatingType.L_A____L;
			
			nameLabel = TextUtil.createLabel6("", 28, 0x452a14, true,-1,0,TextFieldAutoSize.LEFT);
			this.addNode(nameLabel);
			nameLabel.locatingTypeForHoriz = LocatingType.F_A____F;
			nameLabel.locatingTypeForVerti = LocatingType.F___A___F;
			nameLabel.locatingOffsetX = 30;
			
			dscLabel = TextUtil.createLabel6("", 24, 0x452a14, false,-1,0,TextFieldAutoSize.LEFT);
			this.addNode(dscLabel);
			dscLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			dscLabel.locatingTypeForVerti = LocatingType.L___A___L;
			
			amoutLabel = TextUtil.createLabel6("", 24, 0xef192d, false, 0x452a14);
			this.addNode(amoutLabel);
			amoutLabel.locatingTypeForHoriz = LocatingType.F____A_F;
			amoutLabel.locatingTypeForVerti = LocatingType.F___A___F;
			amoutLabel.locatingOffsetX = -30;
			
			//updateView();
		}
		
		
		override protected function updateView():void {
			hoverBg.visible = selectBg.visible = false;
			if (selected) {
				selectBg.visible = true;
			}
			taskInfo = data as TaskVO;
			nameLabel.text = taskInfo.taskCfg.name +" : ";
			dscLabel.text = taskInfo.taskCfg.condent;
			amoutLabel.text = "("+taskInfo.value + "/" + taskInfo.taskCfg.amount+")";
			if (taskInfo.value >= taskInfo.taskCfg.amount ) {
				amoutLabel.color = 0x65ef19;
			}else {
				amoutLabel.color = 0xef192d;
			}
			
		}
		
		override protected function onHover(e:ATouchEvent):void {
			if (selected) return;
			hoverBg.visible = true;
		}
		
		override protected function onLeave(e:ATouchEvent):void {
			if (selected) return;
			hoverBg.visible = false;
		}
		
		override public function set selected(value:Boolean):void 
		{
			_selected = value;
			selectBg.visible = value;
			updateView();
		}
	}

}