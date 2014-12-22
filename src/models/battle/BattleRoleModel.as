package models.battle {
	import com.netease.protobuf.Int64;
	import com.netease.protobuf.UInt64;
	
	import flash.utils.Dictionary;
	
	import models.player.PlayerModel;
	
	import proto.com.BattleMemberInfo;
	import proto.com.RoomBaseInfo;
	
public class BattleRoleModel {
	
	public static var roomId:Int64;
	
	public static var ownerId:UInt64;
	
	public static var state:int;
	
	public static var roomName:String;
	
	public static var password:String;
	
	public static var mod:int;  //RoomMod
	
	public static var mapId:int;
	
	public static var stage:int; //RoomStage
	
	public static var numMembers:int;
	
	public static var pvpIp:String;
	
	
	
	
	public static function initialize( members:Array, roomBaseInfo:RoomBaseInfo ):void {
		var member:BattleMemberInfo;
		var vo:BattleRoleVo;
		var i:int;
		var l:int;
		
		_roleId2BattleRoleVoMap = {};
		l = members.length;
		while(i<l){
			vo = new BattleRoleVo;
			vo.initialize(members[i++]);
			
			_roleId2BattleRoleVoMap[vo.roleVo.id] = vo;
		}
		
		
		roomId = roomBaseInfo.roomId;
		ownerId = roomBaseInfo.owerId;
		state = roomBaseInfo.state;
		roomName = roomBaseInfo.name;
		password = roomBaseInfo.pwd;
		mod = roomBaseInfo.mod;
		mapId = roomBaseInfo.roundId;
		stage = roomBaseInfo.stage
		numMembers = roomBaseInfo.memberCount;
		pvpIp = roomBaseInfo.pvpIp;
		
		
		isEven = ((getMyBattleRoleVo().chairId % 2) == 0);
	}
	
	
	public static function dispose() : void {
		
		
	}
	
	/**
	 * 查找戰鬥角色數據.
	 *  
	 * @param roleId
	 * @return 
	 * 
	 */	
	public static function getBattleRoleVo( roleId:* ) : BattleRoleVo {
		return _roleId2BattleRoleVoMap[roleId];
	}
	
	/**
	 * 快速獲取自己的戰鬥角色數據.
	 */
	public static function getMyBattleRoleVo() : BattleRoleVo {
		return _roleId2BattleRoleVoMap ? _roleId2BattleRoleVoMap[PlayerModel.getInstance().myRole.id] : null;
	}
	
	
	// 己方是否为偶数chairId，判断是否队友.
	public static var isEven:Boolean;
	
	public static function getBattleRoleVoByChairId( v:int ) : BattleRoleVo {
		var vo:BattleRoleVo;
		
		for each(vo in _roleId2BattleRoleVoMap) {
			if (vo.chairId == v) {
				return vo;
			}
		}
		return null;
	}
	
	
	private static var _roleId2BattleRoleVoMap:Object;

}
}