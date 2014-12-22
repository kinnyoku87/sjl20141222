package views.UU.cardSet.items 
{
	import configs.cards.CardConfigurator;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CardHoldUnit;
	import utils.GameUtil;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CardSet_BagCard_UU extends FusionUU
	{

		public var cardUnit:CardHoldUnit;
		private var _animator:AnimatorUU;
		private var animatorSource:String = "atlas/cardset/effects3";
		public function CardSet_BagCard_UU() 
		{
			
		}
		
		private  function init():void {
			var bg:ImageLoaderUU = new ImageLoaderUU;
			bg.source = TResourceManager.getAsset("cardset/img/card_bg.png");
			this.addNode(bg);
			this.spaceWidth = bg.width;
			this.spaceHeight = bg.height;
			
			var logo:BitmapLoaderUU = new BitmapLoaderUU;
			logo.source = GameUtil.getCardSmallHead(cardUnit.cardId);
			this.addNode(logo);
			logo.locatingTypeForHoriz = LocatingType.F_A____F;
			logo.locatingTypeForVerti = LocatingType.F_A____F;
			logo.locatingOffsetX = 10;
			logo.locatingOffsetY = 5;
			
			
			
			var magicBg:ImageLoaderUU = new ImageLoaderUU;
			magicBg.source = TResourceManager.getAsset("cardset/btn/blue_btn_press.png");
			this.addNode(magicBg);
			magicBg.locatingTypeForHoriz = LocatingType.F_A____F;
			magicBg.locatingTypeForVerti = LocatingType.F___A___F;
			magicBg.locatingOffsetX = 55;
			
			var magicLabel:LabelUU;
			magicLabel = TextUtil.createLabel6("", 20, ColorUtil.WHITE);
			this.addNode(magicLabel);
			magicLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			magicLabel.locatingTypeForVerti = LocatingType.L___A___L;
			magicLabel.text = CardConfigurator.getCardById(cardUnit.cardId).mana.toString();
			
			
			var nameLabel:LabelUU;
			nameLabel = TextUtil.createLabel6("", 20, 0xa57b55, false, 0x1d170f);
			this.addNode(nameLabel);
			nameLabel.locatingTypeForHoriz = LocatingType.L____L_A;
			nameLabel.locatingTypeForVerti = LocatingType.L___A___L;
			nameLabel.locatingOffsetX = 5;
			nameLabel.width = 80;
			nameLabel.text = CardConfigurator.getCardById(cardUnit.cardId).name;
			
			
			var lock:ImageLoaderUU = new ImageLoaderUU;
			lock.source = TResourceManager.getAsset("cardset/img/lock.png");
			this.addNode(lock);
			lock.locatingTypeForHoriz = LocatingType.F____A_F;
			lock.locatingTypeForVerti = LocatingType.F___A___F;
			lock.locatingOffsetX = -10;
			lock.visible = GameUtil.isKing(cardUnit.cardId);
			
			var num:ImageLoaderUU = new ImageLoaderUU;
			num.source = TResourceManager.getAsset("cardset/img/card_num.png");
			this.addNode(num);
			num.visible = cardUnit.cardNum >= 2 ? true : false;
		}
		
		public function showAnimator():void {
			if (!_animator) {
				_animator = new AnimatorUU;
				_animator.play("common.eight", animatorSource, 1, function():void {
					if (_animator) {
						_animator.kill();
						_animator = null;
					}	
				});
				_animator.locatingTypeForHoriz = LocatingType.F_A____F;
				_animator.locatingTypeForVerti = LocatingType.F_A____F;
				_animator.locatingOffsetX = -20;
				_animator.locatingOffsetY = -100;
				this.addNode(_animator);
			}
		}
		
		
		public function setData(_cardUnit:CardHoldUnit):void {
			cardUnit = _cardUnit;
			init();
		}
		
	}

}