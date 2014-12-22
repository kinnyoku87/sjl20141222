package configs.shop 
{
	import proto.com.CAMP_ID;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class ShopConfig 
	{
		public static const XUANYU_SHOPID:int = 3;
		public static const BAOHE_SHOPID:int = 2;
		public static const DEFAULT_BUY_NUM:int = 100;
		
		
		public static var baoheStep:int = 1;   //宝盒步骤
		
		
		public static const CutLine_Num:int = 4;                       //商店列表 4 个一行
		
			
		public static const Shop_Card_Width:Number = 245;          //商店卡牌 尺寸宽  这里手动设置大小，卡牌获取不准确
		public static const Shop_Card_Height:Number = 390;         //商店卡牌 尺寸高
		
		public static var campId:int = CAMP_ID.CAMP_ID_SHANG;           //当前阵营
		
		public static var searchName:String = "";               //查找名称
		public function ShopConfig() 
		{
			
		}
		
	}

}