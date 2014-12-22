package views.events
{
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.core.NodeUU;
	import org.agony2d.inputs.Touch;
	
	public class CardUUEvent extends AEvent
	{
		public function CardUUEvent(type:String)
		{
			super(type);
			
		}
		
		
		// 发牌完成 (一张).
		public static const CARD_COMPLETE:String = "cardComplete";
		
		// 放下卡牌.
		public static const CARD_DROP:String = "cardDrop";
		
		
		public var cardGuid:int;
		
		public var view:NodeUU;
	}
}