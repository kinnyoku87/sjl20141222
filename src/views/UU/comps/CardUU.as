package views.UU.comps
{
	import configs.cards.CardConfigurator;
	import configs.cards.CharacterCardCfg;
	import configs.cards.EquipmentCardCfg;
	import configs.cards.MagicCardCfg;
	
	import org.agony2d.flashApi.StateFusionUU;
	
	import views.UU.comps.cardStates.CharacterCard_StateUU;
	import views.UU.comps.cardStates.EquipmentCard_StateUU;
	import views.UU.comps.cardStates.MagicCard_StateUU;
	import views.UU.comps.cardStates.SneakingCard_StateUU;
	
public class CardUU extends StateFusionUU
{
	
	public static const CARD_NAME_OFFSET_X:int = 72;
	public static const CARD_NAME_OFFSET_Y:int = -1;
	
	
	
	public function get guid() : int {
		return this.userData as int;
	}
	
	public function get cardId() : int {
		return (this.userData as int) % 100000;
	}
	
	
	/**
	 * 設定卡牌數據.
	 * 
	 * @param	guid	該值為卡牌id或卡牌guid都可.
	 */
	public function setCardId( guid:int ) : void {
		this.userData = guid;
		
		var cardId:int;
		
		cardId = guid % 100000;
		
		// Role.
		if(cardId >= 10000 && cardId < 15000){
			this.setState(CharacterCard_StateUU, [CardConfigurator.getCardById(guid) as CharacterCardCfg]);
		}
		// Magic
		else if(cardId >= 20000 && cardId < 25000){
			this.setState(MagicCard_StateUU, [CardConfigurator.getCardById(guid) as MagicCardCfg]);
		}
		// Equipment.
		else if(cardId >= 30000 && cardId < 35000){
			this.setState(EquipmentCard_StateUU, [CardConfigurator.getCardById(guid) as EquipmentCardCfg]);
		}
		// Sneaking.
		else {
			this.setState(SneakingCard_StateUU);
		}
	}
	

}
}