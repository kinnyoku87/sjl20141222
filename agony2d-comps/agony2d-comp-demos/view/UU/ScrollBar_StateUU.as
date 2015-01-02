package view.UU 
{
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.RawSpriteUU;
	import org.agony2d.flashApi.SliderUU;
	import org.agony2d.flashApi.StateFusionUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.ViewportFusion;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.keyboard.TKeyboardManager;
	import view.UU.Animator_StateUU;
	
	public class ScrollBar_StateUU extends StateUU
	{
		
		public function ScrollBar_StateUU() 
		{
			
		}
		
		
		private var _cw:Number = 550;
		private var _ch:Number = 550;
		
		override public function onEnter() : void {
			var img_A:ImageLoaderUU;
			var btn:ButtonUU;
			
			//img_A = new ImageLoaderUU;
			//img_A.source = "assets/battle/img/select_yellow.png";
			//this.fusion.addNode(img_A);
			//img_A.addEventListener(ATouchEvent.PRESS, function(e:ATouchEvent):void {
				//trace("press");
			//});
			//
			//btn = new ButtonUU;
			//btn.skinName = "slider_A_thumb";
			//this.fusion.addNode(btn);
			//btn.x = 260;
			//btn.y = 30;
			//
			//btn = new ButtonUU;
			//btn.skinName = "slider_B_thumb";
			//this.fusion.addNode(btn);
			//btn.x = 320;
			//btn.y = 30;
			
			this.doTest_V_Slider();
			this.doTest_H_Slider();
			this.doTestViewport();
			
		}
		
		override public function onExit() : void {
			TKeyboardManager.getInstance().getState().straight.removeEventAllListeners("A");
			TKeyboardManager.getInstance().getState().straight.removeEventAllListeners("D");
			TKeyboardManager.getInstance().getState().straight.removeEventAllListeners("W");
			TKeyboardManager.getInstance().getState().straight.removeEventAllListeners("S");
		}
		
		private function doTest_V_Slider():void {
			var slider_A:SliderUU;
			var btn:ButtonUU;
			
			slider_A = new SliderUU(false);
			this.fusion.addNode(slider_A);
			slider_A.x = 500;
			slider_A.y = 100;
			
			btn = new ButtonUU;
			btn.skinName = "scrollbar_A";
			slider_A.getThumb().addNode(btn);
			slider_A.dragOffsetValue = 300 - btn.height;
			slider_A.model.addEventListener("change", function(e:AEvent):void {
				viewportFusion.vertiRatio = slider_A.model.ratio;
			});
			
			TKeyboardManager.getInstance().getState().straight.addEventListener("W", function(e:AEvent):void { slider_A.model.value -= 3; trace(slider_A.model.ratio)} );
			TKeyboardManager.getInstance().getState().straight.addEventListener("S", function(e:AEvent):void { slider_A.model.value += 3; trace(slider_A.model.ratio)} );
		}
		
		private function doTest_H_Slider():void {
			var slider_A:SliderUU;
			var btn:ButtonUU;
			
			btn = new ButtonUU;
			btn.skinName = "scrollbar_A";
			btn.rotation = 90;
			
			slider_A = new SliderUU(true);
			this.fusion.addNode(slider_A);
			slider_A.x = 200 + btn.width;
			slider_A.y = 400;
			
			slider_A.getThumb().addNode(btn);
			slider_A.dragOffsetValue = 300 - btn.width;
			slider_A.model.addEventListener("change", function(e:AEvent):void {
				viewportFusion.horizRatio = slider_A.model.ratio;
			});
			
			TKeyboardManager.getInstance().getState().straight.addEventListener("A", function(e:AEvent):void { slider_A.model.value -= 3; trace(slider_A.model.ratio)} );
			TKeyboardManager.getInstance().getState().straight.addEventListener("D", function(e:AEvent):void { slider_A.model.value += 3; trace(slider_A.model.ratio)} );
		}
		
		private var viewportFusion:ViewportFusion;
		private function doTestViewport():void {
			viewportFusion = new ViewportFusion(300, 300);
			this.fusion.addNode(viewportFusion);
			viewportFusion.x = 200;
			viewportFusion.y = 100;
			viewportFusion.contentWidth = _cw;
			viewportFusion.contentHeight = _ch;
			
			var rawSprite:RawSpriteUU;
			var stateFusion:StateFusionUU;
			
			rawSprite = new RawSpriteUU;
			rawSprite.graphics.beginFill(0x0, 1.0);
			rawSprite.graphics.drawRect(0, 0, _cw, _ch);
			viewportFusion.content.addNode(rawSprite);
			
			stateFusion = new StateFusionUU;
			viewportFusion.content.addNode(stateFusion);
			stateFusion.setState(Animator_StateUU, [80]);
			
			
			//TKeyboardManager.getInstance().getState().straight.addEventListener("A", function(e:AEvent):void { viewportFusion.viewportX -= 3; trace(viewportFusion)} );
			//TKeyboardManager.getInstance().getState().straight.addEventListener("D", function(e:AEvent):void { viewportFusion.viewportX += 3; trace(viewportFusion)} );
			//TKeyboardManager.getInstance().getState().straight.addEventListener("W", function(e:AEvent):void { viewportFusion.viewportY -= 3; trace(viewportFusion)} );
			//TKeyboardManager.getInstance().getState().straight.addEventListener("S", function(e:AEvent):void { viewportFusion.viewportY += 3; trace(viewportFusion)} );
		}
		
	}

}