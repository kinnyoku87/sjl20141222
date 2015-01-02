package  {
	import assets.sounds.SoundAssets;
	import com.bit101.components.PushButton;
	import com.bit101.components.Slider;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	import org.agony2d.Agony;
	import org.agony2d.base.FrameManager;
	import org.agony2d.base.events.TickEvent;
	import org.agony2d.loading.events.AProgressEvent;
	import org.agony2d.inputs.*;
	import org.agony2d.loading.LoaderMachine;
	import org.agony2d.sounds.*;
	import org.agony2d.events.AEvent;
	import org.agony2d.utils.*;
	
public class SoundDemo extends Sprite 
{

	private var mSfxA:SfxManager = new SfxManager()
	
	private var mPaused:Boolean
	
	public function SoundDemo() 
	{
		Agony.startup(stage)
		
		LoaderMachine.getInstance().getBytesLoader(new SoundAssets.soundAssets).addEventListener(AEvent.COMPLETE, onLoadSound);
		
		stage.addChild(new Stats);
	}
	
	
	private function onLoadSound(e:AEvent):void
	{
		var slider:Slider
		var pauseBtn:PushButton;
		
		
		pauseBtn = new PushButton(this, 200, 130, 'toggle', function (e:MouseEvent):void{MusicManager.getInstance().paused = !MusicManager.getInstance().paused})
		pauseBtn.setSize(50, 20)
		pauseBtn = new PushButton(this, 300, 130, 'reset', function(e:MouseEvent):void{MusicManager.getInstance().reset()})
		
		pauseBtn.setSize(50, 20)
		
		pauseBtn = new PushButton(this, 400, 130, 'stop', function(e:MouseEvent):void{MusicManager.getInstance().stop()})
		pauseBtn.setSize(50, 20)
		
		pauseBtn = new PushButton(this, 500, 130, 'play', function(e:MouseEvent):void
		{ 
			MusicManager.getInstance().loadAndPlay('初日.mp3', 1, 1, false).addEventListener(AEvent.COMPLETE, function(e:AEvent):void
			{
				trace('[Music] - complete !!')
			})
		})
		pauseBtn.setSize(50, 20)
		
		MusicManager.getInstance().addEventListener(AProgressEvent.PROGRESS, p)

		slider = new Slider(Slider.HORIZONTAL, this, 200, 200)
		slider.setSliderParams(0, 1, 1)
		slider.addEventListener(Event.CHANGE, function(e:Event):void
		{
			var s:Slider = e.target as Slider
			MusicManager.getInstance().totalVolume = s.value
		});
		
		//pauseBtn = new PushButton(this, 200, 330, 'sfxA', function(e:MouseEvent):void { SfxManager.getInstance().loadAndPlay('Greeeen.mp3', 1, 1) } )
		pauseBtn = new PushButton(this, 200, 330, 'sfxA', function(e:MouseEvent):void { SfxManager.getInstance().play('sfx_Call', 1, 1) } )
		pauseBtn.setSize(50,20)
		//pauseBtn = new PushButton(this, 300, 330, 'sfxB', function(e:MouseEvent):void { SfxManager.getInstance().loadAndPlay('Akb48.mp3', 1, 1) } )
		pauseBtn = new PushButton(this, 300, 330, 'sfxB', function(e:MouseEvent):void { SfxManager.getInstance().play('sfx_Chip', 1, 1) } )
		pauseBtn.setSize(50, 20)
		
		KeyboardManager.getInstance().getState().press.addEventListener('Z', function():void {
			if (mSfxA)
			{
				mSfxA.stopAll()
				mSfxA = null
			}
		})
		KeyboardManager.getInstance().getState().press.addEventListener('P', function():void
		{
			mPaused = !mPaused
			trace('Paused: ' + mPaused)
		})
		
		var timer:Timer = new Timer(2000, 0)
		timer.addEventListener(TimerEvent.TIMER,function(e:TimerEvent):void 
		{ 
			var SN:ASound
			if (mSfxA)
			{
				SN = mSfxA.play(SoundAssets.SN_sfxA, 1, 1)
				if (SN)
				{
					SN.addEventListener(AEvent.COMPLETE, __onSfxRound)
				}
			}
		})
		timer.start();
		
		slider = new Slider(Slider.HORIZONTAL, this, 200, 400)
		slider.setSliderParams(0, 1, 1)
		slider.addEventListener(Event.CHANGE, function(e:Event):void
		{
			var s:Slider = e.target as Slider
			SfxManager.getInstance().totalVolume = s.value
		});
		
		pauseBtn = new PushButton(this, 350, 400, 'StopAll', function(e:MouseEvent):void {
			SfxManager.getInstance().stopAll()
		})
		pauseBtn.setSize(50, 20)
		pauseBtn = new PushButton(this, 350, 450, 'Enable', function(e:MouseEvent):void
		{
			if (mSfxA)
			{
				if (mSfxA.enabled)
				{
					mSfxA.setDisable(mPaused)
				}
				else
				{
					mSfxA.setEnable()
				}
				//trace(mSfxA.numSfx)
			}
		})
		pauseBtn.setSize(50, 20)
		//pauseBtn = new PushButton(this, 400, 330, 'StopSfx', function(e:MouseEvent):void{SfxManager.getInstance().stopSfx(1)})
		//pauseBtn.setSize(50, 20)
		
		slider = new Slider(Slider.HORIZONTAL, this, 200, 100)
		slider.setSliderParams(0, 1, 0)
		slider.addEventListener(Event.CHANGE, function(e:Event):void
		{
			var s:Slider = e.target as Slider
			MusicManager.getInstance().position = MusicManager.getInstance().length * s.value
			trace(MusicManager.getInstance().position)
		});
		
		FrameManager.addEventListener(TickEvent.TICK, function(e:TickEvent):void
		{
			slider.value = MusicManager.getInstance().position / MusicManager.getInstance().length
		})
		
	}
	
	private function p(e:AProgressEvent):void
	{
		trace(e.bytesLoaded, " / ", e.bytesTotal)
		//trace("加載聲音 : ", e.bytesLoaded, e.bytesTotal);
	}

	private function __onSfxRound(e:AEvent):void
	{
		
		trace(ASound(e.target).source)
		//trace(mSfxA.numSfx)
	}
	
	private function doAddTxt( str:String, x:Number, y:Number ) : TextField {
		var txt:TextField
		
		txt = new TextField
		this.addChild(txt)
		txt.x = x
		txt.y = y
		txt.text = str
		txt.autoSize = TextFieldAutoSize.LEFT
		txt.background = true
		txt.backgroundColor = 0x44dd44
		txt.scaleX = txt.scaleY = 1.6
		txt.multiline = false
		txt.selectable = false
		return txt
	}
}
}