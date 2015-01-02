package view.AA {
	import org.agony2d.display.filters.FilterAA;
	
	import flash.display.Bitmap;
	
	import assets.publicAA.PublicAA_Assets;
	
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.display.AAFacade;
	import org.agony2d.display.ImageAA;
	import org.agony2d.display.StateAA;
	import org.agony2d.display.ImageLoaderAA;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.loading.ALoader;
	import org.agony2d.loading.LoadManager;
    
public class ImageLoader_StateAA extends StateAA {
    
    override public function onEnter() : void {
		var img:ImageAA;
		var imgLoader:ImageLoaderAA;
		var l:int;

		{
			imgLoader = new ImageLoaderAA
			imgLoader.load("assets/snake.jpg", null, false)
			this.fusion.addNode(imgLoader)
		}
		
		{
			l = 8;
			while (--l > -1) {
				imgLoader = new ImageLoaderAA
				imgLoader.x = l * 100;
				imgLoader.load("assets/role.png", "A_64", true);
				this.fusion.addNode(imgLoader);
			}
		}
		
		{
			l = 8;
			while (--l > -1) {
				imgLoader = new ImageLoaderAA
				imgLoader.x = l * 100;
				imgLoader.y = 220;
				imgLoader.embed(PublicAA_Assets.img_flash_icon_64, true);
				this.fusion.addNode(imgLoader);
			}
		}
		
		{
			l = 7;
			while (--l > -1) {
				imgLoader = new ImageLoaderAA
				imgLoader.x = l * 100;
				imgLoader.y = 100;
				imgLoader.load("assets/role.png", "A_64", true);
				this.fusion.addNode(imgLoader);
			}
		}
		
		//{
			//l = 7;
			//while (--l > -1) {
				//imgLoader = new ImageLoaderAA
				//imgLoader.x = l * 100;
				//imgLoader.y = 260;
				//imgLoader.load("assets/role.png", "A_64", true);
				//this.fusion.addNode(imgLoader);
			//}
		//}
		
		//{
			//l = 7;
			//while (--l > -1) {
				//imgLoader = new ImageLoaderAA
				//imgLoader.x = l * 100;
				//imgLoader.y = 420;
				//imgLoader.load("assets/role.png", "A_64", true);
				//this.fusion.addNode(imgLoader);
			//}
		//}
		
		//{
			//l = 10;
			//while (--l > -1) {
				//imgLoader = new ImageLoaderAA
				//imgLoader.x = Math.random() * 800;
				//imgLoader.y = Math.random() * 500;
				//imgLoader.color = 0xFFFFFF * Math.random();
				//imgLoader.alpha = Math.random() * 0.5 
				//imgLoader.load("assets/role.png", "A_64", true);
				//this.fusion.addNode(imgLoader);
			//}
			//
		//}
		
		//{
			//imgLoader = new ImageLoaderAA
			//imgLoader.x = 100;
			//imgLoader.y = 300;
			//imgLoader.alpha = 0.5
			//this.fusion.addNode(imgLoader);
			//imgLoader.filters = [new FilterAA]
			//var loader:ILoader = LoadManager.getInstance().getLoader("assets/GoP_1.png")
			//loader.addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				//imgLoader.setBitmapData((loader.data as Bitmap).bitmapData);
			//})
		//}
		
		TouchManager.addEventListener(ATouchEvent.PRESS, onReset, 44444)
    }
	
	public var m_urlList:Array = ["48.png", "49.png", "50.png", "51.png", "52.png", "53.png", "54.png"];
    
	override public function onExit():void {
//		TweenMax.killAll();
		//TouchManager.removeEventListener(ATouchEvent.PRESS, onReset)
	}
	
	
	private function onReset(e:ATouchEvent):void {
		//e.breakExecution();
		//AAFacade.getModule("ImageLoader_StateAA").init()
	}
}
}