package view.UU {
	import assets.publicUU.PublicUU_Assets;
	
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.GestureFusionUU;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.inputs.TouchType;
	import org.agony2d.inputs.TouchManager;
    
public class Gesture_StateUU extends StateUU {
    
    override public function onEnter() : void {
		var ges:GestureFusionUU;
		var bmp:BitmapLoaderUU;
		
		// 1
		ges = new GestureFusionUU();
		ges.gestureType = GestureFusionUU.MOVEMENT | GestureFusionUU.ROTATE | GestureFusionUU.SCALE;
		
		bmp = new BitmapLoaderUU
		
		bmp.cached = true;
		bmp.source = PublicUU_Assets.img_role_girl
		//bmp.width = 300
		bmp.height = 300
		ges.addNode(bmp);
		this.fusion.addNode(ges);
		ges.x = 200;
		ges.y = 200;
		
		ges.addEventListener(ATouchEvent.START_DRAG, onTouch)
		ges.addEventListener(ATouchEvent.DRAGGING, onTouch)
		ges.addEventListener(ATouchEvent.STOP_DRAG, onTouch)
		
		ges = new GestureFusionUU();
		ges.gestureType = GestureFusionUU.ROTATE | GestureFusionUU.SCALE | GestureFusionUU.MOVEMENT;
		
		// 2
		bmp = new BitmapLoaderUU
		bmp.source = PublicUU_Assets.IMG_gesture
		ges.addNode(bmp);
		
		this.fusion.addNode(ges);
		ges.x = 200;
		ges.y = 200;
		
		ges.addEventListener(ATouchEvent.START_DRAG, onTouch)
		ges.addEventListener(ATouchEvent.DRAGGING, onTouch)
		ges.addEventListener(ATouchEvent.STOP_DRAG, onTouch)
		
		//TouchManager.touchType = TouchType.MULTIPLE;
    }
	
	private function onTouch(e:ATouchEvent):void{
		trace(e.type)
		if (e.type == ATouchEvent.START_DRAG) {
			e.touch.userData = "Ges !!"
		}
	}
    
}
}