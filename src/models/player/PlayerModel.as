package models.player
{
	import com.netease.protobuf.UInt64;
	import org.agony2d.events.Notifier;
	
	import models.GameModel;
	
	import proto.com.RoleInfo;
	
	import utils.GameUtil;

public class PlayerModel
{
	private static var _notifier:Notifier = new Notifier();
	private static var g_instance:PlayerModel;
	public static function getInstance() : PlayerModel
	{
		return g_instance ||= new PlayerModel;
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
		_notifier.dispatchEvent(new RoleEvent(str, data));
	}
	
	public function  get myRole() : RoleVo {
		return _myRole;
	}
	
	public static function get roleState():String 
	{
		return _roleState;
	}
	
	public static function set roleState(value:String):void 
	{
		_roleState = value;
	}
	
	public function initialize( roleInfo:RoleInfo, campList:Array ) : void{
		_myRole = new RoleVo
		_myRole.setValue(roleInfo);
		_myRole.setCamps(campList);
		
		GameModel.getLog().simplify("初期化玩家信息.");
	}
	
	public function updateRole(roleInfo:RoleInfo, campList:Array ):void {
		_myRole.updateValue(roleInfo);
		_myRole.updateCamps(campList);
		GameModel.getLog().simplify("更新了玩家信息.");
		dispatchEvent(RoleEvent.Update_Role_Info);
	}
	
	/**
	 * 是否為自己的角色.
	 *  
	 * @param roldId
	 * @return 
	 * 
	 */		
	public static function isMyRole( roleId:UInt64 ) : Boolean {
		return GameUtil.isUint64Equal(roleId, PlayerModel.getInstance().myRole.id);
	}
	
	
	
	
	private var _myRole:RoleVo;
	private static var _roleState:String;    //玩家在某个状态
}
}