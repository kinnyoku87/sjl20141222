package models.events 
{
	import models.battle.CharacterVo;
	import org.agony2d.events.AEvent;
	/**
	 * ...
	 * @author ...
	 */
	public class BuffEvent extends AEvent
	{
		
		public function BuffEvent( type:String, vo:CharacterVo, buffId:int ) 
		{
			super(type);
			this.vo = vo;
			this.buffId = buffId;
		}
		
		public static const REMOVE_BUFF:String = "removeBuff";
		
		
		
		public var vo:CharacterVo;
		
		public var buffId:int;
	}

}