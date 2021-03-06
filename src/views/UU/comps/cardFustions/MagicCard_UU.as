package views.UU.comps.cardFustions 
{
	import configs.cards.CardConfigurator;
	import configs.cards.MagicCardCfg;
	import configs.ConfigTxt;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.resources.TResourceManager;
	import utils.TextUtil;
	import views.UU.comps.CardUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class MagicCard_UU extends FusionUU
	{
		private var cardVo:MagicCardCfg;
		
		public function MagicCard_UU(_cardVo:MagicCardCfg) 
		{
			cardVo = _cardVo;
			init();
		}
		
		private function init():void 
		{
			var img:BitmapLoaderUU;
			var i:int;
			var label:LabelUU;
			//var cardVo:MagicCardCfg;
			
			 //roleVo.
			//cardVo = this.stateArgs[0];

			var name:String = cardVo.name;
			var magic:int = cardVo.mana;
			var imageURL:String = "assets/temp/cards/magic_equip/" + cardVo.imageURL + ".png"
			
			
			// 上部外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_upper_magic.png");
			this.addNode(img);
			
			// 人物圖片.
			img = new BitmapLoaderUU;
			img.source = imageURL;
			img.x = 3;
			img.y = 30;
			this.addNode(img);
			//img.scaleX = 1.26;
			//img.scaleY = 1.35
			
			// 人物名字.
			label = TextUtil.createLabel2(name, 22, 0xFFFFFF);
			this.addNode(label);
//			label.locatingTypeForHoriz = LocatingType.F___A___F;
//			label.locatingOffsetX = 20;
			label.x = CardUU.CARD_NAME_OFFSET_X;
			label.y = CardUU.CARD_NAME_OFFSET_Y;
			
			// 頂部魔耗數字外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_magic.png");
			this.addNode(img);
			img.x = -3;
			img.y = -14
			
			// 魔耗數字.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset(CardConfigurator.getMagicNumAssetId(magic));
			this.addNode(img);
			img.x = 14;
			img.y = 2;
			
			// 下部外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_desc_A.png");
			this.addNode(img);
			img.y = 230;
			
			this.spaceWidth = this.width;
			this.spaceHeight = this.height;
			
			// 下部描述外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_desc_B.png");
			this.addNode(img);
			img.x = 16;
			img.y = 246;
			
			var pos_A:Number;
			var pos_B:Number;
			
			pos_A = 16;
			pos_B = 248;
			
			// 技能A描述
			label = TextUtil.createLabel4(cardVo.desc, 15, 0x0, ConfigTxt.CARD_DESC_WIDTH, ConfigTxt.CARD_DESC_HEIGHT);
			this.addNode(label);
			label.x = pos_A + 6;
			label.y = pos_B + 22;
		}
	}

}