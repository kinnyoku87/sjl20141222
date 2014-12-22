package models.room 
{
	import proto.com.RoomMemberInfo;
	import proto.cs.GetSimpleRoleRes;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class RoomMemberVo 
	{
		public var roomMember:RoomMemberInfo;
		public var simpleRole:GetSimpleRoleRes;
		public var roombattleState:int;
		
		public function RoomMemberVo() 
		{
			roomMember = new RoomMemberInfo();
			simpleRole = new GetSimpleRoleRes();
		}
	}

}