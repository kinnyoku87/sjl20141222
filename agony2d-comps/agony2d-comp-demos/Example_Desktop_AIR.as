package
{
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowType;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import assets.OptionalAssets;
	import assets.publicUU.PublicUU_Assets;
	import assets.ui.UiAssets;
	
	import org.agony2d.Agony;
	import org.agony2d.base.DebugLogger;
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.events.TickEvent;
	import org.agony2d.display.animation.AnimationManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.loading.LoadManager;
	import org.agony2d.project.ViewFacade;
	import org.agony2d.resources.ResMachine;
	import org.agony2d.resources.TAssetBundle;
	import org.agony2d.resources.TAssetData;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.resources.converters.AtlasAssetConvert;
	import org.agony2d.resources.data.AtlasData;
	import org.agony2d.utils.Stats;
	import org.agony2d.utils.gc;
	
	import res.TmpAtlas;
	import res.handlers.AtlasResHandler;
	
	import view.UU.Animator_StateUU;
	import view.UU.Gesture_StateUU;
	
	[SWF(width="1100", height="720",frameRate="30",backgroundColor = "0x0")]
	public class Example_Desktop_AIR extends Sprite
	{
		public function Example_Desktop_AIR()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			
		}
			
		private function onAddedToStage(e:Event):void{
			Agony.startup(stage, new DebugLogger, null, onInit);
			stage.addChild(new Stats);
			
		}
		
		private function onInit():void{
			
			
			KeyboardManager.getInstance().getState().press.addEventListener("SHIFT", function(e:AEvent):void{
				toggle();
			})
			KeyboardManager.getInstance().getState().press.addEventListener("G", function(e:AEvent):void{
				gc();
			})
			
			
			TResourceManager.initialize();
			TResourceManager.embedAssets(new OptionalAssets.animation).addEventListener(AEvent.COMPLETE, onAnim);
			TResourceManager.embedAssets(new OptionalAssets.atlas).addEventListener(AEvent.COMPLETE, onAtlas);
			//ResourceManager.loadAssets("optional_anim.zip").addEventListener(AEvent.COMPLETE, onAnim);
			//ResourceManager.loadAssets("optional_atlas.zip").addEventListener(AEvent.COMPLETE, onAtlas);
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			TouchManager.registerListenTarget();
			
			UUFacade.registerRoot();
			
			
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
		
		private function onAssetLoaded(e:AEvent):void {
			trace("[Asset complete].");
			
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
		
		private function onMcLoaded(e:AEvent) : void {
			LoadManager.getInstance().removeEventListener(AEvent.COMPLETE, onMcLoaded);
			
			//		TouchManager.getInstance().addEventListener(ATouchEvent.PRESS, onPress)
			//	}
			//	
			//	private function onPress(e:ATouchEvent):void{
			//		TouchManager.getInstance().removeEventListener(ATouchEvent.PRESS, onPress)
			
			ResMachine.baseURL = "assets/"
			ResMachine.activate(AtlasAssetConvert);
			
			ResMachine.getInstance().extractZip(TmpAtlas.optional).setHandler(AtlasResHandler);
			ResMachine.getInstance().extractZip(TmpAtlas.shield).setHandler(AtlasResHandler);
			
			ResMachine.getInstance().addEventListener(AEvent.COMPLETE, onResComplete);
		}
		
		private function onResComplete(e:AEvent) : void {
			ResMachine.getInstance().removeEventListener(AEvent.COMPLETE, onResComplete);
			
			
			
			UUFacade.registerSkin("scale9_button_A", ButtonSkinUU, ButtonSkinType.ATLAS_SCALE9_PRESS_OVER_INVALID,  UiAssets.scale9_button_A);
			UUFacade.registerSkin("radio_A", ToggleSkinUU, ButtonSkinType.ATLAS_PRESS_OVER_INVALID,                 UiAssets.radio_A);
			UUFacade.registerSkin("scale9_A", Scale9MultiBitmapsSkinUU,                                             UiAssets.scale9_hover);
			//
			UUFacade.registerSkin("checkBox_A", ToggleSkinUU, ButtonSkinType.PRESS_OVER_INVALID,                    UiAssets.scale9_up, UiAssets.scale9_hover, UiAssets.scale9_down, UiAssets.scale9_disabled,
				UiAssets.check_selected_up,UiAssets.check_selected_hover, UiAssets.check_selected_down, UiAssets.check_selected_disabled);
			UUFacade.registerSkin("scale9_button_B", ButtonSkinUU, ButtonSkinType.SCALE9_PRESS_OVER,                UiAssets.scale9_up, UiAssets.scale9_hover, UiAssets.scale9_down);
			
			
//			UUFacade.getWindow(Animator_StateUU).activate();
			UUFacade.getWindow(Gesture_StateUU).activate();
			
//			toggle();
		}
		
		private var win:NativeWindow;
		
		private function toggle() : void{
			trace("......");
			if(!win){
				trace("打開窗口")
				var options:NativeWindowInitOptions = new NativeWindowInitOptions
				options.type = NativeWindowType.UTILITY;
				//			options.
				win = new NativeWindow(options)
				win.width = 1000;
				win.height = 600;
				win.x = 600
				
				win.activate();
				win.addEventListener(Event.CLOSING, onWinClosed);
				
				win.stage.frameRate = 60;
				Agony.registerStage(win.stage, "A");
				
				TouchManager.registerListenTarget("A");
				UUFacade.registerRoot("A");
				
//				UUFacade.getWindow(Gesture_StateUU, "A").activate();
				UUFacade.getWindow(Animator_StateUU, "A").activate();
			}
			else{
				trace("key關閉");
				win.close();
				win.removeEventListener(Event.CLOSING, onWinClosed);
				
				Agony.unregisterStage("A");
				TouchManager.unregisterListenTarget("A");
				UUFacade.unregisterRoot("A");
				win = null;
			}
		}
		
		private function onWinClosed(e:Event):void{
			trace("關閉.");
			
			win.removeEventListener(Event.CLOSING, onWinClosed);
			win = null;
			Agony.unregisterStage("A");
			TouchManager.unregisterListenTarget("A");
			UUFacade.unregisterRoot("A");
		}
		
	}
}