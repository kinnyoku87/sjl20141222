package configs.create 
{
	import adobe.utils.CustomActions;
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.utils.StringUtil;
	/**
	 * ...角色对象控制器
	 * @author ... dcl
	 */
	public class RoleCreateConfigurator 
	{
		private static var _roleHeadList:Object = { };
		public static var _roleHeadArr:Vector.<RoleHeadCfg> = new Vector.<RoleHeadCfg>();
		
		public static var _roleNameFirstArr:Array = [];
		public static var _roleNameMiddleArr:Array = [];
		public static var _roleNameLastArr:Array = [];
		public function RoleCreateConfigurator() 
		{
			
		}
		
		//初始化头像数据
		public static function initHead( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var head:RoleHeadCfg
			
			const HEAD_FIELDS:Array = ["id", "gender", "altas", "sprite"]
			l = v.length;
			while (i < l) {
				//if (v[i++].length != HEAD_FIELDS.length ) {
				//	continue;
				//}
				head = new RoleHeadCfg;
				CsvUtil.setValues(head, v[i++], HEAD_FIELDS);
				_roleHeadList[head.id] = head;
				_roleHeadArr.push(head);
			}
			GameModel.getLog().simplify("初期化: csv - [ RoleHead ].");
		}
		
		//初始化头像数据
		public static function initName( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var name:RoleNameCfg
			
			const NAME_FIELDS:Array = ["firstName", "middleName", "lastName"]
			l = v.length;
			
			while(i<l){
				name = new RoleNameCfg;
				CsvUtil.setValues(name, v[i++], NAME_FIELDS);
				_roleNameFirstArr.push(name.firstName);
				_roleNameMiddleArr.push(name.middleName);
				_roleNameLastArr.push(name.lastName);
			}
			GameModel.getLog().simplify("初期化: csv - [ RoleName ].");
		}
		
		//根据id 获取
		public static function getRoleHeadById(id:int):RoleHeadCfg {
			return _roleHeadList[id];
		}
		
		//根据sprite 获取
		public static function getRoleHeadBySprite(sprite:String):RoleHeadCfg {
			for each(var value:RoleHeadCfg in _roleHeadList) {
				if (value.sprite == sprite) {
					return value;
				}
			}
			return null;
		}
		
		//获取随机名
		public static function getRandomName():String {
			var firstName:String = "";
			var middleName:String = "";
			var lastName:String = "";
			
			firstName = randomExtract(_roleNameFirstArr) as String;
			middleName = randomExtract(_roleNameMiddleArr) as String;
			lastName = randomExtract(_roleNameLastArr) as String;
			
			return StringUtil.Trim(firstName + middleName + lastName);
		}
		
		
		/** 
		 * 从参数ary（数组）中随机返回一个 数组项
		 */
		public static function randomExtract(arr:Array):* 
		{
			return (arr[Math.floor(Math.random() * arr.length)]);
		}
	}

}