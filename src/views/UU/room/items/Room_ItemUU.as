package views.UU.room.items 
{
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import flash.events.TouchEvent;
	import flash.filters.GlowFilter;
	import models.room.RoomModule;
	import net.NetManager;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.RoomBaseInfo;
	import proto.com.RoomState;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.JoinRoomReq;
	import ui.ItemView;
	import utils.TextUtil;
	import views.UU.room.Room_Into_StateUU;
	/**
	 * ...房间列表item
	 * @author ... dcl
	 */
	public class Room_ItemUU extends ItemView
	{
		private static const wait_color:uint = 0x90ff00;
		private static const gaming_color:uint = 0xff5a00;
		
		private var imgBg:ImageLoaderUU;            //背景条 
		private var imgSelect:ImageLoaderUU;        //选中条
		private var imgLock:ImageLoaderUU;
		
		private var roomIdTxt:LabelUU;             //房间号
		private var perNumTxt:LabelUU;              //人数
		private var timeTxt:LabelUU;                //时间
		private var setTxt:LabelUU;					//设定
		private var statusTxt:LabelUU;				//状态
		private var btnTxt:LabelUU;				//按钮文字
		private var handleBtn:ButtonUU;				//操作
		
		//private var _selected:Boolean;				//是否选中
		private var roomInfo:RoomBaseInfo;
		public var isCanInto:Boolean = false;
		public function Room_ItemUU() 
		{
			super();
		}
		
		override protected function init():void {
			super.init();
			imgBg = new ImageLoaderUU;
			imgBg.source = TResourceManager.getAsset("room/img/room_item_bg.png");
			imgBg.width = imgBg.width - 20;
			this.addNode(imgBg);
			
			imgSelect = new ImageLoaderUU;
			imgSelect.source = TResourceManager.getAsset("room/img/room_item_select.png");
			imgSelect.width = imgSelect.width - 20;
			this.addNode(imgSelect);
			
			roomIdTxt = new LabelUU;
			roomIdTxt.x = 20;
			roomIdTxt.y = 5;
			this.addNode(roomIdTxt);
			
			imgLock = new ImageLoaderUU;
			imgLock.source = TResourceManager.getAsset("room/img/pass_lock.png");
			imgLock.x = 105;
			imgLock.y = 10;
			this.addNode(imgLock);
			
			perNumTxt = new LabelUU();
			perNumTxt.x = 180;
			perNumTxt.y = 5;
			this.addNode(perNumTxt);
			
			timeTxt = new LabelUU();
			timeTxt.x = 310;
			timeTxt.y = 5;
			this.addNode(timeTxt);
			
			setTxt = new LabelUU();
			setTxt.x = 445;
			setTxt.y = 5;
			this.addNode(setTxt);
			
			statusTxt = new LabelUU();
			statusTxt.x = 595;
			statusTxt.y = 5;
			this.addNode(statusTxt);
			
			
			
			handleBtn = new ButtonUU();
			handleBtn.skinName = SkinNameConfig.common_B;
			handleBtn.x = 740;
			handleBtn.scaleX = 0.75;
			handleBtn.scaleY = 0.75;
			this.addNode(handleBtn);
			handleBtn.addEventListener(ATouchEvent.CLICK,onHandleClick);
			
			btnTxt = new LabelUU();
			btnTxt.locatingNode = handleBtn;
			btnTxt.locatingTypeForHoriz = LocatingType.L___A___L;
			btnTxt.locatingTypeForVerti = LocatingType.L___A___L;
			this.addNode(btnTxt);
			btnTxt.touchable = false;
			
			
			handleBtn.visible = btnTxt.visible = true;
			//竞技场模式不显示
			if (RoomModule.getRoomMode() == RoomModConfig.ROOM_MOD_ARENA) {
				handleBtn.visible = btnTxt.visible = false;
			}
			
			setTxtFormat(roomIdTxt);
			setTxtFormat(perNumTxt);
			setTxtFormat(timeTxt);
			setTxtFormat(setTxt);
			setTxtFormat(statusTxt);
			setTxtFormat(btnTxt);

			
		}
		
		override protected function updateView():void {
			roomInfo = data as RoomBaseInfo;
			roomIdTxt.text = roomInfo.roomId.toString();
			perNumTxt.text = roomInfo.memberCount + "/" + RoomModule.getInstance().getRoomMember;
			timeTxt.text = roomInfo.playCardTime+"秒";
			setTxt.text = roomInfo.isChat ? "允许聊天" : "禁止聊天";
			isCanInto = false;
			if (roomInfo.state == RoomState.ROOM_STATE_OPEN) {
				if (roomInfo.memberCount != RoomModule.getInstance().getRoomMember) {
					statusTxt.text = "等待中";
					statusTxt.color = ColorUtil.GREEN;
					isCanInto = true;
				}else {
					statusTxt.text = "人已满";
					statusTxt.color = ColorUtil.YELLOW;	
				}
				
				
			}else {
				statusTxt.text = "游戏中";
				statusTxt.color = ColorUtil.ORANGE;
			}
			
			
			btnTxt.text = "进入";
			if (RoomModule.getRoomMode() == RoomModConfig.ROOM_MOD_ARENA) {
				isCanInto = false;
			}
			imgLock.visible = roomInfo.pwd != null && roomInfo.pwd != "";
		}
		
		//public function setData(_data:Object):void {
			//data = _data;
			//UpdateView();
		//}
		
		public function setTxtFormat(label:LabelUU):void {		
			label.font = TextUtil.FONT_A;
			label.color = 0xa38a69;
			label.size = 20;
			label.filters = [new GlowFilter(ColorUtil.BLACK, 1, 2, 2, 22)];
			label.letterSpacing = 1;
			label.bold = true;
			label.touchable = false;
		}
		
		override public function get itemHeight():Number{
			return height;
		}
		
		//override protected function onClick(e:ATouchEvent):void {
			//if (selected) return;
			//selected = true;
		//}
		
		private function onHandleClick(e:ATouchEvent):void {
			if (roomInfo.pwd == null) {
				var joinReq:JoinRoomReq = new JoinRoomReq();
				joinReq.roomId = roomInfo.roomId;
				//joinReq.pwd = "";
				NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROOM_JOIN_REQ,joinReq);
			}else {
				UUFacade.getWindow(Room_Into_StateUU).activate([roomInfo]);
			}
		}
		
		override protected function onHover(e:ATouchEvent):void {
			super.onHover(e);
			if(isCanInto) {	
			   imgSelect.visible = true;
			   handleBtn.visible = true;
			}
			
		}
		
		
		override protected function onLeave(e:ATouchEvent):void {
			if (_selected) return;
			imgSelect.visible = false;
			handleBtn.visible = false;
		}
		
		
		override public function set selected(value:Boolean):void 
		{
			_selected = value;
			if(isCanInto) {	
			   imgSelect.visible = value;
			   handleBtn.visible = value;
			}else {
			   imgSelect.visible = false;
			   handleBtn.visible = false;
			}
			
		}
		
		
	}

}