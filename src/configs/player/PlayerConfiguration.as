package configs.player 
{
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	/**
	 * ...
	 * @author dcl
	 */
	public class PlayerConfiguration 
	{
		private static var _expList:Object = { };
		
		public function PlayerConfiguration() 
		{
			
		}
		
		
		public static function initExp( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var exp:UpgradeExp;
			
			const FIELDS:Array = ["level", "exp"];
			l = v.length;
			while(i<l){
				exp = new UpgradeExp;
				CsvUtil.setValues(exp, v[i++], FIELDS);
				_expList[exp.level] = exp;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Experience ].");
		}
		
		public static function getExpInfo(level:int):UpgradeExp {
			return _expList[level];
		}
		
		public static function getExp(level:int):int {
			return getExpInfo(level).exp;
		}
		
		static public function get expList():Object 
		{
			return _expList;
		}
		
		
	}

}