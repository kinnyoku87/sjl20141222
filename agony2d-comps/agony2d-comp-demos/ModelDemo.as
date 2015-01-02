package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import org.agony2d.Agony;
	import org.agony2d.utils.map.ViewportData;
	import org.agony2d.models.*;
	import org.agony2d.events.AEvent;
	import org.agony2d.keyboard.KeyboardManager;
	import com.greensock.plugins.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	
public class ModelDemo extends Sprite {
	
	public function ModelDemo() {
		Agony.startup(stage)
		
		// bool
		var B:ABool = new ABool()
		B.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace(B, B.value)
		})
		KeyboardManager.getInstance().getState().press.addEventListener('B', function():void { B.value = !B.value } )
		
		// int
		var I:AInt = new AInt
		//I.value = 1.8;
		I.minimum = -3
		I.maximum = 3;
		I.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace(I, I.value)
		})
		KeyboardManager.getInstance().getState().press.addEventListener('I', function():void {
			if (KeyboardManager.getInstance().isKeyPressed("SHIFT")) {
				I.value--
			}
			else {
				I.value++
			}
		})
		
		// loop
		var loop:ALoopInt = new ALoopInt
		loop.minimum = -3
		loop.maximum = 3
		loop.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace(loop, loop.value)
		})
		KeyboardManager.getInstance().getState().press.addEventListener('L', function():void {
			if (KeyboardManager.getInstance().isKeyPressed("SHIFT")) {
				loop.value--
			}
			else {
				loop.value++
			}
		})
		
		// number
		var N:ANumber = new ANumber;
		N.value = 0;
		N.minimum = -5;
		N.maximum = 5;
		N.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace(N, N.value)
		})
		KeyboardManager.getInstance().getState().press.addEventListener('N', function():void { 
			if (KeyboardManager.getInstance().isKeyPressed("SHIFT")) {
				N.value--
			}
			else {
				N.value++
			}
		})
		
		// range
		var R:ARange = new ARange
		R.value = 47.4444
		R.minimum = -50
		R.maximum = 50
		R.snapInterval = 3;
		R.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace(R, R.value, R.minimum, R.maximum, R.ratio)
		})
		KeyboardManager.getInstance().getState().press.addEventListener('LEFT', function():void { R.value -= 1 } )
		KeyboardManager.getInstance().getState().press.addEventListener('RIGHT', function():void { R.value += 1 } )
		
		
		// string
		txtA = new TextField()
		addChild(txtA)
		txtA.x = 750
		txtA.y = 400;
		txtA.width = 300
		//txtA.text = S.value

		
		var S:AString = new AString
		S.value = ('string p')
		S.addEventListener(AEvent.CHANGE, function(e:AEvent):void
		{
			txtA.text = S.value
		})
		
		txtB = new TextField()
		addChild(txtB)
		txtB.x = 600
		txtB.y = 400;
		txtB.type = TextFieldType.INPUT
		txtB.background = true
		txtB.backgroundColor = 0xdddd33
		
		// input change !!
		
		KeyboardManager.getInstance().getState().press.addEventListener('ENTER', function():void{S.value = txtB.text})
		
		
		
		/////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////
		
		// Viewport
		var shell:Sprite
		var mask:Shape
		
		shell = new Sprite
		shell.x = 200
		shell.y = 200
		//shell.graphics.beginFill(0, 0)
		//shell.graphics.drawRect(0, 0, 100, 100)
		addChild(shell)
		
		//mask = new Shape
		//mask.graphics.beginFill(0, 0)
		//mask.graphics.drawRect(0, 0, 100, 100)
		//addChild(mask)
		//mask.x = 200
		//mask.y = 200
		//shell.mask = mask
		
		var contentWidth:Number = 200
		var contentHeight:Number = 200
		BG = new Sprite
		BG.graphics.beginFill(0x0, 80)
		BG.graphics.drawRect(0,0,contentWidth,contentHeight)
		shell.addChild(BG)
		
		BP = new Bitmap(new BitmapData(100, 100, true, 0x44FF0000))
		shell.addChild(BP)
		
		var targetX:Number = 105
		var targetY:Number = 120
		target.graphics.beginFill(0x0000dd)
		target.graphics.drawCircle(0, 0, 5)
		target.x = targetX
		target.y = targetY
		BG.addChild(target)
		
		VP = new ViewportData(BP.width, BP.height, contentWidth, contentHeight)
		this.updateViewport()
		BG.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void
		{
			//trace('click')
			movePlayerTo(BG.mouseX,BG.mouseY)
		})
		
		KeyboardManager.getInstance().getState().straight.addEventListener('A', function():void { movePlayer( -25, 0);} )
		KeyboardManager.getInstance().getState().straight.addEventListener('D', function():void { movePlayer(25, 0);} )
		KeyboardManager.getInstance().getState().straight.addEventListener('W', function():void { movePlayer(0, -25);} )
		KeyboardManager.getInstance().getState().straight.addEventListener('S', function():void { movePlayer(0, 25)})
		
		KeyboardManager.getInstance().getState().press.addEventListener('Q', function():void { VP.motionTo(0, 0);updateViewport() } )
		KeyboardManager.getInstance().getState().press.addEventListener('E', function():void { VP.motionTo(VP.maxViewportX, 0);updateViewport() } )
		KeyboardManager.getInstance().getState().press.addEventListener('Z', function():void { VP.motionTo(0, VP.maxViewportY);updateViewport() } )
		KeyboardManager.getInstance().getState().press.addEventListener('C', function():void { VP.motionTo(VP.maxViewportX, VP.maxViewportY); updateViewport() } )
		TweenPlugin.activate([Physics2DPlugin])
		
		KeyboardManager.getInstance().getState().release.addEventListener('A', __onRelease )
		KeyboardManager.getInstance().getState().release.addEventListener('D', __onRelease )
		KeyboardManager.getInstance().getState().release.addEventListener('W', __onRelease )
		KeyboardManager.getInstance().getState().release.addEventListener('S', __onRelease )

	}
	
	private function __onRelease(e:AEvent):void
	{
		TweenLite.killTweensOf(target)
	}
	
	private var txtA:TextField, txtB:TextField
	private var BP:Bitmap, BG:Sprite
	private var target:Shape = new Shape
	private var VP:ViewportData

	private function movePlayer(tx:Number, ty:Number):void
	{
		
		TweenLite.to(target, 1, { x:tx + target.x, y:ty + target.y,
									ease:Sine.easeOut,
									onUpdate:function():void
		{
			if (VP.seek(target.x, target.y, 20, 20))
			{
				BG.x = VP.contentX
				BG.y = VP.contentY
			}
		}})
	}
	
	private function movePlayerTo(tx:Number, ty:Number):void
	{
		TweenLite.to(target, 2, { x:tx, y:ty,
									ease:Sine.easeOut, 
		onUpdate:function():void
		{
			if (VP.seek(target.x, target.y, 20, 20))
			{
				TweenLite.to(BG, 0.1, {x: VP.contentX, y: VP.contentY, ease:Linear.easeNone, overwrite:1})
			}
		}, 
		onComplete:function():void
		{		
			
		}})
	}
	
	private function updateViewport():void
	{
		if (VP.seek(target.x, target.y, 20, 20))
		{
			TweenLite.to(BG, 0.1, {x: VP.contentX, y: VP.contentY, ease:Linear.easeNone, overwrite:1})
		}
	}
}
}