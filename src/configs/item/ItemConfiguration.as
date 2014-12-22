package configs.item 
{
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ItemConfiguration 
	{
		private static var _itemList:Object = { };
		public function ItemConfiguration() 
		{
			
		}
		
		public static function initItem( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var item:ItemCfg;

			const FIELDS:Array = ["id", "name", "stacking", "levelNeed", "useType", "timeLimit", "des", "type", "value", "icon", "post"];
			l = v.length;
			while(i<l){
				item = new ItemCfg;
				CsvUtil.setValues(item, v[i++], FIELDS);
				_itemList[item.id] = item;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Item ].");
		}
		
		public static function getItem(id:int):ItemCfg {
			return _itemList[id];
		}
		
		static public function get itemList():Object 
		{
			return _itemList;
		}
	}

}