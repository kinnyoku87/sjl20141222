package view.UU {
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.flashApi.TextInputUU2;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.events.AEvent;
	import org.agony2d.inputs.events.ATouchEvent;
	
public class Text_StateUU extends StateUU {
	
    public function Text_StateUU() {
		
    }
	
	override public function onEnter() : void {
		var input:TextInputUU2;
		
		input = new TextInputUU2();
		input.width = 300
		
		this.fusion.spaceWidth = this.fusion.root.spaceWidth;
		this.fusion.spaceHeight = this.fusion.root.spaceHeight;
		
		this.fusion.addNode(input);
		input.background = true;
		input.backgroundColor = 0xdddd44
		//input.displayAsPassword = true;
		input.border = true;
		input.borderColor = 0x4444ff;
		input.text = "大幅度abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef"
		input.size = 33
		input.thickness = 13
		input.locatingTypeForHoriz = LocatingType.F___A___F
		input.locatingTypeForVerti = LocatingType.F____A_F
		input.locatingOffsetX = 100
		input.locatingOffsetY = -10
		//input.multiline = true;
		input.wordWrap = true
		
		input.addEventListener(NodeEvent.FOCUS_IN, onEvent)
		input.addEventListener(NodeEvent.FOCUS_OUT, onEvent)
		input.addEventListener(AEvent.CHANGE, onEvent)
		
		var label:LabelUU;
		var css:TextFormat;
		
		label = new LabelUU;
		
		//css = new TextFormat(null, 28, 0x44dd44);
		label.size = 28;
		label.text = "ABCDE__F !!";
		label.color = 0x44ff44;
		
		//label.font = null;
		label.border = true;
		label.borderColor = 0x0;
		//label.autoSize = TextFieldAutoSize.CENTER;
		label.width = 250;
		label.height = 50;
		//label.align = "center"
		this.fusion.addNode(label);
		
		label.locatingTypeForHoriz = LocatingType.L_A____L;
		label.locatingTypeForVerti = LocatingType.A_L____L
		label.locatingOffsetY = -10;
		label.addEventListener(ATouchEvent.PRESS, onEvent);
	}
	
	private function onEvent(e:AEvent):void {
		trace(e.type)
	}
}
}