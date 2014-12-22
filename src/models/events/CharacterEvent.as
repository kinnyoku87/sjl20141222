package models.events
{
	import models.battle.CharacterVo;
	
	import org.agony2d.events.AEvent;
	
	public class CharacterEvent extends AEvent
	{
		public function CharacterEvent(type:String, vo:CharacterVo )
		{
			super(type);
			this.vo = vo;
		}
		
		
		// 人物操作狀態變化.
		public static const INTERACTION_CHANGED:String = "interactionChanged";
		
		// 人物屬性變化
		public static const UPDATE_VALUES:String = "updateValues";
		
		// 装备變化
		public static const UPDATE_EQUIP:String = "updateEquip";
		
		// 人物死亡
		public static const KILL_CHARACTER:String = "killCharacter";
		
		
		
		
		public var vo:CharacterVo;
	}
}