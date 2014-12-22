package views.UU.login
{
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.resources.TResourceManager;
	
	public class Login_Bg_StateUU extends StateUU
	{
		override public function onEnter() : void {
			
			
			
			// 大背景.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("temp/bg/bg.png");
			this.fusion.addNode(img);
			
			
			
			this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
			onResize(null);
		}
		
		
		private var img:BitmapLoaderUU;
		
		
		override public function onExit():void{
			this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
		}
		
		private function onResize(e:NodeEvent):void {
			//img.width = this.fusion.root.spaceWidth;
			//img.height = this.fusion.root.spaceHeight;
			
			this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;	
			this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		}
	}
	
	
	
}