package views.UU.tips
{
	import configs.ConfigTxt;
	import configs.skills.BuffCfg;
	import configs.skills.SkillConfigurator;
	import flash.geom.Point;
	import models.battle.BattleRoleModel;
	import models.battle.BattleRoleVo;
	import models.battle.CharacterVo;
	import models.player.PlayerModel;
	import org.agony2d.Agony;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.LocatingType;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.resources.TResourceManager;
	import utils.TextUtil;
	
	import org.agony2d.flashApi.tips.TipViewStateUU;
	
	import views.UU.comps.CardUU;

	public class Character_TipViewStateUU extends TipViewStateUU
	{

		override public function onEnter():void {
			var cardView:CardUU;
			var coord:Point;
			var vo:CharacterVo;
			var buffCfg:BuffCfg;
			var buffId:String;
			var buffIdMap:Object;
			var img:BitmapLoaderUU;
			var battleRole:BattleRoleVo;
			
			vo = this.tipData.userData as CharacterVo;
			cardView = new CardUU;
			this.fusion.addNode(cardView);
			battleRole = BattleRoleModel.getBattleRoleVo(vo.role_id);
			if (vo.isSneaking() && (((battleRole.chairId % 2) == 0 && !BattleRoleModel.isEven) || ((battleRole.chairId % 2) == 1 && BattleRoleModel.isEven))) {
				cardView.setCardId(-1);
			}
			else {
				cardView.setCardId(vo.card_guid);
			}
			
			/////////////////////////////////
			// buff
			/////////////////////////////////
			
			if (vo.numBuff > 0) {
				var txtFusion:FusionUU;
				var label:LabelUU;
				var i:int;
				var scale9Multi:Scale9MultiBitmapsUU;
				var scale9Img:Scale9BitmapUU;
				
				txtFusion = new FusionUU;
				txtFusion.spaceWidth = cardView.spaceWidth - 43;
				txtFusion.x = 5;
				txtFusion.locatingTypeForVerti = LocatingType.L____L_A;
				txtFusion.locatingOffsetY = 5;
				this.fusion.addNode(txtFusion);
				
				// scale9;
				//scale9Multi = new Scale9MultiBitmapsUU;
				//scale9Multi.skinName = "buffTip_scale9";
				//txtFusion.addNode(scale9Multi);
				//scale9Multi.width = txtFusion.spaceWidth - 40;
				//scale9Multi.height = 300;
				scale9Img = new Scale9BitmapUU;
				scale9Img.source = TResourceManager.getAsset("battle/img/buffTip_scale9.png");
				//scale9Img.width = cardView.spaceWidth - 10;
				txtFusion.addNodeAt(scale9Img, 0);
				
				buffIdMap = vo.buffIdMap;
				for (buffId in buffIdMap) {
					buffCfg = SkillConfigurator.getBuffById(int(buffId));
					
					// buff名字
					label = TextUtil.createLabel(buffCfg.name, 14, 0x8080FF, false, 3, 3.5, 22);
					txtFusion.addNode(label);
					label.height = label.textHeight;
					label.x = 25;
					if (i == 0) {
						label.y = 26;
					}
					else {
						label.locatingTypeForVerti = LocatingType.L____L_A;
						label.locatingOffsetY = -5;
					}
					
					// buff描述
					label = TextUtil.createLabel4(buffCfg.desc, 13, 0x0, ConfigTxt.CARD_DESC_WIDTH - 10);
					label.x = 25;
					label.height = label.textHeight;
					label.locatingTypeForVerti = LocatingType.L____L_A;
					label.locatingOffsetY = -5;
					txtFusion.addNode(label);
					
					i++;
				}
				
				
				Agony.getFrame().addEventListener(AEvent.CHANGE, function(e:AEvent):void {
					Agony.getFrame().removeEventAllListeners(AEvent.CHANGE);
					
					if (scale9Img.displayObject) {
						scale9Img.width = cardView.spaceWidth - 10;
						scale9Img.height = txtFusion.height + 20;
					}
				});
				
				// Left.
				img = new BitmapLoaderUU;
				img.source = TResourceManager.getAsset("battle/img/buffTip_A.png");
				this.fusion.addNode(img);
				img.x = 23;
				img.y = cardView.spaceHeight - 43;
				
				// Right.
				img = new BitmapLoaderUU;
				img.source = TResourceManager.getAsset("battle/img/buffTip_B.png");
				this.fusion.addNode(img);
				img.x = cardView.spaceWidth - 62;
				img.y = cardView.spaceHeight - 43;
			}
			
			
			
			coord = this.target.parent.localToGlobal(this.target.x, this.target.y);
			
			// 左
			if(coord.x + 83 + cardView.spaceWidth + 11 > this.fusion.root.spaceWidth){
				coord.x = coord.x - 83 - cardView.spaceWidth - 50;
			}
			// 右
			else {	
				coord.x = coord.x + 83 + 50;
			}
			// 上
			//if(coord.y + this.target.height / 2 + cardView.spaceHeight + 11 > this.fusion.root.spaceHeight){
			if(coord.y - 100 - cardView.spaceHeight - 22 > 0){
				coord.y = coord.y - 100 - cardView.spaceHeight;
			}
			else {
				coord.y = 22;
			}
			
			// 下
			//else {	
				//coord.y = coord.y + this.target.height / 2 + 11;
			//}
			
			this.fusion.x = coord.x;
			this.fusion.y = coord.y;
			
			
		}
	}
}