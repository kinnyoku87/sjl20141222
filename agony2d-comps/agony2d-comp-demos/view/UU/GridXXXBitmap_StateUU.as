package view.UU {
	import assets.ui.UiAssets;
	import com.greensock.TweenLite;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.events.AEvent;
	
	import assets.publicUU.PublicUU_Assets;
	
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.keyboard.KeyboardManager;
    
public class GridXXXBitmap_StateUU extends StateUU {
    
	private var sm:Scale9MultiBitmapsUU;
	
    override public function onEnter() : void {
		sm = new Scale9MultiBitmapsUU
		//sm.skinName = "scale9_A";
		sm.skinName = "buffTip_scale9";
		//sm.rotation = 20
		sm.width = 100
		this.fusion.addNode(sm);
		sm.x = 100
		sm.y = 100
		sm.height = 80
		TweenLite.to(sm, 4, {width : 600, onComplete:function():void{trace(sm.spaceWidth, sm.spaceHeight)}})
		
		sm.addEventListener(ATouchEvent.PRESS, function(e:ATouchEvent):void {
			if (KeyboardManager.getInstance().isKeyPressed("SHIFT")) {
				sm.width-=10
			}
			else {
				sm.width += 10
			}
		})
		sm.addEventListener(ATouchEvent.OVERLAY_PRESS, function(e:ATouchEvent):void{
			sm.width-=10
		})
		
		var bitmap:BitmapLoaderUU = new BitmapLoaderUU
		bitmap.cached = true;
		bitmap.source = PublicUU_Assets.IMG_grid_A;
		this.fusion.addNode(bitmap);
		//bitmap.x = 100
		bitmap.y = 400
		
		var label:LabelUU
		var gb:Scale9BitmapUU;
		
		UUFacade.cache.addBitmap(UiAssets.scale9_up, "aaa", true)
		UUFacade.cache.addBitmap(UiAssets.scale9_down, null, false)
		
		gb = new Scale9BitmapUU;
		gb.source = UiAssets.scale9_down;
		//gb.source = "aaa"
		
		//gb.load("assets/role.png");
		this.fusion.addNode(gb);
		gb.x = 100
		gb.y = 400
		
		gb.width = 80;
		gb.height = 30
		//trace(gb.spaceWidth, gb.spaceHeight)
		
		
		gb = new Scale9BitmapUU;
		//gb.embed(PublicUU_Assets.IMG_grid_A);
		gb.source = "aaa"
		//gb.load("assets/role.png");
		this.fusion.addNode(gb);
		gb.x = 500
		gb.y = 500
		
		gb.spaceWidth = gb.width = 100;
		gb.spaceHeight = gb.height = 100
		//gb.rotation = 20;
		
		label = new LabelUU
		//label.x = 125
		//label.y = 160
		label.size = 18
		label.text = "開始遊戲";
		label.font = "Courier New"
		
		label.locatingOffsetX += 20
		label.locatingTypeForHoriz = LocatingType.L___A___L;
		label.locatingTypeForVerti = LocatingType.L___A___L;
		this.fusion.addNode(label);
		
		//TweenLite.to(gb, 4, {width : 600})
		
	
    }
	
	override public function onExit() : void {
		TweenLite.killTweensOf(sm);
	}

}
}