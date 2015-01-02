package view.UU {
	import res.TmpAtlas;
	import com.greensock.TweenLite;
	import org.agony2d.resources.converters.AtlasAssetConvert;
	import org.agony2d.resources.ResMachine;
	import res.handlers.AtlasResHandler;
	
	import flash.events.MouseEvent;
	
	import assets.OptionalAssets;
	import assets.publicUU.PublicUU_Assets;
	import assets.ui.UiAssets;
	
	import org.agony2d.Agony;
	import org.agony2d.base.events.TickEvent;
	import org.agony2d.display.animation.AnimationManager;
	import org.agony2d.resources.data.AtlasData;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.flashApi.tips.TipReactionType;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.loading.LoadManager;
	import org.agony2d.resources.TAssetBundle;
	import org.agony2d.resources.TAssetData;
	import org.agony2d.resources.TResourceManager;
	
	import view.UU.tips.Alpha_TipEffectStateUU;
	
public class UU_Initializer {
    
	private static var m_instance:UU_Initializer;
	public static function getInstance() : UU_Initializer {
		return m_instance ||= new UU_Initializer
	}
	
	
	
	public function startup() : void {
		TResourceManager.initialize();
		
		UUFacade.registerRoot();
		UUToolTip.setReactionTypeForPress(TipReactionType.EXIT_NO_EFFECT);
		UUToolTip.setDefaultEffect(Alpha_TipEffectStateUU);
		
		TResourceManager.embedAssets(new OptionalAssets.animation).addEventListener(AEvent.COMPLETE, onAnim);
		TResourceManager.embedAssets(new OptionalAssets.atlas).addEventListener(AEvent.COMPLETE, onAtlas);
		TResourceManager.embedAssets(new OptionalAssets.ui2).addEventListener(AEvent.COMPLETE, onUi2);
		
		//ResourceManager.loadAssets("optional_anim.zip").addEventListener(AEvent.COMPLETE, onAnim);
		//ResourceManager.loadAssets("optional_atlas.zip").addEventListener(AEvent.COMPLETE, onAtlas);
		TResourceManager.addEventListener(AEvent.COMPLETE, onAssetLoaded);
		Agony.getFrame().addEventListener(TickEvent.TICK, ____onTick);
		_rawValue = TResourceManager.totalValue;
		
		
	}
	
	private var _rawValue:Number;
	private function ____onTick(e:TickEvent):void{
		trace("[Asset progress]: " + TResourceManager.totalValue / _rawValue);
	}
	
	private function onAssetLoaded(e:AEvent):void {
		trace("[Asset complete].");
		Agony.getFrame().removeEventListener(TickEvent.TICK, ____onTick);
		TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetLoaded);
		var mcList:Array
		var i:int
		var l:int
		
		mcList = PublicUU_Assets.getMcList();
		l = mcList.length
		while (--l > -1) {
			LoadManager.getInstance().getBytesLoader(mcList[l])
		}
		LoadManager.getInstance().addEventListener(AEvent.COMPLETE, onMcLoaded)
		
	}
	
	private function onAnim(e:AEvent):void {
		var l:int;
		var list:Vector.<TAssetData>;
		var bundle:TAssetBundle;
		
		bundle = e.target as TAssetBundle;
		list = bundle.assetList;
		l = list.length;
		while (--l > -1) {
			AnimationManager.addAnimationDataByXML(XML(list[l].data));
			AnimationManager.addFrameClips(XML(list[l].data));
		}
	}
	
	private function onAtlas(e:AEvent):void {
		var l:int;
		var list:Vector.<TAssetData>;
		var bundle:TAssetBundle;
		
		bundle = e.target as TAssetBundle;
		list = bundle.assetList;
		l = list.length;
		while (--l > -1) {
			UUFacade.cache.addAtlas(list[l].data as AtlasData);
		}
	}
	
	private function onUi2(e:AEvent):void {
		UUFacade.registerSkin("scrollbar_A", ButtonSkinUU, ButtonSkinType.PRESS, 
								TResourceManager.getAsset("ui2/btn/scrollbar-A-up.png").data, 
								TResourceManager.getAsset("ui2/btn/scrollbar-A-down.png").data);
								
		UUFacade.registerSkin("slider_A_thumb", ButtonSkinUU, ButtonSkinType.PRESS_OVER_INVALID, 
								TResourceManager.getAsset("ui2/btn/slider-A-thumb-up.png").data, 
								TResourceManager.getAsset("ui2/btn/slider-A-thumb-hover.png").data, 
								TResourceManager.getAsset("ui2/btn/slider-A-thumb-down.png").data, 
								TResourceManager.getAsset("ui2/btn/slider-A-thumb-disabled.png").data);
								
		UUFacade.registerSkin("slider_B_thumb", ButtonSkinUU, ButtonSkinType.PRESS_OVER_INVALID, 
								TResourceManager.getAsset("ui2/btn/slider-B-thumb-up.png").data, 
								TResourceManager.getAsset("ui2/btn/slider-B-thumb-hover.png").data, 
								TResourceManager.getAsset("ui2/btn/slider-B-thumb-down.png").data, 
								TResourceManager.getAsset("ui2/btn/slider-B-thumb-disabled.png").data);
	}
	
	private function onMcLoaded(e:AEvent) : void {
		LoadManager.getInstance().removeEventListener(AEvent.COMPLETE, onMcLoaded);
		
//		TouchManager.getInstance().addEventListener(ATouchEvent.PRESS, onPress)
//	}
//	
//	private function onPress(e:ATouchEvent):void{
//		TouchManager.getInstance().removeEventListener(ATouchEvent.PRESS, onPress)
		
		ResMachine.baseURL = "assets/"
		ResMachine.activate(AtlasAssetConvert);
		
		//ResMachine.getInstance().addEventListener(AEvent.COMPLETE, onResComplete);
	//}
	//
	//private function onResComplete(e:AEvent):void{
		//ResMachine.getInstance().removeEventListener(AEvent.COMPLETE, onResComplete);
		
		doAddModule();
	}
		
	private function doAddModule() : void {
		this.addListeners();
		UUFacade.registerSkin("scale9_button_A", ButtonSkinUU, ButtonSkinType.ATLAS_SCALE9_PRESS_OVER_INVALID,  UiAssets.scale9_button_A);
		UUFacade.registerSkin("radio_A", ToggleSkinUU, ButtonSkinType.ATLAS_PRESS_OVER_INVALID,                 UiAssets.radio_A);
		UUFacade.registerSkin("scale9_A", Scale9MultiBitmapsSkinUU,                                             UiAssets.scale9_hover);
		UUFacade.registerSkin("buffTip_scale9", Scale9MultiBitmapsSkinUU,                                             UiAssets.buffTip_scale9);
		//
		UUFacade.registerSkin("checkBox_A", ToggleSkinUU, ButtonSkinType.PRESS_OVER_INVALID,                    UiAssets.scale9_up, UiAssets.scale9_hover, UiAssets.scale9_down, UiAssets.scale9_disabled,
																												UiAssets.check_selected_up,UiAssets.check_selected_hover, UiAssets.check_selected_down, UiAssets.check_selected_disabled);
		UUFacade.registerSkin("scale9_button_B", ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER,                UiAssets.scale9_up, UiAssets.scale9_hover, UiAssets.scale9_down);
		this.init();
	}
	
	
	private function init() : void {
		//Agony.getStage().addEventListener(MouseEvent.RIGHT_CLICK, function(e:MouseEvent):void{});
		
		//UUFacade.getWindow(Image_StateUU).activate()
		
		//UUFacade.getWindow(Gesture_StateUU).activate()
		//UUFacade.getWindow(ProgressBar_StateUU).activate()
		//UUFacade.getWindow(Button_StateUU).activate()
		//UUFacade.getWindow(Drag_StateUU).activate()
		//UUFacade.getWindow(GridXXXBitmap_StateUU).activate()
		UUFacade.getWindow(Text_StateUU).activate()
		
		//UUFacade.getWindow(Animator_StateUU).activate([10])
		UUFacade.getWindow(ScrollBar_StateUU).activate()
		
		//UUFacade.getModule("Image_StateUU").locateForHoriz(LocationType.F___A_F)
		//UUFacade.getModule("Image_StateUU").locateForVerti(LocationType.F___A_F)
		
		//Agony.getFrame().timeScaleFactor = 2.0;
	}
	
	private function addListeners() : void {
		
		// [R] reset.
		KeyboardManager.getInstance().getState().release.addEventListener("R", function(e:AEvent):void {
			init();
		})
		// [C] alpha.
		KeyboardManager.getInstance().getState().release.addEventListener("Y", function(e:AEvent):void {
			if (KeyboardManager.getInstance().isKeyPressed("SHIFT")) {
				UUFacade.closeAllWindows();
			}
			else {
				UUFacade.getRoot().alpha = (UUFacade.getRoot().alpha == 1) ? 0.5 : 1.0
			}
		})
		// tween toggle
		KeyboardManager.getInstance().getState().press.addEventListener("T", function(e:AEvent):void {
			TweenLite.paused = !TweenLite.paused
		})
		// timeScaleFactor ↓
		KeyboardManager.getInstance().getState().press.addEventListener("UP", function(e:AEvent):void {
			Agony.getFrame().timeScaleFactor -= 0.1
		})
		// timeScaleFactor ↑
		KeyboardManager.getInstance().getState().press.addEventListener("DOWN", function(e:AEvent):void {
			Agony.getFrame().timeScaleFactor += 0.1
			trace(Agony.getFrame().timeScaleFactor);
		})
	} 
}
}