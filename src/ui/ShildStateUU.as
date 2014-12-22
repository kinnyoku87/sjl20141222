package ui 
{
	import configs.skinname.SkinNameConfig;
	import org.agony2d.Agony;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import utils.TextUtil;
	/**
	 * ... 具有屏蔽下层操作的容器
	 * @author ... dcl
	 */
	public class ShildStateUU extends StateUU
	{
		private var shildSprite:RawSpriteUU; 
		private var _notDefaultClose:Boolean = false;
		private var _isShild:Boolean = true;
		private var _bgAlpha:Number = 0;
		protected static var NAME:String = "";
		protected var title:LabelUU;
		protected var closeBtn:ButtonUU;
		public function ShildStateUU() 
		{
			
		}
		
		override public function onEnter () : void 
		{
			if (_isShild) {
				shildSprite = new RawSpriteUU();
				this.fusion.addNode(shildSprite);
				shildSprite.graphics.beginFill(0x000000,bgAlpha); 
				shildSprite.graphics.lineStyle(0, 0x000000, bgAlpha);
				//shildSprite.graphics.drawRect(0 - Agony.getAdapter().rootWidth / 2,0 - Agony.getAdapter().rootHeight / 2, Agony.getAdapter().rootWidth, Agony.getAdapter().rootHeight);
				shildSprite.graphics.drawRect(-2500,-1000, 5000,2000);
				shildSprite.graphics.endFill();
				shildSprite.touchable = true;
			}
			
			
			title = TextUtil.createLabel6(NAME, 24, 0xfea768, true, 0x320702);

			title.locatingTypeForHoriz = LocatingType.F___A___F;
			title.locatingTypeForVerti = LocatingType.F_A____F;
			title.locatingOffsetY = 8;
			if (!_notDefaultClose) {
				closeBtn = new ButtonUU(SkinNameConfig.common_close_B);
				closeBtn.locatingTypeForHoriz = LocatingType.F____A_F;
				closeBtn.locatingTypeForVerti = LocatingType.F_A____F;
				closeBtn.locatingOffsetX = -5;
				closeBtn.locatingOffsetY = 5;
				closeBtn.addEventListener(ATouchEvent.CLICK, closeClick);
			}
			
		}
		
		protected function closeClick(evt:ATouchEvent):void {
			
		}
		
		protected function addRootEvent():void {
			this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
			onResize(null);
		}
		
		protected function onResize(evt:NodeEvent):void {
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		}
		

		override public function onExit () : void 
		{
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		}
		
		public function set bgAlpha(value:Number):void 
		{
			_bgAlpha = value;
		}
		
		public function get bgAlpha():Number 
		{
			return _bgAlpha;
		}
		
		public function set notDefaultClose(value:Boolean):void 
		{
			_notDefaultClose = value;
		}
		
		public function set isShild(value:Boolean):void 
		{
			_isShild = value;
		}
		
	}

}