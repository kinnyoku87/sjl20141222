package {
	import flash.display.Sprite;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.Scale9BitmapUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	
	import configs.battle.BattleConfigurator;
	import configs.cards.CardConfigurator;
	import configs.skills.SkillConfigurator;
	
	import models.GameModel;
	import models.battle.BattleModel;
	
	import org.agony2d.Agony;
	import org.agony2d.base.Adapter;
	import org.agony2d.base.DebugLogger;
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.display.animation.AnimationManager;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.BitmapLoaderUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.flashApi.skins.ToggleSkinUU;
	import org.agony2d.flashApi.tips.UUToolTip;
	import org.agony2d.inputs.TouchManager;
	import org.agony2d.resources.TResourceManager;
	import org.agony2d.utils.Stats;
	import configs.ConfigTxt;
	import configs.skills.BuffCfg;
	import configs.skills.SkillConfigurator;
	import flash.geom.Point;
	import models.battle.CharacterVo;
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
	
	[SWF(width="1160", height="720", frameRate="60",backgroundColor = "0x0")]
public class UnitTest_Buff extends Sprite {
	
	public function UnitTest_Buff() 
	{
		Agony.startup(stage, new DebugLogger("(A)"), new Adapter(1280, 960, true), onInit);
	}
	
	
	public var assetsList:Array = ["login.zip", "card.zip", "battle.zip"];
	public var csvList:Array = ["data/card_character.csv", "data/card_equipment.csv", "data/card_magic.csv", "data/skill.csv", "data/buff.csv"];
	
	
	
	private function onInit() : void {
		TResourceManager.initialize();
		
		TouchManager.registerListenTarget();
		AnimationManager.defaultFrameRate = 12;
		
		
		UUFacade.registerRoot();
		
		
		TResourceManager.loadAssets2("animation/common.xml").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
			AnimationManager.addFrameClips(TResourceManager.getAsset("animation/common.xml").data);
		})
		
		
		
		TResourceManager.loadAssets("card.zip");
		TResourceManager.loadAssets("battle.zip");
		TResourceManager.loadAssets2.apply(null, csvList);
		TResourceManager.addEventListener(AEvent.COMPLETE, onAssetsLoaded);
	}
	
	private var fusion:FusionUU;
	
	private var buffIdMap:Object = {60053:true, 60074:true};
	//private var buffIdMap:Object = {60017:true, 60053:true, 60074:true};
	
	private function onAssetsLoaded(e:AEvent):void {
		var data:Vector.<Array>;
			
		data = CsvUtil.parse(TResourceManager.getAsset("data/card_character.csv").data);
		CardConfigurator.initCharacterCards(data);
		data = CsvUtil.parse(TResourceManager.getAsset("data/card_equipment.csv").data);
		CardConfigurator.initEquipmentCards(data);
		data = CsvUtil.parse(TResourceManager.getAsset("data/card_magic.csv").data);
		CardConfigurator.initMagicCards(data);
		data = CsvUtil.parse(TResourceManager.getAsset("data/skill.csv").data);
		SkillConfigurator.initSkill(data);
		data = CsvUtil.parse(TResourceManager.getAsset("data/buff.csv").data);
		SkillConfigurator.initBuff(data);
			
		var cardView:CardUU;
		var coord:Point;
		var vo:CharacterVo;
		var buffCfg:BuffCfg;
		var buffId:int;
		var img:BitmapLoaderUU;
			
		fusion = new FusionUU;
		UUFacade.getRoot().addNode(fusion);
		fusion.x = 200;
		fusion.y = 100;
		
		cardView = new CardUU;
		cardView.setCardId(10062);
		this.fusion.addNode(cardView);
			
		//if (vo.numBuff > 0) {
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
			scale9Img.width = cardView.spaceWidth - 10;
			txtFusion.addNodeAt(scale9Img, 0);
			
			//buffIdMap = vo.buffIdMap;
			for (buffId in buffIdMap) {
				buffCfg = SkillConfigurator.getBuffById(buffId);
				
				// buff名字
				label = TextUtil.createLabel(buffCfg.name, 15, 0x8080FF, false, 3, 3.5, 22);
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
				label = TextUtil.createLabel4(buffCfg.desc, 14, 0x0, ConfigTxt.CARD_DESC_WIDTH - 10);
				label.x = 25;
				label.height = label.textHeight;
				label.locatingTypeForVerti = LocatingType.L____L_A;
				label.locatingOffsetY = -5;
				txtFusion.addNode(label);
				
				i++;
			}
			
			//Agony.getFrame().addEventListener(AEvent.COMPLETE, function(e:AEvent):void {
				//Agony.getFrame().removeEventAllListeners(AEvent.COMPLETE);
				//if (scale9Img.displayObject) {
					//scale9Img.width = txtFusion.spaceWidth + 30 ;
					scale9Img.height = txtFusion.height + 20;
				//}
			//})
			
			
			
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
		//}
		
	}
	
	
	
}
}