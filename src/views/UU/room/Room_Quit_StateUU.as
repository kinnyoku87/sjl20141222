package views.UU.room 
{
	import configs.skinname.SkinNameConfig;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import ui.ShildStateUU;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ...
	 */
	public class Room_Quit_StateUU extends ShildStateUU
	{
		public function Room_Quit_StateUU() 
		{
			NAME = "提示";
			notDefaultClose = true;
		}
		override public function onEnter():void {
			super.onEnter();
			
			var content:String = this.stateArgs[0] as String;
			var bgImg:Scale9BitmapUU;
			// 背景
			bgImg = new Scale9BitmapUU;
			bgImg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			bgImg.width = 600;
			bgImg.height = 400;
			this.fusion.addNode(bgImg);
			this.fusion.spaceWidth = bgImg.width;
			this.fusion.spaceHeight = bgImg.height;

			this.fusion.addNode(title);
			
			var msgLabel:LabelUU = TextUtil.createLabel6(content, 25, ColorUtil.WHITE, false, ColorUtil.rgb(36, 16, 0), 1);
			this.fusion.addNode(msgLabel);
			msgLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			msgLabel.locatingTypeForVerti = LocatingType.F___A___F;
			msgLabel.locatingOffsetY = -20;
			
			var btn:ButtonUU = new ButtonUU;
			btn.skinName = SkinNameConfig.common_A;
			TextUtil.decorateLabel6(btn.getLabel(),"确定",25,ColorUtil.rgb(231,196,134),true,ColorUtil.BLACK,1);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F____A_F;
			btn.locatingOffsetY = -70;
			btn.addEventListener(ATouchEvent.CLICK, onBtnClick);
			this.fusion.addNode(btn);
			addRootEvent();
		}
		
		private function onBtnClick(et:ATouchEvent):void {
			UUFacade.getWindow(Room_Quit_StateUU).close();	
		}
		
	}

}