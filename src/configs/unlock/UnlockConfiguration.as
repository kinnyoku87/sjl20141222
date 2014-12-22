package configs.unlock 
{
	import cn.flashk.controls.skin.sourceSkin.ButtonSourceSkin;
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	import proto.com.CAMP_ID;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class UnlockConfiguration 
	{
		//阵营最高解锁等级 {shang,zhou,yao,wu,zhongli}
		public static var UnlockMaxLevel:Object = { 1:12,2:13,3:13,4:14,9:1 };
		
		private static var _unlockList:Object = { };
		public function UnlockConfiguration() 
		{
			
		}
		
		public static function initUnlock( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var unlock:UnlockInfoCfg;
			var k:int;
			var arr1:Array = ["name","level","camp"];
			var arr2:Array = [];
			var arr3:Array = ["num"];
			for (k = 1; k <= 29;k++ ) {
				arr2.push("unlock"+k);
			}
			const FIELDS:Array = arr1.concat(arr2).concat(arr3);
			l = v.length;
			while(i<l){
				unlock = new UnlockInfoCfg;
				CsvUtil.setValues(unlock, v[i++], FIELDS);
				_unlockList[unlock.name] = unlock;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Unlock ].");
		}
		
		public static function getUnlock(campID:int, camplevel:int ):UnlockInfoCfg {
			var name:String = "";
			switch (campID)
			{
				case CAMP_ID.CAMP_ID_SHANG:
					name = "shang_" + camplevel;
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					name = "zhou_" + camplevel;
					break;
				case CAMP_ID.CAMP_ID_YAO:
					name = "yao_" + camplevel;
					break;
				case CAMP_ID.CAMP_ID_WU:
					name = "wu_" + camplevel;
					break;
				default:
					break;
			}
			return _unlockList[name];
		}
		
		public static function getUnlockCards(campID:int, camplevel:int):Array {
			var arr:Array = [];
			var unlock:UnlockInfoCfg = getUnlock(campID, camplevel);
			for (var i:int = 1; i <= unlock.num;i++ ) {
				arr.push(unlock["unlock"+i]);
			}
			return arr;
		}
		
		public static function getMaxLevel(level:int):int {
			return UnlockMaxLevel[level];
		}
		
		//public static function getUnlock(name:String):UnlockInfoCfg {
			//return _unlockList[name];
		//}
		
		static public function get unlockList():Object 
		{
			return _unlockList;
		}
		
	}

}