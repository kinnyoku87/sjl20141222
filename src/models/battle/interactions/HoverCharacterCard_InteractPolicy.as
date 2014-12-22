package models.battle.interactions {
	import configs.cards.CardConfigurator;
	import models.GameModel;
	
	import models.battle.BattleModel;

public class HoverCharacterCard_InteractPolicy extends InteractPolicy {
	
	override public function onExec( args:Array ) : void {
		var cardGuid:int;
		
		cardGuid = args[0];
		
		//GameModel.getLog().simplify("mp: " + BattleModel.remainMp);
		
		
		if(BattleModel.remainMp < CardConfigurator.getCardById(cardGuid).mana){
			return;
		}
		
		BattleModel.setSelectedUiStateForHoverCard(cardGuid, BattleModel.getIdleGridIdList());
	}
}
}