package configs.shop 
{
	import models.GameModel;
	import org.agony2d.collections.CsvUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ShopConfiguration 
	{
		
		private static var _shopList:Object = { };
		private static var _shopSaleList:Object = { };
		public function ShopConfiguration() 
		{
			
		}
		
		
		public static function initShop( v:Vector.<Array> ) : void {
			var i:int;
			var l:int;
			var shop:ShopInfoCfg;
			
			const FIELDS:Array = ["shopId", "classStr", "subClassStr", "goodId", "count", "sellType","price"];
			l = v.length;
			while(i<l){
				shop = new ShopInfoCfg;
				CsvUtil.setValues(shop, v[i++], FIELDS);
				_shopList[shop.shopId] = shop;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ Shop ].");
		}
		
		public static function initSellPrice( v:Vector.<Array> ):void {
			var i:int;
			var l:int;
			var sale:ShopSaleCfg;
			
			const FIELDS:Array = ["id", "quality", "type", "price"];
			l = v.length;
			while(i<l){
				sale = new ShopSaleCfg;
				CsvUtil.setValues(sale, v[i++], FIELDS);
				_shopSaleList[sale.quality] = sale;
			}
			
			GameModel.getLog().simplify("初期化: csv - [ ShopSale ].");
		}
		
		public static function getShopInfo(id:int):ShopInfoCfg {
			return _shopList[id];
		}
		
		public static function getShopSale(quality:int):ShopSaleCfg {
			return _shopSaleList[quality];
		}
		
		static public function get shopList():Object 
		{
			return _shopList;
		}
		
		static public function get shopSaleList():Object 
		{
			return _shopSaleList;
		}
		
	}

}