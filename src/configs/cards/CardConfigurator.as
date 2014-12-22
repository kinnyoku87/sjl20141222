package configs.cards {
	import models.GameModel;
	
	import org.agony2d.collections.CsvUtil;
	
public class CardConfigurator {
	
	public static function initCharacterCards( v:Vector.<Array> ) : void {
		var i:int;
		var l:int;
		var card:CharacterCardCfg;
		
		const ROLE_FIELDS:Array = ["id", "name", "camp", "type", "subType", "quality", "mana", "attack", "hp", "movement", "gender", null, "carryMax", "skill1", "skill2", "skill3", null, "imageURL", "atlasId", "frameRate", "offsetY", "desc", "guide" ];	
		l = v.length;
		while(i<l){
			card = new CharacterCardCfg;
			CsvUtil.setValues(card, v[i++], ROLE_FIELDS);
			_cardList[card.id] = card;
		}
		GameModel.getLog().simplify("初期化: csv - [ Role ].");
	}
	
	public static function initEquipmentCards( v:Vector.<Array> ) : void {
		var i:int;
		var l:int;
		var card:EquipmentCardCfg;
		
		const EQUIPMENT_FIELDS:Array = ["id", "name", "camp", "quality", "type", "sort", null, "usage", "mana", "costResType", "costCondition", "costCount", null, null, null, "carryMax", "skill1", "skill2", null, "imageURL", "buffIconURL", "effectURL", "soundURL", "desc" ];
		l = v.length;
		while(i<l){
			card = new EquipmentCardCfg;
			CsvUtil.setValues(card, v[i++], EQUIPMENT_FIELDS);
			_cardList[card.id] = card;
		}
		GameModel.getLog().simplify("初期化: csv - [ Equipment ].");
	}
	
	public static function initMagicCards( v:Vector.<Array> ) : void {
		var i:int;
		var l:int;
		var card:MagicCardCfg;
		
		const MAGIC_FIELDS:Array = ["id", "name", "camp", "quality", "type", "sort", "usage", "mana", "carryMax","skill1", "skill2", null, "imageURL", "effectURL", "soundURL", "desc" ]
		l = v.length;
		while(i<l){
			card = new MagicCardCfg;
			CsvUtil.setValues(card, v[i++], MAGIC_FIELDS);
			_cardList[card.id] = card;
		}
		GameModel.getLog().simplify("初期化: csv - [ Magic ].");
	}
	
	/**
	 * 通過id獲取卡牌.
	 * 
	 * @param id
	 */
	public static function getCardById( guid:int ) : CardCfg {
		return _cardList[guid % 100000];
	}
	
	/**
	 * 獲取魔耗圖片數字資源id.
	 * 
	 * @param v	魔耗值
	 */		
	public static function getMagicNumAssetId( v:int ) : String {
		return "card/img/" + v + ".png";
	}
	
	private static var _cardList:Object = {};
}
}