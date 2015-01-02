package view.UU{
	//import com.sociodox.theminer.TheMiner;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.agony2d.Agony;
	import org.agony2d.base.Adapter;
	import org.agony2d.base.DebugLogger;
	import org.agony2d.events.AEvent;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.utils.Stats;
	import org.agony2d.utils.gc;
	
	[SWF(width = "960", height = "600", backgroundColor = "0xFFFFFF")]
//	[SWF(width = "1280" ,height = "800", backgroundColor = "0xFFFFFF", frameRate = "30")]
	
	//[SWF(width = "800", height = "480", backgroundColor = "0xFFFFFF", frameRate = "60")]
public class MobileUUCases extends Sprite {
	
	public function MobileUUCases() {
		//stage.addChild(new TheMiner);
		
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
	}
	
	private function onAddedToStage(e:Event) : void {
		
		
		//Agony.startup(this.stage, null, new Adapter(960, 600, false), onInit);
		Agony.startup(this.stage, new DebugLogger, new Adapter(960, 600, false), onInit);
		//Agony.startup(this.stage, new DebugLogger(), null, onInit);
		
		
	}
	
	private function onInit() : void {
		Agony.getLog().message(this, "UUUUUUUUU");
		
		TouchManager.registerListenTarget();
		
		UU_Initializer.getInstance().startup();
		
		
		//AA_Initializer.getInstance().startup();
		
		stage.addChild(new Stats(10, 120));
		
		// [G] gc.
		KeyboardManager.getInstance().getState().release.addEventListener("G", function(e:AEvent):void {
			gc()
		})
	}
}
}