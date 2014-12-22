package net.responses
{
	import configs.ConfigNet;
	
	import models.GameModel;
	import models.player.PlayerModel;
	
	import net.NetManager;
	import net.NetUtil;
	
	import org.agony2d.events.AEvent;
	
	import proto.cs.AuthBody;
	import proto.cs.CmdCodeBattle;
	import proto.cs.CmdCodeRole;
	import proto.cs.CmdCodeSign;
	import proto.cs.CmdType;
	import proto.cs.EnterArenaReq;
	import proto.cs.SignReq;
	import proto.cs.SignRes;
	import proto.cs.SignZoneIpRes;

	public class AuthResponsor implements IResponsor
	{
		public function onHandle(cmd_B:int, subMsg:Object,ret:int):void
		{
			var subMsg_A:AuthBody;
			
			subMsg_A = subMsg as AuthBody;
			switch(cmd_B){

				// 用戶驗證.
				case CmdCodeSign.CC_AUTH_ZONE_IP_RES:
					this.onAuthZoneIp(subMsg_A.signZoneIpRes as SignZoneIpRes);
					break;
				
				// 專區信息.
				case CmdCodeSign.CC_AUTH_SIGN_RES:
					this.onAuthSign(subMsg_A.signRes as SignRes);
					break;
					
				default:
					
					break;
			}
		}
		
		private function onAuthZoneIp(v:SignZoneIpRes):void{
			var AY:Array;
			
			AY = NetUtil.getIpAndPort(v.zoneIp);
			NetManager.connect(AY[0], AY[1]);
			NetManager.addEventListener(AEvent.COMPLETE, ____onNetConnected1);
		}
		
		/**
		 * 用戶驗證.
		 */
		public static function ____onNetConnected1(e:AEvent):void{
			NetManager.removeEventListener(AEvent.COMPLETE, ____onNetConnected1);
			
			GameModel.getLog().simplify("客戶端驗證成功.");
			
			var msg:SignReq;
			
			msg = new SignReq;
			msg.uid = ConfigNet.uid;
			NetManager.sendRequest(CmdType.CT_AUTH, CmdCodeSign.CC_AUTH_SIGN_REQ, msg);
		}
		
		private function onAuthSign(v:SignRes):void{
			GameModel.getLog().simplify("透傳數據: [ {0} ].", v.cbData);
			
			if(v.cbData == 0){
				// 當前專區的角色列表.
				NetManager.sendRequest(CmdType.CT_ROLE, CmdCodeRole.CC_ROLE_GET_LIST_REQ, null);
			}
			else if(v.cbData == 1){

				// 發送戰鬥請求.
				
				var msg_B:EnterArenaReq;
				
				msg_B = new EnterArenaReq;
				msg_B.roleId = PlayerModel.getInstance().myRole.id
				msg_B.checkCode = ConfigNet.checkCode;
				NetManager.sendRequest2(CmdType.CT_BATTLE, CmdCodeBattle.CC_ARENA_ENTER_REQ, msg_B);
				
			}
		}
	}
}