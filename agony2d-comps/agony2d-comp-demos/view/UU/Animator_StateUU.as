package view.UU 
{
	import flash.filters.GlowFilter;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.resources.ResMachine;
	import org.agony2d.utils.getClassName;
	import res.handlers.AtlasResHandler2;
	
	import org.agony2d.Agony;
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.events.TickEvent;
	import org.agony2d.display.AnimatorAA;
	import org.agony2d.display.ImageAA;
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.AdvancedAnimatorUU;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.inputs.events.ATouchEvent;
    
public class Animator_StateUU extends StateUU {
    
	private var _animatorList:Array = [];
	
    override public function onEnter() : void {
		var FN:FusionUU;
		var animator:AnimatorUU;
		var l:int;
		
		this.addTouchEvent(this.fusion.root);
		this.addTouchEvent(this.fusion);
		
		l = this.stateArgs[0] ? this.stateArgs[0] : 30;
		while (--l > -1) {
			FN = new FusionUU();
			this.fusion.addNode(FN);
			FN.x = Math.random() * 450 + 10;
			FN.y = Math.random() * 450 + 10;
			FN.userData = "FN_" + l;
			this.addTouchEvent(FN);
			if (l % 2) {
				FN.touchMerged = true;
			}
			
			animator = new AnimatorUU(); //new AdvancedAnimatorUU("optional_atlas/tornado_A");
			animator.play("tornado_A.loop", "atlas/tornado_A", 0);
			animator.pivotX = animator.sourceWidth / 2;
			animator.pivotY = animator.sourceHeight / 2;
			FN.addNode(animator);
			
			this.addTouchEvent(animator);
			animator.userData = "anim____" + l;
		}
		//animator.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void{
			//animator.play([2]);
		//})
		var anim2:AnimatorUU = new AnimatorUU();
		anim2.play("tornado_A.loop", "atlas/tornado_A", 0);
		this.fusion.addNode(anim2);
		anim2.x = 800
		anim2.y = 400
		anim2.addEventListener(ATouchEvent.HOVER, function(e:ATouchEvent):void {
			anim2.filters = [new GlowFilter(0x44dddd, 0.8, 8, 8, 6, 3)];
		})
		anim2.addEventListener(ATouchEvent.LEAVING, function(e:ATouchEvent):void {
			anim2.filters = null;
		})
//		anim2.pivotX = 33;
//		anim2.pivotY = 33;
		//anim2.addEventListener(ATouchEvent.CLICK, onClick_A);
		anim2.addEventListener(NodeEvent.DISPOSE, function(e:AEvent):void{
			trace("Anim Killed.");
		})
		this.addTouchEvent(anim2);
		anim2.userData = "anim2";
		
		// character.
		//anim3 = new AnimatorUU();
		//anim3.setTargetId("optional");
		//this.doPlayNext();
		//this.fusion.addNode(anim3);
		//anim3.pivotX = anim3.sourceWidth / 2;
		//anim3.pivotY = anim3.sourceHeight / 2;
		//anim3.x = 100;
		//anim3.y = 400;
		//this.addTouchEvent(anim3);
		//anim3.userData = "anim3";
		
		//Agony.getFrame().timeScaleFactor = 0.3
		
		//trace(UUFacade.cache.isAtlasExist("shield"));
		
		var id:String = "atlas/characters/daodunbingshang";
		
		// 动态加载atlas
		//ResMachine.getInstance().loadFiles(id + ".atlas").setHandler(AtlasResHandler2);
		//
		//ResMachine.getInstance().addEventListener(AEvent.COMPLETE, onResComplete);
		//
		//UUFacade.cache.addEventListener(id, function():void {
			//UUFacade.cache.removeEventAllListeners(id);
			//
			//anim3.setTargetId(id, "common.ten");
			//anim3.pivotX = anim3.sourceWidth / 2;
			//anim3.pivotY = anim3.sourceHeight / 2;
			//
			//KeyboardManager.getInstance().getState().press.addEventListener("Q", function(e:AEvent):void {
				//anim3.setTargetId(anim3.getTargetId() == id ? "optional" : id, anim3.getTargetId() == id ? "common.eight" : "common.ten");
			//});
		//})
		
		
		
	}
	
	private var anim3:AnimatorUU;
	
	private function onResComplete(e:AEvent):void {
		
	}
	
	private function doPlayNext() : void {
		anim3.play("common.eight", _actionList[_index], 2, doPlayNext);
		if (++_index > _actionList.length - 1) {
			_index = 0;
		}
	}
	
	public var _index:int;
	public var _actionList:Array = ["attack/back", "attack/front", "attack/left", "idle/back", "idle/front", "idle/left", "run/back", "run/front", "run/left"];
	
	override public function onExit() : void {
		
	}
	
	
	private function addTouchEvent(v:NodeUU):void {
		//v.addEventListener(ATouchEvent.PRESS, onTouch);
		//v.addEventListener(ATouchEvent.RELEASE, onTouch);
		//v.addEventListener(ATouchEvent.MOVE, onTouch);
		//v.addEventListener(ATouchEvent.HOVER, onTouch);
		//v.addEventListener(ATouchEvent.LEAVING, onTouch);
		//v.addEventListener(ATouchEvent.CLICK, onTouch);
	}
	
	private function onTouch(e:ATouchEvent):void{
		Agony.getLog().simplify("[ {2} ({0}) ]: {1}", e.target.userData, e.type, getClassName(e.target));
	}
}
}