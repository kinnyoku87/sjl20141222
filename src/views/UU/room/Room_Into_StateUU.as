package views.UU.room 
{
	import configs.skinname.SkinNameConfig;
	import models.GameModel;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import proto.com.RoomBaseInfo;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.JoinRoomReq;
	import ui.ShildStateUU;
	import utils.path.ErrorUtil;
	import utils.TextUtil;
	/**
	 * ... 进入房间输入密码界面
	 * @author ... dcl
	 */
	public class Room_Into_StateUU extends ShildStateUU
	{
		private var curRoomInfo:RoomBaseInfo;
		private var pass_input:TextInputUU;
		private var okBtn:ButtonUU;
		private var cancelBtn:ButtonUU;
		
		public function Room_Into_StateUU() 
		{
			NAME = "提示";
		}
		
		override public function onEnter():void {
			super.onEnter();
			curRoomInfo = this.stateArgs[0];
			
			var bgImg:Scale9BitmapUU;
			var password:LabelUU;
			var img:Scale9BitmapUU;
			
			// 背景
			bgImg = new Scale9BitmapUU;
			bgImg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			bgImg.width = 400 / Agony.getAdapter().pixelRatio;
			bgImg.height = 250 / Agony.getAdapter().pixelRatio;
			this.fusion.addNode(bgImg);
			this.fusion.spaceWidth = bgImg.width;
			this.fusion.spaceHeight = bgImg.height;
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			
			//标题
			//title = TextUtil.createLabel6(NAME, 24, 0xfea768, true, 0x320702);
			//this.fusion.addNode(title);
			//title.locatingTypeForHoriz = LocatingType.F___A___F;
			//title.locatingTypeForVerti = LocatingType.F_A____F;
			//title.locatingOffsetY = 8;
			
			//关闭按钮
			//closeBtn = new ButtonUU(SkinNameConfig.common_close_B);
			//
			//closeBtn.locatingTypeForHoriz = LocatingType.F____A_F;
			//closeBtn.locatingTypeForVerti = LocatingType.F_A____F;
			//closeBtn.locatingOffsetX = -5;
			//closeBtn.locatingOffsetY = 5;
			//closeBtn.addEventListener(ATouchEvent.CLICK, closeClick);
			this.fusion.addNode(title);
			this.fusion.addNode(closeBtn);
			
			
			// 輸入文本1.
			img = new Scale9BitmapUU
			img.source = TResourceManager.getAsset("room/img/friend_bg_scale9.png");
			//img.source = TResourceManager.getAsset("login/img/inputBox.png");
			this.fusion.addNode(img);
			img.width = 250;
			img.height = 50;
			img.locatingOffsetX = 40;
			img.locatingOffsetY = -20;
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			
			password = TextUtil.createLabel6("输入密码：", 22,0xa38a69);
			this.fusion.addNode(password);
			password.locatingOffsetX = -8;
			password.locatingOffsetY = -3;
			password.locatingTypeForHoriz = LocatingType.A_L____L;
			password.locatingTypeForVerti = LocatingType.L___A___L;
			
			pass_input = new TextInputUU(false);
			this.fusion.addNode(pass_input);
			pass_input.locatingTypeForHoriz = LocatingType.F___A___F;
			pass_input.locatingTypeForVerti = LocatingType.F___A___F;
			pass_input.locatingOffsetX = 40 + 6;
			pass_input.locatingOffsetY = -20 + 6;
			pass_input.width = 250;
			pass_input.height = 42;
			pass_input.color = 0xFFFFFF
			pass_input.size = 22
			pass_input.maxChars = 22;
			pass_input.font = TextUtil.FONT_A;
			
			
			
			//确认按钮
			okBtn = new ButtonUU(SkinNameConfig.common_B);
			TextUtil.decorateLabel6(okBtn.getLabel(),"确认", 22, 0xffffae,true);
			this.fusion.addNode(okBtn);
			okBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			okBtn.locatingTypeForVerti = LocatingType.F____A_F;
			okBtn.locatingOffsetX = -100;
			okBtn.locatingOffsetY = -50;
			okBtn.addEventListener(ATouchEvent.CLICK,onOkClick);
			
			//取消按钮
			cancelBtn = new ButtonUU(SkinNameConfig.common_B);
			TextUtil.decorateLabel6(cancelBtn.getLabel(),"取消", 22, 0xffffae,true);
			this.fusion.addNode(cancelBtn);
			cancelBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			cancelBtn.locatingTypeForVerti = LocatingType.F____A_F;
			cancelBtn.locatingOffsetX = 100;
			cancelBtn.locatingOffsetY = -50;
			cancelBtn.addEventListener(ATouchEvent.CLICK,closeClick);
			
			addRootEvent();
			//this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		}
		
		//确认点击
		private function onOkClick(e:ATouchEvent):void {
			if (pass_input.text == "") {
				ErrorUtil.showError("请输入密码");
				return;
			}
			var joinReq:JoinRoomReq = new JoinRoomReq();
			joinReq.roomId = curRoomInfo.roomId;
			joinReq.pwd = pass_input.text;
			NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROOM_JOIN_REQ,joinReq);
			//closeClick(e);-
		}
		
		//关闭 取消点击
		override protected function closeClick(e:ATouchEvent):void {
			UUFacade.getWindow(Room_Into_StateUU).close();
		}
		
		//override public function onExit():void {
			//super.onExit();
			//this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		//}
		
		//private function onResize(e:AEvent):void {
			//this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			//this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		//}
		//
	}

}