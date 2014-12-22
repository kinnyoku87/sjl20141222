package views.UU.cardSet.items 
{
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	import configs.cardset.CardSetConfig;
	import flash.filters.GlowFilter;
	import models.cardSet.CardSetEvent;
	import models.cardSet.CardSetModule;
	import models.unlock.UnlockModule;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CardHoldUnit;
	import utils.GameUtil;
	import utils.TextUtil;
	import views.UU.comps.cardFustions.CharacterCard_UU;
	import views.UU.comps.cardStates.CharacterCard_StateUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CardSet_CharacterCard_UU extends FusionUU
	{
		private var cardUU:FusionUU;
		public var cardId:int;
		private var numLabel:LabelUU;
		private var _selected:Boolean;
		public var num:int;
		private var _animator:AnimatorUU;
		private var animatorSource:String = "atlas/cardset/effects1";
		private var _animator2:AnimatorUU;
		private var animatorSource2:String = "atlas/cardset/effects2";
		public function CardSet_CharacterCard_UU() 
		{
			
		}
		
		private function init():void {
			
			cardUU = GameUtil.getCardUU(cardId);
			this.addNode(cardUU);
			this.spaceWidth = CardSetConfig.Cardset_Card_Width;
			this.spaceHeight = CardSetConfig.Cardset_Card_Height;
			var tabBg:ImageLoaderUU = new ImageLoaderUU;
			tabBg.source = TResourceManager.getAsset("cardset/img/tab_bg.png");
			this.addNode(tabBg);
			tabBg.locatingTypeForHoriz = LocatingType.F___A___F;
			tabBg.locatingTypeForVerti = LocatingType.F____A_F;
			tabBg.locatingOffsetY = -12;
			numLabel = TextUtil.createLabel6("", 22, ColorUtil.COFFEE_A);
			numLabel.locatingTypeForHoriz = LocatingType.L___A___L;
			numLabel.locatingTypeForVerti = LocatingType.L___A___L;
			numLabel.locatingOffsetY = -5;
			this.addNode(numLabel);
			updateData("");
			
			cardUU.scaleX = Agony.getAdapter().pixelRatio;
			cardUU.scaleY = Agony.getAdapter().pixelRatio;
			CardSetModule.addEventListener(CardSetEvent.Set_Bag_Status, updateData);
			CardSetModule.addEventListener(CardSetEvent.Change_Card_Num, updateData);
			CardSetModule.addEventListener(CardSetEvent.Delete_Card_Num, updateData);
			CardSetModule.addEventListener(CardSetEvent.Add_Card_Num, updateData);
			this.addEventListener(ATouchEvent.HOVER,onHover);
			this.addEventListener(ATouchEvent.LEAVING, onOut);
			//_animator = new AnimatorUU;
		}
		
		private function updateData(evt:String,data:Object = null):void {
			var maxNum:int = UnlockModule.getUnlockCardNum(cardId);
			var haNum:int = CardSetModule.getBagCardNum(cardId);
			if (CardSetConfig.isSetCard) {
				num = maxNum - haNum;
			}else {
				num = maxNum;
			}
			numLabel.text = num.toString();
			numLabel.color = num == maxNum ? ColorUtil.COFFEE_A : ColorUtil.GREEN;
			numLabel.color = num == 0 ? ColorUtil.RED : numLabel.color;
		}
		
		public function setData(id:int):void {
			cardId = id;
			init();
		}
		
		private function onHover(evt:ATouchEvent):void {
			//this.filters = [new GlowFilter(0x44dddd, 0.8, 8, 8, 6, 3)];
			if (selected ) return;
			showAnimator1(true);
			
				
		}
		
		private function onOut(evt:ATouchEvent):void {
			if (selected) return;
			showAnimator1(false);
		}
		
		private function showAnimator1(isShow:Boolean):void {
			if (isShow) {
				if (!_animator) {
				_animator = new AnimatorUU;
				_animator.play("common.eight", animatorSource, 0);
				//_animator.scaleX = 1 / 0.7;
				//_animator.scaleY = 1 / 0.7;
				_animator.locatingTypeForHoriz = LocatingType.F_A____F;
				_animator.locatingTypeForVerti = LocatingType.F_A____F;
				_animator.scaleX = Agony.getAdapter().pixelRatio + 0.03;
				_animator.scaleY = Agony.getAdapter().pixelRatio + 0.03;
				_animator.locatingOffsetX = -7;
				_animator.locatingOffsetY = -8;
					
				this.addNodeAt(_animator,0);
				}
			}else {
				if (_animator) {
					_animator.kill();
					_animator = null;
				}
			}
		}
		
		public function showAnimator2():void {
			if (!_animator2) {
				_animator2 = new AnimatorUU;
				_animator2.play("common.eight", animatorSource2, 1, function():void {
					if (_animator2) {
						_animator2.kill();
						_animator2 = null;
					}	
				});

				_animator2.locatingTypeForHoriz = LocatingType.F_A____F;
				_animator2.locatingTypeForVerti = LocatingType.F_A____F;
				_animator2.scaleX = Agony.getAdapter().pixelRatio + 0.03;
				_animator2.scaleY = Agony.getAdapter().pixelRatio + 0.03;
				_animator2.locatingOffsetX = -7;
				_animator2.locatingOffsetY = -8;
				this.addNode(_animator2);
			}
		}
		
		
		
		public function get selected():Boolean 
		{
			return _selected;
			
		}
		
		public function set selected(value:Boolean):void 
		{
			_selected = value;
			showAnimator1(_selected);
		}
		
	}

}