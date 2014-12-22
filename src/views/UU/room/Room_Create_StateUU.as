package views.UU.room 
{
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import models.GameModel;
	import models.room.RoomModule;
	import net.NetManager;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.CheckBoxUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.TextInputUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import proto.com.RoomBaseInfo;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.CreateRoomReq;
	import ui.ShildStateUU;
	import utils.TextUtil;
	/**
	 * ...创建房间
	 * @author ... dcl
	 */
	public class Room_Create_StateUU extends ShildStateUU
	{
		//private static const NAME:String = "创建房间";
		private var pass_input:TextInputUU;
		private var time_input:TextInputUU;
		private var okBtn:ButtonUU;
		private var cancelBtn:ButtonUU;
		private var checkBox:CheckBoxUU;
		private var maskBg:RawSpriteUU;
		public function Room_Create_StateUU() 
		{
			NAME = "创建房间";
		}
		
		override public function onEnter():void {
			super.onEnter();
			
			var bgImg:Scale9BitmapUU;
			//var title:LabelUU;
			var password:LabelUU;
			var time:LabelUU;
			var forbid:LabelUU;
			var img:Scale9BitmapUU;
			
			var isArea:Boolean = RoomModule.getRoomMode() == RoomModConfig.ROOM_MOD_ARENA;
			
			
			// 背景
			bgImg = new Scale9BitmapUU;
			bgImg.source = TResourceManager.getAsset("common/img/dialog_bg_B.png");
			bgImg.width = 550 ;
			bgImg.height = 400 ;
			this.fusion.addNode(bgImg);
			this.fusion.spaceWidth = bgImg.width;
			this.fusion.spaceHeight = bgImg.height;
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			
			title = TextUtil.createLabel6(NAME, 24, 0xfea768, true, 0x320702);
			this.fusion.addNode(title);
			title.locatingTypeForHoriz = LocatingType.F___A___F;
			title.locatingTypeForVerti = LocatingType.F_A____F;
			title.locatingOffsetY = 8;
			
			
			//closeBtn = new ButtonUU(SkinNameConfig.common_close_B);
			//
			//closeBtn.locatingTypeForHoriz = LocatingType.F____A_F;
			//closeBtn.locatingTypeForVerti = LocatingType.F_A____F;
			//closeBtn.locatingOffsetX = -5;
			//closeBtn.locatingOffsetY = 5;
			//closeBtn.addEventListener(ATouchEvent.CLICK, closeClick);
			this.fusion.addNode(closeBtn);
			
			
			// 輸入文本1.
			img = new Scale9BitmapUU
			img.source = TResourceManager.getAsset("room/img/friend_bg_scale9.png");
			//img.source = TResourceManager.getAsset("login/img/inputBox.png");
			this.fusion.addNode(img);
			img.width = 250;
			img.height = 50;
			img.locatingOffsetX = 40;
			img.locatingOffsetY = -93;
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			password = TextUtil.createLabel6("密     码：", 22,0xa38a69);
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
			pass_input.locatingOffsetY = -93 + 6;
			pass_input.width = 250;
			pass_input.height = 42;
			pass_input.color = 0xFFFFFF
			pass_input.size = 22
			pass_input.maxChars = 8;
			pass_input.font = TextUtil.FONT_A;
			
			img.visible = pass_input.visible = password.visible =  !isArea;
			
			// 密碼.
			// 輸入文本2.
			img = new Scale9BitmapUU
			img.source = TResourceManager.getAsset("room/img/friend_bg_scale9.png");
			this.fusion.addNode(img);
			img.width = 250;
			img.height = 50;
			img.locatingOffsetX = 40;
			img.locatingOffsetY = -15;
			if (isArea) img.locatingOffsetY = -50;
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
			
			time = TextUtil.createLabel6("出牌时间：", 22,0xa38a69);
			this.fusion.addNode(time);
			time.locatingOffsetX = -8;
			time.locatingOffsetY = -3;
			time.locatingTypeForHoriz = LocatingType.A_L____L
			time.locatingTypeForVerti = LocatingType.L___A___L;
			
			time_input = new TextInputUU(false);
			this.fusion.addNode(time_input);
			time_input.locatingOffsetX = 40 + 6 ;
			time_input.locatingOffsetY = -15 + 6;
			if (isArea) time_input.locatingOffsetY = -50 + 6;
			time_input.locatingTypeForHoriz = LocatingType.F___A___F;
			time_input.locatingTypeForVerti = LocatingType.F___A___F;
			time_input.width = 250;
			time_input.height = 42;
			time_input.color = 0xFFFFFF
			time_input.size = 22
			time_input.maxChars = 22;
			time_input.font = TextUtil.FONT_A;
			time_input.text = "90";
			time_input.restrict = "0-9";
			
			// 禁止聊天.
			checkBox = new CheckBoxUU(SkinNameConfig.room_checkbox_btn, false);
			this.fusion.addNode(checkBox);
			
			forbid = TextUtil.createLabel6("禁止聊天", 22,0xa38a69);
			checkBox.addNode(forbid);
			checkBox.locatingOffsetX = 80
			checkBox.locatingOffsetY = 45
			if (isArea) checkBox.locatingOffsetY = 25;
			checkBox.locatingTypeForHoriz = LocatingType.F___A___F
			checkBox.locatingTypeForVerti = LocatingType.F___A___F;
			
			//forbid.locatingOffsetX =
			forbid.locatingTypeForHoriz = LocatingType.A_L____L;
			forbid.locatingTypeForVerti = LocatingType.L___A___L;
			
			
			
			okBtn = new ButtonUU(SkinNameConfig.common_B);
			TextUtil.decorateLabel6(okBtn.getLabel(),"确认", 22, 0xffffae,true);
			this.fusion.addNode(okBtn);
			okBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			okBtn.locatingTypeForVerti = LocatingType.F____A_F;
			okBtn.locatingOffsetX = -100;
			okBtn.locatingOffsetY = -50;
			okBtn.addEventListener(ATouchEvent.CLICK,onOkClick);
			
			cancelBtn = new ButtonUU(SkinNameConfig.common_B);
			TextUtil.decorateLabel6(cancelBtn.getLabel(),"取消", 22, 0xffffae,true);
			this.fusion.addNode(cancelBtn);
			cancelBtn.locatingTypeForHoriz = LocatingType.F___A___F;
			cancelBtn.locatingTypeForVerti = LocatingType.F____A_F;
			cancelBtn.locatingOffsetX = 100;
			cancelBtn.locatingOffsetY = -50;
			cancelBtn.addEventListener(ATouchEvent.CLICK,closeClick);
			
			addRootEvent();
		}
		
		//关闭 取消点击
		override protected function closeClick(e:ATouchEvent):void {
			UUFacade.getWindow(Room_Create_StateUU).close();
		}
		
		//确认点击
		private function onOkClick(e:ATouchEvent):void {
			var msg:CreateRoomReq = new CreateRoomReq();
			msg.roomBaseInfo = new RoomBaseInfo();
			if (pass_input.text != "") {
				msg.roomBaseInfo.pwd = pass_input.text;
			}
			msg.roomBaseInfo.playCardTime = int(time_input.text);
			msg.roomBaseInfo.isChat = !checkBox.selected;
			msg.roomBaseInfo.stage  = RoomModConfig.curStage;
			msg.roomBaseInfo.mod = GameModel.gameMode;
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_CREATE_REQ, msg);
			closeClick(e);
		}
		
		//override public function onExit():void {
			//super.onExit();
			//this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		//}
		
		//private function onResize(e:AEvent):void {
			//maskBg.graphics.clear();
			//maskBg.graphics.beginFill(0x0,0.5);
			//maskBg.graphics.drawRect((this.fusion.width  - Agony.getAdapter().rootWidth) / 2, (this.fusion.height  - Agony.getAdapter().rootHeight) / 2, Agony.getAdapter().rootWidth, Agony.getAdapter().rootHeight);
			//maskBg.graphics.endFill();
			//
			//this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			//this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
			//
			//
		//}
	}

}