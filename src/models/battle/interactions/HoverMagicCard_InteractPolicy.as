package models.battle.interactions {
	import configs.cards.CardCfg;
	import configs.cards.CardConfigurator;
	import models.battle.BattleModel;
	
public class HoverMagicCard_InteractPolicy extends InteractPolicy {
	
	override public function onExec( args:Array ) : void {
		var cardGuid:int;
		var cardId:int;
		var cfg:CardCfg;
		
		cardGuid = args[0];
		
		//BattleModel.setNullSelectedUiState();
		
		cfg = CardConfigurator.getCardById(cardGuid);
		if(BattleModel.remainMp < cfg.mana){
			return;
		}
		
		InteractPolicy.execPolicy(Skill_interactPolicy, [cfg.skill1, cfg]);
	}
	
	
}
}