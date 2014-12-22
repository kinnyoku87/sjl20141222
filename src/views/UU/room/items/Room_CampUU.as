package views.UU.room.items 
{
	import configs.skinname.SkinNameConfig;
	import models.cardSet.CardSetModule;
	import models.player.PlayerModel;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.ButtonUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.RadioUU;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.ColorUtil;
	import proto.com.CAMP_ID;
	import proto.com.CampBattleCard;
	import utils.TextUtil;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class Room_CampUU extends FusionUU
	{
		
		private static const NAME:String = "选择套牌";
		private var closeBtn:ButtonUU;
		private var campIndex:int;
		public var btn:ButtonUU;
		public var campCard:CampBattleCard;
		public function Room_CampUU(_campIndex:int) 
		{
			campIndex = _campIndex;
			campCard = CardSetModule.getCardBgByIndex(_campIndex);
			this.userData = campCard;
			init();
		}
		
		private function init():void {
			
			var img:BitmapLoaderUU;
			var label:LabelUU;
			var levelLabel:LabelUU;
			
			btn = new ButtonUU;
			this.addNode(btn);
			
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("camp/img/camp_frame.png");
			this.addNode(img);
			img.x = 30;
			img.y = 190;
			
			label = TextUtil.createLabel6("", 17,ColorUtil.rgb(255,180,72), false,ColorUtil.BLACK,1);
			this.addNode(label);
			label.locatingTypeForHoriz = LocatingType.L_A____L;
			label.locatingTypeForVerti = LocatingType.L___A___L;
			label.locatingOffsetX = 40;
			label.text = campCard.name;
			
			levelLabel = TextUtil.createLabel6("", 20,ColorUtil.WHITE, false,ColorUtil.BLACK,1);
			this.addNode(levelLabel);
			levelLabel.locatingTypeForHoriz = LocatingType.A_L____L;
			levelLabel.locatingTypeForVerti = LocatingType.L___A___L;
			levelLabel.locatingOffsetX = -7;
			//levelLabel.y = 178;
			levelLabel.text = PlayerModel.getInstance().myRole.getCampLevel(campCard.campId).toString();
			
			if (campCard.campId == CAMP_ID.CAMP_ID_SHANG) {
				btn.skinName = SkinNameConfig.camp_shang_btn;
		
			}else if (campCard.campId == CAMP_ID.CAMP_ID_ZHOU) {
				btn.skinName = SkinNameConfig.camp_zhou_btn;

			}else if (campCard.campId == CAMP_ID.CAMP_ID_YAO) {
				btn.skinName = SkinNameConfig.camp_yao_btn;

			}
			else if (campCard.campId == CAMP_ID.CAMP_ID_WU) {
				btn.skinName = SkinNameConfig.camp_wu_btn;

			}
		
		}
		
		
		public function setSelected( b:Boolean ) : void {
			
		}
		
	}

}