package   {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	import org.agony2d.keyboard.KeyboardManager;
	import org.agony2d.Agony;
	import org.agony2d.utils.DelayMachine;
	import org.agony2d.events.AEvent;

	[SWF(frameRate = "60")]
public class DelayDemo extends Sprite {
	
	public function DelayDemo() {
		Agony.startup(stage)
		
		var l:int, i:int
		var removeList:Array = []
		var id:uint
		var N:int
		
		l = 10
		while (--l > 0)
		{
			id = DelayMachine.getInstance().delayedCall(l, trace, l)
			if (l > 5 && l < 7)
			{
				removeList.push(id)
			}
		}
		trace("numDelays(1-9) : " + DelayMachine.getInstance().numDelays)
		oldT2 = getTimer()
		
		// 削除全部
		KeyboardManager.getInstance().getState().press.addEventListener("A", function(e:AEvent):void
		{
			trace("remove all")
			if (KeyboardManager.getInstance().isKeyPressed('SHIFT'))
			{
				DelayMachine.getInstance().killAll(true)
			}
			else
			{
				DelayMachine.getInstance().killAll(false)
			}
			trace("numDelays : " + DelayMachine.getInstance().numDelays)
		})
		
		// 移除某段延迟调用
		KeyboardManager.getInstance().getState().press.addEventListener("R", function(e:AEvent):void
		{
			i = removeList.length
			while (--i > -1)
			{
				DelayMachine.getInstance().killDelayedCall(removeList[i])
			}
			trace("numDelays: "+DelayMachine.getInstance().numDelays)
		})
		
		// 暂停
		KeyboardManager.getInstance().getState().press.addEventListener("P", function():void
		{
			DelayMachine.getInstance().paused = !DelayMachine.getInstance().paused
		})
		
		// 时间减速
		KeyboardManager.getInstance().getState().press.addEventListener("LEFT", function():void
		{
			trace(DelayMachine.getInstance().timeScaleFactor -= 0.1)
		})
		
		// 时间加速
		KeyboardManager.getInstance().getState().press.addEventListener("RIGHT", function():void
		{
			trace(DelayMachine.getInstance().timeScaleFactor += 0.1)
		})
	}
	
	private var oldT:int = -1;
	private var oldT2:int;
	private var elapsedT:int;

}
}
