package views.UU.comps {
	import configs.cards.CardCfg;
	import configs.cards.CardConfigurator;
	import configs.ConfigTxt;
	import configs.skills.SkillCfg;
	import configs.skills.SkillConfigurator;
	import org.agony2d.flashApi.FusionUU;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.Scale9MultiBitmapsUU;
	import utils.TextUtil;
	
	
public class SkillDescUU extends FusionUU {
	
	
	public function init( cardId:int ) : void {
		var i:int;
		var l:int;
		var cfg:SkillCfg;
		var label:LabelUU
		var w:Number;
		var h:Number;
		var scale9Multi:Scale9MultiBitmapsUU;
		
		cfg = SkillConfigurator.getSkillById(cardId);
		
		// 技能名字
		label = TextUtil.createLabel(cfg.name, 18, 0xdddd33, false, 3, 3.5, 22);
		this.addNode(label);
		
		// 技能描述
		label = TextUtil.createLabel4(cfg.desc, 15, 0xFFFFFF, ConfigTxt.CARD_DESC_WIDTH, NaN, 2);
		this.addNode(label);
		label.height = label.textHeight;
		label.y = 33;
		
		scale9Multi = new Scale9MultiBitmapsUU;
		scale9Multi.skinName = "battleSkill";
		scale9Multi.width = ConfigTxt.CARD_DESC_WIDTH + 22;
		scale9Multi.height = this.height + 20;
		scale9Multi.x = -12;
		scale9Multi.y = -8;
		this.addNodeAt(scale9Multi, 0);
		
	}
	
	
}
}