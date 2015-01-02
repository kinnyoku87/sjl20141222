package view.UU {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import assets.publicUU.PublicUU_Assets;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.DragFusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.inputs.events.ATouchEvent;
    
public class Drag_StateUU extends StateUU {
    
    override public function onEnter() : void {
        var dragFusion:DragFusionUU;
		var bmp:ImageLoaderUU;
		var drag_A:DragFusionUU
		
		dragFusion = new DragFusionUU();
		this.fusion.addNode(dragFusion);
		bmp = new ImageLoaderUU
		bmp.source = PublicUU_Assets.IMG_gesture
		dragFusion.addNode(bmp)
		dragFusion.x = dragFusion.y = 50
		//dragFusion.rotation = 20
		
			
		dragFusion.addEventListener(ATouchEvent.PRESS, function(e:ATouchEvent):void {
			
			drag_A = new DragFusionUU();
			drag_A.alpha = 0.4
			fusion.addNode(drag_A);
			e.touch.userData = "Drag !!";
			//drag_A.rotation = 20;
			drag_A.x = drag_A.y = 50
			
			drag_A.addEventListener(ATouchEvent.START_DRAG, onTouch)
			drag_A.addEventListener(ATouchEvent.DRAGGING, onTouch)
			drag_A.addEventListener(ATouchEvent.STOP_DRAG, onTouch)
			
			bmp = new ImageLoaderUU
			bmp.source = PublicUU_Assets.IMG_gesture
			
			//bmp.graphics.beginFill(0x0, 0.5)
			//bmp.graphics.drawRect(0, 0, bmp.spaceWidth / 2 - 5, bmp.spaceHeight / 2 - 5);
			
			//bmp.graphics.beginFill(0x0, 0.5)
			//bmp.graphics.drawRect(bmp.spaceWidth / 2 + 5, 0, bmp.spaceWidth / 2 - 5, bmp.spaceHeight / 2 - 5);
			
			//bmp.graphics.beginFill(0x0, 0.5)
			//bmp.graphics.drawRect(0, bmp.spaceHeight / 2 + 5, bmp.spaceWidth / 2 - 5, bmp.spaceHeight / 2 - 5);
			
			//bmp.graphics.beginFill(0x0, 0.5)
			//bmp.graphics.drawRect(bmp.spaceWidth / 2 + 5, bmp.spaceHeight / 2 + 5, bmp.spaceWidth / 2 - 5, bmp.spaceHeight / 2 - 5);
			
			drag_A.addNode(bmp)
			
			drag_A.startDrag(e.touch, new Rectangle(10, 10, 200, 200), 0, 0);
			
			var point:Point = drag_A.globalToLocal(e.touch.rootX, e.touch.rootY)
			trace("[local]"+point)
			point = drag_A.localToGlobal(point.x, point.y)
			trace("[global]"+point)
			
			drag_A.addEventListener(ATouchEvent.STOP_DRAG, function(e:ATouchEvent):void {
				drag_A.kill();
				drag_A = null;
			}, -100)
		})
		
		KeyboardManager.getInstance().getState().press.addEventListener("S", function(e:AEvent):void {
			if (drag_A) {
				drag_A.stopDrag(true);
			}
		})
    }
	
	override public function onExit():void {
		KeyboardManager.getInstance().getState().press.removeAllListeners();
	}
	
	private function onTouch(e:ATouchEvent):void {
		trace(e.type);
	}
    
}
}