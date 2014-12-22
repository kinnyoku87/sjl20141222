package models.room 
{
	import com.netease.protobuf.UInt64;
	import configs.room.RoomModConfig;
	import models.GameModel;
	import models.player.PlayerModel;
	import net.NetManager;
	import org.agony2d.events.Notifier;
	import proto.com.RoomBaseInfo;
	import proto.com.RoomMod;
	import proto.com.RoomState;
	import proto.cs.ClientMessage;
	import proto.cs.ClientSelfOperationReq;
	import proto.cs.CmdCodeRoom;
	import proto.cs.CmdType;
	import proto.cs.ReadyMatchReq;
	import utils.GameUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class RoomModule 
	{
		private static var _notifier:Notifier = new Notifier();
		
		public function RoomModule() 
		{
			
		}
		
		/**
		 * 偵聽事件.
		 * 
		 * @param type
		 * @param listener
		 */		
		public static function addEventListener( type:String, listener:Function ) : void {
			_notifier.addEventListener(type, listener);
		}
		
		/**
		 * 移除偵聽.
		 * 
		 * @param type
		 * @param listener
		 */		
		public static function removeEventListener( type:String, listener:Function ) : void {
			_notifier.removeEventListener(type, listener);
		}
		
		public static function dispatchEvent( str:String, data:Object = null ) : void {
			_notifier.dispatchEvent(new RoomEvent(str, data));
		}
	
		public static function dealBattleBack():void {
			if (RoomModConfig.roomInfo != null) {
				var roomReadyReq:ReadyMatchReq = new ReadyMatchReq;
				roomReadyReq.ready = true;
				NetManager.sendRequest(CmdType.CT_ROOM, CmdCodeRoom.CC_ROOM_READY_MATCH_REQ,roomReadyReq);
				
				var selfClientReq:ClientSelfOperationReq = new ClientSelfOperationReq;
				var clientMessage:ClientMessage = new ClientMessage();
				clientMessage.sendId = PlayerModel.getInstance().myRole.id;
				clientMessage.value1 = RoomModConfig.ROOM_STATE_INROOM;
				selfClientReq.clientMessage = clientMessage;
				NetManager.sendRequest(CmdType.CT_ROOM,CmdCodeRoom.CC_ROME_CLIENT_SELF_OPERATION_REQ,selfClientReq);
			}else {
				RoomModConfig.isJoinOrOutRoom = false;
			}
		}
		
		
		//是否为房主
		public  function isRoomOwner(id:UInt64):Boolean {
			if (RoomModConfig.roomInfo == null) {
				GameModel.getLog().simplify("当前无房间信息.\n");
				return false
			}
			return GameUtil.isUint64Equal(RoomModConfig.roomInfo.owerId, id);
		}
		
		//获取房间列表  是否显示游戏中的房间    
		public function getRoomList(isGame:Boolean,_roomList:Array):Array {
			var roomList:Array = _roomList;
			if (!isGame) {
				for (var i:int = roomList.length - 1; i >= 0;i-- ) {
					if(RoomBaseInfo(roomList[i]).state == RoomState.ROOM_STATE_MATCHING) {
						roomList.splice(i,1);
					}
				}
			}
			return roomList;
		}
	
		//获取当前大类型模式
		public static function getRoomMode():int {
			var module:int;
			switch(GameModel.gameMode) {
				case RoomMod.ROOM_MOD_PRACTICE:
					module = RoomModConfig.ROOM_MOD_PRACTICE;
					break;
				case RoomMod.ROOM_MOD_FREE_1V1:
					module = RoomModConfig.ROOM_MOD_FREE;
					break;
				case RoomMod.ROOM_MOD_FREE_2V2:
					module = RoomModConfig.ROOM_MOD_FREE;
					break;
				case RoomMod.ROOM_MOD_FREE_2V3:
					module = RoomModConfig.ROOM_MOD_FREE;
					break;
				case RoomMod.ROOM_MOD_FREE_3V3:
					module = RoomModConfig.ROOM_MOD_FREE;
					break;
				case RoomMod.ROOM_MOD_FREE_4V4:
					module = RoomModConfig.ROOM_MOD_FREE;
					break;
				case RoomMod.ROOM_MOD_ARENA_1V1:
					module = RoomModConfig.ROOM_MOD_ARENA;
					break;
				case RoomMod.ROOM_MOD_ARENA_2V2:
					module = RoomModConfig.ROOM_MOD_ARENA;
					break;
				case RoomMod.ROOM_MOD_ARENA_2V3:
					module = RoomModConfig.ROOM_MOD_ARENA;
					break;
				case RoomMod.ROOM_MOD_ARENA_3V3:
					module = RoomModConfig.ROOM_MOD_ARENA;
					break;
				case RoomMod.ROOM_MOD_ARENA_4V4:
					module = RoomModConfig.ROOM_MOD_ARENA;
					break;
			}
			return module;
		}	
		
		//获取此模式下房间最大成员数
		public function get getRoomMember():int {
			var num:int;
			switch(GameModel.gameMode) {
				case RoomMod.ROOM_MOD_PRACTICE:
					num = 2;
					break;
				case RoomMod.ROOM_MOD_FREE_1V1:
					num = 2;
					break;
				case RoomMod.ROOM_MOD_FREE_2V2:
					num = 4;
					break;
				case RoomMod.ROOM_MOD_FREE_2V3:
					num = 5;
					break;
				case RoomMod.ROOM_MOD_FREE_3V3:            //6人及以上也相当于8张桌子
					//num = 6;
					num = 8;
					break;
				case RoomMod.ROOM_MOD_FREE_4V4:
					num = 8;
					break;
				case RoomMod.ROOM_MOD_ARENA_1V1:
					num = 2;
					break;
				case RoomMod.ROOM_MOD_ARENA_2V2:
					num = 4;
					break;
				case RoomMod.ROOM_MOD_ARENA_2V3:
					num = 5;
					break;
				case RoomMod.ROOM_MOD_ARENA_3V3:        //6人及以上也相当于8张桌子
					//num = 6;
					num = 8;
					break;
				case RoomMod.ROOM_MOD_ARENA_4V4:
					num = 8;
					break;
			}
			return num;
		}
		
		public static function dealRoomError(str:String):void {
			dispatchEvent(RoomEvent.Deal_Room_Error,str);
		}

		private static var g_instance:RoomModule;
		
		public static function getInstance() : RoomModule
		{
			return g_instance ||= new RoomModule;
		}
	}

}