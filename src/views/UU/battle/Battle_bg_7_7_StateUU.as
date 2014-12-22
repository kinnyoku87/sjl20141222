package views.UU.battle
{
	import configs.ConfigBattle;
	import models.battle.BattleModel;
	import org.agony2d.flashApi.AnimatorUU;
	
	import org.agony2d.display.events.NodeEvent;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.resources.TResourceManager;
	
public class Battle_bg_7_7_StateUU extends StateUU {
	
	override public function onEnter():void {
		var i:int;
		var k:int;
		var l:int;
		var img:BitmapLoaderUU;
		var w:Number;
		var h:Number;
		var animator:AnimatorUU;
		
		//i = 0;
		//l = 28;
		//while(++i<=l){
			//img = new BitmapLoaderUU;
			//img.source = TResourceManager.getAsset("temp/battle/bg/" + i + ".png");
			//if(i==1){
				//w = img.width;
				//h= img.height;
			//}
			//this.fusion.addNode(img);
			//img.x = w * (k % 7);
			//img.y = h * int(k / 7);
			//
			//k++;
		//}
		
		img = new BitmapLoaderUU;
		img.source = TResourceManager.getAsset("temp/bg/battleBg.png");
		this.fusion.addNode(img);
		
		// 棋盤格子.
		img = new BitmapLoaderUU;
		img.source = TResourceManager.getAsset("battle/img/map_grid_7_7.png");
		this.fusion.addNode(img);
		
//			this.fusion.spaceWidth = img.width;
//			this.fusion.spaceHeight = img.height;
		
		img.locatingTypeForHoriz = LocatingType.F___A___F;
		img.locatingTypeForVerti = LocatingType.F___A___F;
		img.locatingOffsetY = ConfigBattle.GRID_LOCATING_OFFSET_Y;
		
		// 火焰.
		animator = new AnimatorUU;
		this.fusion.addNode(animator);
		animator.play("common.scene.fire", "atlas/scene/fire2", 0);
		animator.x = 1365;
		animator.y = 238;
		
		BattleModel.gridWidth = img.width;
		BattleModel.gridHeight = img.height;
		
		this.fusion.root.addEventListener(NodeEvent.RESIZE, onResize);
		
		this.onResize(null);
	}
	
	override public function onExit():void {
		this.fusion.root.removeEventListener(NodeEvent.RESIZE, onResize);
	}
	
	
	
	private function onResize(e:AEvent):void{
		this.fusion.locatingTypeForHoriz = LocatingType.F___A___F;
		this.fusion.locatingTypeForVerti = LocatingType.F___A___F;
		
		
	}
	
}
}