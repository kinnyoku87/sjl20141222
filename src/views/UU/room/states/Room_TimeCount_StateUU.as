package views.UU.room.states 
{
	import cn.flashk.controls.Button;
	import configs.skinname.SkinNameConfig;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import net.NetManager;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import ui.ShildStateUU;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Room_TimeCount_StateUU extends ShildStateUU
	{
		private var timer:Timer;
		private var updateTime:int;
		private var titleLabel:LabelUU;
		private var timeLabel:LabelUU;
		private var bg:Scale9BitmapUU;
		private var cancelBtn:ButtonUU;
		public function Room_TimeCount_StateUU() 
		{
			
		}
		
		override public function onEnter () : void {
			super.onEnter();
			
			
			//bg = new Scale9MultiBitmapsUU;
			//bg.skinName = SkinNameConfig.room_timeprompt_scale9;
			bg = new Scale9BitmapUU;
			bg.source = TResourceManager.getAsset("room/img/time_prompt_scale9.png");
			this.fusion.addNode(bg);
			bg.touchable = false;
			this.fusion.spaceWidth = bg.width = 500;
			this.fusion..spaceHeight = bg.height = 200;
			
			titleLabel = TextUtil.createLabel6("提示",30,0xA38A69,false,ColorUtil.BLACK,1);
			this.fusion.addNode(titleLabel);
			titleLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			titleLabel.locatingTypeForVerti = LocatingType.F_A____F;
			titleLabel.locatingOffsetY = 20;
			
			timeLabel = TextUtil.createLabel6("", 20, 0xFFB448,false,-1);
			this.fusion.addNode(timeLabel);
			timeLabel.locatingTypeForHoriz = LocatingType.F___A___F;
			timeLabel.locatingTypeForVerti = LocatingType.F___A___F;
			timeLabel.locatingOffsetY = -10;
			
			cancelBtn = new ButtonUU(SkinNameConfig.common_C);
			TextUtil.decorateLabel6(cancelBtn.getLabel(), "取消", 20, 0xFFFFAE,false,ColorUtil.BLACK,1);
			this.fusion.addNode(cancelBtn);
			cancelBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			cancelBtn.locatingTypeForVerti = LocatingType.F____A_F;
			cancelBtn.locatingOffsetY = -30;
			
			cancelBtn.addEventListener(ATouchEvent.CLICK, onCancelClick);
			
			//this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
			//onResize(null);
			addRootEvent();
			
			updateTime = 181;
			onUpdateTime(null);
			timer = new Timer(1000, 0);
			timer.addEventListener(TimerEvent.TIMER, onUpdateTime);
			timer.start();
		}
		
		private function onUpdateTime(evt:TimerEvent):void {
			
			if (updateTime == 0) {
				updateTime = 181;
			}
			updateTime --;
			timeLabel.text = "正在为您匹配对手，最多还需要等待" + "<font color='#" + ColorUtil.RED.toString(16) +"'>" + updateTime.toString() +"</font>秒。。。";
		}
		
		private function onCancelClick(evt:ATouchEvent):void {
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_MATCH_QUIT_REQ, null);
			UUFacade.getWindow(Room_TimeCount_StateUU).close();
		}

		override public function onExit () : void {
			super.onExit();
			timer.stop();
			timer = null;
			cancelBtn.removeEventListener(ATouchEvent.CLICK,onCancelClick);
		}
		//
		//private function onResize(evt:NodeEvent):void {
			//this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			//this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		//}
		
		
		
	}

}