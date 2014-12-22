package views.UU.room.states 
{
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.StateUU;
	import org.agony2d.resources.TResourceManager;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Room_Friend_StateUU extends StateUU
	{
		private var bg:Scale9BitmapUU;
		private var titleBg:ImageLoaderUU;
		public function Room_Friend_StateUU() 
		{
			
		}
		
		override public function onEnter():void {
			bg = new Scale9BitmapUU;
			bg.source = TResourceManager.getAsset("friend/img/friend_bg_scale9.png");
			this.fusion.addNode(bg);
			bg.width = this.fusion.spaceWidth;
			bg.height = this.fusion.spaceHeight;
			
			titleBg = new ImageLoaderUU;
			titleBg.source = TResourceManager.getAsset("friend/img/friend_title.png");
			this.fusion.addNode(titleBg);
			titleBg.locatingTypeForHoriz = LocatingType.F___A___F;
			titleBg.locatingTypeForVerti = LocatingType.F_A____F;
			titleBg.locatingOffsetY = 15;
		}
		
		override public function onExit():void {
			
		}
		
	}

}