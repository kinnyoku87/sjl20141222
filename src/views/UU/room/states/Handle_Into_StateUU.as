package views.UU.room.states 
{
	import configs.room.RoomModConfig;
	import configs.skinname.SkinNameConfig;
	import models.GameModel;
	import net.NetManager;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.QuickJoinRoomReq;
	import utils.TextUtil;
	import views.UU.room.Room_Create_StateUU;
	/**
	 * ...进入房间的操作区
	 * @author ... dcl
	 */
	public class Handle_Into_StateUU extends StateUU
	{
		private var btnInto:ButtonUU;             //快速进入
		
		private var btnCreate:ButtonUU;          //创建房间
		
		public function Handle_Into_StateUU() 
		{
			
		}
		
		override public function onEnter():void 
		{
			var txt:LabelUU;
			
			btnInto = new ButtonUU(SkinNameConfig.into_room_btn);
			TextUtil.decorateLabel6(btnInto.getLabel(), "自动加入", 36, 0xffe2b9, false, 0x371c02);
			this.fusion.addNode(btnInto);
			btnInto.locatingTypeForHoriz = LocatingType.F___A___F;
			btnInto.locatingTypeForVerti = LocatingType.F___A___F;
			btnInto.locatingOffsetX = -150;
			btnInto.addEventListener(ATouchEvent.CLICK,onIntoClick);
			
			//txt = TextUtil.createLabel6("快速开始", 36, 0xffe2b9, true, 0x371c02);
			//btnInto.addNode(txt);
			//txt.locatingTypeForHoriz = LocatingType.F___A___F;
			//txt.locatingTypeForVerti = LocatingType.F___A___F;
			//txt.locatingOffsetX = -15;
			//txt.locatingOffsetY = -10;
			
			btnCreate = new ButtonUU(SkinNameConfig.create_room_btn);
			TextUtil.decorateLabel6(btnCreate.getLabel(), "创建房间", 36, 0xffe2b9, false, 0x371c02);
			this.fusion.addNode(btnCreate);
			btnCreate.locatingTypeForHoriz = LocatingType.F___A___F;
			btnCreate.locatingTypeForVerti = LocatingType.F___A___F;
			btnCreate.locatingOffsetX = 150;
			btnCreate.addEventListener(ATouchEvent.CLICK, onCreateClick);
			
			//txt = TextUtil.createLabel6("创建房间", 36, 0xffe2b9, true, 0x371c02);
			//btnCreate.addNode(txt);
			//txt.locatingTypeForHoriz = LocatingType.F___A___F;
			//txt.locatingTypeForVerti = LocatingType.F___A___F;
			//txt.locatingOffsetX = -15;
			//txt.locatingOffsetY = -10;
		}
		
		
		private function onIntoClick(e:ATouchEvent):void {
			var quickIntoRes:QuickJoinRoomReq = new QuickJoinRoomReq();
			quickIntoRes.mod = GameModel.gameMode;
			quickIntoRes.stage = RoomModConfig.curStage;
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_QUICK_JOIN_REQ, quickIntoRes);
			
			UUFacade.getWindow(Room_TimeCount_StateUU).activate();
		}
		
		private function onCreateClick(e:ATouchEvent):void {
			UUFacade.getWindow(Room_Create_StateUU).activate();
		}
		
		override public function onExit():void 
		{	
			super.onExit();
			this.fusion.removeNode(btnInto);
			this.fusion.removeNode(btnCreate);
			btnInto.removeEventListener(ATouchEvent.CLICK,onIntoClick);
			btnCreate.removeEventListener(ATouchEvent.CLICK,onCreateClick);
		}
	}

}