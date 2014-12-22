package views.UU.shop.states 
{
	import configs.shop.ShopConfig;
	import org.agony2d.flashApi.StateUU;
	import views.UU.shop.items.Shop_XuanYu_ItemUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_XuanYu_StateUU extends StateUU
	{
		
		public function Shop_XuanYu_StateUU() 
		{
			
		}
		
		override public function onEnter () : void {
			var xuanyuUU:Shop_XuanYu_ItemUU = new Shop_XuanYu_ItemUU();
			this.fusion.addNode(xuanyuUU);
			xuanyuUU.setData(ShopConfig.XUANYU_SHOPID);
			xuanyuUU.x = 50;
			xuanyuUU.y = 30;
		}
		
		override public function onExit () : void {
			
		}
	}

}