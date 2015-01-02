package view.UU {
	import org.agony2d.flashApi.McProgressBarUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.events.AEvent;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.inputs.events.ATouchEvent;
    
public class ProgressBar_StateUU extends StateUU{
    
    override public function onEnter() :void{
        var pb:McProgressBarUU
		
		pb = new McProgressBarUU("Range_A");
		this.fusion.addNode(pb);
		pb.x = 600 
		pb.y = 50
		KeyboardManager.getInstance().getState().straight.addEventListener("LEFT", function(e:AEvent):void {
			pb.model.ratio-=0.01
		})
		KeyboardManager.getInstance().getState().straight.addEventListener("RIGHT", function(e:AEvent):void {
			pb.model.ratio+=0.01
		})
		
		pb.model.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace(pb.model.value)
		})
		
		pb.addEventListener(ATouchEvent.PRESS, onTouch)
		pb.addEventListener(ATouchEvent.MOVE, onTouch)
		pb.addEventListener(ATouchEvent.RELEASE, onTouch)
		pb.addEventListener(ATouchEvent.CLICK, onTouch)
		
		//trace("hitTest: ", this.fusion.hitTestPoint(650, 60));
		//trace("hitTest: ", this.fusion.hitTestPoint(590, 60));
    }
	
	override public function onExit():void {
		KeyboardManager.getInstance().getState().straight.removeEventAllListeners("LEFT");
		KeyboardManager.getInstance().getState().straight.removeEventAllListeners("RIGHT");
	}
   	
	private function onTouch(e:ATouchEvent):void {
		trace("[ProgressBar] : " + e.type)
	}
     
}
}