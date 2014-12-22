package views.UU.cardSet.items 
{
	import configs.skinname.SkinNameConfig;
	import models.cardSet.CardSetModule;
	import org.agony2d.flashApi.AnimatorUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.ImageLoaderUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.resources.TResourceManager;
	import proto.com.CAMP_ID;
	/**
	 * ...
	 * @author ...
	 */
	public class CardSet_Camp_UU extends FusionUU
	{
		public var btn:ButtonUU;
		private var animatorSource:String;
		private var _animator:AnimatorUU;
		public function CardSet_Camp_UU() 
		{
			
		}
		
		public function init( campId:int ) : void {
			this.spaceWidth = 300;
			this.spaceHeight = 400;
			
			animatorSource = CardSetModule.getCampAnimator(campId);
			
			
			btn = new ButtonUU;
			var skin:String = "";
			switch(campId) {
				case CAMP_ID.CAMP_ID_SHANG:
					skin =  SkinNameConfig.camp_shang_btn;
					break;
				case CAMP_ID.CAMP_ID_ZHOU:
					skin =  SkinNameConfig.camp_zhou_btn;
					break;
				case CAMP_ID.CAMP_ID_YAO:
					skin =  SkinNameConfig.camp_yao_btn;
					break;
				case CAMP_ID.CAMP_ID_WU:
					skin =  SkinNameConfig.camp_wu_btn;
					break;
			}
			btn.skinName = skin;
			this.addNode(btn);
			btn.locatingTypeForHoriz = LocatingType.F___A___F;
			btn.locatingTypeForVerti = LocatingType.F_A____F;
			
			var title:ImageLoaderUU = new ImageLoaderUU;
			title.source = TResourceManager.getAsset(CardSetModule.getCampTitle(campId));
			this.addNode(title);
			title.locatingTypeForHoriz = LocatingType.F___A___F;
			title.locatingTypeForVerti = LocatingType.L____L_A;
			title.locatingOffsetY = 10;
			
			//this.addEventListener(NodeEvent.DISPOSE, ____onDispose);
		}
		
		public function setSelected( b:Boolean ) : void {
			if (b) {
				_animator = new AnimatorUU;
				_animator.play("common.eight", animatorSource, 0);
				//_animator.locatingTypeForHoriz = LocatingType.F___A___F;
				//_animator.locatingTypeForVerti = LocatingType.F___A___F;
				_animator.x = -105;
				_animator.y = -130;
				this.addNodeAt(_animator, 0);
				
				btn.visible = this.touchable = false;
			}
			else {
				btn.visible = this.touchable = true;
				_animator.kill();
				_animator = null;
			}
		}
		
	}

}