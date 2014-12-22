package views.UU.shop.items 
{
	import configs.cardset.CardSetConfig;
	import models.cardSet.CardSetModule;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import ui.ItemView;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Shop_CardTab_UU extends FusionUU
	{
		private var selectBg:ImageLoaderUU;
		private var title:LabelUU;
		private var _campId:int;
		private var _selected:Boolean;
		public function Shop_CardTab_UU() 
		{
			init();
		}
		
		private function init():void {
						
			selectBg = new ImageLoaderUU;
			selectBg.source = TResourceManager.getAsset("shop/img/select_bg_scale9.png");
			this.addNode(selectBg);
			//this.itemHeight = selectBg.height;
			this.spaceWidth = selectBg.width;
			this.spaceHeight = selectBg.height;
			
			var rawsprite:RawSpriteUU = new RawSpriteUU;
			this.addNode(rawsprite);
			rawsprite.graphics.beginFill(0x000000,0); 
			rawsprite.graphics.lineStyle(0, 0x000000, 0);
			//shildSprite.graphics.drawRect(0 - Agony.getAdapter().rootWidth / 2,0 - Agony.getAdapter().rootHeight / 2, Agony.getAdapter().rootWidth, Agony.getAdapter().rootHeight);
			rawsprite.graphics.drawRect(0,0, selectBg.width,selectBg.height);
			rawsprite.graphics.endFill();
			
			title = TextUtil.createLabel6("", 18, 0xe8bb8a, true, 0x341700);
			this.addNode(title);
			title.locatingTypeForHoriz = LocatingType.F___A___F;
			title.locatingTypeForVerti = LocatingType.F___A___F;
		}
		//override protected function onClick(e:ATouchEvent):void {
			//trace();
		//}
		
		//override public function set selected(value:Boolean):void 
		//{
			//
		//}
		
		public function get campId():int 
		{
			return _campId;
		}
		
		public function set campId(value:int):void 
		{
			_campId = value;
			title.text = CardSetConfig.Camp_Str[campId];
		}
		
		public function get selected():Boolean 
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void 
		{
			_selected = value;
			selectBg.visible = selected;
		}
	}

}