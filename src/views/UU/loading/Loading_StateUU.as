package views.UU.loading
{
	import com.greensock.TweenLite;
	import configs.ConfigRes;
	import models.GameModel;
	import org.agony2d.Agony;
	import org.agony2d.base.events.TickEvent;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.ScrollProgressBarUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.resources.TResourceManager;

	public class Loading_StateUU extends StateUU 
	{
		
		
		override public function onEnter():void{
			var img:BitmapLoaderUU;
			var isAssetsLoaded:Boolean;
			
			isAssetsLoaded = this.stateArgs[0]
			_callback = this.stateArgs[1];
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("temp/bg/bg.png");
			this.fusion.addNode(img);
			
			this.fusion.spaceWidth = img.width;
			this.fusion.spaceHeight  = img.height;
				
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("temp/logo/logo2.png");
			this.fusion.addNode(img);
			
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.y = 60
			
			
			// 進度條.
			
			
			var mask:RawSpriteUU;
			mask = new RawSpriteUU;
			this.fusion.addNode(mask);
			
			scrollProgressBar = new ScrollProgressBarUU;
			scrollProgressBar.skinId = "scrollProgressBar_A";
			scrollProgressBar.setBarStartOffset(-1010, 0);
			//scrollProgressBar.model.ratio = 0.5;
			this.fusion.addNode(scrollProgressBar);
			scrollProgressBar.x = 225;
			scrollProgressBar.y = 710;
			scrollProgressBar.width = 1100;
			
			mask.x = 225;
			mask.y = 710;
			
			Agony.getFrame().addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				Agony.getFrame().removeEventListener(AEvent.COMPLETE, arguments.callee);
				mask.graphics.beginFill(0x0, 1);
				mask.graphics.drawRect(30, 0, scrollProgressBar.barScale9Img.width - 60, scrollProgressBar.barScale9Img.height);
				scrollProgressBar.setMask(mask);
				
			})
			
			//scrollProgressBar.model.maximum =  TResourceManager.totalValue;
			//trace(".................", TResourceManager.totalValue);
			//_startValue = TResourceManager.totalValue;
			
			// 加載.
			if (!isAssetsLoaded) {
				Agony.getFrame().addEventListener(TickEvent.TICK, ____onTick);
			}
			// 模擬加載.
			else {
				TweenLite.to(scrollProgressBar.model, 0.4, { ratio:1, onComplete:function():void {
					// 停頓一會.
					GameModel.getDelay().delayedCall(ConfigRes.WAITING_TIME_FOR_LOADING, function():void{
						_callback();
					})
				}});
			}
			
			//Agony.getLog().simplify("加載進度條視圖狀態: [ {0} ].", this.stateArgs[0] ? "Loaded": "Loading");
			
			//TResourceManager.addEventListener(AEvent.CHANGE, onChanged);
			this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
			onResize(null);
			
		}
		
		override public function onExit():void {
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
			
			if (!this.stateArgs[0]) {
				Agony.getFrame().removeEventListener(TickEvent.TICK, ____onTick);
			}
			
			//TResourceManager.removeEventListener(AEvent.CHANGE, onChanged);
		}
		
		private function onResize(e:NodeEvent):void {
			//img.width = this.fusion.root.spaceWidth;
			//img.height = this.fusion.root.spaceHeight;
			
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;	
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		}
		
		private var scrollProgressBar:ScrollProgressBarUU;
		private var _startValue:Number;
		private var _initValue:Number;
		private var _inited:Boolean;
		private var _callback:Function;
		
		
		
		private function ____onTick(e:TickEvent):void {
			
			//trace("=====================", TResourceManager.totalValue);
			if (!_inited) {
				_startValue = TResourceManager.totalValue;
				_inited = true;
			}
			//else {
			scrollProgressBar.model.ratio = 1 - TResourceManager.totalValue / _startValue;
				
			//Agony.getLog().message(this, "加載進度: [ {0} ].", scrollProgressBar.model.ratio);
			
			
				//TweenLite.to(scrollProgressBar.model,0.3, {ratio:1 - TResourceManager.totalValue / _startValue});
			//}
			//TweenLite.to(scrollProgressBar.model, 1, {ratio:1 - TResourceManager.totalValue / _startValue});
			//scrollProgressBar.model.ratio = 1 - TResourceManager.totalValue / _startValue;
		}
		
		//private function onChanged(e:AEvent):void {
			//scrollProgressBar.model.ratio = 1 - TResourceManager.totalValue / _startValue;
		//}
		
	}
}