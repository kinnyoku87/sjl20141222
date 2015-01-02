package view.UU {
	import com.greensock.TweenLite;
	
	import flash.filters.GlowFilter;
	
	import org.agony2d.flashApi.ButtonOutInReaction;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.CheckBoxUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.PivotFusionUU;
	import org.agony2d.flashApi.RadioGroupUU;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.ToggleUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.events.AEvent;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.inputs.events.ATouchEvent;
    
public class Button_StateUU extends StateUU {
    
    override public function onEnter() : void {

		//TouchManager.lostBindingWhenLeave = true
		
		var btn:ButtonUU;
		var shell:PivotFusionUU;
		
		shell = new PivotFusionUU
		shell.pivotX = 100;
		shell.pivotY = 40;
		shell.x = 100;
		shell.y = 40;
		this.fusion.addNode(shell);
		
		btn = new ButtonUU//("scale9_button_A");
		btn.skinName = "scale9_button_A";
		btn.image.width = 220
		btn.image.height = 80
		shell.addNode(btn);
		
		//btn.x = 400
		//btn.y = 200
		//btn.getLabel().text = "ABCDEF";
		btn.getLabel().text = "開始遊戲";
		btn.getLabel().size = 22;
		//btn.scaleX = btn.scaleY = 2.0
		btn.onPress = function():void {
			TweenLite.to(shell, 0.1, {scaleX:0.95,scaleY:0.95})
		}
		btn.onOver = function():void {
			//TweenLite.to(shell, 0.3, {scaleX:1.1,scaleY:1.1})
			TweenLite.to(shell, 0.1, {scaleX:1.05,scaleY:1.05})
		}
		btn.onRelease = function():void {
			TweenLite.to(shell, 0.1, {scaleX:1,scaleY:1})//,ease:Back.easeOut})
		}
		
		btn = new ButtonUU//("scale9_button_A");
		btn.skinName = "scale9_button_B";
		btn.image.width = 220
		btn.image.height = 80
		btn.x = 240
		btn.y = 0
		this.fusion.addNode(btn);
		btn.getLabel().text = "退出遊戲";
		btn.getLabel().size = 22;
		
		UUFacade.defaultOutInReaction = ButtonOutInReaction.OUT_PRESS_IN_PRESS
		btn.outInReaction = ButtonOutInReaction.OUT_RELEASE_IN_PRESS
		
		btn.addEventListener(ATouchEvent.PRESS, onTouch)
		btn.addEventListener(ATouchEvent.RELEASE, onTouch)
		btn.addEventListener(ATouchEvent.HOVER, onTouch)
		btn.addEventListener(ATouchEvent.LEAVING, onTouch)
		btn.addEventListener(ATouchEvent.MOVE, onTouch)
		btn.addEventListener(ATouchEvent.CLICK, onTouch)
		
		var checkBox:ToggleUU;
		
		checkBox = new CheckBoxUU
		checkBox.skinName = "checkBox_A"
		//checkBox = new ToggleUU("scale9_button_A")
		this.fusion.addNode(checkBox);
		checkBox.locatingTypeForHoriz = LocatingType.F___A___F
		checkBox.locatingTypeForVerti = LocatingType.F___A___F
		checkBox.locatingOffsetX = 100
		//checkBox.x = 8
		//checkBox.y = 10
		//checkBox.scaleX = checkBox.scaleY = 3.0
		//checkBox.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void {
			//checkBox.selected = !checkBox.selected;
		//})
		
		checkBox.addEventListener(ATouchEvent.PRESS, onTouch)
		checkBox.addEventListener(ATouchEvent.RELEASE, onTouch)
		checkBox.addEventListener(ATouchEvent.HOVER, onTouch)
		checkBox.addEventListener(ATouchEvent.LEAVING, onTouch)
		checkBox.addEventListener(ATouchEvent.CLICK, onTouch)
		
		
		
		var l:int;
		var i:int;
		
		radioGroup_A = new RadioGroupUU;
		l = 8;
		while (i<l) {
			radio = new RadioUU
			radio.skinName = "radio_A";
			radio.group = radioGroup_A;
			this.fusion.addNode(radio);
			radio.x = i * 30 + 300;
			radio.y = 200;
			radio.userData = "radioGroup_A___" + i;
			radio.filters = [new GlowFilter(0x3333cc)]
			i++
			radio.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
				trace("[UserData]: " + (e.target as RadioUU).userData)
			})
		}
		radioGroup_A.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace("..." + radioGroup_A.selectedIndex)
		})
		
		
		radioGroup_B = new RadioGroupUU;
		i = 0
		l = 8;
		while (i<l) {
			radio = new RadioUU
			radio.skinName = "radio_A";
			radio.group = radioGroup_B;
			this.fusion.addNode(radio);
			radio.x = i * 30 + 300;
			radio.y = 300;
			radio.userData = "radioGroup_B___" + i;
			i++
			radio.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
				trace("[UserData]: " + (e.target as RadioUU).userData)
			})
		}
		radioGroup_B.addEventListener(AEvent.CHANGE, function(e:AEvent):void {
			trace("..." + radioGroup_B.selectedIndex)
		})
			
			
		this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
		this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		this.fusion.locatingOffsetX = 100
		this.fusion.locatingOffsetY =  100
		//checkBox.addNode(this.fusion)
		
		KeyboardManager.getInstance().getState().press.addEventListener("A", function(e:AEvent):void {
			radioGroup_A.selectedIndex--;
		})
		KeyboardManager.getInstance().getState().press.addEventListener("D", function(e:AEvent):void {
			radioGroup_A.selectedIndex++;
		})
		KeyboardManager.getInstance().getState().press.addEventListener("I", function(e:AEvent):void {
//			btn.interactive = !btn.interactive;
//			checkBox.interactive = !checkBox.interactive;
		})
		KeyboardManager.getInstance().getState().press.addEventListener("M", function(e:AEvent):void {
			radio.group = (radio.group == radioGroup_A) ? radioGroup_B : radioGroup_A;
			radio.filters = (radio.group == radioGroup_A) ? [new GlowFilter(0x3333cc)] : null;
		})
    }
	private var radioGroup_A:RadioGroupUU
	private	var radioGroup_B:RadioGroupUU
	private	var radio:RadioUU;
	override public function onExit() : void {
		KeyboardManager.getInstance().getState().press.removeEventAllListeners("A");
		KeyboardManager.getInstance().getState().press.removeEventAllListeners("D");
		KeyboardManager.getInstance().getState().press.removeEventAllListeners("I");
		KeyboardManager.getInstance().getState().press.removeEventAllListeners("M");
		
		var i:int;
		
		while (i < radioGroup_A.numRadios) {
			radioGroup_A.getRadioAt(i++).filters = null;
		}
	}
	
	private function onTouch(e:ATouchEvent):void {
		trace(e.type);
	}
    
	
	
}
}