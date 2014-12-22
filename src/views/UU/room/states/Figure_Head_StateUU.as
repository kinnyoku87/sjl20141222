package views.UU.room.states 
{
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.resources.TResourceManager;
	/**
	 * ...玩家形象
	 * @author ... dcl
	 */
	public class Figure_Head_StateUU extends StateUU
	{
		
		public function Figure_Head_StateUU() 
		{
			
		}
		
		private var icon:String;
		private var img:ImageLoaderUU;
		override public function onEnter():void 
		{
			icon = this.stateArgs[0];
			var sprite:String = int(icon) <= 1000 ? "1006" : icon;
			img = new ImageLoaderUU;
			img.source = TResourceManager.getAsset("room/hallHead/" + sprite + ".png");
			this.fusion.addNode(img);
			img.locatingTypeForHoriz = LocatingType.F___A___F;
			img.locatingTypeForVerti = LocatingType.F___A___F;
		}
		
	}

}