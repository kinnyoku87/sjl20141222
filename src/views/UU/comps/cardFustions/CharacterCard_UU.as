package views.UU.comps.cardFustions 
{
	import org.agony2d.flashApi.FusionUU;
	
	
	import configs.ConfigTxt;
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	import configs.skills.SkillCfg;
	import org.agony2d.Agony;
	
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.resources.TResourceManager;
	
	import utils.TextUtil;
	
	import views.UU.comps.CardUU;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CharacterCard_UU extends FusionUU
	{
		private var cardVo:CharacterCardCfg;
		
		public function CharacterCard_UU(_cardVo:CharacterCardCfg) 
		{
			cardVo = _cardVo;
			init();
		}
		
		private function init():void {
			var img:BitmapLoaderUU;
			var i:int;
			var label:LabelUU;
			
			var skillVo:SkillCfg;
			var frame_upper_assetId:String;
			
			// roleVo.
			//cardVo = this.stateArgs[0];
			
			var name:String = cardVo.name;
			var magic:int = cardVo.mana;
			var attack:int = cardVo.attack;
			var life:int = cardVo.hp;
			var movement:int = cardVo.movement;
			var imageURL:String = "assets/temp/cards/role/" + cardVo.imageURL + ".png"
			
			
			// 人物圖片.
			img = new BitmapLoaderUU;
			img.source = imageURL;
			img.x = 3;
			img.y = 30;
			this.addNode(img);
			//img.scaleX = 1.26;
			//img.scaleY = 1.35
			
			// 上部外框.
			if (cardVo.camp == 1) {
				frame_upper_assetId = "shang";
			}
			else if(cardVo.camp == 2) {
				frame_upper_assetId = "zhou";
			}
			else if(cardVo.camp == 3) {
				frame_upper_assetId = "yao";
			}
			// 中立.
			else {
				frame_upper_assetId = "neutrality";
			}
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_upper_" + frame_upper_assetId + ".png");
			this.addNode(img);
			
			// 人物名字.
			label = TextUtil.createLabel2(name, 22, 0xFFFFFF);
			this.addNode(label);
//			label.locatingTypeForHoriz = LocatingType.F___A___F;
//			label.locatingOffsetX = 20;
			label.x = CardUU.CARD_NAME_OFFSET_X;
			label.y = CardUU.CARD_NAME_OFFSET_Y;
			
			// 頂部魔耗數字外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_magic.png");
			this.addNode(img);
			img.x = -3;
			img.y = -14
			
			// 魔耗數字.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset(CardConfigurator.getMagicNumAssetId(magic));
			this.addNode(img);
			img.x = 14;
			img.y = 2;
			
			// 攻擊外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_life.png");
			this.addNode(img);
			img.y = 56;
			
			// 攻擊圖標.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/attack.png");
			this.addNode(img);
			img.x = 10;
			img.y = 56 + 11;
			
			// 攻擊文本.
			label = TextUtil.createLabel(String(attack), 28, 0xFFFFFF);
			this.addNode(label);
			label.x = 44;
			label.y = 56 + 7;
			
			// 生命外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_life.png");
			this.addNode(img);
			img.y = 114;
			
			// 生命圖標.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/life.png");
			this.addNode(img);
			img.x = 14;
			img.y = 114 + 13;
			
			// 生命文本.
			label = TextUtil.createLabel(String(life), 28, 0xFFFFFF);
			this.addNode(label);
			label.x = 44;
			label.y = 114 + 7;
			
			// 移動力外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_life.png");
			this.addNode(img);
			img.y = 173;
			
			// 移動力圖標.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/movement.png");
			this.addNode(img);
			img.x = 10;
			img.y = 173 + 12;
			
			// 移動力文本.
			label = TextUtil.createLabel(String(movement), 28, 0xFFFFFF);
			this.addNode(label);
			label.x = 44;
			label.y = 173 + 7;
			
			// 下部外框.
 			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_desc_A.png");
			this.addNode(img);
			img.y = 230;
			
			this.spaceWidth = this.width;
			this.spaceHeight = this.height;
			
			// 下部描述外框.
			img = new BitmapLoaderUU;
			img.source = TResourceManager.getAsset("card/img/frame_desc_B.png");
			this.addNode(img);
			img.x = 16;
			img.y = 246;
			
			var pos_A:Number;
			var pos_B:Number;
			
			if(cardVo.skill1 > 0){
				pos_A = 16;
				pos_B = 246;
				
				skillVo = cardVo.getSkill1();
				
				// 技能A名字
				label = TextUtil.createLabel(skillVo.name, 14, 0xdddd33, false, 4, 3.5, 22);
				this.addNode(label);
				label.x = pos_A + 19;
				label.y = pos_B + 2;
				
				// 主動or自動.
				img = new BitmapLoaderUU;
				img.x = pos_A + 177;
				img.y = pos_B + 11;
				this.addNode(img);
				label = TextUtil.createLabel(skillVo.name, 14, 0xffffff, false, 3, 3.5, 22);
				label.x = pos_A + 183;
				label.y = pos_B + 2;
				
				this.addNode(label);
				if(skillVo.howRun == 1){
					img.source = TResourceManager.getAsset("card/img/frame_active.png");
					label.text = "主动";
				}
				else if(skillVo.howRun == 2){
					img.source = TResourceManager.getAsset("card/img/frame_passive.png");
					label.text = "自动";
				}
				
				// 技能A描述
				label = TextUtil.createLabel4(skillVo.desc, 13, 0x0, ConfigTxt.CARD_DESC_WIDTH, ConfigTxt.CARD_DESC_HEIGHT, 0);
				this.addNode(label);
				label.x = pos_A + 6;
				label.y = pos_B + 22;
			}
			else {
				return;
			}
			if(cardVo.skill2 > 0){
				pos_A = 16;
				//pos_B = label.y + label.textHeight - 20;
				pos_B = label.y + label.textHeight * Agony.getAdapter().pixelRatio - 3;
				
				skillVo = cardVo.getSkill2();
				
				// 技能A名字
				label = TextUtil.createLabel(skillVo.name, 14, 0xdddd33, false, 4, 3.5, 22);
				this.addNode(label);
				label.x = pos_A + 19;
				label.y = pos_B + 4;
				
				// 主動or自動.
				img = new BitmapLoaderUU;
				img.x = pos_A + 177;
				img.y = pos_B + 13;
				this.addNode(img);
				label = TextUtil.createLabel(skillVo.name, 14, 0xffffff, false, 3, 3.5, 22);
				label.x = pos_A + 183;
				label.y = pos_B + 4;
				
				this.addNode(label);
				if(skillVo.howRun == 1){
					img.source = TResourceManager.getAsset("card/img/frame_active.png");
					label.text = "主动";
				}
				else if(skillVo.howRun == 2){
					img.source = TResourceManager.getAsset("card/img/frame_passive.png");
					label.text = "自动";
				}
				
				// 技能A描述
				label = TextUtil.createLabel4(skillVo.desc, 13, 0x0, ConfigTxt.CARD_DESC_WIDTH, ConfigTxt.CARD_DESC_HEIGHT,0 );
				this.addNode(label);
				label.x = pos_A + 6;
				label.y = pos_B + 26;
			}
		}
	}

}