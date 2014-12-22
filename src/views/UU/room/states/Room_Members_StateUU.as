package views.UU.room.states 
{
	import com.netease.protobuf.UInt64;
	import configs.EventConfig;
	import configs.room.RoomModConfig;
	import event.EventManager;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import models.GameModel;
	import models.player.PlayerModel;
	import models.room.RoomEvent;
	import models.room.RoomMemberVo;
	import models.room.RoomModule;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CAMP_ID;
	import proto.com.RoomBaseInfo;
	import proto.com.RoomMemberInfo;
	import proto.com.RoomMod;
	import proto.cs.GetSimpleRoleRes;
	import utils.TextUtil;
	import views.UU.room.items.Room_RoleUU;
	
	/**
	 * ......进入房间 房间成员块
	 * @author ... dcl
	 */
	public class Room_Members_StateUU extends StateUU 
	{
		private var verLine:BitmapLoaderUU;
		private var memberObj:Object;
		private var memberMax:int;
		
		private var countLabel:LabelUU;
		private var countTimer:Timer;
		private var count:int;
		public function Room_Members_StateUU() 
		{
			
		}
		
		override public function onEnter():void 
		{
			
			verLine = new BitmapLoaderUU;
			verLine.source = TResourceManager.getAsset("room/img/vertical_line.png");
			this.fusion.addNode(verLine);
			verLine.locatingTypeForHoriz = LocatingType.F___A___F;
			verLine.locatingTypeForVerti = LocatingType.F___A___F;
			//verLine.visible = RoomModule.getRoomMode() == RoomModConfig.ROOM_MOD_FREE || RoomModConfig.ROOM_MOD_PRACTICE;
			if (GameModel.gameMode == RoomMod.ROOM_MOD_PRACTICE) {
				initPractiseData();
			}
			setMemberInfo();
			RoomModConfig.isInRoom = true;
			//EventManager.ins.addEvtListener(EventConfig.Update_Room_Role,onUpdateRoles);
			RoomModule.addEventListener(RoomEvent.Update_Room_Role, onUpdateRoles);
			RoomModule.addEventListener(RoomEvent.Owner_Start_Ntf, onOwnerStart);
			
			countLabel = TextUtil.createLabel6("", 25, ColorUtil.RED, true, ColorUtil.BLACK, 2);
			countLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			countLabel.locatingTypeForVerti = LocatingType.L____A_L;
			countLabel.locatingOffsetY = -30;
			countLabel.touchable = false;
		}
		
		private function initPractiseData():void {
			
			var roomBaseInfo:RoomBaseInfo = new RoomBaseInfo();
			roomBaseInfo.owerId = PlayerModel.getInstance().myRole.id;
			
			RoomModConfig.roomInfo =roomBaseInfo ;
			
			RoomModConfig.memberInfoObj = { };
			var roomInfo:RoomMemberVo;
			var member:RoomMemberInfo; 
			var roleInfo:GetSimpleRoleRes
			
			//自己
			member =  new RoomMemberInfo();
			member.roleId = PlayerModel.getInstance().myRole.id;
			member.ready = true;
			member.campId = CAMP_ID.CAMP_ID_SHANG;
			member.chairId = RoomModConfig.ROOM_OWNER_CHAIR_ID;
				
			roleInfo = new GetSimpleRoleRes();
			roleInfo.id = PlayerModel.getInstance().myRole.id;
			roleInfo.name = PlayerModel.getInstance().myRole.name;
			roleInfo.icon = PlayerModel.getInstance().myRole.icon;
			roleInfo.scoreList = PlayerModel.getInstance().myRole.scoreList;
			roleInfo.gender = PlayerModel.getInstance().myRole.gender;
	
			roomInfo = new RoomMemberVo();
			roomInfo.roomMember = member;
			roomInfo.simpleRole = roleInfo;
			RoomModConfig.memberInfoObj[member.chairId] = roomInfo;
			
			member = new RoomMemberInfo();
			member.ready = true;
			member.chairId = 1;
			
			
			
			roleInfo = new GetSimpleRoleRes();
			roleInfo.name = "二大爷";
			roleInfo.icon = "10086";
			
			roomInfo = new RoomMemberVo();
			roomInfo.roomMember = member;
			roomInfo.simpleRole = roleInfo;
			RoomModConfig.memberInfoObj[1] = roomInfo;
		}
		
		private function onUpdateRoles(evt:String, data:Object = null):void {
			//var members:int = 0;
			//for (var chair:String in RoomModConfig.memberInfoObj ) {
				//memberObj[chair].setData(RoomModConfig.memberInfoObj[chair]);
				//members++;
			//}
			//RoomModConfig.curRoomMember = members;
			setMemberInfo();
		}
		
		
		//设置成员数据
		private function setMemberInfo():void {
			initMemberObj();
			var chair:String;
			for (chair in memberObj) {
				memberObj[chair].setData(null);
			}
			var members:int = 0;
			for (chair in RoomModConfig.memberInfoObj ) {
				memberObj[chair].setData(RoomModConfig.memberInfoObj[chair]);
				members++;
			}
			RoomModConfig.curRoomMember = members;
			setPlace();
		}
		
		private function initMemberObj():void {
			memberObj = {};
			memberMax = RoomModule.getInstance().getRoomMember;
			for (var i:int = 0; i < memberMax;i++ ) {
				var roomRole:Room_RoleUU = new Room_RoleUU();
				memberObj[i] = roomRole;
			}
		}
		
		//设置成员位置
		private function setPlace():void {
			var memberWidth:Number = Room_RoleUU(memberObj[1]).width;
			var memberHeight:Number = Room_RoleUU(memberObj[1]).height;
			if (this.fusion.numNodes > 1) {
				this.fusion.removeNodesAt(1);
			}
			
			if (memberMax == 2) {
				Room_RoleUU(memberObj[0]).locatingNode = verLine;
				Room_RoleUU(memberObj[0]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[0]).locatingTypeForHoriz = LocatingType.A_L____L;
				Room_RoleUU(memberObj[0]).locatingOffsetX = -150;
				this.fusion.addNode(memberObj[0]);
				Room_RoleUU(memberObj[1]).locatingNode = verLine;
				Room_RoleUU(memberObj[1]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[1]).locatingTypeForHoriz = LocatingType.L____L_A;
				Room_RoleUU(memberObj[1]).locatingOffsetX = 150;
				this.fusion.addNode(memberObj[1]);
				trace();
			}else if (memberMax == 4) {
				Room_RoleUU(memberObj[0]).locatingNode = verLine;
				Room_RoleUU(memberObj[0]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[0]).locatingTypeForHoriz = LocatingType.A_L____L;
				Room_RoleUU(memberObj[0]).locatingOffsetX = -40 - memberWidth;
				this.fusion.addNode(memberObj[0]);
				Room_RoleUU(memberObj[1]).locatingNode = verLine;
				Room_RoleUU(memberObj[1]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[1]).locatingTypeForHoriz = LocatingType.A_L____L;
				Room_RoleUU(memberObj[1]).locatingOffsetX = -20;
				this.fusion.addNode(memberObj[1]);
				Room_RoleUU(memberObj[2]).locatingNode = verLine;
				Room_RoleUU(memberObj[2]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[2]).locatingTypeForHoriz = LocatingType.L____L_A;
				Room_RoleUU(memberObj[2]).locatingOffsetX = 20;
				this.fusion.addNode(memberObj[2]);
				Room_RoleUU(memberObj[3]).locatingNode = verLine;
				Room_RoleUU(memberObj[3]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[3]).locatingTypeForHoriz = LocatingType.L____L_A;
				Room_RoleUU(memberObj[3]).locatingOffsetX = 40 + memberWidth;
				this.fusion.addNode(memberObj[3]);
			}else if (memberMax == 8) {
				Room_RoleUU(memberObj[0]).locatingNode = verLine;
				Room_RoleUU(memberObj[0]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[0]).locatingTypeForHoriz = LocatingType.A_L____L;
				Room_RoleUU(memberObj[0]).locatingOffsetX = -40 - memberWidth;;
				Room_RoleUU(memberObj[0]).locatingOffsetY = -memberHeight / 2;
				this.fusion.addNode(memberObj[0]);
				Room_RoleUU(memberObj[1]).locatingNode = verLine;
				Room_RoleUU(memberObj[1]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[1]).locatingTypeForHoriz = LocatingType.A_L____L;
				Room_RoleUU(memberObj[1]).locatingOffsetX = -20 ;
				Room_RoleUU(memberObj[1]).locatingOffsetY = -memberHeight / 2;
				this.fusion.addNode(memberObj[1]);
				Room_RoleUU(memberObj[2]).locatingNode = verLine;
				Room_RoleUU(memberObj[2]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[2]).locatingTypeForHoriz = LocatingType.L____L_A;
				Room_RoleUU(memberObj[2]).locatingOffsetX = 20;
				Room_RoleUU(memberObj[2]).locatingOffsetY = -memberHeight / 2;
				this.fusion.addNode(memberObj[2]);
				Room_RoleUU(memberObj[3]).locatingNode = verLine;
				Room_RoleUU(memberObj[3]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[3]).locatingTypeForHoriz = LocatingType.L____L_A;
				Room_RoleUU(memberObj[3]).locatingOffsetX = 40 + memberWidth;
				Room_RoleUU(memberObj[3]).locatingOffsetY = -memberHeight / 2;
				this.fusion.addNode(memberObj[3]);
				Room_RoleUU(memberObj[4]).locatingNode = verLine;
				Room_RoleUU(memberObj[4]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[4]).locatingTypeForHoriz = LocatingType.A_L____L;
				Room_RoleUU(memberObj[4]).locatingOffsetX = -40 - memberWidth;;
				Room_RoleUU(memberObj[4]).locatingOffsetY = memberHeight / 2;
				this.fusion.addNode(memberObj[4]);
				Room_RoleUU(memberObj[5]).locatingNode = verLine;
				Room_RoleUU(memberObj[5]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[5]).locatingTypeForHoriz = LocatingType.A_L____L;
				Room_RoleUU(memberObj[5]).locatingOffsetX = -20;
				Room_RoleUU(memberObj[5]).locatingOffsetY = memberHeight / 2 ;
				this.fusion.addNode(memberObj[5]);
				Room_RoleUU(memberObj[6]).locatingNode = verLine;
				Room_RoleUU(memberObj[6]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[6]).locatingTypeForHoriz = LocatingType.L____L_A;
				Room_RoleUU(memberObj[6]).locatingOffsetX = 20;
				Room_RoleUU(memberObj[6]).locatingOffsetY = memberHeight / 2;
				this.fusion.addNode(memberObj[6]);
				Room_RoleUU(memberObj[7]).locatingNode = verLine;
				Room_RoleUU(memberObj[7]).locatingTypeForVerti = LocatingType.L___A___L;
				Room_RoleUU(memberObj[7]).locatingTypeForHoriz = LocatingType.L____L_A;
				Room_RoleUU(memberObj[7]).locatingOffsetX = 40 + memberWidth;
				Room_RoleUU(memberObj[7]).locatingOffsetY = memberHeight / 2;
				this.fusion.addNode(memberObj[7]);
			}
			ownerRole = memberObj[ownerChild];
		}
		
	
		private var ownerChild:int;
		private var ownerRole:Room_RoleUU;  
		private function onOwnerStart(evt:RoomEvent):void {
			for (var chair:String in RoomModConfig.memberInfoObj ) {
				if (RoomModule.getInstance().isRoomOwner(RoomModConfig.memberInfoObj[chair].roomMember.roleId)) {
					ownerChild = int(chair);
				}
				
			}
			clearOwnerTime();
			count = 21;
			countTimer = new Timer(1000, 0);
			//RoomModConfig.isStartState = true;
			//countLabel.text = "";
			//this.fusion.addNodeAt(countLabel,this.fusion.numNodes - 1);
			onUpdateOwnerTime(null);
			countTimer.addEventListener(TimerEvent.TIMER, onUpdateOwnerTime);
			countTimer.start();
		}
		
		private function onUpdateOwnerTime(evt:TimerEvent ):void {
			if (count == 0 || RoomModConfig.isStartState) {
				clearOwnerTime();
				return;
			}
			count --;
			ownerRole.setTimeCount(count.toString());
			//countLabel.text = "实践实践事件:"+count.toString();
		}
		
		private function clearOwnerTime():void {
			if (countTimer != null) {
				countTimer.stop();
				countTimer = null;
				ownerRole.setTimeCount("");
			}
		}
		
		private function  initEvents():void {			
			
		}
		
		override public function onExit():void 
		{
			super.onExit();
			//if (this.fusion.getNodeIndex(verLine)!=-1) {
				//this.fusion.removeNode(verLine);
			//}
			clearOwnerTime();
			RoomModConfig.isInRoom = false;
			RoomModule.removeEventListener(RoomEvent.Update_Room_Role, onUpdateRoles);
			RoomModule.removeEventListener(RoomEvent.Owner_Start_Ntf,onOwnerStart);
			
		}
		
	}
}