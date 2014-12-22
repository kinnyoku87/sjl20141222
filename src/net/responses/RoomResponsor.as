package net.responses
{
	import cn.flashk.controls.DataGrid;
	import com.netease.protobuf.UInt64;
	import configs.EventConfig;
	import configs.RoleState;
	import configs.room.RoomModConfig;
	import event.EventManager;
	import models.cardSet.CardSetModule;
	import models.player.PlayerModel;
	import models.room.RoomEvent;
	import models.room.RoomMemberVo;
	import models.room.RoomModule;
	import mx.core.IFlexDisplayObject;
	import org.agony2d.flashApi.UUFacade;
	import proto.com.CAMP_ID;
	import proto.com.RoomMemberInfo;
	import proto.cs.ClientMessage;
	import proto.cs.ClientSelfOperationNtf;
	import proto.cs.ClientSelfOperationReq;
	import proto.cs.CmdCodeRole;
	import proto.cs.CmdType;
	import proto.cs.CreateRoomRes;
	import proto.cs.FindRoomRes;
	import proto.cs.GetSimpleRoleReq;
	import proto.cs.GetSimpleRoleRes;
	import proto.cs.JoinRoomNtf;
	import proto.cs.JoinRoomReq;
	import proto.cs.JoinRoomRes;
	import proto.cs.KickRoomNtf;
	import proto.cs.ModifyRoomParamNtf;
	import proto.cs.QuitRoomNtf;
	import proto.cs.ReadyMatchNtf;
	import proto.cs.ReadyMatchReq;
	import proto.cs.ReconnectPvpIngNtf;
	import proto.cs.SelectCampNtf;
	import proto.cs.SelectCampReq;
	import proto.cs.SelectCampRes;
	import proto.cs.SetChairStateNtf;
	import utils.GameUtil;
	import views.Battle_StateVV;
	import org.agony2d.project.ViewFacade;
	import views.UU.room.Room_Into_StateUU;
	import views.UU.room.Room_Quit_StateUU;
	import views.UU.room.Room2_StateUU;
	import views.UU.room.states.Room_TimeCount_StateUU;
	
	import configs.ConfigNet;
	
	import models.GameModel;
	import models.battle.BattleRoleModel;
	
	import net.NetManager;
	import net.NetUtil;
	
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	
	import proto.cs.CheckCodeNtf;
	import proto.cs.CmdCodeRoom;
	import proto.cs.MatchJoinRes;
	import proto.cs.RoomBody;
	import proto.cs.StartMatchNtf;
	
	import views.UU.battle.Battle_active_StateUU;
	import views.UU.battle.Battle_active_post_StateUU;
	import views.UU.battle.Battle_active_pre_StateUU;
	//import views.UU.battle.Battle_bg_StateUU;
	import views.UU.battle.Battle_bg_7_7_StateUU;
	import views.UU.battle.Battle_ready_StateUU;
	import views.UU.battle.Battle_ui_StateUU;
	import views.UU.loading.Loading_StateUU;
	
	public class RoomResponsor implements IResponsor
	{
		
		public function onHandle(cmd_B:int, subMsg:Object,ret:int):void
		{
			var subMsg_A:RoomBody;
			
			subMsg_A = subMsg as RoomBody;
			switch(cmd_B){
				 //匹配成功回應.
				case CmdCodeRoom.CC_ROOM_MATCH_JOIN_RES:
					this.onMatchJoin(subMsg_A.matchJoinRes as MatchJoinRes);
					break;
				
				 //獲取服務器校檢碼.
				case CmdCodeRoom.CC_ROOM_CHECK_CODE_NTF:
					this.onCheckCodeNTF(subMsg_A.checkCodeNtf as CheckCodeNtf);
					break;
				
				 //匹配比賽成功，返回比賽相關信息.
				case CmdCodeRoom.CC_ROOM_START_MATCH_NTF:
					this.onStartMatchNTF(subMsg_A.startMatchNtf as StartMatchNtf);
					break;
				
				default:
					break;
			}
			
			switch(cmd_B) {
				//创建房间
				case CmdCodeRoom.CC_ROOM_CREATE_RES:
					this.onRoomCreateRes(subMsg_A.createRoomRes as CreateRoomRes);
					break;
				//房间列表
				case CmdCodeRoom.CC_ROOM_FIND_RES:
					this.onRoomFindRes(subMsg_A.findRoomRes as FindRoomRes);
					break;
				//修改房间参数
				case CmdCodeRoom.CC_ROOM_MODIFY_PARAM_NTF:
					this.onModifyParamNtf(subMsg_A.modifyRoomParamNtf as ModifyRoomParamNtf);
					break;
				//加入房间
				case CmdCodeRoom.CC_ROOM_JOIN_RES:
					this.onRoomJoinRes(subMsg_A.joinRoomRes as JoinRoomRes);
					break;
				//加入房间通知
				case CmdCodeRoom.CC_ROOM_JOIN_NTF:
					this.onRoomJoinNtf(subMsg_A.joinRoomNtf as JoinRoomNtf);
					break;
				//退出房间	
				case CmdCodeRoom.CC_ROOM_QUIT_NTF:
					this.onRoomQuitNtf(subMsg_A.quitRoomNtf as QuitRoomNtf);
					break;
				//踢人
				case CmdCodeRoom.CC_ROOM_KICK_NTF:
					this.onRoomKickNtf(subMsg_A.kickRoomNtf as KickRoomNtf);
					break;
				//设置桌子状态
				case CmdCodeRoom.CC_ROOM_SET_CHAIR_STATE_NTF:
					this.onRoomSetChairStateNtf(subMsg_A.setChairStateNtf as SetChairStateNtf);
					break;
				//房间成员设置准备状态
				case CmdCodeRoom.CC_ROOM_READY_MATCH_NTF:
					this.onRoomReadyMatchNtf(subMsg_A.readyMatchNtf as ReadyMatchNtf);
					break;
					
				//停止匹配通知
				//case CmdCodeRoom.CC_ROOM_STOP_MATCH_NTF:
					//this.onStopRoomMatchNtf(subMsg_A.stop as ReadyMatchNtf);
					//break;
				//房主点开始通知(空指令)
				case CmdCodeRoom.CC_ROOM_START_STATE_NTF:
					this.onStartState();
					break;
				//房主开始游戏请求
				//case CmdCodeRoom.CC_ROOM_START_MATCH_NTF:
					//break
				//房间满员，房主开始游戏倒计时
				case CmdCodeRoom.CC_ROOM_KICK_OWNER_TIMER_NTF:
					this.onKickOwnerNtf();
					break;
				 //快速加入
				//case CmdCodeRoom.CC_ROOM_QUICK_JOIN_RES:
					//break;
				//选择阵营请求(配置套牌)
				case CmdCodeRoom.CC_ROOM_SELECT_CAMP_RES:
					this.onCampSelectRes(subMsg_A.selectCampRes as SelectCampRes);
					break;
				 //选择阵营广播
				//case CmdCodeRoom.CC_ROOM_SELECT_CAMP_NTF:
					//break;
					
				// 加入快速撮合队列请求
				case CmdCodeRoom.CC_ROOM_MATCH_JOIN_RES:
					this.onMatchJoin(subMsg_A.matchJoinRes as MatchJoinRes);
					break;
				// 退出快速撮合队列请求(空指令)
				case CmdCodeRoom.CC_ROOM_MATCH_QUIT_RES:
					// todo
					break;
				// 验证码通知
				case CmdCodeRoom.CC_ROOM_CHECK_CODE_NTF:
					this.onCheckCodeNTF(subMsg_A.checkCodeNtf as CheckCodeNtf);
					break;
				// 断线重连接战斗通知
				case CmdCodeRoom.CC_ROOM_RECONNECT_PVP_ING_NTF:
					this.onReconnectPvpIngNtf(subMsg_A.reconnectPvpIngNtf as ReconnectPvpIngNtf);
					break;
				// 
				case CmdCodeRoom.CC_ROME_CLIENT_SELF_OPERATION_NTF:
					this.OnClientOperation(subMsg_A.clientSelfOperationNtf as ClientSelfOperationReq);
					break;
			}
			EventManager.ins.addEvtListener(EventConfig.Get_Simple_Role_Info,updateRoomMember);
		}
		
		private function onRoomCreateRes(v:CreateRoomRes):void {
			GameModel.getLog().simplify("校檢碼: [ {0} ].\n", v.checkCode);
			ConfigNet.checkCode = v.checkCode;
		
			//自己建房间  设置对象数据 
			var joinRoomRes:JoinRoomRes = new JoinRoomRes();
			joinRoomRes.chairId = v.chairId;
			joinRoomRes.checkCode = v.checkCode;
			joinRoomRes.roomBaseInfo = v.roomBaseInfo;
			var arr:Array = [];
		
			var member:RoomMemberInfo = new RoomMemberInfo();
			member.roleId = PlayerModel.getInstance().myRole.id;
			member.ready = true;
			member.campId = CAMP_ID.CAMP_ID_SHANG;
			member.chairId = RoomModConfig.ROOM_OWNER_CHAIR_ID;
			arr.push(member);
			joinRoomRes.members = arr;
			RoomModConfig.roomInfo = v.roomBaseInfo;
			setRoomMember(joinRoomRes, true);
			
			UUFacade.getWindow(Room_TimeCount_StateUU).close();
		}
		
		private function onRoomFindRes(v:FindRoomRes):void {
			
			//EventManager.ins.sendEvent(EventConfig.Get_Room_Item_List,v);
			RoomModule.dispatchEvent(RoomEvent.Get_Room_Item_List,v);
		}
		
		private function onModifyParamNtf(v:ModifyRoomParamNtf):void {
			RoomModConfig.roomInfo.owerId = v.ownerId;
			RoomModule.dispatchEvent(RoomEvent.Update_Room_Role);
			
		}
		
		//加入房间返回  设置相关数据，并跳转界面
		private function onRoomJoinRes(v:JoinRoomRes):void { 
			RoomModConfig.roomInfo = v.roomBaseInfo;
			ConfigNet.checkCode = v.checkCode;
			setRoomMember(v,false);
			UUFacade.getWindow(Room_Into_StateUU).close();
			UUFacade.getWindow(Room_TimeCount_StateUU).close();
		}
		
		private var memberCount:int;
		private var updateCount:int;
		//设置房间中的成员数据（有一个取数据操作）
		private function setRoomMember(v:JoinRoomRes,isOwner:Boolean):void {
			RoomModConfig.memberArr = [];
			RoomModConfig.memberInfoObj = { };
			updateCount = 0;
			memberCount = v.members.length;
			var roomMemberVo:RoomMemberVo;
			var member:RoomMemberInfo;
			var roleInfo:GetSimpleRoleRes;
			for (var i:int = 0; i < v.members.length; i++ ) {
				roomMemberVo = new RoomMemberVo();
				roleInfo = new GetSimpleRoleRes();
				member = v.members[i];
				if (PlayerModel.isMyRole(RoomMemberInfo(v.members[i]).roleId)) {
					roleInfo.id = PlayerModel.getInstance().myRole.id;
					roleInfo.name = PlayerModel.getInstance().myRole.name;
					roleInfo.icon = PlayerModel.getInstance().myRole.icon;
					roleInfo.scoreList = PlayerModel.getInstance().myRole.scoreList;
					roleInfo.gender = PlayerModel.getInstance().myRole.gender;
					
					var selfClientReq:ClientSelfOperationReq = new ClientSelfOperationReq;
					var clientMessage:ClientMessage = new ClientMessage();
					clientMessage.sendId = PlayerModel.getInstance().myRole.id;
					clientMessage.value1 = RoomModConfig.ROOM_STATE_INROOM;
					selfClientReq.clientMessage = clientMessage;
					NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROME_CLIENT_SELF_OPERATION_REQ,selfClientReq);
					
				}else {
					PlayerModel.roleState = RoleState.ROOM;
					var getSimpleReq:GetSimpleRoleReq = new GetSimpleRoleReq();
					getSimpleReq.id = RoomMemberInfo(v.members[i]).roleId;
					NetManager.sendRequest(CmdType.CT_ROLE,CmdCodeRole.CC_ROLE_GET_SIMPLE_REQ,getSimpleReq);
				}  
				roomMemberVo.roomMember = member;
				roomMemberVo.simpleRole = roleInfo;
				RoomModConfig.memberInfoObj[member.chairId] = roomMemberVo;
            }
			//if (!isOwner) {
			var readyMatch:ReadyMatchReq = new ReadyMatchReq();
			readyMatch.ready = true;
			NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROOM_READY_MATCH_REQ,readyMatch);
			//}
			var selectCamp:SelectCampReq = new SelectCampReq();
			selectCamp.campId = CAMP_ID.CAMP_ID_SHANG;
			selectCamp.bagIndex = CardSetModule.getCardBagByCamp(CAMP_ID.CAMP_ID_SHANG).bagIndex;
			selectCamp.useBagCard = true;
			NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_SELECT_CAMP_REQ, selectCamp);
			if (isOwner) {
				//EventManager.ins.sendEvent(EventConfig.Join_Room_Into);
				RoomModConfig.isJoinOrOutRoom = true;
				//UUFacade.getWindow(Room2_StateUU).activate();
				//intoOrUpdateRoom();
				
				RoomModule.dispatchEvent(RoomEvent.Join_Room_Into);
			}
			
		}
		
		//房间成员角色信息到达 更新数据  且刷新列表
		public function updateRoomMember(evt:String, data:Object = null):void {
			if (PlayerModel.roleState == RoleState.ROOM) {
				var simpleRole:GetSimpleRoleRes = data as GetSimpleRoleRes;
				for (var chairId:* in RoomModConfig.memberInfoObj) {
					if (GameUtil.isUint64Equal(RoomMemberVo(RoomModConfig.memberInfoObj[chairId]).roomMember.roleId,data.id)) {
						RoomMemberVo(RoomModConfig.memberInfoObj[chairId]).simpleRole = simpleRole;
					}
				}
				updateCount++;
				if (updateCount >= memberCount - 1 ) {
					if (RoomModConfig.isInRoom) {
						//EventManager.ins.sendEvent(EventConfig.Update_Room_Role);
						//RoomModConfig.isJoinOrOutRoom = true;
						//UUFacade.getWindow(Room2_StateUU).activate();
						RoomModule.dispatchEvent(RoomEvent.Update_Room_Role);
					}else {
						//EventManager.ins.sendEvent(EventConfig.Join_Room_Into);
						RoomModConfig.isJoinOrOutRoom = true;
						//UUFacade.getWindow(Room2_StateUU).activate();
						RoomModule.dispatchEvent(RoomEvent.Join_Room_Into);
					}
					//intoOrUpdateRoom();
					PlayerModel.roleState = RoleState.COMMON;
					updateCount = 0;
					return;
				}
				
			}
		}
		
		private function onRoomJoinNtf(v:JoinRoomNtf):void {
			var id:UInt64 = v.joinerId;
			var chairId:int = v.chairId;
			var member:RoomMemberInfo = new RoomMemberInfo();
			var roomvo:RoomMemberVo = new RoomMemberVo();
			member.roleId = id;
			member.chairId = chairId;
			var roleInfo:GetSimpleRoleRes = new GetSimpleRoleRes();
			roomvo.roomMember = member;
			roomvo.simpleRole = roleInfo;
			RoomModConfig.memberInfoObj[member.chairId] = roomvo;
			
			PlayerModel.roleState = RoleState.ROOM;
			var getSimpleReq:GetSimpleRoleReq = new GetSimpleRoleReq();
			getSimpleReq.id = id;
			NetManager.sendRequest(CmdType.CT_ROLE,CmdCodeRole.CC_ROLE_GET_SIMPLE_REQ,getSimpleReq);
			
		}
		
		
		private function onRoomQuitNtf(v:QuitRoomNtf):void {
			if (PlayerModel.isMyRole(v.quiterId)) {
				RoomModConfig.roomInfo = null;
				RoomModConfig.isJoinOrOutRoom = false;
				//UUFacade.getWindow(Room2_StateUU).activate();
				//EventManager.ins.sendEvent(EventConfig.Quit_Room_Out);
				RoomModule.dispatchEvent(RoomEvent.Quit_Room_Out);
				if (v.quitType == 1) {
					UUFacade.getWindow(Room_Quit_StateUU).activate(["由于长时间未开始游戏，你已被系统踢出房间"]);
				}
			}else {
				GameModel.getLog().simplify("有润退出房干了: [ {0} ].\n", v.quiterId);
				for (var chairId:* in RoomModConfig.memberInfoObj) {
					if (GameUtil.isUint64Equal(RoomMemberVo(RoomModConfig.memberInfoObj[chairId]).roomMember.roleId,v.quiterId)) {
						delete RoomModConfig.memberInfoObj[chairId];
						//EventManager.ins.sendEvent(EventConfig.Update_Room_Role);	
						//RoomModConfig.isJoinOrOutRoom = true;
						//UUFacade.getWindow(Room2_StateUU).activate();
						//intoOrUpdateRoom();
						RoomModule.dispatchEvent(RoomEvent.Update_Room_Role);
					}
				}
				//if (GameUtil.isUint64Equal(RoomModConfig.roomInfo.owerId,v.quiterId) && v.quitType == 1) {
					//TODO  "因房主长时间未开始游戏，已被系统踢出房间。"
				//}
				
			}
		}
		
		private function onRoomKickNtf(v:KickRoomNtf):void {
			
		}
		
		private function onRoomSetChairStateNtf(v:SetChairStateNtf):void {
			
		}
		
		private function onRoomReadyMatchNtf(v:ReadyMatchNtf):void {
			for (var chairId:* in RoomModConfig.memberInfoObj) {
				if (GameUtil.isUint64Equal(RoomMemberVo(RoomModConfig.memberInfoObj[chairId]).roomMember.roleId,v.readyerId)) {
					RoomMemberVo(RoomModConfig.memberInfoObj[chairId]).roomMember.ready = v.ready;
					//EventManager.ins.sendEvent(EventConfig.Update_Room_Role);	
					//RoomModConfig.isJoinOrOutRoom = true;
					//UUFacade.getWindow(Room2_StateUU).activate();
					//intoOrUpdateRoom();
					RoomModule.dispatchEvent(RoomEvent.Update_Room_Role);
				}
			}
		}
		
		private function onStartState():void {
			//EventManager.ins.sendEvent(EventConfig.Start_Room_State);
			RoomModule.dispatchEvent(RoomEvent.Start_Room_State);
		}
		
		private function onKickOwnerNtf():void {
			//EventManager.ins.sendEvent(EventConfig.Start_Room_State);
			RoomModule.dispatchEvent(RoomEvent.Owner_Start_Ntf);
		}
		
		private function onCampSelectRes(v:SelectCampRes):void {
			//GameModel.campIndex = v.campId;
			GameModel.campBag = CardSetModule.getCardBag(v.bagIndex);
			//EventManager.ins.sendEvent(EventConfig.Camp_Change);
			//RoomModConfig.isJoinOrOutRoom = true;
			//UUFacade.getWindow(Room2_StateUU).activate();
			//intoOrUpdateRoom();
			RoomModule.dispatchEvent(RoomEvent.Camp_Change);
		}
		
		private function onCampSelectNtf(v:SelectCampNtf):void {
			
		}
		
		
		private function onMatchJoin(v:MatchJoinRes):void{
			// 不做回應.
		}
		
		private function onCheckCodeNTF(v:CheckCodeNtf):void{
			GameModel.getLog().simplify("校檢碼: [ {0} ].\n", v.checkCode);
			ConfigNet.checkCode = v.checkCode;
		}
		
		private function onReconnectPvpIngNtf(v:ReconnectPvpIngNtf):void {
			
		}
		
		private function OnClientOperation(v:ClientSelfOperationReq):void {
			var id:UInt64 = v.clientMessage.sendId;
			var state:int = v.clientMessage.value1;
			for (var chairId:* in RoomModConfig.memberInfoObj) {
				if (GameUtil.isUint64Equal(RoomMemberVo(RoomModConfig.memberInfoObj[chairId]).roomMember.roleId,id)) {
					RoomMemberVo(RoomModConfig.memberInfoObj[chairId]).roombattleState = state;
				}
			}
			RoomModule.dispatchEvent(RoomEvent.Update_Room_Role);
		}
		
		private function setBattleClientOperation():void {
			var selfClientReq:ClientSelfOperationReq = new ClientSelfOperationReq;
			var clientMessage:ClientMessage = new ClientMessage();
			clientMessage.sendId = PlayerModel.getInstance().myRole.id;
			clientMessage.value1 = RoomModConfig.ROOM_STATE_INBATTLE;
			selfClientReq.clientMessage = clientMessage;
			NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROME_CLIENT_SELF_OPERATION_REQ,selfClientReq);
		}
		
		
		private function onStartMatchNTF(v:StartMatchNtf):void{
			GameModel.getLog().simplify("匹配比賽成功.");
			
			BattleRoleModel.initialize(v.members, v.roomBaseInfo);
			
			GameModel.getLog().simplify("\nChair Id: [ {0} ].", BattleRoleModel.getMyBattleRoleVo().chairId);
			
//			ConfigNet.members = v.members;
//			ConfigNet.roomBaseInfo = v.roomBaseInfo;
			
			// 戰鬥服務器註冊請求.
			var AY:Array;
			
			AY = NetUtil.getIpAndPort(v.roomBaseInfo.pvpIp);
			NetManager.connect2(AY[0], AY[1]);
			NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected3);
			setBattleClientOperation();
		}
		
		
		/**
		 * 連接戰鬥服務器成功.
		 */
		public static function ____onNetConnected3(e:AEvent):void{
			NetManager.removeEventListener(AEvent.COMPLETE, ____onNetConnected3);
			
			GameModel.getLog().simplify("連接戰鬥服務器ip成功.\n");
			
			
			//GameModel.getNotifier().addEventListener(AEvent.COMPLETE, onEnterBattle);
			
			// 進入戰鬥App (先加載，後請求!!!).
			ViewFacade.setStateView(Battle_StateVV);
			
			
			
			//		var msg_A:SignReq;
			//		
			//		msg_A = new SignReq;
			//		msg_A.uid = ConfigNet.uid;
			//		msg_A.cbData = 1;
			//		NetManager.sendRequest2(CmdType.CT_AUTH, CmdCodeSign.CC_AUTH_SIGN_REQ, msg_A);
			
			//		var msg_B:EnterArenaReq;
			//		
			//		msg_B = new EnterArenaReq;
			//		msg_B.roleId = RoleManager.getInstance().myRole.id;
			//		msg_B.checkCode = ConfigNet.checkCode;
			//		NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_ARENA_ENTER_REQ, msg_B);
		}
		
		/*private static function onEnterBattle(e:AEvent):void {
			GameModel.getNotifier().removeEventListener(AEvent.COMPLETE, onEnterBattle);
			
			
			UUFacade.getWindow(Loading_StateUU).close();
			
			//UUFacade.getWindow(Battle_bg_StateUU).activate();
			UUFacade.getWindow(Battle_bg_7_7_StateUU).activate();
			UUFacade.getWindow(Battle_active_pre_StateUU).activate();
			UUFacade.getWindow(Battle_active_StateUU).activate();
			UUFacade.getWindow(Battle_active_post_StateUU).activate();
			
			UUFacade.getWindow(Battle_ui_StateUU).activate();
			UUFacade.getWindow(Battle_ready_StateUU).activate();
		}*/
		
		/**
		 *   进入房间或者更新
		 * @param	isInto   是否是进入房间
		 */
		public static function intoOrUpdateRoom(isInto:Boolean = false):void {
			RoomModConfig.isJoinOrOutRoom = true;
			UUFacade.getWindow(Room2_StateUU).activate();
		}
	}
}