package views.UU.loading
{
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.events.AEvent;
	import org.agony2d.resources.TResourceManager;
	
	public class Preload_StateUU extends StateUU
	{
		public function Preload_StateUU()
		{
			super();
		}
		
		override public function onEnter():void{
			
		}
		
//		[Embed(source="../../assets/optionals/btn/scale9_button_A.png")]
//		public static var ccc:Class;
		
		private var _scale9_button_A:String = "assets/optionals/btn/scale9_button_A.png";
		
		private function onBtnLoaded(e:AEvent):void{
			
			
			UUFacade.registerSkin(_scale9_button_A, ButtonSkinUU, ButtonSkinType.ATLAS_SCALE9_PRESS_OVER_INVALID, TResourceManager.getAsset(_scale9_button_A).data);
//			UUFacade.registerSkin(_scale9_button_A, ButtonSkinUU, ButtonSkinType.ATLAS_SCALE9_PRESS_OVER_INVALID, ccc);
			
			var button:ButtonUU;
			
			button = new ButtonUU();
			button.skinName = _scale9_button_A;
			button.bitmap.width = 220;
			button.bitmap.height = 80;
			this.fusion.addNode(button);
			
			button.getLabel().text = "開始遊戲";
			button.getLabel().size = 22;
			
			
			
		}
		
	}
}