package net {
	import com.netease.protobuf.Message;
	import configs.battle.BattleErrorValidator;
	import configs.error.ErrorConfiguration;
	import models.PromptManager;
	import net.responses.ShopResponsor;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.project.ViewFacade;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdCodeRole;
	import views.UU.common.Net_Reconnect_StateUU;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	
	import models.GameModel;
	
	import net.responses.AuthResponsor;
	import net.responses.BattleResponsor;
	import net.responses.ChatResponsor;
	import net.responses.IResponsor;
	import net.responses.ItemResponsor;
	import net.responses.LoginResponsor;
	import net.responses.QuestResponsor;
	import net.responses.RoleResponsor;
	import net.responses.RoomResponsor;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.events.Notifier;
	import org.agony2d.utils.formatString;
	
	import proto.cs.AuthBody;
	import proto.cs.BattleBody;
	import proto.cs.ChatBody;
	import proto.cs.CmdType;
	import proto.cs.ItemBody;
	import proto.cs.LoginBody;
	import proto.cs.MsgBody;
	import proto.cs.MsgDef;
	import proto.cs.MsgHead;
	import proto.cs.QuestBody;
	import proto.cs.RoleBody;
	import proto.cs.RoomBody;
	
public class NetManager {
	
	/**
	 * 初期化.
	 */
	public static function connect( ip:String, port:int ) : void {
		if(!_notifier){
			_notifier = new Notifier;
			_respMap = [];
		}
		if(_socket){
			_socket.removeEventListener(Event.CONNECT, onConnect);
			_socket.removeEventListener(Event.CLOSE, onClose);
			_socket.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_socket.removeEventListener(ProgressEvent.SOCKET_DATA, onSocketData);
			if(_socket.connected){
				_socket.close();
			}
			GameModel.getLog().simplify("============================================\n關閉socket: [ {0}:{1} ].\n...", _ip, _port);
		}
		_ip = ip;
		_port = port;
		_socket = new Socket;
		_socket.addEventListener(Event.CONNECT, onConnect);
		_socket.addEventListener(Event.CLOSE, onClose);
		_socket.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
		_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
		_socket.addEventListener(ProgressEvent.SOCKET_DATA, onSocketData);
		
		GameModel.getLog().simplify("============================================\n正在連接socket: [ {0}:{1} ].\n...", ip, port);
		
		//try {
			_socket.connect(ip, port);
		//}
		//catch (err:Error) {
			//GameModel.getLog().simplify(err.message);
		//}
		
		
	}
	
	public static function close():void {
		if(_socket){
			_socket.removeEventListener(Event.CONNECT, onConnect);
			_socket.removeEventListener(Event.CLOSE, onClose);
			_socket.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_socket.removeEventListener(ProgressEvent.SOCKET_DATA, onSocketData);
			if(_socket.connected){
				_socket.close();
			}
			GameModel.getLog().simplify("============================================\n關閉socket.\n...");
		}
	}
	
	public static function connect2( ip:String, port:int ) : void {
		_ip2 = ip;
		_port2 = port;
		_socket2 = new Socket;
		_socket2.addEventListener(Event.CONNECT, onConnect2);
		_socket2.addEventListener(Event.CLOSE, onClose2);
		_socket2.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
		_socket2.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
		_socket2.addEventListener(ProgressEvent.SOCKET_DATA, onSocketData2);
		_socket2.connect(ip, port);
	}
	
	public static function close2() : void {
		_socket2.removeEventListener(Event.CONNECT, onConnect2);
		_socket2.removeEventListener(Event.CLOSE, onClose2);
		_socket2.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
		_socket2.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
		_socket2.removeEventListener(ProgressEvent.SOCKET_DATA, onSocketData2);
		if(_socket2.connected){
			_socket2.close();
		}
		_socket2 = null;
	}
	
	/**
	 * 向服務器發送一個請求.
	 *  
	 * @param cmd_A	主命令號.
	 * @param cmd_B	子命令號.
	 * @param msg	具體的消息實例.
	 */	
	public static function sendRequest( cmd_A:int, cmd_B:int, msg:Message, hasLogging:Boolean = true ) : void {
		var head:MsgHead;
		var body:MsgBody;

		var count:int;
		var subMsg:Object;
		var msgName:String;
		var index:int;
		
		bytes_H.length = bytes_B.length = bytes_L.length = 0;
		
		// head.
		head = new MsgHead;
		head.cmd = (cmd_A << 16) | cmd_B;
		head.writeTo(bytes_H);
		count = MsgDef.MSG_HEAD_LEN - bytes_H.length;
		while(--count > -1){
			bytes_H.writeByte(0);
		}
		
		// body，msg不存在則跳過.
		if(msg){
			body = new MsgBody;
			switch(cmd_A) {
				case CmdType.CT_AUTH:
					subMsg = body.authBody = new AuthBody;
					break;
				case CmdType.CT_LOGIN:
					subMsg = body.loginBody = new LoginBody;
					break;
				case CmdType.CT_ROLE:
					subMsg = body.roleBody = new RoleBody;
					break;
				case CmdType.CT_QUEST:
					subMsg = body.questBody = new QuestBody;   
					break;
				case CmdType.CT_ITEM:
					subMsg = body.itemBody = new ItemBody;   
					break;
				case CmdType.CT_BATTLE:
					subMsg = body.battleBody = new BattleBody;
					break;
				case CmdType.CT_ROOM:
					subMsg = body.roomBody = new RoomBody;
					break;
				case CmdType.CT_CHAT:
					subMsg = body.chatBody = new ChatBody;
					break;
				default:
					GameModel.getLog().error("NetManager", "sendRequest", "Error cmd A: [ {0} ].", cmd_A);
					break;
			}
			msgName = getQualifiedClassName(msg);
			index = msgName.lastIndexOf("::");
			msgName = String(msgName.charAt(index + 2)).toLowerCase() + msgName.substring(index + 3);
			try {
				subMsg[msgName] = msg;
			}
			catch(e:Error){
				GameModel.getLog().error("NetManager", "sendRequest", "Not found msg member: [ {0} ].", msgName);
			}
			body.writeTo(bytes_B);
		}
		
		
		bytes_L.writeUnsignedInt(msg ? bytes_B.length + 14 : 14);
		_socket.writeBytes(bytes_L);
		_socket.writeBytes(bytes_H);
		if(msg){
			_socket.writeBytes(bytes_B);
		}
		
		if (hasLogging) {
			GameModel.getLog().simplify("\n========================================================================\n");
			GameModel.getLog().message("NetManager", "Send request: [ {0}, {1}, {2}, {3} ].", msgName, cmd_A, cmd_B, _socket.bytesPending - 4);
			GameModel.getLog().simplify(body);
		}
		
		_socket.flush();
	}
	
	/**
	 * 向戰鬥服務器發送一個請求.
	 *  
	 * @param cmd_A	主命令號.
	 * @param cmd_B	子命令號.
	 * @param msg	具體的消息實例.
	 */	
	public static function sendRequest2( cmd_A:int, cmd_B:int, msg:Message, hasLogging:Boolean = true ) : void {
		var head:MsgHead;
		var body:MsgBody;
		
		var count:int;
		var subMsg:Object;
		var msgName:String;
		var index:int;
		
		bytes_H.length = bytes_B.length = bytes_L.length = 0;
		
		// head.
		head = new MsgHead;
		head.cmd = (cmd_A << 16) | cmd_B;
		head.writeTo(bytes_H);
		count = MsgDef.MSG_HEAD_LEN - bytes_H.length;
		while(--count > -1){
			bytes_H.writeByte(0);
		}
		
		// body，msg不存在則跳過.
		if(msg){
			body = new MsgBody;
			switch(cmd_A) {
				case CmdType.CT_AUTH:
					subMsg = body.authBody = new AuthBody;
					break;
				case CmdType.CT_LOGIN:
					subMsg = body.loginBody = new LoginBody;
					break;
				case CmdType.CT_ROLE:
					subMsg = body.roleBody = new RoleBody;
					break;
				case CmdType.CT_QUEST:
					subMsg = body.questBody = new QuestBody;   
					break;
				case CmdType.CT_ITEM:
					subMsg = body.itemBody = new ItemBody;   
					break;
				case CmdType.CT_BATTLE:
					subMsg = body.battleBody = new BattleBody;
					break;
				case CmdType.CT_ROOM:
					subMsg = body.roomBody = new RoomBody;
					break;
				case CmdType.CT_CHAT:
					subMsg = body.chatBody = new ChatBody;
					break;
				default:
					GameModel.getLog().error("NetManager", "sendRequest", "Error cmd A: [ {0} ].", cmd_A);
					break;
			}
			msgName = getQualifiedClassName(msg);
			index = msgName.lastIndexOf("::");
			msgName = String(msgName.charAt(index + 2)).toLowerCase() + msgName.substring(index + 3);
			try {
				subMsg[msgName] = msg;
			}
			catch(e:Error){
				GameModel.getLog().error("NetManager", "sendRequest", "Not found msg member: [ {0} ].", msgName);
			}
			body.writeTo(bytes_B);
		}
		
		
		bytes_L.writeUnsignedInt(msg ? bytes_B.length + 14 : 14);
		_socket2.writeBytes(bytes_L);
		_socket2.writeBytes(bytes_H);
		if(msg){
			_socket2.writeBytes(bytes_B);
		}
		
//		GameModel.getLog().simplify("\n========================================================================\n戰鬥請求:\n");
		if (hasLogging) {
			GameModel.getLog().message("NetManager", "Send request 2: [ {0}, {1}, {2}, {3} ].", msgName, cmd_A, cmd_B, _socket2.bytesPending - 4);
			GameModel.getLog().simplify(body);
		}
		
		_socket2.flush();
	}
	
	/**
	 * 加入事件偵聽器.
	 */
	public static function addEventListener( type:String, listener:Function, priority:int = 0 ) : void {
		_notifier.addEventListener(type, listener, priority);
	}
	
	/**
	 * 移除事件偵聽器.
	 */
	public static function removeEventListener( type:String, listener:Function ) : void {
		_notifier.removeEventListener(type, listener);
	}
	
	
	
	//////////////////////////////////////////////////////
	//////////////////////////////////////////////////////
	//////////////////////////////////////////////////////
	
	private static var _socket:Socket;
	private static var _ip:String;
	private static var _port:int;
	
	private static var _socket2:Socket; // 戰鬥場景.
	private static var _ip2:String;
	private static var _port2:int;
	
	private static var _notifier:Notifier;
	private static var _respMap:Array;
	
	private static var bytes_L:ByteArray = new ByteArray;
	private static var bytes_H:ByteArray = new ByteArray;
	private static var bytes_B:ByteArray = new ByteArray;
	
	
	private static function onConnect(e:Event) : void{
		GameModel.getLog().simplify(formatString("\nsocket連接成功 [ {0} - {1} ].", [_ip, _port]));
		_notifier.dispatchDirectEvent(AEvent.COMPLETE);
	}
	
	private static function onConnect2(e:Event) : void{
		GameModel.getLog().simplify(formatString("\nsocket連接戰鬥服務器成功 [ {0} - {1} ].", [_ip2, _port2]));
		_notifier.dispatchDirectEvent(AEvent.COMPLETE);
	}
	
	private static function onClose(e:Event) : void{
		GameModel.getLog().simplify("NetManager", "onClose", "socket中斷: [ {0} - {1} ] !!!", _ip, _port);
		_notifier.dispatchDirectEvent(AEvent.INTERRUPT);
		UUFacade.getWindow(Net_Reconnect_StateUU).activate(["你已从游戏服务器断开连接，请检查你的网络设置。"]);
	}
	
	private static function onClose2(e:Event) : void{
		GameModel.getLog().simplify("戰鬥服務器socket關閉.");
	}
	
	private static function onIoError(e:IOErrorEvent) : void{
		GameModel.getLog().message("NetManager", e);
	}
	
	private static function onSecurityError(e:SecurityErrorEvent) : void{
		GameModel.getLog().message("NetManager", e);
	}
	
	// 接收數據.
	private static function onSocketData(e:ProgressEvent) : void {
//		_socket.readBytes(bytes_Z);
		____doNextResponse();
		
	}
	

	private static const LEN:int = 0;
	private static const HALF_LEN:int = 2;
	private static const HEAD:int = 3;
	private static const HALF_HEAD:int = 4;
	private static const BODY:int = 5;
	private static const HALF_BODY:int = 6;
	
	private static var _flag:uint = LEN;
	private static var _length:int;
	private static var _currPosition:int;
//	private static var bytes_LL:ByteArray = new ByteArray;
	private static var bytes_HH:ByteArray = new ByteArray;
	private static var bytes_BB:ByteArray = new ByteArray;
	
	private static function ____doNextResponse() : void {
		if(_flag == LEN){
			if(_socket.bytesAvailable < 4){
				throw new Error("Error len.");
//				_socket.readBytes(bytes_LL, 0, _socket.bytesAvailable);
//				_flag = HALF_LEN;
//				return;
			}
			else {
				_length = _socket.readUnsignedInt();
				_flag = HEAD;
				if(_socket.bytesAvailable == 0){
					return;
				}
			}
		}
		if(_flag == HEAD){
			if(_socket.bytesAvailable < 10){
				_currPosition = _socket.bytesAvailable;
				_socket.readBytes(bytes_HH, 0, 10 - _socket.bytesAvailable);
				_flag = HALF_HEAD;
				return;
			}
			else {
				_socket.readBytes(bytes_HH, 0, 10);
				_flag = BODY;
				if(_socket.bytesAvailable == 0){
					return;
				}
			}
		}
		if(_flag == HALF_HEAD){
			if(_currPosition + _socket.bytesAvailable < 10){
				_currPosition += _socket.bytesAvailable;
				_socket.readBytes(bytes_HH, 0, (10 - _currPosition) - _socket.bytesAvailable);
				return;
			}
			else {
				_socket.readBytes(bytes_HH, 0, 10 - _currPosition);
				_flag = BODY;
				if(_socket.bytesAvailable == 0){
					return;
				}
			}
		}
		if(_flag == BODY){
			if(_socket.bytesAvailable < _length - 14){
				_currPosition = _socket.bytesAvailable;
				_socket.readBytes(bytes_BB, 0, (_length - 14) - _socket.bytesAvailable);
				_flag = HALF_BODY;
				return;
			}
			else {
				_socket.readBytes(bytes_BB, 0, _length - 14);
				_flag = BODY;
			}
		}
		if(_flag == HALF_BODY){
			if(_currPosition + _socket.bytesAvailable < _length - 14){
				_currPosition += _socket.bytesAvailable;
				_socket.readBytes(bytes_BB, 0, (_length - 14 - _currPosition) - _socket.bytesAvailable);
				return;
			}
			else {
				_socket.readBytes(bytes_BB, 0, _length - 14 - _currPosition);
				_flag = LEN;
			}
		}
		
		____doMergeBytes(bytes_HH, bytes_BB);
		
		//trace(_socket.bytesAvailable);
		bytes_HH.length = bytes_BB.length = _currPosition = _length = _flag = 0;
		if(_socket.bytesAvailable){
			____doNextResponse();
		}
	}
	
	
	
	// 接收數據 2.
	private static function onSocketData2(e:ProgressEvent) : void {
		//		_socket.readBytes(bytes_Z);
		____doNextResponse2();
		
	}
	
	
	private static var _flag2:uint = LEN;
	private static var _length2:int;
	private static var _currPosition2:int;
	//	private static var bytes_LL2:ByteArray = new ByteArray;
	private static var bytes_HH2:ByteArray = new ByteArray;
	private static var bytes_BB2:ByteArray = new ByteArray;
	
	
	private static function ____doNextResponse2() : void {
		if(_flag2 == LEN){
			if(_socket2.bytesAvailable < 4){
				throw new Error("Error len.");
				//				_socket.readBytes(bytes_LL, 0, _socket.bytesAvailable);
				//				_flag = HALF_LEN;
				//				return;
			}
			else {
				_length2 = _socket2.readUnsignedInt();
				_flag2 = HEAD;
				if(_socket2.bytesAvailable == 0){
					return;
				}
			}
		}
		if(_flag2 == HEAD){
			if(_socket2.bytesAvailable < 10){
				_currPosition2 = _socket.bytesAvailable;
				_socket2.readBytes(bytes_HH2, 0, 10 - _socket2.bytesAvailable);
				_flag2 = HALF_HEAD;
				return;
			}
			else {
				_socket2.readBytes(bytes_HH2, 0, 10);
				_flag2 = BODY;
				if(_socket2.bytesAvailable == 0){
					return;
				}
			}
		}
		if(_flag2 == HALF_HEAD){
			if(_currPosition2 + _socket2.bytesAvailable < 10){
				_currPosition2 += _socket2.bytesAvailable;
				_socket2.readBytes(bytes_HH2, 0, (10 - _currPosition2) - _socket2.bytesAvailable);
				return;
			}
			else {
				_socket2.readBytes(bytes_HH2, 0, 10 - _currPosition2);
				_flag2 = BODY;
				if(_socket2.bytesAvailable == 0){
					return;
				}
			}
		}
		if(_flag2 == BODY){
			if(_socket2.bytesAvailable < _length2 - 14){
				_currPosition2 = _socket2.bytesAvailable;
				_socket2.readBytes(bytes_BB2, 0, (_length2 - 14) - _socket2.bytesAvailable);
				_flag2 = HALF_BODY;
				return;
			}
			else {
				_socket2.readBytes(bytes_BB2, 0, _length2 - 14);
				_flag2 = BODY;
			}
		}
		if(_flag2 == HALF_BODY){
			if(_currPosition2 + _socket2.bytesAvailable < _length2 - 14){
				_currPosition2 += _socket2.bytesAvailable;
				_socket2.readBytes(bytes_BB2, 0, (_length2 - 14 - _currPosition2) - _socket2.bytesAvailable);
				return;
			}
			else {
				_socket2.readBytes(bytes_BB2, 0, _length2 - 14 - _currPosition2);
				_flag2 = LEN;
			}
		}
		
		____doMergeBytes(bytes_HH2, bytes_BB2);
		
		//trace(_socket2.bytesAvailable);
		bytes_HH2.length = bytes_BB2.length = _currPosition2 = _length2 = _flag2 = 0;
		if(_socket2.bytesAvailable){
			____doNextResponse2();
		}
	}
		
	private static function ____doMergeBytes( headBytes:ByteArray, bodyBytes:ByteArray ) : void {
		var body:MsgBody;
		var head:MsgHead;
		var cmd_A:int;
		var cmd_B:int;
		//var subMsg:Object;
		//var resp:IResponsor;
		var ret:int;
		var errorInfo:String;
		
		
		// Head.
		head = new MsgHead
		head.mergeFrom(headBytes);
		cmd_A = head.cmd >> 16;
		cmd_B = head.cmd & 0xFFFF;
		GameModel.getLog().message("NetManager", "Response: [ {0}, {1} ].", cmd_A, cmd_B);
		
		// Body.
		body = new MsgBody;
		body.mergeFrom(bodyBytes);
		
		// 記錄body信息.
		GameModel.getLog().simplify(body);
		
		// 服務端報錯，莫名其妙...
		if ( body.ret != 0) {
			//ret = body.ret;
			// Skill.
			//if (cmd_B == CmdCodeBattle.CC_BATTTE_SKILL_USE_RES) {
				//errorInfo = SKILL_ERROR_INFO_LIST[ret] ? SKILL_ERROR_INFO_LIST[ret] : "未知的技能錯誤";
			//}
			// Movement.
			//else if (cmd_B == CmdCodeBattle.CC_MOVE_CHESS_RES) {
				//errorInfo = MOVE_ERROR_INFO_LIST[ret] ? MOVE_ERROR_INFO_LIST[ret] : "未知的移動錯誤";
			//}
			// Card.
			//else if (cmd_B == CmdCodeBattle.CC_PALY_CARD_RES) {
				//errorInfo = "使用了不存在的手牌 或 使用手牌的法力不足";
			//}
			// ...
			//else {
				//errorInfo = formatString("錯誤的ERROR碼枚舉類型: [ {0} ] !!", [cmd_B]);
			//}
			//GameModel.getLog().simplify("\n============================================================\n");
			//GameModel.getLog().message("NetManager", "服务器錯誤( {0} ): [ {1} ].", ret, errorInfo);
			
			if (cmd_B == CmdCodeRole.CC_ROLE_VERIFICATE_RES) {
				respBack(body, cmd_A, cmd_B);
				return;
			}
			
			BattleErrorValidator.handleError(body.ret);
			
			//GameModel.getLog().message("NetManager", "____doMergeBytes", "服務端返回錯誤.");
			
			
			
			//执行错误码 

			if (ErrorConfiguration.checkErrorStealBack(body.ret)) {
				GameModel.getLog().simplify("\n" + body.ret + "\n");
				
				respBack(body, cmd_A, cmd_B);
				if (ErrorConfiguration.checkHandleBack(body.ret)) {
					ErrorConfiguration.dealHandErrors(body.ret);
				}
			}else {
				PromptManager.instanse.showError(body.ret);
			}
		}else {
			respBack(body,cmd_A,cmd_B);	
		}
		
		
	}
	
	private static function respBack(body:MsgBody,cmd_A:int, cmd_B:int):void {
		var resp:IResponsor;
		var subMsg:Object;
		switch(cmd_A) {
			case CmdType.CT_AUTH:
				subMsg = body.authBody;
				resp = _respMap[cmd_A] ||= new AuthResponsor;
				break;
			case CmdType.CT_LOGIN:
				subMsg = body.loginBody;
				resp = _respMap[cmd_A] ||= new LoginResponsor;
				break;
			case CmdType.CT_ROLE:
				subMsg = body.roleBody;
				resp = _respMap[cmd_A] ||= new RoleResponsor;
				break;
			case CmdType.CT_QUEST:
				subMsg = body.questBody;
				resp =  _respMap[cmd_A] ||= new QuestResponsor;
				break;
			case CmdType.CT_BATTLE:
				subMsg = body.battleBody;
				resp =  _respMap[cmd_A] ||= new BattleResponsor;
				break;
			case CmdType.CT_ROOM:
				subMsg = body.roomBody;
				resp =  _respMap[cmd_A] ||= new RoomResponsor;
				break;
			case CmdType.CT_CHAT:
				subMsg = body.chatBody;
				resp =  _respMap[cmd_A] ||= new ChatResponsor;
				break;
			case CmdType.CT_ITEM:
				subMsg = body.itemBody;
				resp =  _respMap[cmd_A] ||= new ItemResponsor;
				break;
			default:
				GameModel.getLog().simplify("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				GameModel.getLog().simplify("!!!!!!!!未註冊Responsor的cmd: [ {0} ].", cmd_A);
				GameModel.getLog().simplify("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				return;
			}
			
			// 處理服務器返回數據.
			resp.onHandle(cmd_B, subMsg,body.ret);
	}
	
	
	
	//private static const SKILL_ERROR_INFO_LIST:Object = {-1 :  "其他錯誤",
														//-2   :  "服務端等待客戶端交互指令中",
														//-3   :  "施法者指針為空",
														//-4   :  "技能不存在",
														//-5   :  "技能釋放目標錯誤",
														//-6   :  "沒有穿裝備，不能使用裝備技能",
														//-7   :  "身上的裝備沒有主動技能",
														//-8   :  "冤魂纏繞，不能使用任何技能",
														//-9   :  "其他技能與服務器交互中 (猜法力等)",
														//-10  :  "附近敵人有挑戰buff",
														//-11  :  "技能消耗錯誤",
														//-13  :  "技能消耗，法力不足",
														//-14  :  "一次性技能，已經釋放過了",
														//-15  :  "人物的主動技能對其無效",
														//-16  :  "目標已經死亡",
														//-17  :  "目標身上沒有裝備",
														//-18  :  "墓地沒有死亡卡牌",
														//-19  :  "技能限制目標體力",
														//-20  :  "自己身上已經攜帶了怪物",
														//-21  :  "距離限制",
														//-22  :  "對方手牌為空",
														//-23  :  "附近沒有空位置",
														//-24  :  "不能對出兵點目標使用" };
														//
														//
	//private static const MOVE_ERROR_INFO_LIST:Object = { -1 :  "移動格子數小於2",
														//-2  :  "非當前回合的行動者角色", 
														//-3  :  "坐標非法",
														//-4  :  "起點坐標的目標 與 帶移動目標不符",
														//-5  :  "移動目標不存在 或 非自己控制的目標",
														//-6  :  "不能越過的障礙物",
														//-7  :  "移動路徑不相鄰",
														//-8  :  "移動路徑中包含天元" };
}
}