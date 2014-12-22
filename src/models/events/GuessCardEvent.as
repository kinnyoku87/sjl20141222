package models.events 
{
	import models.battle.CharacterVo;
	import org.agony2d.events.AEvent;
	
	public class GuessCardEvent extends AEvent
	{
		
		public function GuessCardEvent(type:String, guessCards:Array, fromVo:CharacterVo, targetVo:CharacterVo) 
		{
			super(type);
			this.guessCards = guessCards;
			this.fromVo = fromVo;
			this.targetVo = targetVo;
		}
		
		public static const GUESS_CARDS:String = "guessCards";
		
		public static const GUESS_CARDS_RES:String = "guessCardsRes";
		
		
		
		public var guessCards:Array;
		
		public var fromVo:CharacterVo;
		
		public var targetVo:CharacterVo;
		
		public var isRight:Boolean
		
		
		
		
		public var guessCardId:int;
		public var realCardId:int;
	}

}