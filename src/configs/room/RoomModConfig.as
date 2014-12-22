package configs.room 
{
	import flash.display.BitmapEncodingColorSpace;
	import proto.com.RoomBaseInfo;
	import proto.com.RoomMemberInfo;
	/**
	 * ...比赛模式 这里是大类分（后台没细分，所以前端存储，细小模式 RoomMod中取 ）
	 * @author ... dcl
	 */
	public class RoomModConfig 
	{
		
		public static const ROOM_MOD_PRACTICE:uint = 0;    // 练习模式
		   
		public static const ROOM_MOD_FREE:uint = 1;        //自由模式
		
		public static const ROOM_MOD_ARENA:uint = 2;      //竞技场模式
		
		public static const ROOM_MOD_BREAK:uint = 3;      //闯关模式
		
		public static const ROOM_MOD_FRESH_GUIDE:uint = 4;      //新手引导模式
		
		public static const ROOM_STATE_INROOM:uint = 1;     //房间中玩家 当前状态  在房间
		   
		public static const ROOM_STATE_INBATTLE:uint = 2;   //房间中玩家 当前状态  在游戏中
		
		
		public static const ROOM_OWNER_CHAIR_ID:uint = 0;   //房主的座位号
		
		public static const SCENE_STATE_BATTLE:String = "battle";   
		 
		public static const SCENE_STATE_COMMON:String = "common";  
		
		
		public static var room_pwd:String;           //房间密码
		
		public static var curStage:int;              //当前等级
		
		public static var memberArr:Array;          //整个房间的成员
		
		public static var memberInfoObj:Object;     ///整个房间的成员 位置--》成员
		
		public static var isInDaTing:Boolean;      //是否在大厅中
		
		public static var isInRoom:Boolean;        //是否已在房间中， 
		
		public static var curRoomMember:uint;   //当前人员个数
		
		public static var myCampId:int;       //我的卡牌
		
		public static var isJoinOrOutRoom:Boolean;    //加入或退出房间更新
		//public static var isOutRoom:Boolean;    //退出房间更新
		
		public static var isStartState:Boolean;   //是否在开始倒计时中
		
		public static var roomListInit:Boolean;    
		
		public static var roomInfo:RoomBaseInfo = null;   //当前房间信息
		
		public static var isGamingCheck:Boolean = true;  //是否显示游戏中的房间
		
		public static var enterRoomTime:int = 0;    //进入房间后时间
		
		public static var lastSceneState:String =  SCENE_STATE_COMMON; //上一个场景
		
		public function RoomModConfig() 
		{
			
		}
		
		
	}

}