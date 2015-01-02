package view
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.agony2d.Agony;
	import org.agony2d.base.DebugLogger;
	import org.agony2d.base.FrameManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.ScrollProgressBarUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.resources.TAssetBundle;
	import org.agony2d.resources.TAssetData;
	import org.agony2d.resources.TResourceManager;

	[SWF(width="1100", height="800")]
	public class Scale9ProgressBar_Example_01 extends Sprite
	{
		
		public function Scale9ProgressBar_Example_01() 
		{
			Agony.startup(stage, new DebugLogger, null, onInit);
		}
		
		
		//[Embed(source = "../assets/progressBar.zip", mimeType = "application/octet-stream")]
		//public var assetsRef:Class
		
		private function onInit() : void {
			stage.frameRate = 60;
			TouchManager.registerListenTarget();
			
			TResourceManager.initialize();
			//TResourceManager.embedAssets(new assetsRef).addEventListener(AEvent.COMPLETE, onLoaded)
			TResourceManager.loadAssets2("temp/loading/01.png", "temp/loading/02.png","temp/loading/03.png").addEventListener(AEvent.COMPLETE, onLoaded)
		}
		
		private function onLoaded(e:AEvent):void {
			var bundle:TAssetBundle;
			var list:Vector.<TAssetData>;
			
			bundle = e.target as TAssetBundle;
			list = bundle.assetList;
			
			UUFacade.registerRoot();
			
			var scale9:Scale9BitmapUU
			var scale9_A:Scale9BitmapUU
			var scale9_B:Scale9BitmapUU
			var scale9Multi:Scale9MultiBitmapsUU
			
			UUFacade.registerSkin("scale9_A", Scale9MultiBitmapsSkinUU, list[0].data);
			
			scale9Multi = new Scale9MultiBitmapsUU;
			scale9Multi.skinName = "scale9_A";
			scale9Multi.x = 100;
			scale9Multi.y = 400;
			scale9Multi.width = 600;
			UUFacade.getRoot().addNode(scale9Multi);
			
			
			var fusion:FusionUU;
			
			fusion = new FusionUU;
			UUFacade.getRoot().addNode(fusion);
			fusion.x = 100;
			fusion.y = 200;
			
			scale9 = new Scale9BitmapUU;
			scale9.source = list[0];
			scale9.width = 600;
			fusion.addNode(scale9);
			//scale9.alpha = 0.3
			
			scale9_B = new Scale9BitmapUU;
			scale9_B.source = list[1];
			scale9_B.width = 600;
			fusion.addNode(scale9_B);
			//scale9_B.displayObject.scrollRect = new Rectangle(50, 0, 600 - 100, 800);
			
			
			//AdvanceManager.addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				//AdvanceManager.removeEventListener(AEvent.COMPLETE, arguments.callee);
				//mask.graphics.beginFill(0x0, 1);
				//mask.graphics.drawRect(30, 0, scale9_B.bitmapData.width - 60, scale9_B.bitmapData.height);
				//
				//scale9_B.displayObject.mask = mask.displayObject;
			//})
			
			
			
			scale9 = new Scale9BitmapUU;
			scale9.source = list[2];
			scale9.width = 600;
			fusion.addNode(scale9);
			
			
			var scrollProgressBar:ScrollProgressBarUU;
			
			var mask:RawSpriteUU;
			mask = new RawSpriteUU;
			UUFacade.getRoot().addNode(mask);
			
			ScrollProgressBarUU.addScrollProgressBarSkin("A", 1, list);
			scrollProgressBar = new ScrollProgressBarUU;
			scrollProgressBar.skinId = "A";
			scrollProgressBar.setBarStartOffset( -510, 0);
			scrollProgressBar.model.ratio = 0;
			UUFacade.getRoot().addNode(scrollProgressBar);
			scrollProgressBar.x = 300;
			scrollProgressBar.y = 300;
			scrollProgressBar.width = 600;
			
			mask.x = 300;
			mask.y = 300;
			
			Agony.getFrame().addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				Agony.getFrame().removeEventListener(AEvent.COMPLETE, arguments.callee);
				mask.graphics.beginFill(0x0, 1);
				mask.graphics.drawRect(30, 0, scrollProgressBar.barScale9Img.bitmapData.width - 60, scrollProgressBar.barScale9Img.bitmapData.height);
				scrollProgressBar.setMask(mask);
				
			})
			
			
			
			
			//KeyboardManager.getInstance().getState().straight.addEventListener("A", function(e:AEvent):void{scale9_B.x-=3})
			//KeyboardManager.getInstance().getState().straight.addEventListener("D", function(e:AEvent):void { scale9_B.x += 3 } )
			
			KeyboardManager.getInstance().getState().straight.addEventListener("A", function(e:AEvent):void{scrollProgressBar.model.ratio-=0.01})
			KeyboardManager.getInstance().getState().straight.addEventListener("D", function(e:AEvent):void{scrollProgressBar.model.ratio+=0.01})
		}
		
	}

}