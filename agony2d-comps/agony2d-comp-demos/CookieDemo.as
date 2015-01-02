package  {
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import org.agony2d.inputs.TouchManager;
	
	import org.agony2d.Agony;
	import org.agony2d.flashApi.LabelUU;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.events.AEvent;
	import org.agony2d.inputs.events.ATouchEvent;
	import org.agony2d.utils.ACookie;
	
	[SWF(frameRate='15')]
public class CookieDemo extends Sprite
{
	
	public function CookieDemo() 
	{
		Agony.startup(stage)
		TouchManager.registerListenTarget();
		UUFacade.registerRoot();
		
		var label:LabelUU;
		
		cookie = new ACookie('Agony2D')
		cookie.addEventListener(ACookie.PENDING, onWaiting)
		cookie.addEventListener(AEvent.COMPLETE, onSuccess)
		cookie.addEventListener(AEvent.CHANGE,  onChange)
		
		// listeners
		trace('本地记录: ' + cookie.size)

		// flush
		label = new LabelUU
		label.background = true
		label.backgroundColor = 0xaaaaee
		label.size = 18
		label.width = 50
		label.height = 20
		label.x = 100
		label.y = 130
		label.text = "flush"
		UUFacade.getRoot().addNode(label);
		label.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void{
			cookie.flush();
		})
		
		// clear useData
		label = new LabelUU
		label.background = true
		label.backgroundColor = 0xaaaaee
		label.size = 18
		label.width = 150
		label.height = 20
		label.x = 100
		label.y = 230
		label.text = "clear useData"
		UUFacade.getRoot().addNode(label);
		label.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void{
			cookie.flush();
			cookie.userData = null;
		})
		
		// kill
		//label = new PushButton(this, 300, 130, 'kill', function(e:MouseEvent):void{cookie.kill()})
		//label.setSize(50, 20)
		
		// show useData
		label = new LabelUU
		label.background = true
		label.backgroundColor = 0xaaaaee
		label.size = 18
		label.width = 150
		label.height = 20
		label.x = 300
		label.y = 230
		label.text = "show useData"
		UUFacade.getRoot().addNode(label);
		label.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void{
			var data:Object = cookie.userData
			for (var key:* in data)
			{
				trace(key + ' | ' + data[key])
			}
		})
		
		// change useData
		label = new LabelUU
		label.background = true
		label.backgroundColor = 0xaaaaee
		label.size = 18
		label.width = 150
		label.height = 20
		label.x = 500
		label.y = 230
		label.text = "change useData"
		UUFacade.getRoot().addNode(label);
		label.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void{
			var obj:Object = { 
				name: 'Agony',
				age: 41,
				sex: 'male'
			}
			cookie.userData = obj
			cookie.flush()
		})
		
		// size
		label = new LabelUU
		label.background = true
		label.backgroundColor = 0xaaaaee
		label.size = 18
		label.width = 50
		label.height = 20
		label.x = 400
		label.y = 130
		label.text = "size"
		UUFacade.getRoot().addNode(label);
		label.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void{
			trace(cookie.size)
		})
		
		var l:int, count:int
		var timer:Timer = new Timer(100, 0)
		timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void
		{
			l = count + 10
			while (++count <= l)
			{
				cookie.userData[count] = count
			}
			cookie.flush()
		})
			
		// size toggle
		label = new LabelUU
		label.background = true
		label.backgroundColor = 0xaaaaee
		label.size = 18
		label.width = 150
		label.height = 20
		label.x = 500
		label.y = 130
		label.text = "size toggle"
		UUFacade.getRoot().addNode(label);
		label.addEventListener(ATouchEvent.CLICK, function(e:ATouchEvent):void{
			if (!timer.running) {
				timer.start() 
			}
			else {
				timer.stop();
			}
		})
	}
	
	private var cookie:ACookie
	
	private function onChange(e:AEvent) : void
	{
		trace('刷新成功: ' + cookie.size)
	}
	
	private function onWaiting(e:AEvent) : void
	{
		trace('请求磁盘空间...')
		//Agony.running = false
	}
	
	private function onSuccess(e:AEvent) : void
	{
		trace('请求磁盘空间成功...')
		//Agony.running = true
	}
}

}