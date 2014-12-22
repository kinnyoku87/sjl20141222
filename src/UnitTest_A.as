package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.agony2d.events.Notifier;
	
	public class UnitTest_A extends Sprite
	{
		public function UnitTest_A()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var d:Object = { };
			var str:String = null;
			d[str] = "AAA";
			trace(d[str]);
			
			var fff:Notifier = new Notifier
		}
	}
}